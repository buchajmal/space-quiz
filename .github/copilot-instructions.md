# Copilot instructions

## Build, run, and test

- There is no build, lint, or automated test command configured. The app is a standalone HTML file with no package manager or dependencies.
- Run it by opening `index.html` directly in a browser; no server is required.
- To smoke-test manually, answer questions and check the score, progress bar, correct/incorrect feedback, final results, keyboard focus, and replay. There is no test runner or single-test command.

## Architecture

- The quiz is intentionally implemented in one file: `index.html` contains the markup, CSS, question data, and JavaScript.
- The `questions` array is the source of truth for question text, answer choices, correct-answer indexes, and explanations. `state` tracks the current index, score, and whether the current question has been answered.
- `renderQuestion`, `selectAnswer`, `advance`, `showResults`, and `startOver` manage the quiz lifecycle. `startOver` rebuilds the quiz markup, so keep that template aligned with the initial quiz markup when changing its structure.
- CSS custom properties provide the shared light/dark palette; the Apollo-inspired flight-sequence/score panel and hex pattern are styled in `.quiz-meta`.

## Codebase conventions

- Keep the app self-contained and dependency-free; preserve direct `file://` operation.
- Keep question content in the data array and create answer/result elements through the existing rendering functions rather than duplicating quiz logic in markup.
- Use native buttons for answers and actions, preserve visible keyboard focus, and keep the progress indicator and answer feedback accessible through their existing ARIA attributes.
- Respect `prefers-color-scheme` and `prefers-reduced-motion` when changing visual styles or animations.
