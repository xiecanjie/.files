function l --description 'exa'
    exa --ignore-glob "node_modules|package.json|package-lock.json|tsconfig.json" $argv
end
