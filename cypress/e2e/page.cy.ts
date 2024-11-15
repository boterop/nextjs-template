describe('page test', () => {
  it('passes', () => {
    cy.visit('/');
    cy.contains('Get started by editing src/app/page.tsx');
  });
});
