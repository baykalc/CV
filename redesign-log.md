
### Iteration 11 — Minimal Rhythm Trim (September 22, 2025)
- Dialed sectional padding back to `clamp(32px, 8vw, 60px)` with slimmer hero offsets so adjacent blocks sit closer without altering structure.
- Removed extra bottom padding from `section--surface` and the cards’ bottom margin to prevent compounded gaps.
- Captured updated QA (`inspection/iteration-11-desktop.png`, `inspection/iteration-11-mobile.png`).

### Iteration 12 — Gap Harmonization (September 22, 2025)
- Lowered base section padding to `clamp(28px, 7vw, 52px)` and added a uniform `.section + .section` top margin so gaps are consistently managed by one rule.
- Tightened hero bottom padding to keep the CV block closer and removed redundant padding/margins that had been stacking between sections.
- Captured updated QA (`inspection/iteration-12-desktop.png`, `inspection/iteration-12-mobile.png`).

### Iteration 13 — Compact CV & Contact (September 22, 2025)
- Added a `section--compact` modifier that trims padding and top margin for targeted sections while keeping the global rhythm intact.
- Applied the compact variant to the CV and Contact blocks and reduced their internal padding to close the gap.
- Captured new QA (`inspection/iteration-13-desktop.png`, `inspection/iteration-13-mobile.png`).
