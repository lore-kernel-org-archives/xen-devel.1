Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4E0CA5FED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441843.1659439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBi-0003SY-6b; Wed, 07 Oct 2026 00:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441843.1659439; Wed, 07 Oct 2026 00:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBi-0003SC-2f; Wed, 07 Oct 2026 00:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1441843;
 Wed, 07 Oct 2026 00:07:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBg-0003Bc-H1
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBf-00Bv1m-Tz
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58ced-e002-0a2a0a5209dd-0a2a4502bac0-46
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:11 +0200
Received: from [52.101.66.102]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d2f-6ca4-0a2a45020019-34654266bce3-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:11 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:10 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRXkLvzhvDdzbH5DGzy3B/xHUvrAYoD3CSRh/2R8fZbHTMSSODbRglgrM+ib+9eHVyheHgQU4G21gKu84PrB/bd/PbVIKG7NnHaB+no57m7bWr2Q2qNeA5Lw2D33GcjYJBfmW96Of8hNlhbnW8qj6iQCybJd7LC9RxyNKelvVPwCcDVnwtdcdamNxSk/lKqeoEv/OMJUeTnY8K7xWAsaAqkDniOTrj9XnajN+68/4KuA95B9mDo3ddHhOsJ7sii7T4rvJXBsqV27LYMRsFocuijCdqbngJ4QTZVYAvZ7GCXOywKfbQvwsEDlWfG/t9H2Nk7P9kuq1cjbrMf0zLwUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6MJ1og6BqUCTCvh0lfZhoDbYWXVkuu3ay1bA+0mw50=;
 b=BE4ME0ktNiMylI7kPDu2mfPNHfNuzshj+hASa/pXK+8/hZ3La2bBbK6WObYlYP7t7SziESBSLqoiCu1oRDifCcQuAuTzPk2jfx6ILJMpkOjfjNSEuN3HvvA+AncIY82dicNXx17C0m2/7z4cyC4cuA2vI/dLOYqQPkf1ggSvGKELkWWt0fL3X5XAifMDswyY3ifqruNSNAxL2ZdrS/ffrYpnBdsXSHrmpKorflTOAEfRnXZtXNIihnD4DB/r4NnsLRBzAxi8H5rBTqZf9wyMvi40NUBw+EbyxN1HtkywwJgXhQasZVHunGQCwkxx42L52ozeNvBJUWW0qagpsurGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6MJ1og6BqUCTCvh0lfZhoDbYWXVkuu3ay1bA+0mw50=;
 b=g0BSzZS211ZXKmfV4YPCD0eycwHrmUFZh7QYZI1nv+rN089SP8nlTRxZMlA/fo8WcGA/EcD/t+VVibiN6Z8es3JTqpcoU9xP/p7ef0R1rXb8iMLz0N3vAKxV9TWz1PYd4rNibJOKezyPR4xUvmKDAD0Kp0iAUc+3snZtCXTzr7ryp+tp+UW+IY3Fvsso4EbULJQah5z5VnfZ7jzIOyNnnnT+FkGDZf9jiwUBk0eEf549P5sAk5sGCnopESQ5G+b1ybSWE8GqigMpyVTCTW4C+DSvVpevq5fReB3Ha8wbFOAA1wi8r3LkrF3GYZ5UQYRhG/puGBGhpAhpuucwTQ9bzg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v4 15/22] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node
 in libxl
Thread-Topic: [PATCH v4 15/22] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHdVe/MdypByIea/k+xZJowEVhBGQ==
Date: Wed, 7 Oct 2026 00:07:10 +0000
Message-ID:
 <34d557ae4a5c1fa7f29b55d96ee4517cf8c3027c.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: de5f0e25-f2e8-49e9-cb50-08df2406ee92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|6133799003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 kia+f/YwWcN1kpwMcuy7swsAiBwB36GbjY9lIquwNHm4ht1ZGzoIGeT6haNlY3Pv/UDJI12hMPP+sh+CYDJz2Np3flyk4smP6EZnu3r66YeM0gEI1Ch0CaVFzMzupsVSAZcuikVDJdf4gFWuOwFkK1bPS/VlQY9lJGNjDARtTiyavHgoeTw9388bq3W7R52UC0lhw+PT4qMCOaHJVDZnmce6h6LKCENzlQhlWZGrNd3aJ8O9TuUv2dMURGWwD2K20FEX97ArU1mSwnuO7MBieuSVf1BX6t0GGQYsB9XweZ/i16hhfsW1TajYzVWF0QT7Qa2GrFSWqmZFcqxDpGIOhBsoZk2aIeW1ISxZDiWLNwM7B7CXoEDucB083Saj17EWTuiqaLA3R4J5Y6iNEzDfT1jEW3A9YqWyyyEy3VxAQ4io1/t9VcwWhQ9XPutMrqNn6N29YL/EhRJ51XdlS9ysaps2gbbGDIiQOHtreF2r8DGDydHJl+KfvpbeWrnQEXnnARtiT5ly7ymrgQQ6zvwwtwu+d6qnJ6yK/rFk4rdadEuD6mGNZeXvafm1a8pwkei4Ca27aF255Ot15x6iOcdWUQNwnY3AowvolCxVaF41o2gcNQ8P6FDliopZM1+I27S9Dsyd6nLzV5Fcm6fF+nCbgG5lFsn4WRXw8ChtKClHGv2+Gqhr6m9XALFYXKDKZDRMXT0voO3hk22209E878KLjdA6R/uIGSBJ+o+FELFl56A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjU5akNVOEs0T25NdlhmRmo4Zzhla1hyeXFwVEtxUWNqcHBBQ3A5QWZqVVMx?=
 =?utf-8?B?MkFxVjB2bGJxUTR2NzU5NWU0K2FnK0J6cW5Pd0FvdFVCVktBMGdNUVdpKzFh?=
 =?utf-8?B?Q0pUK0pic1ArZnY4NCsxUFdmZHRmWGwrSC8zaWtMS1lLNFZaeU0wZTVROFFI?=
 =?utf-8?B?U2FycEZaUzFZcVJ3TkJreGY3VGtpLzY5T0ZkOVJpMmlwVnZjRW1Qdkl5UHZF?=
 =?utf-8?B?QWd3TEtEWmRCVHdtaHZJcG1paUpIbTlsL3pWUnZmb0t2WGVCY0JsQ2lqNC95?=
 =?utf-8?B?UkY5YlpBc1BqSWcyR0dXcEJDUGVaU3NGN1BQUW5zT0Q2MjR4eFhhWnV2c2JE?=
 =?utf-8?B?emNyUjMxYm5jN0JybW5sam9GR3kzNXh0VmlGZUF5SUFwYmJjMEdQaVBKTWNs?=
 =?utf-8?B?SU9HcWpTbVhuK0lyVzFYa2NJMHA5MTlscWFGTExDZjFqTzJQY3o2cFVtQUVp?=
 =?utf-8?B?WTQvNDQ5SlFNc21meFFWdVJFMDE2T0tCTlpyOUpLUVNJbmp0Z2M2OXJ5V1gr?=
 =?utf-8?B?MXBtazlmNHliZ290U1RZb1dndlBkT3RRWlh1RG55MEl3OW1KcUhUZE9HMmFB?=
 =?utf-8?B?bm5Wa25VV0lWQXgrV0RHQkErTVhwZkRnMFZFV3hlWnJINkY5TDhsUlhwYktm?=
 =?utf-8?B?blk0bW93RndWako0V3d2bzRFcVVLSDB0R0VtaUVDdmxVQVloU2xreERJY0t6?=
 =?utf-8?B?ZHNERXJZRllBWi9UdTNkZDY0UmFLcHluL25aVzlyeVZ1SDZPcHNpMkxGYmZW?=
 =?utf-8?B?VEIrclBwVjhLM1BzN3V5RytFUUJSb0RqQ1FPNHNFUE5IWDc3clBjb00ybVRm?=
 =?utf-8?B?OHFFVXNqVE51Uk5zaG90Z1VyQ0lTalJ3NlpuUlFsQlBvMGdIMldpL25jQjhm?=
 =?utf-8?B?Wkd4TjlBdXFRVGlxdmZwNnBIL3dpbzNnbkZwWFZRM2tlbnpLUFRFL2xuV1E0?=
 =?utf-8?B?MDNsaW13ZHBvT1FCbG9lTUQ2VytSSHNTVHYrZmJ6RTU4ak4zUWtHd1QxdFRF?=
 =?utf-8?B?b3cxQUlraFdDd1ppdDJESUpOaVNCT0lWaTNZUE5uNkQrY1NmblA4VEFRMzEx?=
 =?utf-8?B?eXFxb2hrYjR0djBxZWRBS29DNi9UYjJUR0I5ZTFwQnVKa3B3M0laeTcrT0M1?=
 =?utf-8?B?bk1XK0w4RXJZWEI3YThOanV6Qm5MMzk0ckcyYlFtMm9ESzJZcWF3TVU3eks1?=
 =?utf-8?B?L3dPaEFMYmtyaWsvbUJMY0hYR0xCL3hBUnNqL3l6SE5qckJsdFNFVDJqaDNY?=
 =?utf-8?B?YWdjMlNuVWZ2TUtqZWNxUzFacVlrSHYyZlA2TityNVJsSHF0V2wvTHJOMnFr?=
 =?utf-8?B?b0R3WitsNU5HQ25vb1I5THFYeFF4MUowbWJ2NUNjNkRjVnAzWEswVEgxTTJC?=
 =?utf-8?B?Y0JOU1Bkd09TSEwvRWhhejhIaXZVNjFNa21LNjNta3ZpSEtzVDRZYURrRkts?=
 =?utf-8?B?RmF6a1VjSTdsU0JNQmJOaWZyeGJRR21zRUFOWVNMbTA3SDhuUHBMZ05EMUtX?=
 =?utf-8?B?OU51ZWgvRWdNS2ExcUdmSUtDSy9SWVVZWHRZQ2wraUZjNkZSc29UdG5QOUVz?=
 =?utf-8?B?eGZYaTR0RU5CT1UyazV2REZYSVZrbEZMM255R2lkSUdxUFlWcnZyQmc5WDAy?=
 =?utf-8?B?Zi9qUnBCQmFrSWdOV3FBZy9CNWwzMSt5WmFRTWJubnRvWHRMNHp6N0R6TFQv?=
 =?utf-8?B?bngvRThZbm9TUzhHaTJ0bWlmUzdsYmpJRHhYMFo5YXV3Nmw5U09vWEE1Z0FW?=
 =?utf-8?B?MlN4QUp1WE5qRkRjdWlkdm56azVaeUhtTmJYVjBXMGNpL1VQWU85VDBXd3FQ?=
 =?utf-8?B?eWpOUEZDajJrKzFtdFh3SFhhQUZpdm5PY0NsRjlQVDhTVXdBeWN4U21sdUVM?=
 =?utf-8?B?S3c2bjRKWTFsNlZzTVpyWUcrbTM3NlB3anFzRmtPbG9SVmtVc3VxdzFaNTY1?=
 =?utf-8?B?RWFLekJKd3RPRE5RNkg0UW0wYUxBNjdrVFkyeEpPT3hxZDFQaWIzZUgrdVZJ?=
 =?utf-8?B?ODNtOTM1WDlSdDNZMnR4bzM0MG8rck9FWVdrenlwclhPWmF6NGdub3lwRC9t?=
 =?utf-8?B?a2hSYzREWTg3RWhpUEJtSkVHck1Ma25BNnFYdnUyVjVTaXFRQjV6UDF3SWpY?=
 =?utf-8?B?eStTUzVQQWtFZUtlRldGSk85TUMyZU13dHd2ZTVQMXZMUDZ3QytETWtzTkNF?=
 =?utf-8?B?OWhpaHhrVFI3V0hpVDRiVmI1aE1wSEwza0FzS0pMeXBwSXNWeEhJeVJWNFd0?=
 =?utf-8?B?SmU4S09Ub3lYekRjOFYwMkszcG1hSm1mb0lXMnd4UnBiQ2k3M09CK0lGRGxF?=
 =?utf-8?B?bVJ5SGJ1ZFlNb2xSUHB3SmRxdUhwakZPMFdHajk5aUJlSVFRQ1hpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5f0e25-f2e8-49e9-cb50-08df2406ee92
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:10.0660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHTn/kVVrltz/J2FLAwFtoiRL2RFf35pApifEo8IGMG1DGh9L8eW+IX86EwwsbE37fn5++q66FzxpbjKGz/hdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-720697/1791331631-317CA2AC-E0392EAF/0/0
X-purgate-type: clean
X-purgate-size: 3142

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNCmxpYnhsIHdpbGwgY3Jl
YXRlIGFuIEVtdWxhdGVkIFNNTVV2MyBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UNCnRy
ZWUgdG8gZW5hYmxlIHRoZSBndWVzdCBPUyB0byBkaXNjb3ZlciB0aGUgdmlydHVhbCBTTU1VdjMg
ZHVyaW5nIGd1ZXN0DQpib290Lg0KDQpFbXVsYXRlZCBTTU1VdjMgZGV2aWNlIHRyZWUgbm9kZSB3
aWxsIG9ubHkgYmUgY3JlYXRlZCB3aGVuDQoidmlvbW11PXNtbXV2MyIgaXMgc2V0IGluIHhsIGRv
bWFpbiBjb25maWd1cmF0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwu
c2luZ2hAYXJtLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1pbGFuIERqb2tpYyA8bWlsYW5fZGpva2lj
QGVwYW0uY29tPg0KLS0tDQogdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KaW5kZXggYTI0ODc5MzU4OC4uMTIwN2I2MjBmYSAx
MDA2NDQNCi0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCisrKyBiL3Rvb2xzL2xp
YnMvbGlnaHQvbGlieGxfYXJtLmMNCkBAIC05MDEsNiArOTAxLDM2IEBAIHN0YXRpYyBpbnQgbWFr
ZV92cGwwMTFfdWFydF9ub2RlKGxpYnhsX19nYyAqZ2MsIHZvaWQgKmZkdCwNCiAgICAgcmV0dXJu
IDA7DQogfQ0KIA0KK3N0YXRpYyBpbnQgbWFrZV92c21tdXYzX25vZGUobGlieGxfX2djICpnYywg
dm9pZCAqZmR0LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGFy
Y2hfaW5mbyAqYWluZm8sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNf
ZG9tX2ltYWdlICpkb20pDQorew0KKyAgICBpbnQgcmVzOw0KKyAgICBjb25zdCBjaGFyICpuYW1l
ID0gR0NTUFJJTlRGKCJpb21tdUAlbGx4IiwgR1VFU1RfVlNNTVVWM19CQVNFKTsNCisNCisgICAg
cmVzID0gZmR0X2JlZ2luX25vZGUoZmR0LCBuYW1lKTsNCisgICAgaWYgKHJlcykgcmV0dXJuIHJl
czsNCisNCisgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NvbXBhdChnYywgZmR0LCAxLCAiYXJtLHNt
bXUtdjMiKTsNCisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCisNCisgICAgcmVzID0gZmR0X3By
b3BlcnR5X3JlZ3MoZ2MsIGZkdCwgR1VFU1RfUk9PVF9BRERSRVNTX0NFTExTLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBHVUVTVF9ST09UX1NJWkVfQ0VMTFMsIDEsIEdVRVNUX1ZTTU1V
VjNfQkFTRSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1RfVlNNTVVWM19TSVpF
KTsNCisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCisNCisgICAgcmVzID0gZmR0X3Byb3BlcnR5
X2NlbGwoZmR0LCAicGhhbmRsZSIsIEdVRVNUX1BIQU5ETEVfVlNNTVVWMyk7DQorICAgIGlmIChy
ZXMpIHJldHVybiByZXM7DQorDQorICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgIiNp
b21tdS1jZWxscyIsIDEpOw0KKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOw0KKw0KKyAgICByZXMg
PSBmZHRfZW5kX25vZGUoZmR0KTsNCisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCisNCisgICAg
cmV0dXJuIDA7DQorfQ0KKw0KIHN0YXRpYyBpbnQgbWFrZV92cGNpX25vZGUobGlieGxfX2djICpn
Yywgdm9pZCAqZmR0LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGFy
Y2hfaW5mbyAqYWluZm8sDQogICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNfZG9t
X2ltYWdlICpkb20pDQpAQCAtMTQwOCw2ICsxNDM4LDkgQEAgbmV4dF9yZXNpemU6DQogICAgICAg
ICBpZiAoZF9jb25maWctPm51bV9wY2lkZXZzKQ0KICAgICAgICAgICAgIEZEVCggbWFrZV92cGNp
X25vZGUoZ2MsIGZkdCwgYWluZm8sIGRvbSkgKTsNCiANCisgICAgICAgIGlmIChpbmZvLT5hcmNo
X2FybS52aW9tbXVfdHlwZSA9PSBMSUJYTF9WSU9NTVVfVFlQRV9TTU1VVjMpDQorICAgICAgICAg
ICAgRkRUKCBtYWtlX3ZzbW11djNfbm9kZShnYywgZmR0LCBhaW5mbywgZG9tKSApOw0KKw0KICAg
ICAgICAgZm9yIChpID0gMDsgaSA8IGRfY29uZmlnLT5udW1fZGlza3M7IGkrKykgew0KICAgICAg
ICAgICAgIGxpYnhsX2RldmljZV9kaXNrICpkaXNrID0gJmRfY29uZmlnLT5kaXNrc1tpXTsNCiAN
Ci0tIA0KMi40My4wDQo=

