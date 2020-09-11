function repositoryMeta(provider, user, repo) {
    if (provider === 'github.com' || provider === 'gitlab.com') {
        const homepage = `https://${provider}/${user}/${repo}`;
        return {
            bugs: {
                url: `${homepage}/issues`
            },
            homepage,
            repository: `${provider.replace(/\.com$/, '')}:${user}/${repo}`
        };
    }
    return null;
}

const cwdTree = process.cwd().split('/');
const repo = cwdTree.pop();
const user = cwdTree.pop();
const provider = cwdTree.pop();
const meta = repositoryMeta(provider, user, repo);

const json = {
    name: repo,
    description: '',
    version: '0.1.0',
    author: 'ryuta69 <eyma22s.yu@gmail.com> (https://ryuta69.netlify.app)'
};

if (meta) {
    json.bugs = meta.bugs;
    json.homepage = meta.homepage;
}

json.keywords = [];
json.license = 'MIT';
json.main = '';
json.private = true;

if (meta) {
    json.repository = meta.repository;
}

json.scripts = {
    test: 'exit 1'
};

module.exports = json;
