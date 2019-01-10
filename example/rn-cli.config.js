module.exports = {
  getProjectRoots() {
    return [
      path.resolve(__dirname),
      path.resolve(__dirname, "../some-other-package-in-lerna-monorepo")
    ];
  }
};
