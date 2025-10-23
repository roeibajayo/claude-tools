# Client Frontend Guidelines

## Directory Guidelines

- New pages should be created in `client/src/pages/<PageName>/index.tsx`.
- Shared components should be created in `client/src/components/<ComponentName>.tsx`.
- If shared component has own hook, it should be created in `client/src/components/<ComponentName>/index.tsx` and the hook `client/src/components/<ComponentName>/hooks/<hookName>.ts`.
- Shared hooks should be created in `client/src/hooks/<hookName>.ts`.
- Shared utilities should be created in `client/src/utils/<utilityName>.ts`.

## Site Layout

- Header
  - Logo
  - Workspace Selector
  - Active Sessions (tabs-like)
  - (Space)
  - Starred Environments as Dropdown buttons
    - Status
    - Actions (Start, Stop, Restart)
    - Open button
  - Menu
    - Environments
    - Agents
    - MCPs
- Main Content Area
  - Chat
  - Files
  - Git Changes
- Footer
  - SignalR Connection status

## Session Page Layout

- Sidebar (Left when LTR)
  - Top: Icon tabs with badge
    - Chat (badge: number of unread messages)
    - Git changes (badge: number of changes)
    - Files
  - Content
    - Chat
      - Session status and info
      - Tasks
        - List of tasks as pre-defined in workspace with icon status
          - Task 1
          - Task 2
          - Task 3
        - Create new task
      - Actions
        - Pull request
        - Merge to main
        - Push branch
        - Reset
        - Cancel
    - Git changes
      - Staged changes
      - Unstaged changes
    - Files
      - File tree with folders and files
- Content
  - Chat (One screen - Messages or Task)
    - Messages
    - Specific task output with input textarea
  - Files
    - Monaco Editor with tabs
  - Git changes
    - File diff with tabs

## Component Organization and Separation of Concerns

### Complex Component Splitting

When a component becomes complex with multiple logical sections:

1. **Split into Sub-Components**: Break down complex components into smaller, focused sub-components

   - Example: Split large sidebar into `Session.tsx`, `Files.tsx`, `Git.tsx`
   - Each sub-component should handle one specific concern

2. **Create Component Groups**: Organize related components in folders

   - Example: `pages/Session/Sidebar/` containing all sidebar-related components
   - Use `index.tsx` as the main component that orchestrates sub-components

3. **Centralize Logic**: Move component rendering logic to a dedicated component

   - Avoid inline component logic in parent components
   - Example: Move sidebar tab management from Session page to Sidebar component
   - Parent components should focus on layout, child components handle their own logic

4. **Component Hierarchy Best Practices**:

   ```
   Page/
   ├── index.tsx         # Main page layout, minimal logic
   ├── ComponentGroup/
   │   ├── index.tsx     # Main component with state management
   │   ├── SubComponent1.tsx
   │   ├── SubComponent2.tsx
   │   └── SubComponent3.tsx
   └── hooks/
       └── usePageLogic.ts
   ```

5. **Encapsulation Principles**:
   - Each component should manage its own state and logic
   - Parent components should only handle layout and data passing
   - Sub-components should be reusable and self-contained
   - Use re-exports to maintain clean import statements

## UI Components

**NOTE**: NEVER use components directly from external UI library like Shadcn or Apex or Lucide, Use the provided abstractions in `client/src/components/` or create your own.

## Form Validation and User Feedback

### Field-Level Validation

Forms should provide immediate, field-specific feedback to guide users using the Input component's built-in error prop:

1. **Error Display with Input Component**:

   - Use the Input component's `error` prop instead of custom styling
   - The component automatically handles visual indicators and error message display
   - Error messages appear below the input with consistent styling

   ```tsx
   <Input
     label="Name"
     value={formData.name}
     onChange={handleNameChange}
     error={fieldErrors.name}
   />
   ```

2. **Dynamic Error Clearing**:

   - Clear field errors when user starts typing/interacting with the field
   - Implement field-specific error clearing functions
   - Reset all errors when opening create/edit modals

3. **Implementation Pattern**:

   ```typescript
   // State management
   interface FieldErrors {
     fieldName?: string;
   }
   const [fieldErrors, setFieldErrors] = useState<FieldErrors>({});

   // Validation function
   const validateForm = (): boolean => {
     const errors: FieldErrors = {};
     if (!formData.fieldName.trim()) {
       errors.fieldName = "Field name is required";
     }
     setFieldErrors(errors);
     return Object.keys(errors).length === 0;
   };

   // Error clearing
   const handleFieldErrorClear = (field: keyof FieldErrors) => {
     setFieldErrors((prev) => {
       const { [field]: _, ...rest } = prev;
       return rest;
     });
   };
   ```

4. **Input Component Usage with Validation**:

   ```tsx
   <Input
     label="Field Name"
     value={formData.fieldName}
     onChange={(e) => {
       setFormData({ ...formData, fieldName: e.target.value });
       if (fieldErrors.fieldName) {
         onFieldErrorClear('fieldName');
       }
     }}
     error={fieldErrors.fieldName}
   />
   ```

## API Layer

The application includes a REST API layer in `client/src/api/` for interacting with backend services.

## State Management

- Each page should have its own state, implemented in `client/src/pages/<PageName>/use<PageName>.ts`.
- `workspaceStore` should only be used to get and set workspace-related realtime state across the application.
- ALWAYS use zustand for sharing state management.

## Shared Hooks

The application includes reusable hooks in `client/src/hooks/` and store hooks.

## Shared Utilities

The application includes utility functions in `client/src/utils/`.

## Shared Styles

The application includes shared styles in `client/src/styles/`.

## Shared Constants

The application includes shared constants in `client/src/constants/`.

## Shared Types

The application includes shared TypeScript types in `client/src/types/`.

## Testing

No frontend tests currently configured.
