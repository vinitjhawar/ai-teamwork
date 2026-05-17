#!/usr/bin/env bash
# Open Council — install every underlying skill that powers the 10 employees.
#
# Run this ONCE after cloning the repo to fully arm your employees.
# Without these installs the employee SKILL.md files exist as specs but the
# underlying GitHub skills (vercel-labs, emilkowalski, sergebulaev, etc.)
# are not installed and the employees cannot do their work.
#
# Safe to re-run. git clone fails silently for already-cloned repos.

set -eu

SKILLS_DIR="${HOME}/.claude/skills"
mkdir -p "${SKILLS_DIR}"

clone() {
  local repo="$1"
  local name="$2"
  local target="${SKILLS_DIR}/${name}"
  if [ -d "${target}" ]; then
    echo "  ✓ ${name} already installed, skipping"
  else
    echo "  → installing ${name}"
    git clone --quiet --depth 1 "https://github.com/${repo}.git" "${target}" || \
      echo "  ! failed to clone ${repo} (continuing)"
  fi
}

echo ""
echo "Open Council — installing the full employee skill stack into ${SKILLS_DIR}"
echo ""

echo "Engineer (8 skills)"
clone vercel-labs/agent-skills           vercel-agent-skills
clone supabase/agent-skills              supabase-agent-skills
clone obra/superpowers                   superpowers
clone lackeyjb/playwright-skill          playwright
clone yamadashy/browser-extension-developer  browser-extension
clone mhattingpete/claude-skills-marketplace claude-skills-marketplace
clone anthropics/skills                  anthropics-skills
clone RetellAI/n8n-nodes-retellai        retellai

echo ""
echo "Designer (9 skills)"
clone emilkowalski/skill                 emilkowalski
clone pbakaus/impeccable                 impeccable
clone dominikmartn/nothing-design-skill  nothing-design
clone jaywilburn/refactoring-ui-skill    refactoring-ui
clone kylezantos/design-motion-principles motion-principles
clone aboul3ata/lazyweb-skill            lazyweb
clone canva-sdks/canva-claude-skills     canva
clone VoltAgent/awesome-claude-design    awesome-claude-design
clone OneRedOak/claude-code-workflows    claude-code-workflows

echo ""
echo "Writer (6 skills)"
clone boraoztunc/skills                  boraoztunc
clone coreyhaines31/marketingskills      marketing
clone wondelai/skills                    wondelai
clone sergebulaev/linkedin-skills        linkedin
clone blader/humanizer                   humanizer
clone aaron-he-zhu/seo-geo-claude-skills seo-geo

echo ""
echo "Researcher (5 skills)"
clone VoltAgent/awesome-claude-code-subagents voltagent-subagents
clone AgriciDaniel/claude-seo            claude-seo
clone zubair-trabzada/geo-seo-claude     geo-seo
clone trailofbits/agent-toolkit          agent-toolkit
clone anthropics/financial-services      financial-services

echo ""
echo "Video Editor (4 skills)"
clone heygen-com/hyperframes             hyperframes
clone robonuggets/hyperframes-helper     hyperframes-helper
clone remotion-dev/skills                remotion

echo ""
echo "Growth Strategist (3 skills, shares linkedin + seo + marketing with others)"
clone alirezarezvani/claude-skills       alirezarezvani

echo ""
echo "CFO (4 skills, shares xlsx + financial-services with others)"
clone anthropics/claude-cookbooks        claude-cookbooks
clone Sagargupta16/claude-cost-optimizer cost-optimizer
clone ancs21/ai-sub-invest               ai-sub-invest
clone K-Dense-AI/claude-scientific-skills scientific-skills

echo ""
echo "Career Agent (5 skills, shares humanizer + boraoztunc + linkedin with others)"
clone Paramchoudhary/ResumeSkills        resume-skills
clone varunr89/resume-tailoring-skill    resume-tailoring
clone ericgandrade/claude-superskills    superskills

echo ""
echo "Legal & Compliance (5 skills)"
clone lawvable/awesome-legal-skills      legal-skills
clone anthropics/claude-for-legal        claude-for-legal
clone Sushegaad/Claude-Skills-Governance-Risk-and-Compliance grc
clone prompt-security/clawsec            clawsec
clone BehiSecc/vibesec                   vibesec

echo ""
echo "Product Manager (2 skills, shares voltagent-subagents + alirezarezvani + claude-skills-marketplace with others)"
clone bobmatnyc/claude-mpm               claude-mpm
clone rohitg00/awesome-claude-code-toolkit awesome-claude-code-toolkit

echo ""
echo "Done. Every employee now has their full skill stack installed in ${SKILLS_DIR}."
echo ""
echo "Restart Claude Code so it picks up the new skills, then type 'opencouncil' to start."
echo ""
