# Round Table Discussion

## User Input

```text
$ARGUMENTS
```

## Goal

Facilitate a structured round table discussion among diverse expert teams to collaboratively explore and decide on the best approach for implementing a new feature or product enhancement.
**NOTE**: The user input provides the topic for discussion, not decisions or dedicated solutions. The goal is to explore ideas, clarify requirements, and reach a consensus on the best path forward.
**IMPORTANT**: DO NOT discuss about the current the project details or information that already known like target audience or what technologies are used. Focus only on the user input topic.

## Instructions

1. Think step-by-step about each phase and participant contribution
2. Each team contributed at least once per phase
3. Between each phase, let the user to intervene if they want to adjust the topic or add clarifications
4. When all phases are completed, save all phases as markdown in `round-tables/<name>.md`

## Phases Flow

1. Introduction
2. Specification
3. Ask user for agreements or clarifications
4. Open Discussion
5. Ask user for agreements or clarifications
6. Decision Making
7. Ask user for agreements or clarifications
8. Summary

## Moderator

- Plays user's role
- The moderator is the Product Manager
- Moderator is the only one who can take decisions

### Introduction Phase

Moderator presents:

- Topic overview
- Implementation value
- Desired outcome

### Specification Phase

**ALL** participants ask moderator to clarify specific aspects.

#### Quality Criteria

- No implementation details (languages, frameworks, APIs)
- Focused on user value and business needs
- Clear for non-technical stakeholders

#### Completeness Criteria

- Measurable, technology-agnostic success criteria
- All acceptance scenarios and edge cases defined
- Scope clearly bounded
- Dependencies and assumptions identified

#### Readiness Criteria

- All functional requirements have acceptance criteria
- User scenarios cover primary flows
- No implementation details in specification

### Open Discussion Phase

**ALL** participants **MUST**:

- Contribute a FEW points per phase, not final answers, not summaries
- Explain concepts clearly for non-experts
- Talk each other directly to build ideas together
- Raise concerns and suggest improvements
- Challenge ideas as skeptics to identify flaws
- Moderator **MUST** use "say the opposite" technique to provoke deeper thinking

### Decision Making Phase

Moderator leads decision-making by:

- Summarizing key points from discussion
- Discussing trade-offs, risks, and benefits
- Discussing about **ALL** proposed ideas and expert opinions

### Summary Phase

Moderator summarizes the discussion, group by:

- Key insights from discussion
- Actionable recommendations based on consensus
- Experts concepts mentioned during discussion
- Participants recommendations and suggestions that not included in the actionable steps

**Only the moderator can write the summary.**

### Output Format

Markdown document of 3000 words, structured as follows:

1. **Summary**: Key insights and recommendations
2. **Transcript**: Full protocol with team contributions
3. **Actionable Recommendations**: Numbered steps based on consensus

#### Transcript Format

- Mark each contribution with team name only
- Participants speak in turns
- Each turn: 1-3 focused points, not final answers

### Participant Teams

#### 1. UX/UI Designers

This team **MUST** quick explain concepts clearly for non-experts.
Use examples from famous design patterns or concepts.

Focus on:

- User experience and interface design
- Usability and accessibility
- User journey and interaction flows

#### 2. Developers

- Technical considerations and challenges
- Maintainability, scalability, performance
- Quality assurance strategies

#### 3. Behavioral Economics Professors

This team **MUST** quick explain concepts clearly for non-experts.
Use examples from famous experiments and studies.

Focus on:

- Behavioral economics insights
- User behavior nudges and incentives
- Psychological barriers to adoption

#### 4. Ideation Specialists

- Alternative approaches and perspectives
- Challenge conventional thinking
- MVP approach and rapid prototyping

#### 5. Product Specialists

- Market insights from similar products
- Competitive advantages
- Feature comparisons

## Markdown Template

<template>
# Round Table Discussion

**Topic**: <!--Topic from user input-->

---

## Transcript

### Phase N: <!--Phase Name. Repeat for each phase-->

--- <!--Repeat for each participant in turn-->

**<!--Team Name-->**:

```
<!--Contribution-->
```

## Summary

### Key Insights

<!--Bulleted list-->

### Actionable Recommendations

<!--Numbered list-->

### Experts Concepts Mentioned

<!--Bulleted list-->

### Recommendations and Suggestions Not Included in Actionable Steps

<!--Numbered list-->
</template>
