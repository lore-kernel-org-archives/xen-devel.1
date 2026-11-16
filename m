Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD7606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=FYYIJg68
Received: from list by lists.xenproject.org with outflank-mailman.1491499.1692284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2Jl-0003rV-Qg; Mon, 16 Nov 2026 19:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491499.1692284; Mon, 16 Nov 2026 19:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2Jl-0003rM-Nl; Mon, 16 Nov 2026 19:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1491499;
 Mon, 16 Nov 2026 19:24:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT2Jk-0003qU-HG
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 19:24:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT2Jj-00GKab-Tu
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 20:24:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb585f-2eae-0a2a0a5409dd-0a2a4501996a-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:39 +0100
Received: from [52.101.66.115]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb5877-5984-0a2a45010019-346542739039-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:39 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AS8PR03MB7637.eurprd03.prod.outlook.com
 (2603:10a6:20b:345::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 19:24:38 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 19:24:38 +0000
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
 b=I94j+n9GZaih/42kiGr3/qUQ3og80Fd/HeGBnr9EsxtlIM3obYj0Tw+EFZWP4yCmYhVP+qb9B74YLD4lkKjQopV8jeN8hPr1Cp65tlnXbEdsSTzkwicPjl+QlFbtZE1eTxV3NDhYGSJ4E8qFpSw80PfX8liGlZ4BFZBUJhQzxWoxe2IwP8UBuE633SdQpLAD6xTTERIGkzyKvtogmMRtlLpyYWwuhw+P79XbHFPg1V9GTUYsZ/Y6EptiQbelMSPzIgjJHvgZ5IoyJDp60DcFdi8B+3UDce5jteFyBOY/xSi6Tn7FE5O7HXoToZwgMDmpttsCsSxKUf/oyykEPOAW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2gxiEEpuuT+ze5mDTwwNf8zgj7+LHEBsAKJPicWPBc=;
 b=hJbOLp7/aJ6TMee6KrGdej+iAdv0p65hmtMHji8403AAu7bfJQAXbdqqH6n+mIqd6/I+JqdXagPgPx8XCOUdPUmrseG55eBxALSX5Qzs+b1bnTUYiBBF1rHdtZLfUImQArUQasNqD6JZ006+MAWdyysiMPVBsf11/fiBpEFmVmTRrEdRF5U/UgyUs9OUwXHmakjbAs74CLs9fuA29HoNT/fOULw4Gz5l4MDZAhNAxWObHZz0lqsfasixQS0G1NHfXuYDUbS8gXYEQVBDWLqVBJxdHU6K4hQqKq2hp3wehjel7iRHyfwbpilw79fpkQmL/ouKRtFiY/49gqncKlX0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2gxiEEpuuT+ze5mDTwwNf8zgj7+LHEBsAKJPicWPBc=;
 b=FYYIJg68QOHNLkaPkk/tX4sUFycJvR24wWEGAEje9wXZKV50qntroDmJ2Rq4l66YylhmWu2HjedLStJVKSrJmnr6qFPBc2+zyUp95zop+WrzxqlyOeKsi/7sosW71Xo22sYvRuBJ/Mim5Gg2ko9YGEEQv0pOFBqKshxJ1qVts3g2sG/P7wJH7ouT5fQrSG7Mj6fcWq9upcajVZuHc+12CvT17Tkwd1X5DPM8exhslbJzspB3JXw+NNI/rLZRvZtWXM9bZU4x4ORsJAT8nqQXBca/0kkzPauYmvJsSF7h7sB9PLHz/EUqnYL51F0SfJnNjE9g9Vii8dXbkJduRF+exA==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] tools/symbols: skip names exceeding the runtime limit
Thread-Topic: [PATCH v2 2/2] tools/symbols: skip names exceeding the runtime
 limit
Thread-Index: AQHddgAf4/QhwuDeUkK131GKYPgPzA==
Date: Mon, 16 Nov 2026 19:24:38 +0000
Message-ID:
 <af6fb26652a3b9f51e5be5bb09b26f5a9d1bbccb.1794852738.git.mykola_kvach@epam.com>
References: <cover.1794852738.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1794852738.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|AS8PR03MB7637:EE_
x-ms-office365-filtering-correlation-id: 2a2f2ec3-fcc3-45ea-c911-08df4417418c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|11063799006|5023799004|10067099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261102123227099003|38070700021|261022075727099003;
x-microsoft-antispam-message-info:
 +9owmtIOypxmgDw55w1ii6UryWvgmXLBKax8mGfibiida/MT0vZc736kBB6J4HY72VMAZvi7+nio/B7KtktLFHxGFG1UPbxcBzcdN6mqxPEZ4C8yN1X0zz7ZwWSQDSAt4+db5bufyfARxjhgYWaR6ZDHp9mMv8htJI0h6g4mu2buk9goUQnffgSuq3T0Mzpp2fpj/LZi4HrUSFw2XlazokVGU+tqg4Z5GmfwdLYhroHrBNx4OX85FFCDkNPjnBlYH29qx871bkXt9gFIwWuc6cQdsCD/BMkqM6LATIdFAfpB3xn2rg779BXxKyfO/LWOgxG/fi2Cql2kVPgiW5uSzMWCpXhRPDxSNE/foEZs9Oj9LK2PkkqcP2HjvRzvQpx8tAbIJmExlXprP0xI74f4QBRV2r3fa3SOpJovvKLMGgXILj0Tu+DViVZ8c1yWTjHYiZDwyFzlmux+D2727L39ZZWJ6V+BdYao1+On+FOb1HtCqnuUF3mLEdnji+6vi+miKkT94n8EOjxdqy7x1kNLUxDTGMW+V76mckgFzZIL12TJ8Z8UFo32qb0SHK+84xG3X/mgYVbE4YFGaIk2D1irgJHr8zVcPUtjgK16KH+6I78f+IF++gJunqiL84QW/I+98BszNqlby3INgsEeJpj6ClFgkT8Xz1S6D95ldsnBgdxlc2L9809i/Vx/SePHyHTC9rhuifQXPN58gDjMBDbbNOqTI8SdURm8Nn8N/Kk5DKQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(5023799004)(10067099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(38070700021)(261022075727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2k5Y1NSMFdOdDNvcEkvSjB5cHpTY1dBMG1uRkxhTVcyVjhSV2tqcDZWZ1ls?=
 =?utf-8?B?VGc4OFVibWoyVDBHMS9CZTZ3L3NyMnBhVnllbW1LWEtWZzJvYm9KMGNyZGlB?=
 =?utf-8?B?eHNhanB4OEtUVHRqNDZUVTdEQnBGcEkvYzkybkRGUmQrbHRZNGRiUWRwRHUy?=
 =?utf-8?B?c1BDZUVMVURHb3V5VUNyNDlUWlp6QS9vUmN2MnNXdXdaSExKVXBwN3ZjQmNm?=
 =?utf-8?B?UzZrMXAzUUJIN1pPRmdpcy9JQml1K1ZmZkxZU0RRelBKSkFRbVMzTHJFSFFS?=
 =?utf-8?B?ejBJcEFmWUZmZ0FpY0RZMUV1TEk1UkJTMmdnc2l1aEVnMzVCamxaZmVUNEV4?=
 =?utf-8?B?THJpaElFdXkzSWhUZjJ3clJIQ1pvSkxiTytEb0Q4ckdTL2xwK1FXUWdvblhV?=
 =?utf-8?B?RStmQVRDN2F1eXIvOVJsdGRCblpXa0EweStNeExONnhyc1dIVWpZV3ZLa2NF?=
 =?utf-8?B?YVVtMDE3ZUJRY1cwSlNadFFYL25wU1BMSkpJQU8rOW4wVXQxTHA4d1NsbXNn?=
 =?utf-8?B?UzZiZlZlSHVpcUFMSzVpMEZSWmRveGlVT0RFai9VdkJkclZ2R2ovVjBKdTh5?=
 =?utf-8?B?c0J2dzVpRkh6WVJlVHlWKzB5Tk5UWVRoRk8wcC9nV3R0THFkemFJcHg0SkNW?=
 =?utf-8?B?a1JZZTlWZzMwOHlyTmRxWThwQnhPWDBzSzNtQzRBN25UVGVRZ0hXUW5kZlBz?=
 =?utf-8?B?MG9qOFNxa25vUTV2SjNHQlpMMXUvRGNZdXNpMGpqVXRqUEc5WnJHMjFRN2lJ?=
 =?utf-8?B?cXlFQkZybWdxM1FPdzdyU2hsYmtodkFJeDJUVUtrN3JzNjVWYnhpRXk4L1Q5?=
 =?utf-8?B?WnpEK1RidUJPMy9XTjE0N3oxSXJ5MkN3c1BVWFN3WFNLd21GRXpML0srSWV6?=
 =?utf-8?B?c2hxTGlvWG1JOVk3a1JQSjFKWFJqVlovQ01qbVdPMkZxUmZwdW5hNm4xeDZ6?=
 =?utf-8?B?VjlGeWxTdkZvR0pGNHBuZk1hYXhpczB4T3UzQ284TGVIaFJ4VjVDVE5GYzNF?=
 =?utf-8?B?aWdnbE1DTUVoYWZWSUlRcXl2NDBHaVBERGpTNGEwV1FyNk9PV3o0SDdvWE40?=
 =?utf-8?B?cDFFSFhKRC9Sa0hFSDl5ZXg3M1M2Nk1zeVlyRmFnOElIQ1BmUnRVNE0xNmVX?=
 =?utf-8?B?N1JYdHFHR0JxeUFMS1JZZis3TTRWWFB4RnV2NVhXaHBLajhnSi9YbVY4WUpK?=
 =?utf-8?B?UVlIUFBPK2dXZFVCSDRYVzA0bzNzamw4dWt0WndGdG9ZdnJUYzBiZndhcDU4?=
 =?utf-8?B?VE1KTTBNbW9NZ291T2hxMmpNRHhtUVlad09CM3draDMzYlVaNHl1NjF5YzV0?=
 =?utf-8?B?aEdhT3oxaFN6TlV3SjFuekNXMDNGMWdFTHlORnA4b09NaEJORjdqbDBodVRE?=
 =?utf-8?B?RGgyeTV6ZENkc1p0Zld5ZGVNWnk2UnBEVkNDb0IybEg5T1RyWmtSa2F3UFFv?=
 =?utf-8?B?cDR3SEVobnNNaElXMmVMSWo5ZnlEcUhXbUxtclhJZ3QxWDdOaUxPRHY1RjBQ?=
 =?utf-8?B?bktNZzlQSDFoNitpMk8yMkl2bU5BeUpuVXlGaTg2aUg1U1RZMXFMMjFVMDM0?=
 =?utf-8?B?Q0U2cTJHZXY5V1dWZzJZODl4VjhJVllHSlc5Nyt4bjU4a3ZuM3liaWFKeHEx?=
 =?utf-8?B?dCtjQVBmYnVpTWVHVGZyekxrVk4xQ3JOY2tSeEdTVi9KL2NqN2ZWWVlzeUpL?=
 =?utf-8?B?NXdJaVZJcllTckUwSXBibXRaa0JwNUM5OWZlTFJXUVNWREhuYmptWHhkN0F6?=
 =?utf-8?B?bFNiMlVOWTZZcEZ6U04xUThxMTdLWVM0QWpsUnl1ZkpMaFFaaDZNeGUwbzk3?=
 =?utf-8?B?UDZOVXNkUktJT2t2M1hUVXlSVVE5UEtIK3RyQitwNjNsVUd2b2dGUVBPVFBl?=
 =?utf-8?B?NVlOcldRL2EvQVFUV3lIMGQvL1dOeXdicTd4VFg2eVB5K3lxT1lNaXdCNWJh?=
 =?utf-8?B?Ulc4bWpOV0dVSXhlTWVndStBSkFUai95OThFaUhaVEJKMEtMbkRKbjRZQllo?=
 =?utf-8?B?SW10ZXhNaDJwM09jbmlWbWVTTVZHWlRpSTZBUUhhYWwxSm5OMmd3OC9teUxJ?=
 =?utf-8?B?OVB6dGswek1qV3VMcmoyUDlRNVBOcEk3U1l5Y0sxaWFVOEYxL05XVnBrOFNu?=
 =?utf-8?B?ZVROYzdseHFZWFJuWmQreVgydE95dEpva1JKUjNRbXlKcGxIYis1ejZIVXZu?=
 =?utf-8?B?T1psTUttOWJaSlMxb1hKVXk1a0ppcXV1QU1ISEMrL1RKTndrV3VvUEtxdFhZ?=
 =?utf-8?B?U1NSUHpYemd1bDdTeGN6VmtQc3ZCMSsxTjNYTmxCVmw3WW1CZURYUXo4VVl3?=
 =?utf-8?Q?hvjpOQBit6JAHdtzXk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2f2ec3-fcc3-45ea-c911-08df4417418c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 19:24:38.4254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYnn2Usp6dn0YomVtrbMDKjF6LE2h6olH+5lsJdqw2EH8AlrfnzjiQdAZT99p8uAEKM0+jLrS2pzH9wpbQtgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7637
X-purgate-ID: tlsNG-d62444/1794857079-C4D44757-7B8E4980/0/0
X-purgate-type: clean
X-purgate-size: 2800
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHJ1bnRpbWUgbG9va3VwIGJ1ZmZlcnMgaG9sZCBLU1lNX05BTUVfTEVOIGJ5dGVzICgxMjgp
LCBidXQgdGhlDQpnZW5lcmF0b3IgYWNjZXB0cyBsb25nZXIgbmFtZXMuIFNZU1YgaW5wdXQgcHJl
Zml4ZXMgbG9jYWwgc3ltYm9scw0Kd2l0aCB0aGVpciBmaWxlbmFtZSwgc28gYW4gYWJzb2x1dGUg
YXNzZW1ibHkgc291cmNlIHBhdGggY2FuIG1ha2UgYQ0KbmFtZSB0b28gbG9uZyBldmVuIHdoZW4g
dGhlIHN5bWJvbCBpdHNlbGYgaXMgc2hvcnQuDQoNCk9uIGFuIE9yYW5nZSBQaSA1IGRlYnVnIGJ1
aWxkIHRoaXMgY3Jhc2hlZCBYZW4gYXQgYm9vdDogZHVyaW5nIHRoZQ0KdGVzdF9zeW1ib2xzKCkg
Y29uc3RydWN0b3IsIHN5bWJvbHNfbG9va3VwX2J5X25hbWUoKSBleHBhbmRlZCB0aGUNCjE0NS1i
eXRlIG5hbWUgZW5kaW5nIGluIG1tdS9oZWFkLlMjaWRlbnRpdHlfbWFwcGluZ19yZW1vdmVkIGlu
dG8gYQ0KMTI4LWJ5dGUgYnVmZmVyLCBvdmVyd3JpdGluZyB0aGUgc2F2ZWQgZnJhbWUgcG9pbnRl
ciBhbmQgcmV0dXJuIGFkZHJlc3MuDQoNClJlcG9ydCBhbmQgc2tpcCBuYW1lcyBvZiBLU1lNX05B
TUVfTEVOIGJ5dGVzIG9yIG1vcmUsIGFzIExpbnV4IGRvZXMuDQpDaGVjayB0aGUgY29tcGxldGUg
bmFtZSBpbiByZWFkX3N5bWJvbCgpLCBhZnRlciBhZGRpbmcgdGhlIGZpbGVuYW1lDQpwcmVmaXgu
IEtlZXAgLS14ZW5zeW1zIG1hcHMgY29tcGxldGU6IHRoZXkgYXJlIG5vdCBsb2FkZWQgaW50byBY
ZW4uDQoNCkZpeGVzOiBkMzdkNjNkNGI1NDggKCJzeW1ib2xzOiBwcmVmaXggc3RhdGljIHN5bWJv
bHMgd2l0aCB0aGVpciBzb3VyY2UgZmlsZSBuYW1lcyIpDQpBc3Npc3RlZC1ieTogQ29kZXg6R1BU
LTYuMQ0KU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+
DQotLS0NCkNoYW5nZXMgaW4gdjI6DQotIFByZXZpb3VzbHkgcGF0Y2ggMTsgbW92ZSBpdCBhZnRl
ciB0aGUgS1NZTV9OQU1FX0xFTiBjb252ZXJzaW9uLg0KLSBSZXBvcnQgYW5kIHNraXAgb3ZlcnNp
emVkIG5hbWVzIGluc3RlYWQgb2YgZmFpbGluZyB0aGUgYnVpbGQgKEphbikuDQotIE1vdmUgdGhl
IGNoZWNrIGZyb20gYnVpbGRfaW5pdGlhbF90b2tfdGFibGUoKSB0byByZWFkX3N5bWJvbCgpLCBh
ZnRlcg0KICBhZGRpbmcgdGhlIGZpbGVuYW1lIHByZWZpeCAoSmFuKS4NCi0gVXNlIHRoZSBOVUwt
aW5jbHVzaXZlIEtTWU1fTkFNRV9MRU4gaW4gdGhlIGNoZWNrIGFuZCBkaWFnbm9zdGljLg0KDQog
eGVuL3Rvb2xzL3N5bWJvbHMuYyB8IDggKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vdG9vbHMvc3ltYm9scy5jIGIveGVuL3Rvb2xz
L3N5bWJvbHMuYw0KaW5kZXggMTRhMDQ1ZjA5OC4uODYwZTlkOTIyNCAxMDA2NDQNCi0tLSBhL3hl
bi90b29scy9zeW1ib2xzLmMNCisrKyBiL3hlbi90b29scy9zeW1ib2xzLmMNCkBAIC0xNzgsNiAr
MTc4LDE0IEBAIHN0YXRpYyBpbnQgcmVhZF9zeW1ib2woRklMRSAqaW4sIHN0cnVjdCBzeW1fZW50
cnkgKnMpDQogCQkqc3ltKysgPSAnIyc7DQogCX0NCiAJc3RyY3B5KHN5bSwgc3RyKTsNCisJLyog
T25seSB0aGUgdGFibGUgbG9hZGVkIGludG8gWGVuIGlzIGxpbWl0ZWQsIG5vdCAtLXhlbnN5bXMg
bWFwcy4gKi8NCisJaWYgKCFtYXBfb25seSAmJiBzLT5sZW4gLSAxID49IEtTWU1fTkFNRV9MRU4p
IHsNCisJCWZwcmludGYoc3RkZXJyLA0KKwkJCSJJZ25vcmluZyBzeW1ib2wgJyVzJzogdG9vIGxv
bmcgKCV1IGJ5dGVzLCBtYXhpbXVtICV1KVxuIiwNCisJCQlTWU1CT0xfTkFNRShzKSwgcy0+bGVu
IC0gMSwgS1NZTV9OQU1FX0xFTiAtIDEpOw0KKwkJZnJlZShzLT5zeW0pOw0KKwkJZ290byBza2lw
X3RhaWw7DQorCX0NCiAJaWYgKHNvcnRfYnlfbmFtZSB8fCBtYXBfb25seSkNCiAJCXMtPm9yaWdf
c3ltYm9sID0gc3RyZHVwKFNZTUJPTF9OQU1FKHMpKTsNCiAJcy0+dHlwZSA9IHN0eXBlOyAvKiBB
cyBzLT5zeW1bMF0gbWF5IGVuZCB1cCBtYW5nbGVkLiAqLw0KLS0gDQoyLjUzLjANCg==

