Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE3DCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441862.1659465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBt-0005Dj-OT; Wed, 07 Oct 2026 00:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441862.1659465; Wed, 07 Oct 2026 00:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBt-0005D6-KC; Wed, 07 Oct 2026 00:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1441862;
 Wed, 07 Oct 2026 00:07:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBr-0004iN-Jc
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBr-000T4z-0B
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d31-2eae-0a2a0a5409dd-0a2a4502b47a-6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:22 +0200
Received: from [40.107.159.102]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d3a-6ca4-0a2a45020019-286b9f660fa9-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:22 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:20 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:17 +0000
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
 b=f2R97XwvSNrIEygPT/bqtCyAv2Vt2Dj3o5t6/87uqKqfF1umKRfFfe8akYkhaD2MlG84zS22tKMBi9Hz/TY8JCUD+2hz5vrIu2cCPnnxjtFFtcu8rIVuezMTyhu+7Cr5165zf6/8emyEdlYbnS9LfAaQ5BtDwFvH6a4I+v/BCphqhZPkzrVAGaKQElbL0eyKusMyzMkBJwmTj56V/obK5EiphESRbRh+oJiKCYV2YQqRKik2B11smO9378iIgpBpkMxFAfqd3MGRYoBN9GC4Pu3OSD2eR5mDk8DKgR/0B4V931DXGIkhGS1Sa2OlCmQn9QLGhlAokhjlLM3zrKpI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53OCYmKFkmCCZj9TDCJ9g+czJuFl75vdsuZUcX/88+o=;
 b=SKFeXrfBKBAU7GuwHyOrAob2mSReeWd3Od7fUCbEI0FOYLysgV+m+McPiDqxI5eNLptvyAD6JLEuc0eXWafqL2mGzzk2MhH43nKldhOBQ0cc+Z+mtn/0sJVygZJFYpF7lTRsfXPF6W73mm39l1hUzhMu6HYadyC80i1lWgJX7BeY5N9nOnCQw1UBL7Paj4S3r3YXCFuNlr5hWCWDcF4BV868EviVS/YAWf6whzvQRsUF66Bfmp38zlsCUde3XjFe01ghuLxbZ6D4/c8xMXk8Nvliorad089WzHlafTF3JTolVwKn/iGxp//gs6HPcxI5jMqQtnx1lmwQL0/cadsY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53OCYmKFkmCCZj9TDCJ9g+czJuFl75vdsuZUcX/88+o=;
 b=RhZtwrCwt4KUiAXeq0Mh7UvMGCvPV+EaQbL7rDwtmRml8uWXvLYhzCEqEd/wn6WCE15D/hS5ZP6p8s270DhIo0qIQnN+N8Q65XWZD5Vz2WBmVyXglQ7YuWug1IZYZ//vqOnSS5tjZKLua8BUtXZ5fGtnjt3G7pz07DHFR+cMTlY/iZ/V4F54SoNxufVjywv6ZK8myhVI+qj/IrH35Cdq3bTAfl1dsXHCr6zVdvJpnhr77SZVKd7M0esdEldy7h9u5ZTgMHGsYJieTpQXS9NDgKbnz4q6s18FV0em9dsu5jBN8RayJvcajxtQftqfDSFA+DyOXHKk40KTDb3wfkBSXg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v4 18/22] libxl/arm: vIOMMU: Modify the partial device tree
 for iommus
Thread-Topic: [PATCH v4 18/22] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Index: AQHdVe/QhuTEwvt5Z0unZpDIkK/H5w==
Date: Wed, 7 Oct 2026 00:07:17 +0000
Message-ID:
 <4dd1ba2be09b39fc63fdca29515b410a58989fec.1791328190.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 15cf203c-a011-49d1-6a40-08df2406f2c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|6133799003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 JhzI9pCRRICOlUIwlGk/EEFslAZ8owCG1LpCEck1qzjoydsJFRFMGCO/0uYR2i+a1Am2JMaid/OTsLAfyxIV8jXT1xCEKLA39YgU1KzzT9W+MJhtcy0VC+gjwf/TUyPn3GNCRcSn81XYJV9ly8dswg8eif3UsPWbUjV/ubJXlBvP/cqt47Y5ib8O96r1Vv9WBbkLxuUMgb9/GIu9FhQZst1xZQ+txY8jdtcMtJEtd2iUZ7UwqpuJUXqcAPfo4vI7PBqwl/zoQ5dJAyzi4/0/H5YvD/MK7sR9JZLApF0ZnW0T0Abcsul51vtyftb6VnitU68f2MYbW+KPHkQcU65vMDzT8zoni4dOzgdR4eLN9NQsTF4oaYFTtkxs9QiFKYdcshC7lV3iEpUN4IsBb8qPnpN4U+XZbEWMpEJyEH//MmVoYIm+epTBehNkHcyzFyRbD6d28lG4na2qfzT71q/dJmxktWz3+rtnCrvjH9L6CyEGtXUzJ5nmLSrCWKleIZIicwlO56LrB5NDKPHh/RPmOFnu2vcY+JgSZFhRiRJ2MFpNVXg0q6U1gjCnyWQ09sGO/XLjfe/DijxMzyb76zSxCnOJqQkwpz2nWLNB1ZVB+E8TQ8MlyoOwGL5K0HbSpFdL6whunG06njz3CBcQD9rWTJiNoKx7K54kQxU0hbiGc4UAJsgNr+x9xzSVmd5dWqBLImiHadGusdhDOyUq+C8rXvw4viEYNNCunN6grYcJNlA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eldDTEtRMFlXZ0NlV1JuaUlwTkJaWWt2R0dKRVV1eStJNEw2VHp3eFh0ZXdM?=
 =?utf-8?B?QWRLYnlmN1lCaVlaTjdlYUtUajNJNnYzYVNXYnZNN01FdWdOM0FnSGpEK2pK?=
 =?utf-8?B?VnJtdTVnSjkwZU16UU8za2Q1bzVDNHVaZUdBM1RWUVd1b1NmRGZMYmZLdU1Y?=
 =?utf-8?B?NktnQVpFTDNWbmJPcUdSanZTR3U3c0RwNUF6YzdqNmFHUXBNZU5FdmhtSTJZ?=
 =?utf-8?B?TG1mR2N5UGlEdTRTaVNmdEZIdHMwUk9qMktCa3BQS2V3OC90WVIxZ29QNWg2?=
 =?utf-8?B?bUljVkpLcHFVMXdWd0w1N2ZpZXQyZDBzSTJodG9OWDJaY0txVzVSNSt5Q1E1?=
 =?utf-8?B?VFcrMGNxNHk4MmxhTEF4WE8yckJHWWZxcVROSnM0cGFtTnhiRUd1dEwvc1hn?=
 =?utf-8?B?TEoybkdUZy9LSCsrdm53dUFQZ0Z1YlZmcExSZS9PTVFxTlRhTnRoOWVibVB6?=
 =?utf-8?B?am9pUCtNY3FUWUtmK1Zpb2lrbVF6WGNQWG5ZaENTbSsvWHZIQUFMVXFMLzRy?=
 =?utf-8?B?aEpaWlRpeGxCbUFYRTE0eWNDSnNTN1FmL0x6MU9XeDdEcDY5M2dyUzQ5ZlZM?=
 =?utf-8?B?MEtOMUo1bHdzSHJkK3FpZ1pxSkdVL1ZKYkpxLy83Z3JMNGpaSlF5cHVsSU5G?=
 =?utf-8?B?T3lRU1dyOVh4ZGdXOXBCbmQraEVhM1NtZUZPc0NYMWcvQ1pTcE92M1BuRWhG?=
 =?utf-8?B?Z3I0Z0ZPSEt1b3dpSEFVYUhBMG9vQnFGZGR5SEZ4bUFxdm5QU012dzN4ZWRu?=
 =?utf-8?B?UjgxV1p5NzhlMC9JaVo5U1BoWDFpVm1ya2kyQWRZZDhzQ1lKNDRXNkhxcGdo?=
 =?utf-8?B?QTUwVUl5UzAzSHJmMW1XNnIwNDEvdFRNaGxjaEcxU3A1MXZqazBVdnU0b0pl?=
 =?utf-8?B?T083djZRWFNzYUNNUGc0WFBqQkN0SWYzOVRtRnRNRDZ3Z2R4UWlTZWd3MDlR?=
 =?utf-8?B?YnBPY1NSWTRScWFNcENQRWFKbjdMUkZNNHZuQmVVM0NYd084bDlHc2hyek5S?=
 =?utf-8?B?aUM3aW9QTWw1NFU2RTR5NGhtT2tkYzN4bmVMMjBxNXVHcXRaQ0N5eVJSTElE?=
 =?utf-8?B?L3Y0aGJ4eVJ6TFFZZzFRMHFMVVpxMzQrUDUyTGNIeVJaK2RyWXYxN0xLSmVn?=
 =?utf-8?B?VENDUHgrZXdKcEdBSHRyOGE2bDZ4bEUycWFubktKRFE5MWxEU0NKQ29Bbk1U?=
 =?utf-8?B?R3gxMi9PUUxCL0VvVEFBS0VqUWZKaVA0R2E4dGdpWFVZMUFmM0tzTkNjNmE2?=
 =?utf-8?B?NklFMHlpbTBBSzcyUVJZWXdMaVZ2NkpiV0F4N093UFJPMVd3RHhrOVpmc3Ez?=
 =?utf-8?B?K2lMTEFXbUYzQW5aZjBRbHdXYnkwTmUwZzIvaFVFdWcremhmRlA2eGl1VHFP?=
 =?utf-8?B?WU1kNEZUZGJaVTZ1S01hK0VsZHUrb0J0Q3lvZ3owODZzb0ZTaXRRakJVQ0xR?=
 =?utf-8?B?alg2U3I1MnVaUzQrN01PSk55VXhxbnJFS1FlR1VMQS9MeXV5T2h3OC82VE02?=
 =?utf-8?B?Q0xnanBuMEJ0N3NIZlJFTWdhMHlRRzJHMU5GRldvWUJGd2pNTFBGVDYrYm9Z?=
 =?utf-8?B?ZklMalFhU3d2T1lOWXQ4ay90T2ZDY2x2Z0FVcGx5cFRHcnlsUFRpRTdqbmhi?=
 =?utf-8?B?SkYvRnRnYUJnYVFkMjRvU25ZVWFVQ2FSY085a01xRFlpTVlQU1ZhbzJiQjJ6?=
 =?utf-8?B?dDhjeGpBUmdVQ0VjS3dWQUZDc3FaSXF3SDRtQTkxbTdRdWZ6VnNCVjc3NW1z?=
 =?utf-8?B?MzllTXRTZVZYdm1PMzAvYXAyeWR5aFNXT0ZhODhZcm1zSGhsQlQwSU5PSlJa?=
 =?utf-8?B?bHQyYllSVzdJTEloeE1VUE9SV0E4YzRRM0tzV0NPT0p2ZGVDTDgxT3ZFQUw5?=
 =?utf-8?B?Q2hRTUxiSC9Ddy9pUnF4dVpJeks1OHhvR2dyNkx0Qmt2cDVkOGliRjhQSTdQ?=
 =?utf-8?B?dXAvRExCdG55RlVselQ1T1pVcGh3cEp1TGM0SlUwMmVZMHNhNEhadHU5N01E?=
 =?utf-8?B?K2NCK1FJZXVyRCtFVXZ4MXFMZVhPWk1tdFNiOFp5S2U2SmJ1VkMvKzUzSDk2?=
 =?utf-8?B?TFk5ZmxkSVhWN1dtaXlEOHZNQno3dUhQRzhLeUpBVUpBQXljeFoxL0RNRjBi?=
 =?utf-8?B?Wkp3STBlbGNzc3NqZ2JCMzJ3czBkZFZsRWp3cjZzMzBKcHBTWFUxRktpTFRq?=
 =?utf-8?B?S0Y3cTlRTkFWTU5MZ3huc2J0aW9kNUtmclppK0JVNmFRUG8rYVpzUGJhTm1T?=
 =?utf-8?B?NmpnL05iQk5FbWwzYUF0V1pDTC9oOExjanRObXpydUtDK0sxZlBwNXA3eTBl?=
 =?utf-8?B?bSt3MC9WL1VkblhiY3JHQ2p3WEVlRHc0NnliUjVxMVRYdnR0RGpBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cf203c-a011-49d1-6a40-08df2406f2c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:17.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGEHdFDh9xiiUVyBs/DnJ4sYpFYvzLmsvQOBSMW3SZ6aZY7D+GI1UfFU3zka0db2CjPhI9pGZ9Z2H0KMxrYI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-720697/1791331642-674BE2AC-956E1315/0/0
X-purgate-type: clean
X-purgate-size: 4000

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClRvIGNvbmZpZ3VyZSBJ
T01NVSBpbiBndWVzdCBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcywgdXNlciB3aWxsIG5lZWQgdG8N
CmNvcHkgdGhlIHVubW9kaWZpZWQgImlvbW11cyIgcHJvcGVydHkgZnJvbSBob3N0IGRldmljZSB0
cmVlIHRvIHBhcnRpYWwNCmRldmljZSB0cmVlLiBUbyBlbmFibGUgdGhlIGRvbTAgbGludXgga2Vy
bmVsIHRvIGNvbmZpZ3VyZSB0aGUgSU9NTVUNCmNvcnJlY3RseSByZXBsYWNlIHRoZSBwaGFuZGxl
IGluIHBhcnRpYWwgZGV2aWNlIHRyZWUgd2l0aCB2aXJ0dWFsDQpJT01NVSBwaGFuZGxlIHdoZW4g
ImlvbW11cyIgcHJvcGVydHkgaXMgc2V0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8
cmFodWwuc2luZ2hAYXJtLmNvbT4NClNpbmdlZC1vZmYtYnk6IE1pbGFuIERqb2tpYyA8bWlsYW5f
ZGpva2ljQGVwYW0uY29tPg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NCi0tLQ0KIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgfCA0NyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCmluZGV4IDQxMGRj
OThkMDkuLmRhYWE4MWYyYWEgMTAwNjQ0DQotLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Fy
bS5jDQorKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQpAQCAtMTMyMiw2ICsxMzIy
LDQxIEBAIHN0YXRpYyBpbnQgY29weV9wYXJ0aWFsX2ZkdChsaWJ4bF9fZ2MgKmdjLCB2b2lkICpm
ZHQsIHZvaWQgKnBmZHQpDQogICAgIHJldHVybiAwOw0KIH0NCiANCitzdGF0aWMgaW50IG1vZGlm
eV9wYXJ0aWFsX2ZkdChsaWJ4bF9fZ2MgKmdjLCB2b2lkICpwZmR0KQ0KK3sNCisgICAgaW50IG5v
ZGVvZmYsIHByb3BsZW4sIGksIHI7DQorICAgIGNvbnN0IGZkdDMyX3QgKnByb3A7DQorICAgIGZk
dDMyX3QgKnByb3BfYzsNCisNCisgICAgbm9kZW9mZiA9IGZkdF9wYXRoX29mZnNldChwZmR0LCAi
L3Bhc3N0aHJvdWdoIik7DQorICAgIGlmIChub2Rlb2ZmIDwgMCkNCisgICAgICAgIHJldHVybiBu
b2Rlb2ZmOw0KKw0KKyAgICBmb3IgKG5vZGVvZmYgPSBmZHRfZmlyc3Rfc3Vibm9kZShwZmR0LCBu
b2Rlb2ZmKTsNCisgICAgICAgICBub2Rlb2ZmID49IDA7DQorICAgICAgICAgbm9kZW9mZiA9IGZk
dF9uZXh0X3N1Ym5vZGUocGZkdCwgbm9kZW9mZikpIHsNCisNCisgICAgICAgIHByb3AgPSBmZHRf
Z2V0cHJvcChwZmR0LCBub2Rlb2ZmLCAiaW9tbXVzIiwgJnByb3BsZW4pOw0KKyAgICAgICAgaWYg
KCFwcm9wKQ0KKyAgICAgICAgICAgIGNvbnRpbnVlOw0KKw0KKyAgICAgICAgcHJvcF9jID0gbGli
eGxfX3phbGxvYyhnYywgcHJvcGxlbik7DQorDQorICAgICAgICBmb3IgKGkgPSAwOyBpIDwgcHJv
cGxlbiAvIDg7ICsraSkgew0KKyAgICAgICAgICAgIHByb3BfY1tpICogMl0gPSBjcHVfdG9fZmR0
MzIoR1VFU1RfUEhBTkRMRV9WU01NVVYzKTsNCisgICAgICAgICAgICBwcm9wX2NbaSAqIDIgKyAx
XSA9IHByb3BbaSAqIDIgKyAxXTsNCisgICAgICAgIH0NCisNCisgICAgICAgIHIgPSBmZHRfc2V0
cHJvcChwZmR0LCBub2Rlb2ZmLCAiaW9tbXVzIiwgcHJvcF9jLCBwcm9wbGVuKTsNCisgICAgICAg
IGlmIChyKSB7DQorICAgICAgICAgICAgTE9HKEVSUk9SLCAiQ2FuJ3Qgc2V0IHRoZSBpb21tdXMg
cHJvcGVydHkgaW4gcGFydGlhbCBGRFQiKTsNCisgICAgICAgICAgICByZXR1cm4gcjsNCisgICAg
ICAgIH0NCisgICAgfQ0KKw0KKyAgICByZXR1cm4gMDsNCit9DQorDQogI2Vsc2UNCiANCiBzdGF0
aWMgaW50IGNoZWNrX3BhcnRpYWxfZmR0KGxpYnhsX19nYyAqZ2MsIHZvaWQgKmZkdCwgc2l6ZV90
IHNpemUpDQpAQCAtMTM0MCw2ICsxMzc1LDEzIEBAIHN0YXRpYyBpbnQgY29weV9wYXJ0aWFsX2Zk
dChsaWJ4bF9fZ2MgKmdjLCB2b2lkICpmZHQsIHZvaWQgKnBmZHQpDQogICAgIHJldHVybiAtRkRU
X0VSUl9JTlRFUk5BTDsNCiB9DQogDQorc3RhdGljIGludCBtb2RpZnlfcGFydGlhbF9mZHQobGli
eGxfX2djICpnYywgdm9pZCAqcGZkdCkNCit7DQorICAgIExPRyhFUlJPUiwgInBhcnRpYWwgZGV2
aWNlIHRyZWUgbm90IHN1cHBvcnRlZCIpOw0KKw0KKyAgICByZXR1cm4gRVJST1JfRkFJTDsNCit9
DQorDQogI2VuZGlmIC8qIEVOQUJMRV9QQVJUSUFMX0RFVklDRV9UUkVFICovDQogDQogI2RlZmlu
ZSBGRFRfTUFYX1NJWkUgKDE8PDIwKQ0KQEAgLTE0NjIsOCArMTUwNCwxMSBAQCBuZXh0X3Jlc2l6
ZToNCiAgICAgICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMpDQogICAgICAgICAgICAgRkRU
KCBtYWtlX3ZwY2lfbm9kZShnYywgZmR0LCBhaW5mbywgZG9tKSApOw0KIA0KLSAgICAgICAgaWYg
KGluZm8tPmFyY2hfYXJtLnZpb21tdV90eXBlID09IExJQlhMX1ZJT01NVV9UWVBFX1NNTVVWMykN
CisgICAgICAgIGlmIChpbmZvLT5hcmNoX2FybS52aW9tbXVfdHlwZSA9PSBMSUJYTF9WSU9NTVVf
VFlQRV9TTU1VVjMpIHsNCiAgICAgICAgICAgICBGRFQoIG1ha2VfdnNtbXV2M19ub2RlKGdjLCBm
ZHQsIGFpbmZvLCBkb20pICk7DQorICAgICAgICAgICAgaWYgKHBmZHQpDQorICAgICAgICAgICAg
ICAgIEZEVCggbW9kaWZ5X3BhcnRpYWxfZmR0KGdjLCBwZmR0KSApOw0KKyAgICAgICAgfQ0KIA0K
ICAgICAgICAgZm9yIChpID0gMDsgaSA8IGRfY29uZmlnLT5udW1fZGlza3M7IGkrKykgew0KICAg
ICAgICAgICAgIGxpYnhsX2RldmljZV9kaXNrICpkaXNrID0gJmRfY29uZmlnLT5kaXNrc1tpXTsN
Ci0tIA0KMi40My4wDQo=

