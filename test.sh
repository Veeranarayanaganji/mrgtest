run: |
          ACTION="${{ github.event.inputs.action }}"
          REPO="/ApplicationM01/test" # Replace with your repository name
          
          if [ "$ACTION" == "lock" ]; then
            echo "Locking the repository..."
            curl -X PUT -H "Authorization: token $GITHUB_TOKEN" \
              -H "Accept: application/vnd.github.v3+json" \
              "https://api.github.com/repos/$REPO/lock"
        #   elif [ "$ACTION" == "unlock" ]; then
        #     echo "Unlocking the repository..."
        #     curl -X DELETE -H "Authorization: token $GITHUB_TOKEN" \
        #       -H "Accept: application/vnd.github.v3+json" \
        #       "https://api.github.com/repos/$REPO/lock"
          else
            echo "Invalid action: $ACTION"
            exit 1
          fi
