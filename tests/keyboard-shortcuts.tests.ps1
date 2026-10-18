$htmlPath = Join-Path $PSScriptRoot '..\index.html'
$html = Get-Content -Path $htmlPath -Raw

$checks = @(
  @{ Label = 'keyboard legend'; Snippet = '<strong>A</strong><strong>B</strong><strong>C</strong><strong>D</strong> select answers' },
  @{ Label = 'letter shortcut logic'; Snippet = 'if (letter >= "a" && letter <= "d" && !state.answered)' },
  @{ Label = 'keyboard listener registration'; Snippet = 'document.addEventListener("keydown", handleKeyboardShortcuts);' },
  @{ Label = 'repeat answer guard'; Snippet = 'if (state.answered) return;' },
  @{ Label = 'space key interaction guard'; Snippet = 'if (event.key === " " && isTypingTarget)' }
)

foreach ($check in $checks) {
  if (-not $html.Contains($check.Snippet)) {
    throw "Missing $($check.Label) in index.html"
  }
}

Write-Host 'Keyboard shortcut smoke tests passed.'
