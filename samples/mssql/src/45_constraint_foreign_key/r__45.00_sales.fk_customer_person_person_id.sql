﻿
IF OBJECT_ID('[sales].[fk_customer_person_person_id]', 'F') IS NULL
BEGIN
    ALTER TABLE [sales].[customer]  
    ADD CONSTRAINT [fk_customer_person_person_id] 
    FOREIGN KEY (person_id)
    REFERENCES [person].[person] (business_entity_id)
    ON DELETE NO ACTION;
END;
GO

ALTER TABLE [sales].[customer] 
CHECK CONSTRAINT [fk_customer_person_person_id];
GO

IF NOT EXISTS (SELECT 1 
               FROM sys.fn_listextendedproperty(N'MS_Description'
                                              , N'SCHEMA',N'sales'
                                              , N'TABLE',N'customer'
                                              , N'CONSTRAINT',N'fk_customer_person_person_id'))
    EXEC sys.sp_addextendedproperty @name=N'MS_Description'
                                  , @value=N'Foreign key constraint referencing person.business_entity_id.'
                                  , @level0type=N'SCHEMA',@level0name=N'sales'
                                  , @level1type=N'TABLE',@level1name=N'customer'
                                  , @level2type=N'CONSTRAINT',@level2name=N'fk_customer_person_person_id'
GO
