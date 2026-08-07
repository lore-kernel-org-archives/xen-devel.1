Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F7DC5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 09:57:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385882.1628222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsHKP-0007Wi-RM; Fri, 07 Aug 2026 09:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385882.1628222; Fri, 07 Aug 2026 09:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsHKP-0007Wb-Oj; Fri, 07 Aug 2026 09:57:25 +0000
Received: by outflank-mailman (input) for mailman id 1385882;
 Fri, 07 Aug 2026 09:36:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <h.bakker@hunenet.nl>) id 1wsH0B-0003Sy-T3
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 09:36:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsH0B-00AYi3-5o
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 11:36:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <h.bakker@hunenet.nl>)
 id 6a75a715-8faa-0a2a0a5109dd-0a2a450cde46-48
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 11:36:31 +0200
Received: from [52.101.69.90]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <h.bakker@hunenet.nl>)
 id 6a75a71e-f479-0a2a450c0019-3465455a8e61-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 11:36:30 +0200
Received: from AM9PR05MB7665.eurprd05.prod.outlook.com (2603:10a6:20b:2cd::14)
 by PAXPR05MB8781.eurprd05.prod.outlook.com (2603:10a6:102:210::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 09:36:29 +0000
Received: from AM9PR05MB7665.eurprd05.prod.outlook.com
 ([fe80::48e2:5393:ed5a:3b3e]) by AM9PR05MB7665.eurprd05.prod.outlook.com
 ([fe80::48e2:5393:ed5a:3b3e%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 09:36:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=hunenet.nl header.i="@hunenet.nl" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2XrPJ7h6OtVWZFU/dHqXyF3SvS9kmam6c/PexFcI6BMVrr7W4+jHbykO6c4O9YTZ+9xG+C11AFfQ9yH6fYSDbWr+o5mXY2yVRZZged+Sz8DsvyvGLx+U52pJw8sYs+AmRXBJX0slRANtkns9pMmTRv+bC8HY9rT13OnO6XVgjEQpzP17cA2roirEPTgeJVZvqUZHKnV4CqyVbGkzQ2buiA+vzeyVo+9YT2LFmuJYwsTiltF+oEQ77WseHuqZZT+5XKMBL+WDb+bR5fw1U/QnAGXSqQr7Uy4DpEmHTIhW1m281gIYcr8VEPxv092dlhDHK8IoZ+6nx8A438w+h3EfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/o1g/Dd7HtR4QqtG9BroF9eIcDTquPeoIVlm/S0voQ=;
 b=J7uGlNUsoHq7CWi9JQHNChp5rLPG3F2in9CbriPFRCniBeahxRveeJqdHQj7O7Ugcjjk9XaUYKeY+V0PfJ9MKsLCxXMsa2V0Hx1wvrId0+ti/60kqRLiBFw39fLVwAGviZ9Sx74B7sIIJ5uKBWbURUCqXtwtBM47+psCSqfpoZdA8BlLjrSxlPsHZiIPOphNlt7adWjcI3PD5o81mhgDMYvcmRDCvzkM43m43my+yEhsghP4OUVm5URugg+sgqxUAA6ITG2hsaXOFzR4Hu/zDv9Jb7sLAgF2iMLt5nN+6Thvfn1TtnNJEJEUrR4UgSHlFrWduFYg8NzcDBWARjWQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hunenet.nl; dmarc=pass action=none header.from=hunenet.nl;
 dkim=pass header.d=hunenet.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hunenet.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/o1g/Dd7HtR4QqtG9BroF9eIcDTquPeoIVlm/S0voQ=;
 b=giJ9xBI+tX1GKF8WzyjimvmQnaJMXicBYTi+zRCA33s2vZa+BxpS/jUODp13nwo0UCTigt5YRdYJshvCKFW976waxZDH7RYm7mz0DtWTzTlsBE9Ml5qhyp4fXZHzyIjKH1zSkynge0ozy3UiGklPtn1omRIwWjspAzp7weeXLWFEn7uJQ73qOUCbc9ECTpVSzov90JzyHZKvRDfUdyj+CIJyWUVKz18zKnAhqb5MqjVuHQPHWqAvooRlojB7+UUh+bO6WHNfQrDFgktUv1pEchVWNyV+1ObxRvvLsZCDFXOgMue6a6v/H0MyphS3NkZKzb7YJRvM2vsdkVhlbjTOaA==
From: "H. Bakker - Hunenet B.V." <h.bakker@hunenet.nl>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: help Windows PV Drivers and Windows Server 2025
Thread-Topic: help Windows PV Drivers and Windows Server 2025
Thread-Index: Ad0mT/qwzqiDr4LQQ4SZEldj1o5M7Q==
Date: Fri, 7 Aug 2026 09:36:29 +0000
Message-ID:
 <AM9PR05MB7665DF8E88357A35E50C1CA6EDD12@AM9PR05MB7665.eurprd05.prod.outlook.com>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hunenet.nl;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR05MB7665:EE_|PAXPR05MB8781:EE_
x-ms-office365-filtering-correlation-id: ded94f0f-b30c-4bf4-0146-08def4675bfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|38070700021|8096899003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 eqqxxP/57iBa4NFu4279BYEiwwnzQrFKO1kJDD/lWWSlwa/GyDO1ILnkt9wGFcmOZpme8iPSlEwW/tVDgIFWL4ZFoAR1PWqqtBvf91sn1LPzbSdd8bIQrVWFAZ2szdhsllg/l2tkN6Rqau71na9VJYBhHcziNHD5Bj13RvVHKhTOBhZSrNuc68h4CJYrrrfclvrS+9olKbXf0JXk4EDf2AnuraO8PiNV5UC81ld5Lb+dCfRR6LGqah2LLSIkfTFZVNi0AuSlIIo2azkMGN/mepyMXCB6Gsu+qHH7d1PROccvXHqwhaOhR+VlvnnqMZ6ErI2NB7dc67RqQcKjKZCphUA3SY7BNvbYTk5kn1E8ZsIIJYYh5Mm1mMmLasOcZcMolK/Max9n5C0rr3Nl73dtkXVS9Goxs00XqkwzdHGSuLT6WSUhIQ5mGt8MKqD4ZrT9Uojc7lMSOc22GoAoaBKE0r4sAMdOYA6374U6wvR6ZDV8UPIZe4BDffBwcIW7gFRW64/a8rFrJ6nDT4tVhj4H+oHK8FfP0L6toK1BYpugejue6n/svpZjU6WyoJ1XJLspC6OPbOI6KJfQDsiQiKDNbsGeQdbSKlGQwfJtr5Y3mFEOwQtpf0PwRHCsmf3vWqjam0m9zpf74JJIEIUWlYC1uGmuNjqONQ0fN1sOceM3++8FHL750F4a2why2f5PcQG/MFOQAFL9bX77ug4QHNAhuQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR05MB7665.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(38070700021)(8096899003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTR5RVBZazZsblFUSy9mRkY3T0JmTFNhc2h2RTdqRHFtaEs1dlFFaG05L3dF?=
 =?utf-8?B?R1hwYTZSM25xODYwaGVaV0JDenZYTklWVDdVbFRickJmRCs1d1hDNnFqOGRk?=
 =?utf-8?B?U3pBWUU1eGpKUXQ1d1N4YkYrN0I1WGV5UVRDM240NjJBQWZHOGU0ZWpkZk8w?=
 =?utf-8?B?MTlzRXdHWjZQcko2b0ZJcE9GUGQ4VXdmSW9jeHQ5V09VZk9Rb1NzZURRbno4?=
 =?utf-8?B?SS9keFhESWZJUHZHQ1pIUHRCWnZmQjg1WVJSWm5MQ3Nrd2l1WXQrQ0NZdXNY?=
 =?utf-8?B?Qi9OSWMydWFTS3p4cHE5OWVPdzM3OEpBd3ZjZWQvb0xQcUxwOFArcVA0MXZS?=
 =?utf-8?B?UXlPbjhiSlUrS09GN0VESkNFdTlsUFZXcjh5d1U3UkZWQ2o5VnZET0x3Y0pn?=
 =?utf-8?B?VTdETGFnUVd5M0pYWkZ6dHQyK2wzYjhlZndkczZHaERheWE2L3RyV3htV09N?=
 =?utf-8?B?ZkxCN0FyN0VteFQ2RmcybXhhWGwrcnNQNkJhNTd2eWEvaktRcFpTWXpLYmtY?=
 =?utf-8?B?UWdkVjRaNUVMaldWbzY5amp1NHhVNGllNHV4cm41ODFVR2F3RnhYdHNKbEpE?=
 =?utf-8?B?aWQ2cjZYTmdCZ2EycnVXbUNCaVVCR3o5Ui9kTUhONmg4MGI5US9zREZPY2wr?=
 =?utf-8?B?SVRWenEvSVdqVE54VkNtK2ZkVkhSaDdrR1FZY1ppZ01Jb0h2bHRteHFua3ZR?=
 =?utf-8?B?YUpsR05QZ1E0Q1k5T0orRUkrU0Zjd2kvRGxRQnA4TTMzQnk2cU8za2V4WHM2?=
 =?utf-8?B?dmtHYnFaRWJLVHhSUm0wVmZQUmhxdzRqSVFOb3VLTCtBSVQwK0ZLTzNTanZL?=
 =?utf-8?B?YjNZY0RiK2J1U2tWdGY2MXJhclNLeTZPOHQ3YWpxYUdHbm4vY0cyTzkzeTBj?=
 =?utf-8?B?bEl5SUdjSUlpRTUyZVF2eDNJVnZScU5DcDdNKys3Wk42VmVUQ3ZEblpINFFQ?=
 =?utf-8?B?YjE0VFJiRTBmc0MzaHAxaWZIa29NSTU0aWkyUlFlMjVDTTRnb2p6MzNTZkpp?=
 =?utf-8?B?aVRGSlczRXZDMzBDalNTUVdoVHhuOG9jNE9KUmVEZnZaWTk2ZE9RRndTQjA0?=
 =?utf-8?B?MTZXZGlvUVJKRTRhUDBnNVYxWnc1bFgyY2pqM3Rzc2ZZNndZSVg3d2pKSjF5?=
 =?utf-8?B?Nk92UnhndHIxS3dWWG9QOHUzbmYvd0lRRzJVUzlmL1lMY2JKRUwrSEhCS2I4?=
 =?utf-8?B?TmNiK2NDVFYxMU1KSzBKeEQ1RlQrTW5yWlZaeHI4dmNTMTlrdERLb0JJcUM3?=
 =?utf-8?B?ZXpVMDJFdENjL015YVNVRWg1cEduOGhPSlU3RVVvVElsZFZKUWE0L2FkbUt1?=
 =?utf-8?B?YzRnaDh0aEd0c1NPTVhVZHQxQ0hBckZRV0YvbDZPdWdnZm16TGtTd0Y4eS9q?=
 =?utf-8?B?M2oyWUpGcUEyWDdGNG5EK3BhUFovTGUzL1k1clpiQXJ2ckp4V1FMYmVtZmpU?=
 =?utf-8?B?VTlNaEdKcDA2L0RGTnlnWDBWSmFPWVRzb211WDU2OWFiV2tqVlp1Yks2bDJl?=
 =?utf-8?B?T05TMVE2aWF5dGFRektzSXU5N1FFTFp4d2NtLzc3bTVGdXRPcWdwT3h1ZmlI?=
 =?utf-8?B?QW4vM21rOGF0Y3MvOGhYVzJFelNxS1ZFaDhDR09NNi9LOVBJMXhBQzFXSFJl?=
 =?utf-8?B?VWNHajNXTEFFempnTkxFWnZaWk9vNVFrOGpKR2R3UjRNMmNTOHFtdVd6ZXNV?=
 =?utf-8?B?RGEwQ0NRQ3VXOGFCb2dyaGNXdXE2TnpsZFI3NVBJZjk1bGFBcmJUOU1wNElv?=
 =?utf-8?B?dEVRSVdkT05WcXVWQjB6TDkvazc1bmpyLzJwRFkwbTJyYlZ4b0Q5cmJRM25k?=
 =?utf-8?B?Q2licTdtbnB1R0NRcGZLK1hKeFA3aWxGLy84TjFod0R6YXczOGE0TVBRMk5p?=
 =?utf-8?B?RG1Qc3NxUUt2bUVJV3NzRlkwRTdjS2tvdWExd1gxeUtGbC9nNDJ4K1dUV0Nl?=
 =?utf-8?B?VWpHRTlBa01VbHJkU3lQYjBrWE5lbDBmQkREeVJhbUpXeFhac2lGWEh5dEg3?=
 =?utf-8?B?UGZCSTY2VUk3WTU0bWdVMUNOazI3TWwwMDFhcWxFTENLMjU2T2IwSGY1QXky?=
 =?utf-8?B?TEZEZlkzWjZCRUQxSko2Z3E3NEw2TkxKTWVMU1FqaityWmdSMWZZczZ4bkUz?=
 =?utf-8?B?NmdFbWM3azdZS0pjbUs0LzF3MDVoaVNzdWRZUk54ZTJKeGcxWStwdnhlSmt1?=
 =?utf-8?B?dnU1WHpSczA0d3JHUEI2L1orQTkxZ2JkV1ZPNGxBc3FYOUlCUXdibmI3TERD?=
 =?utf-8?B?dmJQWk9lZlRsOENpRlZBc24yeEV5YlFMd1BCTElkc1ZYREEzUUZHSVdDSm9u?=
 =?utf-8?B?Q01CU3NWNC9wa0RJNEV1YmZvNjFIaXVXcENmQjI1Z0FtWDdtN3ROZz09?=
Content-Type: multipart/alternative;
	boundary="_000_AM9PR05MB7665DF8E88357A35E50C1CA6EDD12AM9PR05MB7665eurp_"
MIME-Version: 1.0
X-OriginatorOrg: hunenet.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7665.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded94f0f-b30c-4bf4-0146-08def4675bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 09:36:29.4771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 887aa16f-e08f-4cfb-bc70-8f3f25a72a41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrB+QvkdfxGl9uaSjXP0+C762tRRfgEHo598UzvoAuuUvJURFLVAfNUAKAiO4BnM60lsO74YL6fkOox/9DLdnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR05MB8781
X-purgate-ID: tlsNG-d25034/1786095391-01AC4A5B-CE6FEE1B/0/0
X-purgate-type: clean
X-purgate-size: 4652

--_000_AM9PR05MB7665DF8E88357A35E50C1CA6EDD12AM9PR05MB7665eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBjb25jZXJucyB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZSBXaW5kb3dzIFBWIERyaXZlcnMg
b24gV2luZG93cyBTZXJ2ZXIgMjAyNS4NCg0KV2hlbiBydW5uaW5nICJkcGluc3QuZXhlIiwgdGhl
IGluc3RhbGxhdGlvbiBmYWlscyB3aXRoIHRoZSBtZXNzYWdlICJJbnN0YWxsIGZhaWxlZCIuDQoN
ClRoZSBhZmZlY3RlZCBkcml2ZXIgdmVyc2lvbiBpczoNCkRyaXZlclZlcj0wNy8xMy8yMDIzLDku
MS4wLjENCg0KSSBhbSBjdXJyZW50bHkgdXNpbmcgYW4gb2xkZXIgdmVyc2lvbiB0aGF0IHdvcmtz
IGNvcnJlY3RseToNCkRyaXZlclZlcj0xMi8wNS8yMDE5LDkuMC4wLjINCktpbmQgcmVnYXJkcywg
SGVucnkgQmFra2VyLg0KDQo=

--_000_AM9PR05MB7665DF8E88357A35E50C1CA6EDD12AM9PR05MB7665eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpBcHRvczt9DQovKiBTdHlsZSBEZWZpbml0
aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJn
aW46MGNtOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkFwdG9zIixzYW5zLXNl
cmlmOw0KCW1zby1saWdhdHVyZXM6c3RhbmRhcmRjb250ZXh0dWFsOw0KCW1zby1mYXJlYXN0LWxh
bmd1YWdlOkVOLVVTO30NCnNwYW4uRS1tYWlsU3RpamwxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJz
b25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1zZXJpZjsNCgljb2xvcjp3
aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJbXNvLWxpZ2F0dXJlczpub25lO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzAuODVwdCA3MC44NXB0
IDcwLjg1cHQgNzAuODVwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24x
O30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRz
IHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtp
ZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1h
cCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRp
Zl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9Ik5MIiBsaW5rPSIjNDY3ODg2IiB2bGluaz0iIzk2
NjA3RCIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0
aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+VGhpcyBjb25j
ZXJucyB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZSBXaW5kb3dzIFBWIERyaXZlcnMgb24gV2luZG93
cyBTZXJ2ZXIgMjAyNS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPldoZW4gcnVubmluZyA8Yj4mcXVvdDtk
cGluc3QuZXhlJnF1b3Q7PC9iPiwgdGhlIGluc3RhbGxhdGlvbiBmYWlscyB3aXRoIHRoZSBtZXNz
YWdlDQo8Yj4mcXVvdDtJbnN0YWxsIGZhaWxlZCZxdW90OzwvYj4uPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
Ij5UaGUgYWZmZWN0ZWQgZHJpdmVyIHZlcnNpb24gaXM6PGJyPg0KPGI+RHJpdmVyVmVyPTA3LzEz
LzIwMjMsOS4xLjAuMTxvOnA+PC9vOnA+PC9iPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPkkgYW0gY3VycmVudGx5IHVzaW5n
IGFuIG9sZGVyIHZlcnNpb24gdGhhdCB3b3JrcyBjb3JyZWN0bHk6PGJyPg0KPGI+RHJpdmVyVmVy
PTEyLzA1LzIwMTksOS4wLjAuMjwvYj48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0
b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJtc28tbGlnYXR1cmVzOm5vbmU7bXNvLWZhcmVhc3Qt
bGFuZ3VhZ2U6TkwiPktpbmQgcmVnYXJkcywgSGVucnkgQmFra2VyLjwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO21zby1saWdhdHVy
ZXM6bm9uZTttc28tZmFyZWFzdC1sYW5ndWFnZTpOTCI+PG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bXNvLWxp
Z2F0dXJlczpub25lO21zby1mYXJlYXN0LWxhbmd1YWdlOk5MIj4mbmJzcDs8L3NwYW4+PG86cD48
L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_AM9PR05MB7665DF8E88357A35E50C1CA6EDD12AM9PR05MB7665eurp_--

