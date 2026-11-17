Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE2606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=JzJdYr7/
Received: from list by lists.xenproject.org with outflank-mailman.1491677.1692437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cv-0004sa-3M; Tue, 17 Nov 2026 01:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491677.1692437; Tue, 17 Nov 2026 01:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cu-0004sP-Vk; Tue, 17 Nov 2026 01:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1491677;
 Tue, 17 Nov 2026 01:04:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7cs-0004ZA-SC
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7cs-00Cf60-8i
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:04:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba811-8faa-0a2a0a5109dd-0a2a45048b54-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:46 +0100
Received: from [52.101.69.121]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba82e-b57f-0a2a45040019-3465457944f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:46 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:04:44 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:04:44 +0000
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
 b=QNH5M0ByvzUnTm1IphU+LB3LIN6/wI+RpyxE5PmHzDu6xrHctW3ouXTAKoixIM8JdGFTBlxuAY7zhOB5KVDFd77en/w19tF+F6ZSj7omiZQEd92h0TgakyC5vBTe3Y6fm6GpTNmu70y3BqeZCn+9CtDwJWqYoXaf7FrTzhZF71ytJYiRQlYr97Gg/29JhaWQ8k5AJpysUA4a8z8iM4jB6+NX+Q0tq3Wm6+ozK0zrSSTPhrd+SMAM0mwuQ+iQ49zIurQOgDb54Pg6InPgu1LojdRhcbrvZAQQgihu4eSupCEAKPwq6T3pT/ZyX+zj88l07HLIyWxazAf1yY77C4Pukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxbftVabo0Iq95qONmVxYcaUvcbm+FXNrSmc1pXVw5k=;
 b=d0HBfjV//y/CfOUn8Tnocwq6V4TlYWFQk9c/MjrarxuWz5Xi2uZvyGQcUdWmi1fbsFCQEWOBVBDIW9pmC6Hpr5mSSL5smu0lSNwbIonIt8UeOoNjSLEh5ZBkwlDBRg9aALEI9pthLJkTBzW1WNS3y32c5A+RHhb70meeEIvE2/yG8RhCZ+X61UHh/3FtsXXPxljC1sQKODlDwxfbG15e3ZMgRPMGEfQbBRd9x9tvjxH0E0LNasaYpS0BMU4oeKzorVeYPlcCsnu5pDwdL38eSHdeodfAEL+OCuZXMjIPoJduFDXoNLyw8OD3GE07lT00SC6ege5D4JzzE51IGoMr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxbftVabo0Iq95qONmVxYcaUvcbm+FXNrSmc1pXVw5k=;
 b=JzJdYr7/+3HTw5Z+yV0Uz07QJ4Uzc1CbMAmRAroQNtHbQO9mi76yw2R48Jv3EGQqLCxDN6O4KQ4FLiwN3xs41FQoduxWq2fdlx/9+DrZ4s/Zbq04wSoHRAQJsEB2K8+XOubQBgKcBHE4K4Od29mEMAMMcoRiHFUlFGGpGZkEnbaFo/3Wkb18wGAL7KpTveRw25uOfArl/sRaFVKTEAuFFTLlLaONdwKOBbiQnKWryH2uQRzDydjZ5pNdmoUFwHdIura8V1IdPgJzoA3fe7crJ2bC5nSln5sMUT01qEIhfUJi7F5IcdxqiPo+cveXq9cMj4BVZhikfK2wiGs0KmL8fw==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v14 08/15] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Topic: [PATCH v14 08/15] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Index: AQHddi+hjp7Mzp6lbUSrOd7jaLayGg==
Date: Tue, 17 Nov 2026 01:04:44 +0000
Message-ID:
 <d6856dfeb3578658153564d16f4ae2694ff66c90.1794873792.git.mykola_kvach@epam.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|DB3PR0302MB9234:EE_
x-ms-office365-filtering-correlation-id: 97688c59-ecc4-457a-6f06-08df4446c478
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|261021121427099003|11063799006|261028144727099003|261021123027099003|261026121527099003|261022105027099003|261102123227099003|261026140227099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 /pqKODOXft3sNmaAMX+YEeSAXjQ9qu7Nxv47br3gXOjGBpJqe80qLNrACJyUZewdeM0QoR8LbDZPHMWyD+Pr8JWGg2qqQdLAm1B3/C2ErbmWQWlLrVn0UIwA0ti18TfXs1ytuk2yiVchAa2HrzOsqN6l0Fjk8+SKUNZS9iCh0IX9EwuVeZXm2f25sDHcoAkjwyazxx9zCx3rxGSsInRr30AvuGiSF/oVK1DxL9c4sg4ba2ezSXF6Uu4Uq4QH7hMmAW9Hklty6z6X0abqrI4oQAUFfytR/MsfRzrNcA8b97wuKn9pYnLbURLqJIusrpjzwCuyTwQULpov7FmTUZa52RDN1Tt7NEbBPbIZ0UGGduKQliAVYML4Dr0WAEH4g1UDoxBb0xqcv0TZpJkYtx/qngnHT/OndhXosZeuP+BgIDGRj3L3xaAI5gopMSiUXmFTKxJ6YZPALG5F1cmUOvTKU6O1YHaGPRM+TAC2JgsbWSoZVdDI1zs/2RaCrfEO/zcTEI1nFdEyT6fQSQqdZB+V4xiyuXwhsbestO+znRKJI6W4r7t/OIhNlnq6tkYZ5XLYBUc7G8CSLCQGqvTQcQAy9TQikcXTI6fHcJ1Mcne2OUUl65bSf0fuRUobC2qJJM1MXCW3k0qX36nzlCsKROau9LUbD/aaDPxQUX6GARyHfeLI7pmk7Pf5Qa0oc75S2dw08l4pSgaKLAyTWvvSxEM7rT0ZYIgw1+WLhzbMvBvWV+E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(261021121427099003)(11063799006)(261028144727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261102123227099003)(261026140227099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWkxNGtXdDZoTXcxdXdmTnVXSUhmWXV1QXEra0R2OHZCRjliaUpYWjNyVVZu?=
 =?utf-8?B?MzF6cmludzRRRVEyTnJWY2xud09ReEJjL3hiZ1ZJNWFkazVXTENSbEh2d0ls?=
 =?utf-8?B?ZlJMeXpiajZwbnVZRW5FYjE4b1NPOXR5ZHk2bCtDdk54Q2w4SUs1RzQ2bURo?=
 =?utf-8?B?R29PK2dPb1hNSkJabHFwTi9Vei9uSjNrL3RLVmxHelZvSVZya0dvdkRUVnpE?=
 =?utf-8?B?VXhkOGdlSUoyckw0WWlJTGNKazE5WjkyUFdJSmhEMkVuT1N0eEV5QlNSMS9U?=
 =?utf-8?B?Y2R6eEFFa3JDSEdkaTkvdXRoU3JtcDdEdmFNMjdVajJRK29mSjVmSU9Dc1VB?=
 =?utf-8?B?TDlaUXhMcGFXa09Pd1dUOTlXa0RlNVRwR3dKRW42TDZlVElZRjdNVUlTVSty?=
 =?utf-8?B?cnhZZ1h3Z1BCY2RGemZZcTVuZWQxbnpWWHo5OVdmVDRhNFJtYVFJdmpxQ3ZY?=
 =?utf-8?B?bXI2ZzVwOFF5OHJZeHNxMWNXZXdKcmVPdDAzeXJKQ01lQ3FkMEhHdjVKTGF0?=
 =?utf-8?B?TmVJZXRkTC9TYlRGSkdWRk4xQVFTMHFHdVI1bGJMVUQ4Zi9ma2ZNcUd5VmFC?=
 =?utf-8?B?S2dOL0NTWnJJUkNGVkVLVFAwOE1xWktTODJOQ0hhL3N6aG5RSlJYck40OS96?=
 =?utf-8?B?Y3JwZU12RXNTQURpOU01bVd5UmtGNTVTUFRsMjh3WjUwSXVNWS9henJoa2Z6?=
 =?utf-8?B?bFJKb3N1K1I2VnBIalROZ0x6Y0xNdHM1VExYQ2FEYWxkY3M4SElWQ2M5eFM2?=
 =?utf-8?B?Yk5mWVlueUpDSjQ3bXA2L2RJdFFueC9KSDBzWTdaZ2tBTmdYZUREdFhsZzVV?=
 =?utf-8?B?R1plVjJZTmFWVEhKRVpPcXJYUzNlaEEvV0RxNk1IZnNKdUIrWG01Qmg2Qlk2?=
 =?utf-8?B?dm1lNUlRRXZHbytnOVFwR09QbmYwMVpxc1ROSTNYd1RFQVE2TldwYlpIQkQy?=
 =?utf-8?B?VlNVMlBEeHpKdVZXUUVyZFBPTmFkanVTU0k5djhEVWJYYzJzS1FFWVFvUTRS?=
 =?utf-8?B?Z1dxMVU4ZFNUVVpRZ0FqN1Z4WFA1VWxnU2lIZ1ZQQTVDUzJCdEZzNHVlU3My?=
 =?utf-8?B?Vm9rZEgrVFdsckdmd1IwS21aM1RUVXdzMzJ5OENVVit3R09CMzJNNXB2UWdw?=
 =?utf-8?B?TmVZL3ovYnJaZEQ4QkVXNnZ0MnZGUDBnTWtqQUJYZ0VqbzZaV1Z6NGc3RUJs?=
 =?utf-8?B?VlNJWVY0aGRXYlJkMm1iYUllYUZRWThTNkx4S05Bb2hPZGxHVTdJcVNSWTdE?=
 =?utf-8?B?aVp6NjRCakpqc1V0Q0VpeUpPZHI4c0RtR1VYYWJCckR4N1VBd2dZaFp6MWc4?=
 =?utf-8?B?NWQyVVJKOU5jN202dThhM21hL0UzRFE4U3UyMWpUOWROSDhINlNaTStlUzRR?=
 =?utf-8?B?UkVwbXdTeCtUYlZLOEdVTVNJZWhWa01SUU5CWHM4bVhqekRHbWxQSVM5NlVt?=
 =?utf-8?B?QUpmT3REdExMa2Z3RDYxTWxWQjdNUmFWSjRYKzlmcUkxQ3JYdmN3RWRrM2xp?=
 =?utf-8?B?VE9IM1Bmb1EvWFRFRzdyWlNpMkczOXpWNFhSaGMwOWMvZG5qbG9yeDg4Qmpk?=
 =?utf-8?B?Q3VENm02QTZna29Tei9WQmxEcXJDZkZrTzlOS1FiOTNwQy9kaWFVSjZTbEpP?=
 =?utf-8?B?N2l1VzNEUSs2b1lYNGxId2U1V2lHb1RQU2I2VHhvMXQxTXpUeTJ4a0pqY1lC?=
 =?utf-8?B?UHBRZGtMbUp3dk9lSDA2Mldmb2dKQVJHaElNS0gyODBUQ2xkU1JlWEFlbExy?=
 =?utf-8?B?RGE1NnJZckFPc0pzcTg3bURaZEsxOFlKdGhySkcrMkZtQ1JoODl2K0YvdUZO?=
 =?utf-8?B?U1g5V1ZXVkV5emdWd0JQMU0rT1R3amk4VXhYd1ZxWkQ3aFFvalpIZ3ZiNGlW?=
 =?utf-8?B?VTJaMTVnbnZNY1BWUmEzR01BRDRHeHpUUWtZUm1lRTJXdzl6ZkpJenJUc3Nv?=
 =?utf-8?B?eTVqditCZDBBL3ljbjEvVGwwbzQybHg4WlFPbDBPd2JqNHN3WXJWZnQ5QmpW?=
 =?utf-8?B?L0NwSUtaUEdlWXlFRzc3QnR2VDA3MjJENE9iR3VkUmZMN1hKQ2VjeXVHVmlI?=
 =?utf-8?B?ZlVtbWFHNElDT1ZUbWdueFlWek5WOFlwUEVUZm8ybHNYZDZoVkREUTczK0wx?=
 =?utf-8?B?NWVmRW0zbXpmSmx4b3AzblZWRVNxQ0IvUVNMb2pDZkZ6TDlnVlFUS01nZHg1?=
 =?utf-8?B?MExsajZWblJTM050Yjh4bTM3eUkrdVlvUUlEbkJFWFVtYTFIT0p2L3pjVnE3?=
 =?utf-8?B?K1AvYTJNZ1JFZDZGZElpcCs0TDN1UVp2alhabGNKcy9KakJiSDNCR3htNmVI?=
 =?utf-8?Q?5lKrMPG99j5H22UT9J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97688c59-ecc4-457a-6f06-08df4446c478
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:04:44.4311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nxJFe/ATKb+foxdSPqOmDDhxCKaUBNYQljPBKcEt4J/rdhaQYtDw3Q5U/mnHKViosMfT0bBziTE/yPB3a6Ogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-ebf023/1794877486-516D2B50-EF7CF6DA/0/0
X-purgate-type: clean
X-purgate-size: 5100
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEZGLUEgbm90aWZpY2F0aW9uIFNSSSBpbnRlcnJ1cHQgaGFuZGxlciB3YXMgbm90IGNvcnJl
Y3RseSB0aWVkIHRvDQpDUFUgaG90cGx1ZyBhbmQgc3VzcGVuZC9yZXN1bWUuIEFzIGEgcmVzdWx0
LCBDUFVzIGdvaW5nIG9mZmxpbmUgYW5kDQpiYWNrIG9ubGluZSBjb3VsZCBlbmQgdXAgd2l0aCBz
dGFsZSBvciBtaXNzaW5nIGhhbmRsZXJzLCBicmVha2luZw0KZGVsaXZlcnkgb2YgRkYtQSBub3Rp
ZmljYXRpb25zLg0KDQpTaWduZWQtb2ZmLWJ5OiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBl
cGFtLmNvbT4NClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5j
b20+DQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KLS0tDQpDaGFuZ2VzIGluIFYxMzoNCi0gVXNlIGZhbHNlIGZvciBmcmVlX29uX3JlbGVh
c2UgKE1JU1JBIFJ1bGUgMTAuMykuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KLSBFeHBsaWNpdGx5
IGRpc2NhcmQgcmVxdWVzdF9zcmlfaXJxKCkncyByZXN1bHQgb24gc2Vjb25kYXJ5IENQVXMuIFRo
ZQ0KICBoZWxwZXIgbG9ncyBlcnJvcnMsIHByZXNlcnZpbmcgdGhlIGV4aXN0aW5nIGJlaGF2aW9y
IChNSVNSQSBSdWxlIDE3LjcpLg0KICBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCi0gRXhwbGFpbiB3
aHkgdGhlIG5vdGlmaWVyIGlnbm9yZXMgb3RoZXIgQ1BVIGV2ZW50cyAoTUlTUkEgUnVsZSAxNi40
KS4gTm8NCiAgZnVuY3Rpb25hbCBjaGFuZ2UuDQotLS0NCiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9u
b3RpZi5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25v
dGlmLmMNCmluZGV4IGM2NGJjMzlmMDMuLjFlYzQ1NWQyYWQgMTAwNjQ0DQotLS0gYS94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQorKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5j
DQpAQCAtMzYwLDEwICszNjAsMjggQEAgc3RhdGljIGludDMyX3QgZmZhX25vdGlmaWNhdGlvbl9i
aXRtYXBfZGVzdHJveSh1aW50MTZfdCB2bV9pZCkNCiAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2Fs
bChGRkFfTk9USUZJQ0FUSU9OX0JJVE1BUF9ERVNUUk9ZLCB2bV9pZCwgMCwgMCwgMCk7DQogfQ0K
IA0KLXZvaWQgZmZhX25vdGlmX2luaXRfaW50ZXJydXB0KHZvaWQpDQorc3RhdGljIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBpcnFhY3Rpb24sIHNyaV9pcnEpOw0KKw0KK3N0YXRp
YyBpbnQgcmVxdWVzdF9zcmlfaXJxKHZvaWQpDQogew0KICAgICBpbnQgcmV0Ow0KKyAgICBzdHJ1
Y3QgaXJxYWN0aW9uICpzcmlfYWN0aW9uID0gJnRoaXNfY3B1KHNyaV9pcnEpOw0KKw0KKyAgICBz
cmlfYWN0aW9uLT5uYW1lID0gIkZGLUEgbm90aWYiOw0KKyAgICBzcmlfYWN0aW9uLT5oYW5kbGVy
ID0gbm90aWZfaXJxX2hhbmRsZXI7DQorICAgIHNyaV9hY3Rpb24tPmRldl9pZCA9IE5VTEw7DQor
ICAgIHNyaV9hY3Rpb24tPmZyZWVfb25fcmVsZWFzZSA9IGZhbHNlOw0KKw0KKyAgICByZXQgPSBz
ZXR1cF9pcnEobm90aWZfc3JpX2lycSwgMCwgc3JpX2FjdGlvbik7DQorICAgIGlmICggcmV0ICkN
CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJmZmE6IHNldHVwX2lycSBpcnEgJXUgZmFpbGVk
OiBlcnJvciAlZFxuIiwNCisgICAgICAgICAgICAgICBub3RpZl9zcmlfaXJxLCByZXQpOw0KKw0K
KyAgICByZXR1cm4gcmV0Ow0KK30NCiANCit2b2lkIGZmYV9ub3RpZl9pbml0X2ludGVycnVwdCh2
b2lkKQ0KK3sNCiAgICAgaWYgKCBmd19ub3RpZl9lbmFibGVkICYmIG5vdGlmX3NyaV9pcnEgPCBO
Ul9HSUNfU0dJICkNCiAgICAgew0KICAgICAgICAgLyoNCkBAIC0zNzYsMTQgKzM5NCwzNyBAQCB2
b2lkIGZmYV9ub3RpZl9pbml0X2ludGVycnVwdCh2b2lkKQ0KICAgICAgICAgICogcGVuZGluZywg
d2hpbGUgdGhlIFNQTUMgaW4gdGhlIHNlY3VyZSB3b3JsZCB3aWxsIG5vdCBub3RpY2UgdGhhdA0K
ICAgICAgICAgICogdGhlIGludGVycnVwdCB3YXMgbG9zdC4NCiAgICAgICAgICAqLw0KLSAgICAg
ICAgcmV0ID0gcmVxdWVzdF9pcnEobm90aWZfc3JpX2lycSwgMCwgbm90aWZfaXJxX2hhbmRsZXIs
ICJGRi1BIG5vdGlmIiwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOw0KLSAgICAg
ICAgaWYgKCByZXQgKQ0KLSAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJmZmE6IHJlcXVl
c3RfaXJxIGlycSAldSBmYWlsZWQ6IGVycm9yICVkXG4iLA0KLSAgICAgICAgICAgICAgICAgICBu
b3RpZl9zcmlfaXJxLCByZXQpOw0KKyAgICAgICAgKHZvaWQpcmVxdWVzdF9zcmlfaXJxKCk7DQor
ICAgIH0NCit9DQorDQorc3RhdGljIHZvaWQgZGVpbml0X2ZmYV9ub3RpZl9pbnRlcnJ1cHQodm9p
ZCkNCit7DQorICAgIGlmICggZndfbm90aWZfZW5hYmxlZCAmJiBub3RpZl9zcmlfaXJxIDwgTlJf
R0lDX1NHSSApDQorICAgICAgICByZWxlYXNlX2lycShub3RpZl9zcmlfaXJxLCBOVUxMKTsNCit9
DQorDQorc3RhdGljIGludCBjcHVfZmZhX25vdGlmX2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9i
bG9jayAqbmZiLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGFjdGlvbiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqaGNw
dSkNCit7DQorICAgIHN3aXRjaCAoIGFjdGlvbiApDQorICAgIHsNCisgICAgY2FzZSBDUFVfRFlJ
Tkc6DQorICAgICAgICBkZWluaXRfZmZhX25vdGlmX2ludGVycnVwdCgpOw0KKyAgICAgICAgYnJl
YWs7DQorICAgIGRlZmF1bHQ6DQorICAgICAgICAvKiBJZ25vcmUgb3RoZXIgQ1BVIGV2ZW50cy4g
Ki8NCisgICAgICAgIGJyZWFrOw0KICAgICB9DQorDQorICAgIHJldHVybiBOT1RJRllfRE9ORTsN
CiB9DQogDQorc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBjcHVfZmZhX25vdGlmX25mYiA9
IHsNCisgICAgLm5vdGlmaWVyX2NhbGwgPSBjcHVfZmZhX25vdGlmX2NhbGxiYWNrLA0KK307DQor
DQogdm9pZCBmZmFfbm90aWZfaW5pdCh2b2lkKQ0KIHsNCiAgICAgY29uc3Qgc3RydWN0IGFybV9z
bWNjY18xXzJfcmVncyBhcmcgPSB7DQpAQCAtNDE2LDEzICs0NTcsMTEgQEAgdm9pZCBmZmFfbm90
aWZfaW5pdCh2b2lkKQ0KICAgICAgICAgICAgICAgICByZXR1cm47DQogICAgICAgICAgICAgfQ0K
ICAgICAgICAgfQ0KLSAgICAgICAgcmV0ID0gcmVxdWVzdF9pcnEoaXJxLCAwLCBub3RpZl9pcnFf
aGFuZGxlciwgIkZGLUEgbm90aWYiLCBOVUxMKTsNCi0gICAgICAgIGlmICggcmV0ICkNCi0gICAg
ICAgIHsNCi0gICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiByZXF1ZXN0X2lycSBp
cnEgJXUgZmFpbGVkOiBlcnJvciAlZFxuIiwNCi0gICAgICAgICAgICAgICAgICAgaXJxLCByZXQp
Ow0KKw0KKyAgICAgICAgaWYgKCByZXF1ZXN0X3NyaV9pcnEoKSApDQogICAgICAgICAgICAgcmV0
dXJuOw0KLSAgICAgICAgfQ0KKw0KKyAgICAgICAgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKCZjcHVf
ZmZhX25vdGlmX25mYik7DQogICAgICAgICBmd19ub3RpZl9lbmFibGVkID0gdHJ1ZTsNCiAgICAg
fQ0KIH0NCi0tIA0KMi41My4wDQo=

