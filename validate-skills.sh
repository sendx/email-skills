#!/bin/bash
# Validates that all SKILL.md files have proper YAML frontmatter.
# Usage: ./validate-skills.sh

ERRORS=0
CHECKED=0

echo "Validating skills..."
echo ""

for skill_file in skills/*/SKILL.md skills/*/*/SKILL.md; do
  [ -f "$skill_file" ] || continue
  CHECKED=$((CHECKED + 1))

  # Check for YAML frontmatter opening
  first_line=$(head -1 "$skill_file")
  if [ "$first_line" != "---" ]; then
    echo "  ❌  $skill_file — missing YAML frontmatter (first line should be ---)"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # Check for closing ---
  closing=$(sed -n '2,${/^---$/=}' "$skill_file" | head -1)
  if [ -z "$closing" ]; then
    echo "  ❌  $skill_file — frontmatter never closed (missing second ---)"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # Check for required fields within frontmatter
  frontmatter=$(sed -n "2,$((closing - 1))p" "$skill_file")

  if ! echo "$frontmatter" | grep -q "^name:"; then
    echo "  ❌  $skill_file — missing 'name' in frontmatter"
    ERRORS=$((ERRORS + 1))
  fi

  if ! echo "$frontmatter" | grep -q "^description:"; then
    echo "  ❌  $skill_file — missing 'description' in frontmatter"
    ERRORS=$((ERRORS + 1))
  fi

  # Check minimum content length after frontmatter
  content_length=$(tail -n +"$((closing + 1))" "$skill_file" | wc -c)
  if [ "$content_length" -lt 200 ]; then
    echo "  ⚠️   $skill_file — very short content ($content_length chars). Placeholder?"
  else
    echo "  ✅  $skill_file"
  fi
done

echo ""
echo "---"
echo "Checked $CHECKED skills. $ERRORS errors."

if [ "$ERRORS" -gt 0 ]; then
  exit 1
else
  echo "All skills valid."
fi
