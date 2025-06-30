# Install OCI CLI if missing
if ! command -v oci &> /dev/null; then
  echo "Installing Oracle Cloud CLI..."
  pip install --quiet oci-cli
fi

# Clone the repo if not present
if [ ! -d "sacred-forge-setup" ]; then
  git clone https://github.com/CraftingBuilds/sacred-forge-setup.git sacred-forge-setup
fi

# Enter project directory
cd sacred-forge-setup

# Pull latest code
git pull

# Install Python dependencies if needed
if [ -f "requirements.txt" ]; then
  pip install --quiet -r requirements.txt
fi

echo "✅ Environment ready."
