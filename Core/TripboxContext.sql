CREATE TABLE [Category] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [name] varchar(100) NOT NULL,
    [description] varchar(1000) NULL,
    [isShow] bit NOT NULL DEFAULT (('1')),
    CONSTRAINT [PK_Category] PRIMARY KEY ([id])
);
GO


CREATE TABLE [City] (
    [id] bigint NOT NULL IDENTITY,
    [continent] varchar(100) NULL,
    [country] varchar(100) NULL,
    [codeCountry] char(2) NOT NULL,
    [state] varchar(100) NULL,
    [name] varchar(100) NULL,
    [nameEN] varchar(100) NULL,
    CONSTRAINT [PK_City] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Extra] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [name] varchar(100) NULL,
    [urlImage] varchar(200) NOT NULL,
    [description] varchar(1000) NOT NULL,
    [price] bigint NOT NULL DEFAULT (('0')),
    [cost] bigint NOT NULL,
    [typeOrderQuantity] char(4) NOT NULL,
    [isLimitQuantity] bit NOT NULL DEFAULT (('0')),
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [quantityExtra] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_Extra] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Field] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NULL,
    [typeApply] char(4) NOT NULL,
    [name] varchar(100) NOT NULL,
    [dataType] char(4) NOT NULL,
    [listValue] varchar(max) NULL,
    CONSTRAINT [PK_Field] PRIMARY KEY ([id])
);
GO


CREATE TABLE [MasterCode] (
    [code] char(4) NOT NULL,
    [typeCode] char(3) NOT NULL,
    [valueCode] char(3) NOT NULL,
    [desc01] varchar(1000) NULL,
    [desc02] varchar(1000) NULL,
    [desc03] varchar(1000) NULL,
    CONSTRAINT [PK_MasterCode] PRIMARY KEY ([code])
);
GO


CREATE TABLE [NegotiatedRate] (
    [name] varchar(100) NOT NULL,
    [idSupplier] bigint NOT NULL,
    CONSTRAINT [PK_NegotiatedRate] PRIMARY KEY ([name], [idSupplier]),
    CONSTRAINT [AK_NegotiatedRate_idSupplier_name] UNIQUE ([idSupplier], [name])
);
GO


CREATE TABLE [Order] (
    [id] bigint NOT NULL IDENTITY,
    [typeOrder] char(4) NOT NULL,
    [typeCustomer] char(4) NOT NULL,
    [datetimeCreated] datetime NOT NULL,
    [datetimeConfirmed] datetime NOT NULL,
    [datetimePaid] datetime NOT NULL,
    [datetimeUpdated] datetime NOT NULL,
    [totalSale] bigint NOT NULL DEFAULT (('0')),
    [totalOrder] bigint NOT NULL DEFAULT (('0')),
    [totalPaid] bigint NOT NULL DEFAULT (('0')),
    [totalDue] bigint NOT NULL DEFAULT (('0')),
    [totalDiscount] bigint NOT NULL DEFAULT (('0')),
    [isFullpay] bit NOT NULL DEFAULT (('0')),
    [isSendCheckin] bit NOT NULL DEFAULT (('0')),
    [isSendPayment] bit NOT NULL DEFAULT (('0')),
    [listTypePayment] varchar(max) NOT NULL,
    [typeSource] char(4) NOT NULL,
    [refererSource] varchar(1000) NULL,
    [commentCustomer] varchar(2000) NULL,
    [commentAgent] varchar(2000) NULL,
    [commentSupplier] varchar(2000) NULL,
    [commentTripBox] varchar(2000) NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Party] (
    [id] bigint NOT NULL IDENTITY,
    [typeParty] char(4) NOT NULL,
    [nameFirst] varchar(100) NULL,
    [nameLast] varchar(100) NULL,
    [nameCompany] varchar(100) NULL,
    [companyAlias] varchar(100) NULL,
    [gender] char(4) NULL,
    [title] varchar(100) NULL,
    [dateBirth] date NULL,
    CONSTRAINT [PK_Party] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Payment] (
    [id] bigint NOT NULL IDENTITY,
    [typePayment] char(4) NOT NULL,
    [typeReceipt] char(4) NOT NULL,
    [datePayment] date NOT NULL,
    [amount] bigint NOT NULL DEFAULT (('0')),
    [note] varchar(1000) NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Pickup] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [name] varchar(100) NOT NULL,
    [isAllowRequest] bit NOT NULL DEFAULT (('0')),
    [noteRequest] varchar(1000) NULL,
    [isAdditionalNote] bit NOT NULL DEFAULT (('0')),
    [noteAdditional] varchar(1000) NULL,
    [idSpotStart] bigint NULL,
    [idSpotEnd] bigint NULL,
    [miniteDuration] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_Pickup] PRIMARY KEY ([id])
);
GO


CREATE TABLE [Resource] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [name] varchar(100) NOT NULL,
    [typeResource] char(4) NOT NULL,
    [isLimitQuantity] bit NOT NULL DEFAULT (('0')),
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [typeShace] char(4) NOT NULL,
    CONSTRAINT [PK_Resource] PRIMARY KEY ([id])
);
GO


CREATE TABLE [SessionOrdered] (
    [idSessionPart] bigint NOT NULL,
    [idProduct] bigint NOT NULL,
    [datetimeStart] datetime NOT NULL,
    [datetimeFinish] datetime NOT NULL,
    [amountProfit] bigint NOT NULL DEFAULT (('0')),
    [amountSale] bigint NOT NULL DEFAULT (('0')),
    [commAgent] bigint NOT NULL DEFAULT (('0')),
    [commOperation] bigint NOT NULL DEFAULT (('0')),
    [amountExpense] bigint NOT NULL DEFAULT (('0')),
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_SessionOrdered] PRIMARY KEY ([idSessionPart])
);
GO


CREATE TABLE [Spot] (
    [id] bigint NOT NULL IDENTITY,
    [name] varchar(100) NULL,
    [typeSpot] char(4) NOT NULL,
    [idCity] bigint NOT NULL,
    [postcode] varchar(10) NULL,
    [address1] varchar(100) NULL,
    [address2] varchar(100) NULL,
    [latitude] varchar(20) NOT NULL,
    [longitude] varchar(20) NOT NULL,
    CONSTRAINT [PK_Spot] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Spot] FOREIGN KEY ([idCity]) REFERENCES [City] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderField] (
    [id] bigint NOT NULL IDENTITY,
    [idOrder] bigint NOT NULL,
    [idField] bigint NOT NULL,
    [valueOrder] varchar(max) NOT NULL,
    CONSTRAINT [PK_OrderField] PRIMARY KEY ([id]),
    CONSTRAINT [FK_OrderField_Field] FOREIGN KEY ([idField]) REFERENCES [Field] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderField_Order] FOREIGN KEY ([idOrder]) REFERENCES [Order] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Agent] (
    [idAgent] bigint NOT NULL,
    [isPrivate] bit NOT NULL DEFAULT (('0')),
    [nameAgent] varchar(100) NULL,
    [codeAgent] varchar(100) NULL,
    [nameFirst] varchar(100) NULL,
    [nameLast] varchar(100) NULL,
    [email] varchar(200) NULL,
    [tel] varchar(100) NULL,
    [website] varchar(200) NULL,
    [typeAgent] char(4) NULL,
    [address] varchar(max) NULL,
    [rateComm] smallint NOT NULL DEFAULT (('0')),
    [typePayment] char(4) NULL,
    [emailBilling] varchar(200) NULL,
    [noteBill] varchar(1000) NULL,
    [companyBilling] varchar(100) NULL,
    [userBilling] varchar(100) NULL,
    [isEditOrder] bit NOT NULL DEFAULT (('0')),
    [isEditOrderPrice] bit NOT NULL DEFAULT (('0')),
    [idSupplier] bigint NULL,
    CONSTRAINT [PK_Agent] PRIMARY KEY ([idAgent]),
    CONSTRAINT [FK_Agent] FOREIGN KEY ([idAgent]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Member] (
    [idParty] bigint NOT NULL,
    [userID] varchar(100) NOT NULL,
    [userPWD] varchar(20) NOT NULL,
    [nickname] varchar(100) NOT NULL,
    [imageProfile] varchar(200) NULL,
    CONSTRAINT [PK_Member] PRIMARY KEY ([idParty]),
    CONSTRAINT [FK_Member] FOREIGN KEY ([idParty]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PartyAccount] (
    [id] bigint NOT NULL IDENTITY,
    [idPartyHolder] bigint NOT NULL,
    [typeAccount] char(4) NOT NULL,
    [typeFinance] char(4) NOT NULL,
    [idPartyFinance] bigint NOT NULL,
    [accountNo] varchar(20) NOT NULL,
    [accountName] varchar(20) NOT NULL,
    CONSTRAINT [PK_PartyAccount] PRIMARY KEY ([id]),
    CONSTRAINT [FK_PartyAccount] FOREIGN KEY ([idPartyHolder]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PartyContact] (
    [idParty] bigint NOT NULL,
    [typeContact] char(4) NOT NULL,
    [contact] varchar(200) NOT NULL,
    CONSTRAINT [PK_PartyContact] PRIMARY KEY ([idParty], [typeContact]),
    CONSTRAINT [FK_PartyContact] FOREIGN KEY ([idParty]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PartyRelation] (
    [idParty1] bigint NOT NULL,
    [idParty2] bigint NOT NULL,
    [typeRelation] char(4) NOT NULL,
    CONSTRAINT [PK_PartyRelation] PRIMARY KEY ([idParty1], [idParty2], [typeRelation]),
    CONSTRAINT [FK_PartyRelation1] FOREIGN KEY ([idParty1]) REFERENCES [Party] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PartyRelation] FOREIGN KEY ([idParty2]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Purchage] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [datePurchage] date NOT NULL,
    [idCompanyPurchase] bigint NULL,
    [companyPurchage] varchar(100) NULL,
    [totalPurchage] bigint NOT NULL DEFAULT (('0')),
    [note] varchar(1000) NULL,
    CONSTRAINT [PK_Purchage] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Purchage] FOREIGN KEY ([idCompanyPurchase]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Supplier] (
    [idSupplier] bigint NOT NULL,
    [name] varchar(100) NOT NULL,
    [urlWebsite] varchar(200) NULL,
    [urlHost] varchar(200) NULL,
    [typeBusiness] char(4) NULL,
    [listCity] varchar(max) NULL,
    [firstName] varchar(100) NOT NULL,
    [lastName] varchar(100) NOT NULL,
    [email] varchar(200) NOT NULL,
    [phone] varchar(20) NULL,
    [mobile] varchar(20) NULL,
    [fax] varchar(20) NULL,
    [openingHours] varchar(1000) NULL,
    [businessNumber] varchar(20) NULL,
    [description] varchar(2000) NULL,
    [urlLogo] varchar(200) NULL,
    [youtubeID] varchar(100) NULL,
    [continent] varchar(100) NULL,
    [country] varchar(100) NULL,
    [city] varchar(100) NULL,
    [postcode] varchar(10) NULL,
    [latitude] varchar(20) NULL,
    [longitude] varchar(20) NULL,
    [urlFacebook] varchar(200) NULL,
    [urlTwitter] varchar(200) NULL,
    [urlYoutube] varchar(200) NULL,
    [urlGoogle] varchar(200) NULL,
    [urlInstagram] varchar(200) NULL,
    [urlPinterest] varchar(200) NULL,
    [urlTripadvisor] varchar(200) NULL,
    [typeDepoist] char(4) NULL,
    [term] varchar(max) NULL,
    [privacyPolicy] varchar(max) NULL,
    [isExplicitConsent] bit NOT NULL DEFAULT (('1')),
    [language] char(4) NULL,
    [timezone] char(4) NULL,
    [weekStartNo] smallint NOT NULL DEFAULT (('0')),
    [currency] char(4) NULL,
    [listTypePayment] varchar(max) NULL,
    [isIncludeOrderFee] bit NOT NULL DEFAULT (('0')),
    [rateDeposit] numeric(12, 2) NOT NULL DEFAULT (('0')),
    [isPaymentFull] bit NOT NULL DEFAULT (('1')),
    [isMinPayment] bit NOT NULL DEFAULT (('1')),
    [dayMinPayment] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_Supplier] PRIMARY KEY ([idSupplier]),
    CONSTRAINT [FK_Supplier] FOREIGN KEY ([idSupplier]) REFERENCES [Party] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PaymentOrder] (
    [id] bigint NOT NULL IDENTITY,
    [idPayment] bigint NOT NULL,
    [idOrder] bigint NOT NULL,
    [amount] bigint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_PaymentOrder] PRIMARY KEY ([id]),
    CONSTRAINT [FK_PaymentOrder_Order] FOREIGN KEY ([idOrder]) REFERENCES [Order] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PaymentOrder_Payment] FOREIGN KEY ([idPayment]) REFERENCES [Payment] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Product] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [typeProduct] char(4) NOT NULL,
    [isPart] bit NOT NULL DEFAULT (('1')),
    [name] varchar(100) NOT NULL,
    [codeProduct] varchar(20) NOT NULL,
    [priceAdvertise] bigint NOT NULL,
    [quantityMinSession] smallint NOT NULL DEFAULT (('0')),
    [quantityMinOrder] smallint NOT NULL DEFAULT (('0')),
    [quantityMaxOrder] smallint NOT NULL DEFAULT (('0')),
    [quantityLabel] varchar(100) NOT NULL,
    [quantityLabelPlural] varchar(100) NOT NULL,
    [descriptionShort] varchar(1000) NOT NULL,
    [descriptionLong] varchar(4000) NOT NULL,
    [isSpecialPayment] bit NOT NULL DEFAULT (('0')),
    [typeDepoist] char(4) NULL,
    [rateDeposit] numeric(12, 2) NOT NULL DEFAULT (('0')),
    [isPaymentFull] bit NOT NULL DEFAULT (('1')),
    [isMinPayment] bit NOT NULL DEFAULT (('1')),
    [dayMinPayment] smallint NOT NULL DEFAULT (('0')),
    [isSpecialRule] bit NOT NULL DEFAULT (('0')),
    [valueSpecialRule] varchar(max) NULL,
    [typeSessionSchedule] char(4) NOT NULL,
    [listTime] varchar(max) NULL,
    [typeInventory] char(4) NULL,
    [isAllowWaiting] bit NOT NULL DEFAULT (('0')),
    [isShowSeat] bit NOT NULL DEFAULT (('0')),
    [typeConfirm] char(4) NOT NULL,
    [quantityAfter] smallint NOT NULL DEFAULT (('0')),
    [timeTypeMiniumNotice] char(4) NOT NULL,
    [valueMiniumNotice] smallint NOT NULL DEFAULT (('0')),
    [timeTypeDuration] char(4) NOT NULL,
    [valueDuration] smallint NOT NULL DEFAULT (('0')),
    [isAllday] bit NOT NULL DEFAULT (('0')),
    [productColor] varchar(10) NOT NULL,
    [idSpotStart] bigint NOT NULL,
    [idSpotFinish] bigint NOT NULL,
    [listCity] varchar(max) NULL,
    [listSpot] varchar(max) NULL,
    [note] varchar(1000) NULL,
    [idPickup] bigint NULL,
    [isIncludeExtra] bit NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_Product] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Product] FOREIGN KEY ([idPickup]) REFERENCES [Pickup] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SessionRole] (
    [id] bigint NOT NULL IDENTITY,
    [idSessionPart] bigint NOT NULL,
    [typeRole] char(4) NOT NULL,
    [idParty] bigint NOT NULL,
    CONSTRAINT [PK_SessionRole] PRIMARY KEY ([id]),
    CONSTRAINT [FK_SessionRole2] FOREIGN KEY ([idParty]) REFERENCES [Party] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SessionRole] FOREIGN KEY ([idSessionPart]) REFERENCES [SessionOrdered] ([idSessionPart]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PickupSpot] (
    [idPickup] bigint NOT NULL,
    [idSpot] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    [name] varchar(100) NOT NULL,
    [minutePrior] smallint NOT NULL DEFAULT (('0')),
    [noteInstruction] varchar(1000) NULL,
    CONSTRAINT [PK_PickupSpot] PRIMARY KEY ([idPickup], [idSpot]),
    CONSTRAINT [FK_PickupSpot_Pickup] FOREIGN KEY ([idPickup]) REFERENCES [Pickup] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PickupSpot_Spot] FOREIGN KEY ([idSpot]) REFERENCES [Spot] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductNego] (
    [idSupplier] bigint NOT NULL,
    [nameNego] varchar(100) NOT NULL,
    [idProduct] bigint NOT NULL,
    [typePriceOption] char(4) NOT NULL,
    [idAgent] bigint NOT NULL,
    [rateComm] numeric(12, 2) NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_ProductNego] PRIMARY KEY ([idAgent], [idProduct], [typePriceOption], [idSupplier], [nameNego]),
    CONSTRAINT [AK_ProductNego_idAgent_idProduct_idSupplier_nameNego_typePriceOption] UNIQUE ([idAgent], [idProduct], [idSupplier], [nameNego], [typePriceOption]),
    CONSTRAINT [FK_ProductNego_Agent] FOREIGN KEY ([idAgent]) REFERENCES [Agent] ([idAgent]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductNego_Nego] FOREIGN KEY ([nameNego], [idSupplier]) REFERENCES [NegotiatedRate] ([name], [idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PurchageDetail] (
    [id] bigint NOT NULL IDENTITY,
    [idPurchage] bigint NOT NULL,
    [idSession] bigint NOT NULL,
    [typeItem] char(4) NOT NULL,
    [typePayment] char(4) NOT NULL,
    [cost] bigint NOT NULL DEFAULT (('0')),
    [quantityPurchage] smallint NOT NULL DEFAULT (('0')),
    [amountPurchage] bigint NOT NULL DEFAULT (('0')),
    [note] varchar(1000) NULL,
    CONSTRAINT [PK_PurchageDetail] PRIMARY KEY ([id]),
    CONSTRAINT [FK_PurchageDetail_Purchase] FOREIGN KEY ([idPurchage]) REFERENCES [Purchage] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PurchageDetail_Session] FOREIGN KEY ([idSession]) REFERENCES [SessionOrdered] ([idSessionPart]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Message] (
    [idSupplier] bigint NOT NULL,
    [typePurpose] char(4) NOT NULL,
    [typeSend] char(4) NOT NULL,
    [isIntroductionText] bit NOT NULL DEFAULT (('1')),
    [introductionText] varchar(max) NULL,
    [isConclusionText] bit NOT NULL DEFAULT (('1')),
    [conclusionText] varchar(max) NULL,
    [isAttachFile] bit NOT NULL DEFAULT (('0')),
    [isSend] bit NOT NULL DEFAULT (('0')),
    [timetypeSend] char(4) NULL,
    [valueSend] smallint NOT NULL DEFAULT (('0')),
    [typeTimeBase] char(4) NULL,
    [ratePayment] numeric(12, 2) NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_Message] PRIMARY KEY ([idSupplier], [typePurpose], [typeSend]),
    CONSTRAINT [FK_Message] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [MessageTemplate] (
    [idSupplier] bigint NOT NULL,
    [fromEmail] varchar(200) NULL,
    [subject] varchar(200) NULL,
    [colorTheme] char(4) NULL,
    [isQuickSummary] bit NOT NULL DEFAULT (('1')),
    [isComplanyLogo] bit NOT NULL DEFAULT (('1')),
    [headerType] char(4) NULL,
    [headerValue] varchar(1000) NULL,
    [isOrderSummary] bit NOT NULL DEFAULT (('0')),
    [isIntroductionText] bit NOT NULL DEFAULT (('1')),
    [introductionText] varchar(max) NULL,
    [isConclusionText] bit NOT NULL DEFAULT (('1')),
    [conclusionText] varchar(max) NULL,
    [isBusinessNumber] bit NOT NULL DEFAULT (('0')),
    [isCustomerDetail] bit NOT NULL DEFAULT (('1')),
    [isSpecialRequirement] bit NOT NULL DEFAULT (('0')),
    [isPaymentDetail] bit NOT NULL DEFAULT (('1')),
    [typeFooter] char(4) NULL,
    [footer] varchar(max) NULL,
    [isItemDetail] bit NOT NULL DEFAULT (('0')),
    [isQRCode] bit NOT NULL DEFAULT (('1')),
    [isPickup] bit NOT NULL DEFAULT (('1')),
    [isMap] bit NOT NULL DEFAULT (('1')),
    [isItemSummary] bit NOT NULL DEFAULT (('0')),
    [isGuestDetail] bit NOT NULL DEFAULT (('0')),
    [isProductSpecialMessage] bit NOT NULL DEFAULT (('1')),
    [isSpecificTerm] bit NOT NULL DEFAULT (('0')),
    [isGeneralTerm] bit NOT NULL DEFAULT (('1')),
    [isCompanyAddress] bit NOT NULL DEFAULT (('1')),
    [isConnectWithUs] bit NOT NULL DEFAULT (('1')),
    [isAttachFile] bit NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_MessageTemplate] PRIMARY KEY ([idSupplier]),
    CONSTRAINT [FK_MessageTemplate] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SupplierCity] (
    [idSupplier] bigint NOT NULL,
    [idCity] bigint NOT NULL,
    CONSTRAINT [PK_SupplierCity] PRIMARY KEY ([idSupplier], [idCity]),
    CONSTRAINT [AK_SupplierCity_idCity_idSupplier] UNIQUE ([idCity], [idSupplier]),
    CONSTRAINT [FK_SupplierCity_City] FOREIGN KEY ([idCity]) REFERENCES [City] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SupplierCity_Supplier] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SupplierPayment] (
    [idSupplier] bigint NOT NULL,
    [typePayment] char(4) NOT NULL,
    CONSTRAINT [PK_SupplierPayment] PRIMARY KEY ([idSupplier], [typePayment]),
    CONSTRAINT [FK_SupplierPayment] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Surcharge] (
    [id] bigint NOT NULL IDENTITY,
    [idSupplier] bigint NOT NULL,
    [label] varchar(20) NOT NULL,
    [typeSurcharge] char(4) NOT NULL,
    [typeApply] char(4) NOT NULL,
    [rateSurcharge] numeric(12, 2) NOT NULL DEFAULT (('0')),
    [note] varchar(1000) NULL,
    CONSTRAINT [PK_Surcharge] PRIMARY KEY ([id]),
    CONSTRAINT [FK_Surcharge] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [User] (
    [idSupplier] bigint NOT NULL,
    [idParty] bigint NOT NULL,
    [typeRole] char(4) NULL,
    [isOrderOnline] bit NOT NULL DEFAULT (('1')),
    [isOrderInternal] bit NOT NULL DEFAULT (('1')),
    [isNewCompany] bit NOT NULL DEFAULT (('1')),
    [isMessage] bit NOT NULL DEFAULT (('0')),
    [isViewCompany] bit NOT NULL DEFAULT (('0')),
    [isWeeklyReport] bit NOT NULL DEFAULT (('0')),
    [isAbandonCart] bit NOT NULL DEFAULT (('1')),
    [isBouncedEmail] bit NOT NULL DEFAULT (('1')),
    CONSTRAINT [PK_User] PRIMARY KEY ([idSupplier], [idParty]),
    CONSTRAINT [AK_User_idParty_idSupplier] UNIQUE ([idParty], [idSupplier]),
    CONSTRAINT [FK_User_Member] FOREIGN KEY ([idParty]) REFERENCES [Member] ([idParty]) ON DELETE NO ACTION,
    CONSTRAINT [FK_User_Supplier] FOREIGN KEY ([idSupplier]) REFERENCES [Supplier] ([idSupplier]) ON DELETE NO ACTION
);
GO


CREATE TABLE [BookingField] (
    [idProduct] bigint NOT NULL,
    [idField] bigint NOT NULL,
    [isShow] bit NOT NULL DEFAULT (('0')),
    [isMandatory] bit NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_BookingField] PRIMARY KEY ([idProduct], [idField]),
    CONSTRAINT [AK_BookingField_idField_idProduct] UNIQUE ([idField], [idProduct]),
    CONSTRAINT [FK_BookingField_Field] FOREIGN KEY ([idField]) REFERENCES [Field] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_BookingField_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Package] (
    [idProduct] bigint NOT NULL,
    [idProductPart] bigint NOT NULL,
    [typeProduct] char(4) NOT NULL,
    [day] smallint NOT NULL DEFAULT (('0')),
    [isAllday] bit NOT NULL DEFAULT (('0')),
    [timeStart] time NOT NULL DEFAULT (('00:00')),
    [timeFinish] time NOT NULL DEFAULT (('00:00')),
    CONSTRAINT [PK_Package] PRIMARY KEY ([idProduct], [idProductPart]),
    CONSTRAINT [FK_Package_Finished] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Package_Part] FOREIGN KEY ([idProductPart]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PriceOption] (
    [idProduct] bigint NOT NULL,
    [typePriceOption] char(4) NOT NULL,
    [isGroup] bit NOT NULL DEFAULT (('0')),
    [quantitytUnit] smallint NOT NULL DEFAULT (('1')),
    [price] bigint NOT NULL DEFAULT (('0')),
    [cost] bigint NOT NULL,
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [idResource] bigint NULL,
    [note] varchar(1000) NOT NULL,
    [rateMarketplace] numeric(12, 2) NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_PriceOption] PRIMARY KEY ([idProduct], [typePriceOption]),
    CONSTRAINT [FK_PriceOption_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PriceOption_Resource] FOREIGN KEY ([idResource]) REFERENCES [Resource] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductCategory] (
    [idCategory] bigint NOT NULL,
    [idProduct] bigint NOT NULL,
    CONSTRAINT [PK_ProductCategory] PRIMARY KEY ([idCategory], [idProduct]),
    CONSTRAINT [FK_ProductCategory] FOREIGN KEY ([idCategory]) REFERENCES [Category] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductCategory1] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductExtra] (
    [idProduct] bigint NOT NULL,
    [idExtra] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    CONSTRAINT [PK_ProductExtra] PRIMARY KEY ([idProduct], [idExtra]),
    CONSTRAINT [AK_ProductExtra_idExtra_idProduct] UNIQUE ([idExtra], [idProduct]),
    CONSTRAINT [FK_ProductExtra_Extra] FOREIGN KEY ([idExtra]) REFERENCES [Extra] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductExtra_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductField] (
    [idProduct] bigint NOT NULL,
    [idField] bigint NOT NULL,
    [valueProduct] varchar(max) NOT NULL,
    CONSTRAINT [PK_ProductField] PRIMARY KEY ([idProduct], [idField]),
    CONSTRAINT [AK_ProductField_idField_idProduct] UNIQUE ([idField], [idProduct]),
    CONSTRAINT [FK_ProductField_Field] FOREIGN KEY ([idField]) REFERENCES [Field] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductField_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductImage] (
    [id] bigint NOT NULL IDENTITY,
    [idProduct] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    [isDefault] bit NOT NULL DEFAULT (('0')),
    [urlImageFull] varchar(200) NOT NULL,
    [urlImageLarge] varchar(200) NOT NULL,
    [urlImageMedium] varchar(200) NOT NULL,
    [urlImageSmall] varchar(200) NOT NULL,
    CONSTRAINT [PK_ProductImage] PRIMARY KEY ([id]),
    CONSTRAINT [FK_ProductImage] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductRelated] (
    [idProduct1] bigint NOT NULL,
    [idProduct2] bigint NOT NULL,
    CONSTRAINT [PK_ProductRelated] PRIMARY KEY ([idProduct1], [idProduct2]),
    CONSTRAINT [FK_ProductRelated1] FOREIGN KEY ([idProduct1]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductRelated2] FOREIGN KEY ([idProduct2]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductSpot] (
    [idProduct] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    [idSpot] bigint NOT NULL,
    [typeService] char(4) NULL,
    CONSTRAINT [PK_ProductSpot] PRIMARY KEY ([idProduct], [seq], [idSpot]),
    CONSTRAINT [AK_ProductSpot_idProduct_idSpot_seq] UNIQUE ([idProduct], [idSpot], [seq]),
    CONSTRAINT [FK_ProductSpot_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductSpot_Spot] FOREIGN KEY ([idSpot]) REFERENCES [Spot] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductTag] (
    [idProduct] bigint NOT NULL,
    [typeTag] char(4) NOT NULL,
    [tag] varchar(100) NOT NULL,
    CONSTRAINT [PK_ProductTag] PRIMARY KEY ([idProduct], [typeTag], [tag]),
    CONSTRAINT [AK_ProductTag_idProduct_tag_typeTag] UNIQUE ([idProduct], [tag], [typeTag]),
    CONSTRAINT [FK_ProductTag] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductVideo] (
    [id] bigint NOT NULL IDENTITY,
    [idProduct] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    [isDefault] bit NOT NULL DEFAULT (('0')),
    [typePlatform] char(4) NOT NULL,
    [urlVideo] varchar(200) NOT NULL,
    CONSTRAINT [PK_ProductVideo] PRIMARY KEY ([id]),
    CONSTRAINT [FK_ProductVideo] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Promotion] (
    [codePromotion] varchar(10) NOT NULL,
    [dateOrderStart] date NOT NULL,
    [dateOrderEnd] date NOT NULL,
    [dateSessionStart] date NOT NULL,
    [dateSessionEnd] date NOT NULL,
    [typeApply] char(4) NULL,
    [ratePromotion] numeric(12, 2) NOT NULL DEFAULT (('0')),
    [isLimitTotal] bit NOT NULL DEFAULT (('1')),
    [amountLimit] bigint NOT NULL DEFAULT (('0')),
    [amountMin] bigint NOT NULL DEFAULT (('0')),
    [isIncludeSurcharge] bit NOT NULL DEFAULT (('0')),
    [isIncludeExtra] bit NOT NULL DEFAULT (('0')),
    [typeApplyProduct] char(4) NULL,
    [idProduct] bigint NULL,
    [idCategory] bigint NULL,
    CONSTRAINT [PK_Promotion] PRIMARY KEY ([codePromotion]),
    CONSTRAINT [FK_Promotion] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SessionTemplate] (
    [id] bigint NOT NULL IDENTITY,
    [idProduct] bigint NOT NULL,
    [datetimeStart] datetime NOT NULL,
    [minuteDuration] smallint NOT NULL DEFAULT (('0')),
    [datetimeFinish] datetime NOT NULL,
    [timetypeRepeat] char(4) NOT NULL,
    [valueRepeat] smallint NOT NULL DEFAULT (('0')),
    [dateRepeatStart] date NOT NULL,
    [dateRepeatEnd] date NOT NULL,
    CONSTRAINT [PK_SessionTemplate] PRIMARY KEY ([id]),
    CONSTRAINT [FK_SessionTemplate] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductSurcharge] (
    [idProduct] bigint NOT NULL,
    [idSurcharge] bigint NOT NULL,
    [seq] smallint NOT NULL DEFAULT (('1')),
    CONSTRAINT [PK_ProductSurcharge] PRIMARY KEY ([idProduct]),
    CONSTRAINT [FK_ProductSurcharge_Product] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ProductSurcharge_Surcharge] FOREIGN KEY ([idSurcharge]) REFERENCES [Surcharge] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductSession] (
    [id] bigint NOT NULL IDENTITY,
    [idTemplate] bigint NOT NULL,
    [datetimeStart] datetime NOT NULL,
    [isAllday] bit NOT NULL DEFAULT (('0')),
    [timetypeDuration] char(4) NULL,
    [valueDuration] smallint NOT NULL DEFAULT (('0')),
    [datetimeFinish] datetime NOT NULL,
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_ProductSession] PRIMARY KEY ([id]),
    CONSTRAINT [FK_ProductSession] FOREIGN KEY ([idTemplate]) REFERENCES [SessionTemplate] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SessionTemplateWeek] (
    [idTemplate] bigint NOT NULL,
    [weekdayNo] smallint NOT NULL DEFAULT (('0')),
    [timeStart] time NOT NULL DEFAULT (('00:00')),
    [timeEnd] time NOT NULL DEFAULT (('00:00')),
    CONSTRAINT [PK_SessionTemplateWeek] PRIMARY KEY ([idTemplate], [weekdayNo]),
    CONSTRAINT [FK_SessionTemplateWeek] FOREIGN KEY ([idTemplate]) REFERENCES [SessionTemplate] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItem] (
    [id] bigint NOT NULL IDENTITY,
    [idOrder] bigint NOT NULL,
    [idProduct] bigint NOT NULL,
    [idSesstion] bigint NOT NULL,
    [datetimeFinish] datetime NOT NULL,
    [datetimeStart] datetime NOT NULL,
    [totalAmount] bigint NOT NULL DEFAULT (('0')),
    [amountOrder] bigint NOT NULL DEFAULT (('0')),
    [amountExtra] bigint NOT NULL DEFAULT (('0')),
    [amountSurcharge] bigint NOT NULL DEFAULT (('0')),
    [commission] bigint NOT NULL DEFAULT (('0')),
    [quantityOrder] smallint NOT NULL DEFAULT (('0')),
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    [quantityExtra] smallint NOT NULL DEFAULT (('0')),
    [typeStatus] char(4) NOT NULL,
    CONSTRAINT [PK_OrderItem] PRIMARY KEY ([id]),
    CONSTRAINT [FK_OrderItem2] FOREIGN KEY ([idOrder]) REFERENCES [Order] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItem] FOREIGN KEY ([idProduct]) REFERENCES [Product] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItem1] FOREIGN KEY ([idSesstion]) REFERENCES [ProductSession] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [PackageSession] (
    [idProduct] bigint NOT NULL,
    [idProductPart] bigint NOT NULL,
    [idSessionPart] bigint NOT NULL,
    CONSTRAINT [PK_PackageSession] PRIMARY KEY ([idProduct], [idProductPart], [idSessionPart]),
    CONSTRAINT [FK_PackageSession_Session] FOREIGN KEY ([idSessionPart]) REFERENCES [ProductSession] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_PackageSession_Package] FOREIGN KEY ([idProduct], [idProductPart]) REFERENCES [Package] ([idProduct], [idProductPart]) ON DELETE NO ACTION
);
GO


CREATE TABLE [ProductPrice] (
    [id] bigint NOT NULL IDENTITY,
    [idProduct] bigint NOT NULL,
    [typePriceOption] char(4) NOT NULL,
    [idSession] bigint NULL,
    [price] bigint NOT NULL DEFAULT (('0')),
    [cost] bigint NOT NULL DEFAULT (('0')),
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [quantityOrder] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_ProductPrice] PRIMARY KEY ([id]),
    CONSTRAINT [FK_ProductPrice_Session] FOREIGN KEY ([idSession]) REFERENCES [ProductSession] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SessionResource] (
    [idResource] bigint NOT NULL,
    [idSession] bigint NOT NULL,
    [quantityMax] smallint NOT NULL DEFAULT (('0')),
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_SessionResource] PRIMARY KEY ([idResource], [idSession]),
    CONSTRAINT [FK_SessionResource_Resource] FOREIGN KEY ([idResource]) REFERENCES [Resource] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SessionResource_Session] FOREIGN KEY ([idSession]) REFERENCES [ProductSession] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItemExtra] (
    [id] bigint NOT NULL IDENTITY,
    [idOrderItem] bigint NOT NULL,
    [idExtra] bigint NOT NULL,
    [priceExtra] bigint NOT NULL DEFAULT (('0')),
    [quantityExtra] smallint NOT NULL DEFAULT (('0')),
    [amountExtra] bigint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_OrderItemExtra] PRIMARY KEY ([id]),
    CONSTRAINT [FK_OrderItemExtra_Extra] FOREIGN KEY ([idExtra]) REFERENCES [Extra] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItemExtra_OrderItem] FOREIGN KEY ([idOrderItem]) REFERENCES [OrderItem] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItemField] (
    [id] bigint NOT NULL IDENTITY,
    [idOrderItem] bigint NOT NULL,
    [idField] bigint NOT NULL,
    [valueOrderItem] varchar(max) NOT NULL,
    CONSTRAINT [PK_OrderItemField] PRIMARY KEY ([id]),
    CONSTRAINT [FK_OrderItemField] FOREIGN KEY ([idField]) REFERENCES [Field] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItemField1] FOREIGN KEY ([idOrderItem]) REFERENCES [OrderItem] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItemSession] (
    [idOrderItem] bigint NOT NULL,
    [idSession] bigint NOT NULL,
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    [idSpotPickup] bigint NOT NULL,
    [timePickup] time NOT NULL DEFAULT (('00:00')),
    [isCheckin] bit NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_OrderItemSession] PRIMARY KEY ([idOrderItem], [idSession]),
    CONSTRAINT [FK_OrderItemSession1] FOREIGN KEY ([idOrderItem]) REFERENCES [OrderItem] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItemSession] FOREIGN KEY ([idSession]) REFERENCES [ProductSession] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItemProduct] (
    [id] bigint NOT NULL IDENTITY,
    [idOrderItem] bigint NOT NULL,
    [idPrice] bigint NOT NULL,
    [typePriceOption] char(4) NOT NULL,
    [price] bigint NOT NULL DEFAULT (('0')),
    [quantityOrder] smallint NOT NULL DEFAULT (('0')),
    [quantityUnit] smallint NOT NULL DEFAULT (('1')),
    [amountOrder] bigint NOT NULL DEFAULT (('0')),
    [quantityUsed] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_OrderItemProduct] PRIMARY KEY ([id]),
    CONSTRAINT [FK_OrderItemProduct_OrderItem] FOREIGN KEY ([idOrderItem]) REFERENCES [OrderItem] ([id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItemProduct_Price] FOREIGN KEY ([idPrice]) REFERENCES [ProductPrice] ([id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [OrderItemResource] (
    [idOrderItem] bigint NOT NULL,
    [idSession] bigint NOT NULL,
    [idResource] bigint NOT NULL,
    [quantityAssign] smallint NOT NULL DEFAULT (('0')),
    CONSTRAINT [PK_OrderItemResource] PRIMARY KEY ([idOrderItem], [idSession], [idResource]),
    CONSTRAINT [AK_OrderItemResource_idOrderItem_idResource_idSession] UNIQUE ([idOrderItem], [idResource], [idSession]),
    CONSTRAINT [FK_OrderItemResource_Session] FOREIGN KEY ([idOrderItem], [idSession]) REFERENCES [OrderItemSession] ([idOrderItem], [idSession]) ON DELETE NO ACTION,
    CONSTRAINT [FK_OrderItemResource_Resource] FOREIGN KEY ([idResource], [idSession]) REFERENCES [SessionResource] ([idResource], [idSession]) ON DELETE NO ACTION
);
GO


CREATE INDEX [IX_OrderField_idField] ON [OrderField] ([idField]);
GO


CREATE INDEX [IX_OrderField_idOrder] ON [OrderField] ([idOrder]);
GO


CREATE INDEX [IX_OrderItem_idOrder] ON [OrderItem] ([idOrder]);
GO


CREATE INDEX [IX_OrderItem_idProduct] ON [OrderItem] ([idProduct]);
GO


CREATE INDEX [IX_OrderItem_idSesstion] ON [OrderItem] ([idSesstion]);
GO


CREATE INDEX [IX_OrderItemExtra_idExtra] ON [OrderItemExtra] ([idExtra]);
GO


CREATE INDEX [IX_OrderItemExtra_idOrderItem] ON [OrderItemExtra] ([idOrderItem]);
GO


CREATE INDEX [IX_OrderItemField_idField] ON [OrderItemField] ([idField]);
GO


CREATE INDEX [IX_OrderItemField_idOrderItem] ON [OrderItemField] ([idOrderItem]);
GO


CREATE INDEX [IX_OrderItemProduct_idOrderItem] ON [OrderItemProduct] ([idOrderItem]);
GO


CREATE INDEX [IX_OrderItemProduct_idPrice] ON [OrderItemProduct] ([idPrice]);
GO


CREATE INDEX [IX_OrderItemResource_idResource_idSession] ON [OrderItemResource] ([idResource], [idSession]);
GO


CREATE INDEX [IX_OrderItemSession_idSession] ON [OrderItemSession] ([idSession]);
GO


CREATE INDEX [IX_Package_idProductPart] ON [Package] ([idProductPart]);
GO


CREATE INDEX [IX_PackageSession_idSessionPart] ON [PackageSession] ([idSessionPart]);
GO


CREATE INDEX [IX_PartyAccount_idPartyHolder] ON [PartyAccount] ([idPartyHolder]);
GO


CREATE INDEX [IX_PartyRelation_idParty2] ON [PartyRelation] ([idParty2]);
GO


CREATE INDEX [IX_PaymentOrder_idOrder] ON [PaymentOrder] ([idOrder]);
GO


CREATE INDEX [IX_PaymentOrder_idPayment] ON [PaymentOrder] ([idPayment]);
GO


CREATE INDEX [IX_PickupSpot_idSpot] ON [PickupSpot] ([idSpot]);
GO


CREATE INDEX [IX_PriceOption_idResource] ON [PriceOption] ([idResource]);
GO


CREATE INDEX [IX_Product_idPickup] ON [Product] ([idPickup]);
GO


CREATE INDEX [IX_ProductCategory_idProduct] ON [ProductCategory] ([idProduct]);
GO


CREATE INDEX [IX_ProductImage_idProduct] ON [ProductImage] ([idProduct]);
GO


CREATE INDEX [IX_ProductNego_nameNego_idSupplier] ON [ProductNego] ([nameNego], [idSupplier]);
GO


CREATE INDEX [IX_ProductPrice_idSession] ON [ProductPrice] ([idSession]);
GO


CREATE INDEX [IX_ProductRelated_idProduct2] ON [ProductRelated] ([idProduct2]);
GO


CREATE INDEX [IX_ProductSession_idTemplate] ON [ProductSession] ([idTemplate]);
GO


CREATE INDEX [IX_ProductSpot_idSpot] ON [ProductSpot] ([idSpot]);
GO


CREATE INDEX [IX_ProductSurcharge_idSurcharge] ON [ProductSurcharge] ([idSurcharge]);
GO


CREATE INDEX [IX_ProductVideo_idProduct] ON [ProductVideo] ([idProduct]);
GO


CREATE INDEX [IX_Promotion_idProduct] ON [Promotion] ([idProduct]);
GO


CREATE INDEX [IX_Purchage_idCompanyPurchase] ON [Purchage] ([idCompanyPurchase]);
GO


CREATE INDEX [IX_PurchageDetail_idPurchage] ON [PurchageDetail] ([idPurchage]);
GO


CREATE INDEX [IX_PurchageDetail_idSession] ON [PurchageDetail] ([idSession]);
GO


CREATE INDEX [IX_SessionResource_idSession] ON [SessionResource] ([idSession]);
GO


CREATE INDEX [IX_SessionRole_idParty] ON [SessionRole] ([idParty]);
GO


CREATE INDEX [IX_SessionRole_idSessionPart] ON [SessionRole] ([idSessionPart]);
GO


CREATE INDEX [IX_SessionTemplate_idProduct] ON [SessionTemplate] ([idProduct]);
GO


CREATE INDEX [IX_Spot_idCity] ON [Spot] ([idCity]);
GO


CREATE INDEX [IX_Surcharge_idSupplier] ON [Surcharge] ([idSupplier]);
GO