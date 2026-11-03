Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1B6606EE9B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=V9mIsGhH
Received: from list by lists.xenproject.org with outflank-mailman.1470037.1678790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFnD-0001ac-E3; Tue, 03 Nov 2026 14:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470037.1678790; Tue, 03 Nov 2026 14:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFnD-0001aV-8p; Tue, 03 Nov 2026 14:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1470037;
 Tue, 03 Nov 2026 14:47:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xOFnB-0001a4-Od
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:47:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFnB-007AP4-1f
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:47:17 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ae9f3ed-bab6-0a2a0a5309dd-0a2a4501c4fc-14
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:47:17 +0100
Received: from [52.101.69.105]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ae9f3f4-5984-0a2a45010019-34654569fe92-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:47:16 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GV2PR03MB589725.eurprd03.prod.outlook.com
 (2603:10a6:150:381::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:47:13 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 14:47:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPllapl1K4DjYn74ybZc2GnSvQLLQAuWLrDyAzMJ2xy6BIq41xqA/6hvQ5pqfyc0fKbcNdAUOvDWrH+w6tW9nDzpzDUWP3IvvqgA0JvABaf6RXxOvFSGIHRzLuZ123BPyxdJhSrJA3PRHkoyxsW4fhJwF/1uHX5ti7lxR73WCn1CLXzlpyqeyMYsv1yavF/0DnDrjjMG6Z3Uy1sD72b9lbQRcPq8DIWhWhGklQzo5DcHeZuHZMa9U3SZT9DkWv6Kd+cl67BFlsWpdNQpfw1t6Y0Siojr0fYxO0VtSMWlIsMyDIS05THWc7TCE92zqnb5L/2q1wjgHXyBGx6S2mllzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgKc2ESde+M2XktDLD7JNsTKuKSjlqnsT+uG6BcOvEM=;
 b=igE4QRmJ7+JUqAvWStvcpBn8TWjrONK6tMqWvutngLPQpnk3Uif+aCEKqqP5jocCXB526y87FyF3WgorLJvY7ketlivsWpXU46KQy/Uj9uWOGHbqkCv3QyC6D5dzY/4+5eDB9EewlZlPUN0eaZq2r8ECGr1qsTiahGGDE3FfoqZVjEfCsI5wEbPeoUhZvk99SUBbZe5goZc5RSgHxs0pTkX7/K+8abDyM1v9gF9hLIFbopK2/+x9TAiuUDx23Nu1PBW9pslRp0uD/WfGXzSylUK33PaB3ugLeV1yOnCKtSvkg6RV+IXWK3tDeWHVtfoWGlbpAMgcdKmwspkGOvSrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgKc2ESde+M2XktDLD7JNsTKuKSjlqnsT+uG6BcOvEM=;
 b=V9mIsGhHHoc4dTIVSA3jBoAuxnGxe46AD/3jctlK65/eSvg8vaNFvgetT9449chgH/RyoXha/lWz8x8wSnF6AEJQoMrLUJeWlr2sVLN5oJgG/3Me2cskg/HY2dL1em7a+/xxgBPm7+PtEOiwFdMtyGFgLQetjYyGSxy4ZjH22KIZqoj2gCX2bcGti3mIsaH/Mb/ULQGTMHqZPW931gFqQcwSFy81UcKjV3smlqXpnXc86L/L5gzznArYcNJwNR9bwvy08YLBS3amjZtGzuPov1DUSPIx++LufYgzc9Jm8vPnFN4/OmgdAI0Kf9+djvZrig/0yhEKCt2zu6OF0JvHIQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v15 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v15 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHda6I2d7pGZvD2QUW0M4qXO6zPug==
Date: Tue, 3 Nov 2026 14:47:12 +0000
Message-ID:
 <42db378d9bfe4dcbff86d2e8dbb62be447aa432e.1793717221.git.oleksii_moisieiev@epam.com>
References: <cover.1793717221.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1793717221.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|GV2PR03MB589725:EE_
x-ms-office365-filtering-correlation-id: e786a22e-eb20-4762-06d9-08df39b958d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|18002099003|22082099003|261102123227099003|3023799007|56012099006|10067099003|261009223027099003|261021121427099003|11063799006|38070700021|261026121527099003;
x-microsoft-antispam-message-info:
 3RXpTGZsocWyT+WfV9tptDpCm0fAXqy71id97Tq2H9w1jXn2Zq0UlmArSw+Kj9nQ+1OmikApGAsYJlB+ALueoH/QDJFirPlsF2Mj8W5Hc1I2YxlfNVd2cIYDWaa/6USBSXJ0nH46qeJzhVxOKG963fGRe9X9R+2g5rGzdlUq6AZuF5XcLGsM3N2R5N8TT1d51SQ9h1AnJ28mBsgKdbiyuOuaY4SmWugjYW0H6ECPm8ISLur3Mek1kAHzlEGRwnyDOqjsWhmSzDb02LGPZnKye5YxCNbmhIEW7iUKFDA/nE3nROrQTbQfG3MVQnGwqtcTCkKMiQUHbNWqlL2jJN90or5FzDIfoU66iPgrRSeSo+Xtn6oQBMAJJp5Lm/BOgPAK1E4Y5Rhnu4aEG1WwmabYfARMHjfvrdEy5q+zotfcHJFsKb+qYMzCtVhrativ2qZFh7iATckxI39GkyQdIQiNvNu7ZFkc1IzRSVX8M7cGqdN01+01lF0Nl5AjfMzmkX114i/dUlndxUitIf8YopS1RTZuGrNIANPNMJuEVK7eGI+HOPLcDpGubY2I7BTLPkrV/P1b8K5vqHToBu7yexJUrm6Yvu2eyFrhcFvr/fRYv+opYcGN+SPVcDBSSY97Rhv33EE9r92sCzBMtXAYVZhSey0rjCiGJ38z616EP54dypU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261102123227099003)(3023799007)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(11063799006)(38070700021)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVkwQU9XK2x1OE9acStFS0xZaGhXTWlqaElVRCtGZ1RqZzAzbG1sUlVleUYy?=
 =?utf-8?B?YS9WNDRkYVdtYlU4UzhaZ0RHTkFhVHF2dUh6S1NQMTBGUkR4Tm1YcFBqeklq?=
 =?utf-8?B?dmtxUVozeUFocFIwVHV0SFgvUGNoZ2ZRVkNhbGZpZXE5Y1pRZDJld2pZU29H?=
 =?utf-8?B?SW5GdUlQdUk1VG90OU5LTlF1c09waEhHZG1nakY0ZmxoTDdsQkptUFFJVFRt?=
 =?utf-8?B?MGsrOEpnVEVlSDFDRFc1dG9jV0EvSDdJNlpML0w0NWlwaXJEdytieFRITVNv?=
 =?utf-8?B?b0w0WThWY0EvQi83YU5PL294WVlrVUtPbksrY1JFTTJGOTJjZFJQUlpjM1l0?=
 =?utf-8?B?NlBHQnFjRTRiTXFLRFB1Mm4yNXVPNlZjNzR1ZE04R1hYUU1obmtBcENYazJF?=
 =?utf-8?B?TktaaTErVmdzbkVrNUU2aUtBS011Q3ZOb0FyYis4OUVYWkIremJxK003Mmk2?=
 =?utf-8?B?MGJydDNmeHc4UHlQUklydFVnMVdvSHJoV2ZnRW9MbDQ0cWl1OGZFaVY3dnZJ?=
 =?utf-8?B?RzZJVDRodUxkY053aUVXcTVzcjdETWZFenhyOGFnZFdWUlhhc2FkQk9hdnVz?=
 =?utf-8?B?d0w2elhqSjNuYWtGZ3RkaWxzSi8zaFZCTm9UUHo0cmI1SVVZeDNBa3hGbmZP?=
 =?utf-8?B?SHczRG4wZHpISkNnVm5xb3Z2ai81R2pSYnZnQytLcW8xVFJxU1EycE85ZlBp?=
 =?utf-8?B?Z0F4MVpkbTgzTmJjSzRhWVBRNTExTjJVQ3JTRWozOWpBTyt3NXd6SFpibzEx?=
 =?utf-8?B?dzNuc3huV1BkSFRRaUhwUDNsMzRKTlR0djdiSjJTTlBiTTV0Y3ZiT0RwRHZB?=
 =?utf-8?B?MU5FZFNIUE5ZR2dDOEFLQURZcWlWYnZjL01hUHY1b2UraVlHdTZURTJlYnBt?=
 =?utf-8?B?TVFlUTJwNHF4dFhSaE1sdmRSU21mY3d6UldHSXhMVEZ6Z0pPSndMbVNjdm82?=
 =?utf-8?B?T3JJY255UFJXZnVUVm9QeTFybmVSMWZaUGdTNzJnSlIxSzRzWDRUa013WGZx?=
 =?utf-8?B?eHFDelJvK3ZBZmViR3BkbUQ0VHRnRXRpL3B4TUlCU2g4eWYzWEh4blp3S3BR?=
 =?utf-8?B?c05tdG05WDNDRFU4bDhUc2hNNTNLb25OaXRVclRUSUNZM1FMYVFWeUxEMWVL?=
 =?utf-8?B?VG9qOGdDRk9VSjlTUHFtTGR6WmovbTVUY3JjMitxQnl2MDlFMkxsZGNOYmNx?=
 =?utf-8?B?WHppTzZQQkNtVEJlbE9ER2J6SUFKcTA1bUNsdzVWN0tzWElGdkp0NmczOVB2?=
 =?utf-8?B?TTFoaTZNVVJiVmdIZmlBV2RuaWhuL0w4TWdoVStGaDF6VU9vRDg0ZTFnSUNl?=
 =?utf-8?B?T1RvSmZqWVR0R2dSUFNFZHU3cUNJcDBqdVhYY3M1UURqZzlpakRCL094QlNs?=
 =?utf-8?B?VE1qVW9NTnB3T21leTVxQ2lHNWx1cks4bFIvajlTaEtrWnlUZnhZaW5LUXN5?=
 =?utf-8?B?VUZ5ZmxzZW1lYWU5dlI4VDRmdFcxZzFxK1d3L1ZQN1J5V1JzMlRZSHdlTlpR?=
 =?utf-8?B?ZFI3YW9odzR6U29ldjFGWXQ5L1RFek1kMWpEYTEyQlo5bFYramxCem5KZ0Yw?=
 =?utf-8?B?MStQRzA2NEM4WmkvZm5wOWhmQzE5NkFlUndsbG44NjlZR0xsUFRWQkNlYlFP?=
 =?utf-8?B?NDF6L0dFeFAxRm5GaytrN3Z6ZVExcFIrVVNxK3ZZNUxZRndGREtTM3lQbFc2?=
 =?utf-8?B?RmZJQmUxVnBScnBTZG50bnpQODJJM2hHMjE3VlV0cVV5R2g2MWVzblR1Wi9Q?=
 =?utf-8?B?TzFab2lXSlFlQ0FVeXBMZU9RZjNnYzM5eTdXaE13MXhZR0tESDZvY3ZGVFpl?=
 =?utf-8?B?MS9WdUlHL1FWVGxpOUo2aGJiUzlXWmhNbmdVa1AyeVc4TlcxWEtmNWhTUllM?=
 =?utf-8?B?bFNxYU9acjd6Y1Zhb2RPeHBzQzdaZ0V2YkZQdWx0azVsbi9YTStkNndBK0pa?=
 =?utf-8?B?RnkrYU1EZmd1STNjU1U5KytteUVYWTQ2dXFJZmd1Ulk4T0VtRnN5aUJNY080?=
 =?utf-8?B?dHVhekwyeXFPSFBHZVgxbFhLMktXRXd2ZVNUb05uRnBqRlNZOHA5aitYYTM2?=
 =?utf-8?B?aytYcE00R3dHcHRnUksyeStkenVUakFSQ0NaTmVWZEtrZjFTNVdpRGY1RnhP?=
 =?utf-8?B?NkU3Zm82SjNEd3dadStkdWdnRkR3WmwwSzEzaWdsbVM2TGdzRXBNaTNseHJp?=
 =?utf-8?B?T2NvK2RpREl6M1dwL1JKN0s3SCtwbElqV3c4SHdQVldxb0ovSTdYMWg1cmRx?=
 =?utf-8?B?bDFUZHFWanhzOUlEWFViNVNNcmZMa1NBWE40YTlyUTJ1WmZ1RiszT1I0ck15?=
 =?utf-8?B?K2p2TThEdXMva3dTK0RYWHZDaXFaMUd1TmxXVTIyZjhXczR4TUxDbTJiVG1i?=
 =?utf-8?Q?SULjWl3zIKyDytxs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e786a22e-eb20-4762-06d9-08df39b958d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 14:47:12.8378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9cBtAuD0Q3O3vIBPlFV0udp0VHE24xt+ipNtCShbmNkV+XBIbZsGc3xUhAf8EnS3M3lcBiAyI95tOaWpzEhy1qClPAmGk5Ef7JOSbLrrzq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB589725
X-purgate-ID: tlsNG-d62444/1793717236-1E465757-2889DF65/0/0
X-purgate-type: clean
X-purgate-size: 1520
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWNjb3JkaW5nIHRvIHRoZSAiNy4xIFJldHVybiBDb2RlcyIgc2VjdGlvbiBvZiBERU4wMDI4IFsx
XQ0KSU5WQUxJRF9QQVJBTUVURVIgY29kZSAoLTMpIGlzIHJldHVybmVkIHdoZW4gb25lIG9mIHRo
ZSBjYWxsDQpwYXJhbWV0ZXJzIGhhcyBhIG5vbi1zdXBwb3J0ZWQgdmFsdWUuDQpBZGRpbmcgdGhp
cyBlcnJvciBjb2RlIHRvIHRoZSBjb21tb24gc21jY2MgaGVhZGVyIGZpbGUuDQoNClsxXTogaHR0
cHM6Ly9kb2N1bWVudGF0aW9uLXNlcnZpY2UuYXJtLmNvbS9zdGF0aWMvNWY4ZWRhZWZmODZlMTY1
MTVjZGJlNGM2DQoNClNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21v
aXNpZWlldkBlcGFtLmNvbT4NCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQotLS0NCg0KKG5vIGNoYW5nZXMgc2luY2UgdjEyKQ0KDQpDaGFuZ2Vz
IGluIHYxMjoNCi0gYWRkIG1pc3NlZCBBY2suDQoNCiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
c21jY2MuaCB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NtY2NjLmggYi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vc21jY2MuaA0KaW5kZXggYzc3NjNhY2Q3Zi4uOTFjOWJjMTE4NiAxMDA2NDQNCi0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zbWNjYy5oDQorKysgYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vc21jY2MuaA0KQEAgLTM4MSw2ICszODEsNyBAQCB2b2lkIGFybV9zbWNjY18x
XzJfc21jKGNvbnN0IHN0cnVjdCBhcm1fc21jY2NfMV8yX3JlZ3MgKmFyZ3MsDQogICAgICAgICAg
ICAgICAgICAgICAgICAweDNGRkYpDQogDQogLyogU01DQ0MgZXJyb3IgY29kZXMgKi8NCisjZGVm
aW5lIEFSTV9TTUNDQ19JTlZBTElEX1BBUkFNRVRFUiAgICAgKC0zKQ0KICNkZWZpbmUgQVJNX1NN
Q0NDX05PVF9SRVFVSVJFRCAgICAgICAgICAoLTIpDQogI2RlZmluZSBBUk1fU01DQ0NfRVJSX1VO
S05PV05fRlVOQ1RJT04gICgtMSkNCiAjZGVmaW5lIEFSTV9TTUNDQ19OT1RfU1VQUE9SVEVEICAg
ICAgICAgKC0xKQ0KLS0gDQoyLjQzLjANCg==

