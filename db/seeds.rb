TransactionValue.delete_all
KindTransaction.delete_all
KindTransaction.create(id: 1, description: 'Débito', nature: 1, signal: 1)
KindTransaction.create(id: 2, description: 'Boleto', nature: 0, signal: 0)
KindTransaction.create(id: 3, description: 'Financiamento', nature: 0, signal: 0)
KindTransaction.create(id: 4, description: 'Crédito', nature: 1, signal: 1)
KindTransaction.create(id: 5, description: 'Recebimento Empréstimo', nature: 1, signal: 1)
KindTransaction.create(id: 6,description: 'Vendas', nature: 1, signal: 1)
KindTransaction.create(id: 7, description: 'Recebimento TED', nature: 1, signal: 1)
KindTransaction.create(id: 8, description: 'Recebimento DOC', nature: 1, signal: 1)
KindTransaction.create(id: 9, description: 'Aluguel', nature: 0, signal: 0)
