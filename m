Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC8606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=u4ewLoNd
Received: from list by lists.xenproject.org with outflank-mailman.1461983.1673002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdeA-0004er-Rc; Tue, 27 Oct 2026 09:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461983.1673002; Tue, 27 Oct 2026 09:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdeA-0004ek-OL; Tue, 27 Oct 2026 09:39:10 +0000
Received: by outflank-mailman (input) for mailman id 1461983;
 Tue, 27 Oct 2026 09:39:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLde9-0004ee-CY
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:39:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLde8-001xyd-D8
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:39:08 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae07137-bab6-0a2a0a5309dd-0a2a450be28c-14
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:39:08 +0100
Received: from [52.101.83.130]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae0713b-b7e8-0a2a450b0019-34655382f1e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:39:08 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB8PR03MB6204.eurprd03.prod.outlook.com (2603:10a6:10:139::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:39:05 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0546.019; Tue, 27 Oct 2026
 09:39:05 +0000
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
 b=lUS70TBfgwiHIZrnIUBiHHmLnUogVkZM8lmmmvy5RN0St0oclcCNj69HOGicE7/IAIr9ZnFtqwPd86wWitjzbzgEPo2xQGwOLwHKbVb6HFD6lSJLkB86v1JC1ng1HglLksM8lZRFJyrMGsHd8maShV+vsLyIdCiQ0xLPikY80zH/4P1yBG/fSHnkrKYd+oGdbqvrDypbU6Z5gbT0zjPwwBOGEevC7iaTTqJNotte+xhY//bobQQXkxvcn6N2SlcSJRAUyxUWediK112D3OZnmMPvtifuRJmqSUmBG8xqsx8fAXncKRiQltufTfHECLbq/ezY3Orwf0pubtZJYEbIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs+rNXfxKdI34rPisFtEQGl7/0ZgToIo7kHNoA9PQYI=;
 b=Phf0gdLsKk1LBIk0X9icUJa9xvno15u5x74FdlBRVQxaVtL9pZ/lfL5Uooc3VIv8lmhD+5V7n75CW9WquAxQYpKZ9iJL5eo7Bxay+oolYulIPFMnkzIjFLALm6wDxb0OAxnvj+12Qd73q3oHTZuxIWVo8AGpfFKwCZYILhbibw+5hjs33uZKOlxRivSlgC2m26iVMs24u4vQp8TT/CAw7N0I6Vz+W5BHF2xU+biMlHQF4Cn7Uu5VJa5UQk08pEdqDJaheloLLZNFB96yrEUs958LfEx+RKcw+EJ2hhEgNWT9x7Iu5mPYmuyoPnzJ/4PS33jSPDLrBJUlxBQUpEWb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs+rNXfxKdI34rPisFtEQGl7/0ZgToIo7kHNoA9PQYI=;
 b=u4ewLoNdZA+8o8KozRZ94xneOtGfoBv47Qsp83gzyqxlp28QPlydwiwICPnWDe7ILjMke6aKtOPNfikcEzYh2evRDAhs6cWQMmYEWHinAuGgUlL+7BnNDc0OUQM04/jCIu607QLUjousrumKiifwc3au6SYmBxor34p6qkYRnGluFkQdZauKX7P3aJPLighBBcHbZEuY1sPm6b/jmupf8fmIf+lrar+7lpiyy6FdEZrEoBDYwSyZyqvrnvq6y4jn6H/dYKdP6mNfgpt8/8zt0fBjO3zMnv0vu2ZWe71A2hd4o9QM3wq1ANGdjrDe4/+bAzCjnEb1joh/D2T4bnk0fA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Topic: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Index: AQHdZUVvbuj2+I/wmEeMfHolzOWTxrcPwg+AgAFhaAA=
Date: Tue, 27 Oct 2026 09:39:05 +0000
Message-ID: <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
In-Reply-To: <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB8PR03MB6204:EE_
x-ms-office365-filtering-correlation-id: 0601374c-be28-48da-6bb8-08df340e2442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261009223027099003|261022105027099003|261022113327099003|261021123027099003|261021130227099003|261022075727099003|261021133027099003|261021121427099003|261022115727099003|261021135927099003|260925021311599003|260925022911599003|10067099003|260925021911599003|56012099006|261026121527099003|4133799003|6133799003|22082099003|18002099003|261026135527099003|4143699003|261026140227099003|11063799006|38070700021|261026130827099003;
x-microsoft-antispam-message-info:
 tF2XWnVfsGVIbACWjbAtDdEHVbu6AsKvgjmNgysfQW/Zlu3CM+rfksenGBOjb+w3ZszxCxp51wHErjafKFLDWuzaMRMQVp1rcSU9csXsBkFRCjTHBa2nnnBB+YFNvD79tSUIWTmxOiydkwxnGY0IWJpixdcn0lZrD84R8lKoS2Ai+emvT56IeHy2WkAmNhiddmfD9BEHj7vV3wNb6Na91Xwe0HfWTA4O2aCgXSAPRtGXn6r/ZnX49x60/0u34ANPo+5CtBOBp2xxS+FOx/CuiGJCdumjfPlv/2BLF1VyLrn2T1lT/lQwbc3GCM5oH+so3HOSWl1OcgJ/fV+gLopEI3SHh03MSyGqdMYcqAh06CkgDosdufeoXyCxoamuNeWsJTDUaPmjnlk6ZCyYRY8yHiRBNHJ+ZqsbFIBQ/m+yt1Aon2bxh37mXnDaX4agBsf70D82kC3YDZUo5jqV7VBw8KfU47a/DwrJwLYUi+3lbPty6tJeMfhplvBi8BWkwujtdp5UBtWb6/Hoy4qjyuROcQuobej7DKJAxxVmEiyy5/hU1oSslLRBZrkNB5c7pizi83H8GTODSfogT9+R2D/bMAKyrXNuMRw5MqNH+9mSBZCph2uQPEd2AGbWGXiu08D1t/NQqjB1wH7ACyTnuThb6eUILKmvZR+NfZREz3/5FSU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261009223027099003)(261022105027099003)(261022113327099003)(261021123027099003)(261021130227099003)(261022075727099003)(261021133027099003)(261021121427099003)(261022115727099003)(261021135927099003)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003)(56012099006)(261026121527099003)(4133799003)(6133799003)(22082099003)(18002099003)(261026135527099003)(4143699003)(261026140227099003)(11063799006)(38070700021)(261026130827099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzRrcjMzUnBrbm5MbkNic0JBL3JYMXpKSXFtN3lXUmNFWkg4am11SHpibXVT?=
 =?utf-8?B?dFBQS0pUVkxOZU9GVnJlRmk2alR4QU5obnhtRjZPYzRiL2VDNENmY3dCVU9x?=
 =?utf-8?B?QmJ5U3JvbWo2eEtkMGoyMHJtOUpFUHc4ek9KekMwMG02QmdvVDczampTNWI1?=
 =?utf-8?B?Sm12eHg3eEZkOUZ0QktqZ2Q0eVRwYWR0RGN1SGhnREtjVHc0QjVTdWR3UzVj?=
 =?utf-8?B?ZDBUZ2RrSnRHU2N1d3UxOVQzQ0FtWGZzamFZQ2Q0N0UyeTBpNk1tb1d2L1dY?=
 =?utf-8?B?UnFJWURqZnoreGZSRVgzR3FBTWJaaXA2eVRPYzRUOW1OSnJLd1lSSjBiT2xD?=
 =?utf-8?B?M2RUeG1TSTRsME5iajFacHlMWTFYK1lCSVFiV1dlN1F5bWFPRXFiRUdhRmFJ?=
 =?utf-8?B?MkNLcHZ3YnhEYlBmTm5TbEJUY3dpSE1BaTlRSXJxTTRudXY4cFNKQlVsdEk4?=
 =?utf-8?B?aVdSYmIxWXQzWHRaVktDWGQveFB0MnU5U1BnbThRNUp2T3g2MnJJWVVDcVhv?=
 =?utf-8?B?em5lRStSb2VneFBpSzRYd0lFb1lhL25NU3dHNUdBWFY5eHdmSTVZNEVobG9M?=
 =?utf-8?B?RktoZC9RdEhPb05MU1FRVmc4SXFtcEpsYVFSaERJbzVQb05HYUNvNUNpamVE?=
 =?utf-8?B?TXZBS1JaNDhEaDN2KzRHK01hdGNodlZKMUFxMzkySlZURjdCenNTNEZ2dmZJ?=
 =?utf-8?B?aDlBWUw0RlZZL1JyKzZHWURSWWpZNDIxa2YzSjhUandtWHhyRWxlQ3Q4RHRU?=
 =?utf-8?B?dWo3VktISWNtT0lqbXRYelh5SzROVmN3NVlqVmQzSVBBQys1VWJhSks3eU4x?=
 =?utf-8?B?VUY5SHk3MWVXQWpJVUxIRk0zcWljYlVpOVJTTUpaVkhpOG9kKzlubFRmQ1FD?=
 =?utf-8?B?T3Q2ckZubDJZRTlkTVZCT3AvT1VWK2FMTWhXaFIzaWxKNEQzTWFGKzNFUVJV?=
 =?utf-8?B?bWUwOXl5c0F3K1N0TFgvTUQyVkN6U0lHOWI3M0tGeTJTRkY3dEJRYk0wK3R4?=
 =?utf-8?B?dmxMVFFPS1RjUjdVdHVXcENHdDVwOC9tUzgrTWlvd3ZXVERCYmdiQnRtOU5J?=
 =?utf-8?B?WXlzM05LUGEwWmxhUmVJKzhNdTBzNVpGejNsNDRUQWgxVUVVMjh3ZFBMdW41?=
 =?utf-8?B?MFMvUkxETzdJWWlLMnJjQW9oeFJPZ2RWdEVZdUVIQ0JJK2lZaDhKNSsrZW4r?=
 =?utf-8?B?MUVGWXlMOEtWSm0xajU0VHBCVVJZc3dqMHdvLzgvK3hJMEpWeXNFa1p5NFlN?=
 =?utf-8?B?OC9wcldzTEN2L2dLV2VVcmZZM1k2RVpyT2F0T3NVK0VwSzlSYUx4VmcxSjBy?=
 =?utf-8?B?NHJHZEQ2cE9hcVVBQm9PNEpOZXR5dXVSYU9lL1hYMkdLSU9HNTd4elh6YkZR?=
 =?utf-8?B?QmpBWWhFZVhEcU1uMDhTQk5kV0VRVldBLzN1T2c1TkhzU2tjYW9SQjRhWlJJ?=
 =?utf-8?B?cUJEYWsvdk05djVTMC9sNTBrdTk4QkZDL3prRmpVanRFeURiSUhvWVRoSU9u?=
 =?utf-8?B?ZUoyZlNxWUd1SWI1RXVtemhFVFRsNkdQeVZmekNleGtrMFJoRVhubTJUMlJx?=
 =?utf-8?B?QmVzallOb1NDekVRTDg0d2JJdWtPZEdDczlzNmFzeEx4SFdVVUdUSFZGWFdI?=
 =?utf-8?B?Kzh6SE81T09UeHRiTldFTXQ2clNzZUdmVG1EMDNRbXJ5UWFOZWxWdFZ0WmNT?=
 =?utf-8?B?VjVqQ3p6UmxMelIydm5SUDBuSUY5RU9KT2E0dTVGN1dVVU16SDIyL05PaHQv?=
 =?utf-8?B?QTV5NmZnTzZ0WkxRZ2hYOTMyYmJ5K1NnRm9rbmlTdXJnSVBmTzUrYXBhQlJ5?=
 =?utf-8?B?VGdZcjNyYVh2V0V5MzFYdkxqQlNKajlWZm1uODZEQ0szZldEb0R2a2ZVR1Ax?=
 =?utf-8?B?bGNzZGkwb3Bua2ZrK1VtWm9sT1hoMXNuVjFlbmswaDlVS2JuSFNnbFdKMGpw?=
 =?utf-8?B?T2lKMUFtTThUYVE3aHVPUkdQNzE0Qm4yM2liQURlMnFhUFduS0lBaHVxS0kr?=
 =?utf-8?B?SytOZ3ZNSVUyNXRudzVhN0ROYWZ4U3lRSGM5MDZGaHNGQjQ0YUcwNEd2RzBo?=
 =?utf-8?B?SHkwNXNKN0tjTHQ2UnlRN2trQ05kMjYwSmRyTlFyaHB3UU9EZmRLeXcxd2pn?=
 =?utf-8?B?anJQYXZUWllmU3YrSFJsQ05GWmVHN2krNHlqcHAzNWV5bXo0Y0tVenU2WVgr?=
 =?utf-8?B?M2I1OFBkYnA2QTMyVjUzb2liZWdLdGRJQXJVaDRlc3dhYzNsdld3UnJWTXll?=
 =?utf-8?B?ZFM1VzNaZ2tDUVVaQUIrUUpBNVZ4b1k4d243eS85bm9KeVZjWjN0QU1mQ0xD?=
 =?utf-8?B?c3NvbmFLZmVwaEhyYWxRc1NTN2pMdTNxNjVCaVpoZ0xKdDBudE84QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C1D42B7A0E4A74487342A5C7D1B48EF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0601374c-be28-48da-6bb8-08df340e2442
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 09:39:05.2125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqoA5KrRHbIij/7xFMitU14KtT1oCTjTMlzeMKw941QOrIMdMgOS5m2OQQd5dKp9+2752tJsoFX9A0TEpIYGgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6204
X-purgate-ID: tlsNG-42698a/1793093948-190CD9EA-A649E81E/0/0
X-purgate-type: clean
X-purgate-size: 3096
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCk9uIDEwLzI2LzI2IDI6MzQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4xMC4y
MDI2IDEzOjI3LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IFRoaXMgaXMgcHJlcGFyYXRvcnkg
d29yayB0byBtYWtlIHZQQ0kgTVNJLVggZnVuY3Rpb25hbCBvbiBBcm0uIFNwbGl0IHRoZQ0KPj4g
dlBDSSBNU0ktWCBjb2RlIHNvIHRoYXQgaW50ZXJjZXB0aW5nIHRoZSBNU0ktWCB0YWJsZSBhbmQg
UEJBIHN0YXlzIHg4Ng0KPj4gb25seSwNCj4NCj4gVGhpcyBsaWtlbHkgaXMgcmVsYXRlZCB0byBw
ZWN1bGlhcml0aWVzIG9mIEFybSdzIGludGVycnVwdCBoYW5kbGluZywgeWV0DQo+IG9uIHRoZSBz
dXJmYWNlIEkgY2FuJ3Qgc2VlIHdoeSBub3QgaW50ZXJjZXB0aW5nIE1TSS1YIHRhYmxlIGFjY2Vz
c2VzDQo+IHdvdWxkIGJlIHNhZmUuIFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGV4dGVuZCBiYWNr
Z3JvdW5kIGhlcmUgYSBsaXR0bGU/DQo+DQoNCkhpLA0KDQpPbiBBcm0gbW9zdCBvZiB0aGUgd29y
ayBpcyBkb25lIGJ5IHRoZSBJVFMsIHNvIHRoZSBvbmx5IHRoaW5nIHRoZSBkZXZpY2UNCm5lZWRz
IHRvIHdyaXRlIHRvIHRoZSBkb29yYmVsbCByZWdpc3RlciBpcyB0aGUgRXZlbnRJRC4gSW50ZXJy
dXB0DQp0cmFuc2xhdGlvbiBpcyBmdWxseSBjb25maWd1cmVkIGluIHRoZSBJVFM7IGl0IHdpbGwg
cmVqZWN0IGludmFsaWQNCkV2ZW50SURzIGFuZCBhbHNvIGhhcyBhIHNpZGViYW5kIERldmljZUlE
LCBzbyBtaXNjb25maWd1cmVkIGRldmljZXMNCmNhbm5vdCB0cmlnZ2VyIGVhY2ggb3RoZXIncyBp
bnRlcnJ1cHRzLiBNZW1vcnktd2lzZSBldmVyeXRoaW5nIGlzIGdhdGVkDQpieSB0aGUgSU9NTVUs
IHNvIGEgd3JvbmcgZG9vcmJlbGwgYWRkcmVzcyB3b3VsZCBub3QgcG9zZSBhbnkgcmlzayBlaXRo
ZXIuDQoNClNvIHRoZXJlIGlzIG5vIG5lZWQgb3IgYmVuZWZpdCBpbiB0cmFuc2xhdGluZyBhbnl0
aGluZyBoZXJlLg0KDQo+PiB3aGlsZSB0aGUgTVNJLVggY2FwYWJpbGl0eSBoYW5kbGluZyBiZWNv
bWVzIGNvbW1vbi4gTm8gZnVuY3Rpb25hbA0KPj4gY2hhbmdlIGludGVuZGVkLg0KPj4NCj4+IFRo
aXMgaXMgYSBjb250aW51YXRpb24gb2Ygd29yayBkb25lIGJ5IFJhaHVsIGZyb20gRmVicnVhcnkg
MjAyMlsxXS4NCj4+DQo+PiBUaGUgYXBwcm9hY2ggaXMgaW52ZXJ0ZWQsIGluc3RlYWQgb2YgbW92
aW5nIG91dCB0aGUgeDg2IHBhcnRzLCBtb3ZlIG91dA0KPj4gdGhlIGNvbW1vbiBvbmVzIHRoYXQg
d2lsbCBiZSBuZWVkZWQgb24gQXJtLiBTdWJzZXF1ZW50IGFybSBwYXRjaGVzIGZvcg0KPj4gcmVm
ZXJlbmNlIGNhbiBiZSBmb3VuZCBoZXJlWzJdLg0KPj4NCj4+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvY292ZXIuMTY0NDkzNzQwNS5naXQucmFodWwuc2luZ2hAYXJtLmNv
bS9ULyN0DQo+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZXdkay94ZW4vdHJlZS9wY2llLXBh
c3N0aHJvdWdoLWFybS12cGNpLXYyNg0KPj4NCj4+IFJhaHVsIFNpbmdoICgxKToNCj4+ICAgIHZw
Y2kvbXNpeDogbW92ZSBoZWxwZXJzIHRvIGNvbW1vbg0KPj4NCj4+IFN0ZXdhcnQgSGlsZGVicmFu
ZCAoMik6DQo+PiAgICB2cGNpL21zaXg6IG1vdmUgbXNpeCByZWdpb24gcmVtb3ZhbCB0byBtc2l4
LmMNCj4+ICAgIHZwY2kvbXNpeDogbW92ZSBjb21tb24gbXNpeCBjb2RlIHRvIGNvbW1vbiBmaWxl
DQo+Pg0KPj4gICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vbXNpLmggICAgICB8ICAyMSAtLS0N
Cj4+ICAgeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4+ICAg
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmggfCAgIDIgKy0NCj4+ICAgeGVuL2Ry
aXZlcnMvdnBjaS9NYWtlZmlsZSAgICAgICAgICAgfCAgIDYgKy0NCj4+ICAgeGVuL2RyaXZlcnMv
dnBjaS9oZWFkZXIuYyAgICAgICAgICAgfCAgMzAgKy0tLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBj
aS9tc2kuYyAgICAgICAgICAgICAgfCAgIDMgKy0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4
LmMgICAgICAgICAgICAgfCAxOTcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIHhl
bi9kcml2ZXJzL3ZwY2kvbXNpeF9jb21tb24uYyAgICAgIHwgMjAyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4NCj4gTml0OiBOZXcgZmlsZSdzIG5hbWVzIHdhbnQgdG8gdXNlIGRhc2hl
cyBpbiBmYXZvciBvZiB1bmRlcnNjb3Jlcy4NCj4NCj4gSmFuDQo=

