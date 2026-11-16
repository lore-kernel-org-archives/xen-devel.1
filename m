Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCD7606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=qSOOd2tr
Received: from list by lists.xenproject.org with outflank-mailman.1490779.1691735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvBE-0000LP-Hl; Mon, 16 Nov 2026 11:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490779.1691735; Mon, 16 Nov 2026 11:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvBE-0000LI-Ea; Mon, 16 Nov 2026 11:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1490779;
 Mon, 16 Nov 2026 11:47:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xSvBC-0000Jf-I5
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvBB-00EGJV-K6
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:47:21 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afaed3d-8faa-0a2a0a5109dd-0a2a45098ea8-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:47:21 +0100
Received: from [52.101.83.84]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afaed48-be1a-0a2a45090019-34655354e443-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:47:20 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AS8PR03MB7126.eurprd03.prod.outlook.com
 (2603:10a6:20b:23d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:47:18 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:47:18 +0000
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
 b=ofb6WerZKheaw37IZ3SdJORRnkCGu56O4/FyrtRYvMCNP7RMOqAHf7RnEfzTGjibxzwLJrsrt4bz9zAdgRZ10kE/sq97kj+xieMXWuqnwEi+62J4CkGkUpsXokYTPjGascc5aRvnNkBdQljfy7hXxGmDWHajkpGTeDLKKN13xRKSzC+tlOCoPzvu1T/WuDtLsEqEendRHW6EFF7G9hQ33f+BELx3reQTtHoydXV5FxUZFw6KkKktRJQC4ilBEJQGa/84gs8AuyJgIGsbMK+LNZDEwJgsvByyJZy4CPc6s2FcA5ZBiK5hUSQD1BjGIvxxgiGQ76o1Thao0PRS3MjC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=immTEYJfnBn+7IOnXmZVu5RbPG4A0hrE9HawrdLUGCg=;
 b=uYn3eCwTVw3EIGQc/wuR19J58gCM7l2QOVbDrN8jdPxuwoNJyIkJ0dQ245Jdm4/fN5DOhQBHm3nhaxGv5i8cwydziITQOdlvtZekFp283kp5hj9GDfX5wAKRRKOVFKFwB0nVbMCaJDotgWRslbnngufngFyIZEkT3Z/SaLKdygwO9S/pL4GNpRaK2NdXoGO78j/OuDEf5vpg1oM3mk5sGIush/yQKuL2igb3evPhpLPfQcqALpS+6bVt9pV3TXPZZbKjqzznI6Iw/zq/AJdOJrMktoN4S5+LVnIEumjt6W8B3uw37CjOi798czTloqGB3WUWC3HIPHFr5xRKXyVPqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=immTEYJfnBn+7IOnXmZVu5RbPG4A0hrE9HawrdLUGCg=;
 b=qSOOd2trHPFfh8mSsJApB0EwQ150YVPwp/hGtrNun+Mx3xWMIJqkRNCVYkbj6HNmXcmI5q2tmqCN3ZLbjtcfRhSoMVCXDGdJ0zy2TMg9MaF8tNVbBV2NFeoiNExK8YCljv8fA2HV5x6j4oYLQkD2MvE/PAqW9vKXegd1DeXYxm0l3/rZVXPAcYphwkA3GL1f2zYKxmgPJx07Agn3K4tl8x9xBJbzNodeLh0HaiXPsRLoKNeOsng0jcDVeGDhlxcj9OiQPbSqP5X3GRxc7k23G5UkGyW4WlGLMfPV2f50krM5DqCl7TtSsfI4kkP2wGG351Z+O5vgVn7yE4O0PsLoKQ==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent hardware
Thread-Topic: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent
 hardware
Thread-Index: AQHddcA7KSg86rXuDUWg7Tm+9FjlvA==
Date: Mon, 16 Nov 2026 11:47:18 +0000
Message-ID:
 <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|AS8PR03MB7126:EE_
x-ms-office365-filtering-correlation-id: be93d836-9774-4072-cfd1-08df43d75dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261102124527099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info:
 y6WK/lyHDfRPasCASlCDe6KK6WXJJWfkvHSiTW1+Ozqscqj3KaEszPMV/89zzNf7IitPcHdRwS9T1W25WeDPyyjAsKYEJkTyvtvTL0ji7Xg9hcJ2rBPYdS2fFGCCMt6fmzlpYqo0kFGb4Iswgn9W4boUpgW6YMQYxNGiX9kPVfep/1OJrinKeWVgjSV30YuRnClwiW3RiHxJDnaqDddKYM9cpWmct9EV2LYzMDNlsGW6ZXJ8+zdwuOaMIfOquXrNhXxLDDdwIfiqXfnwx/G/MeN/KroIKw4v5t1QI6TSEE0I3OFwwiQz5OQOLzHSTu3DmOzT46UJdbEZgfU58fNuntlLRqS7uiUdYEEDV3A4BJiRtxYTgE0sV+9wGKsJ4T0d58hCM4mii++Ky913iscQn7vUe3pLzxstgdYnGQfPj1WVAEgbC3oWf+rzZ3UiXTjistkcrPbp5dtGMpLytywv2YwBnNZWxHs4zBrzH1vN0dpXBScgYTrwh/zdS1uaD/c/c5LcW0lBL6JmphrXShRZEY/riAkGnEyKCj5IMTTB515EDJDra2pzTNzqSjHePBNdGXi8gERj9jf3HMMxngD9oRegIHLPe9nJO6KdDHJqAj3ROIPE1pPZ1Ss4uJudhu2nR6kUqgvFkyerFbpzHpo5sPItfAAUGH3Hu0FYa6VY+7+Wqcy11Vvf9SY2axymOuLV0U1QSSNDbaT0tYGbjAqzPw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261102124527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHdzNEh1UGV5MVBpSGluejE0RytGWlc5N3FsQ0l1WVlwWWszcXVadmREcVd4?=
 =?utf-8?B?STg2TEZ1QzV1emM3cDRNT2pTSWN3UU9McHlFam1QclJUUUtqTEdmUFVHNjJp?=
 =?utf-8?B?c1NYNXBKNThTaGxaV09La0l2cnB4NzdjblVpS1JSV1U2MGR1MXBkR2dEL0RN?=
 =?utf-8?B?YnRtUzVXTlk2aVBBMlY4UGt5NU90VERtKzlpK3pwNWxvN1c5clVkdDVHYTJj?=
 =?utf-8?B?ZlFacVdMVDNPK2xlNVliTm5oRmV1RUgyOGdyWSt5c2hVUThGb1ZFdFN3cmxY?=
 =?utf-8?B?Zjh6Q0Zib3Z0aC9Qa0F2RjBaRU5CaWtmY1J3ZUtLU0lwem5BS0crV3JFcnpF?=
 =?utf-8?B?bVhhMXpVM2xSazh2cEkwdTJzYVJnek8yL2RxNDFFV25pOW9YQlFXMVppZ0lq?=
 =?utf-8?B?S1RrTDh1bDZHVXJYc3VKSi91YUUrc1NQeWRBU2Npd0hzR0MxZ25LQ2xkWGx0?=
 =?utf-8?B?SUlXd0tCR053QVl0Qy9mbFp1elhlYkdBTnhRaTFQNDdhVE9IaXdMZzhGcnYw?=
 =?utf-8?B?VzBqejlSeGpJcnF0cGpuR0lWb1hiOFhmcThMbGFHSFB2S3RTc0h6RExHemRG?=
 =?utf-8?B?NElLeUxHY0JGenJ6N3R1UXdaWG5GbTVQM3VTb0VucllwSGRpOWxLdTRhWkFY?=
 =?utf-8?B?R2pScWVLZk1za0hCWWEwZHRGellySFFhbFZ4dmtsS3F3YUlLand2YUdsOFd3?=
 =?utf-8?B?cjlTL2dyYkdHOG5DRVppZEJjQmFNMGg4bjZoNzd5Vk95bUExRjMvaHhlWEFR?=
 =?utf-8?B?U1JaWW4ycXdLUCtEcnYvakpVL0Fna1AzRkhTS1B6SmNRME9paEJhdGtiaGZv?=
 =?utf-8?B?bkhuaktUZmFnY3JYU1dwc01IZnZIV0hhQ1NaMkNhQ3NkYWliOEpnMG5hem9D?=
 =?utf-8?B?cCs4c0V2dDcrLzdoWjNDMDRsd3dQeTlvYUUzblJVU1IrMENQSmd2RXFCSjRr?=
 =?utf-8?B?U1h6K0x4NGtwTFBKNjhWK25HWjNQcTVoWGhtWVN0bFBEekZDRVcwRkVZWWQx?=
 =?utf-8?B?UFBacTRxRlNyZVMzSGg3dncyUEhxeE4vNS8yNHE1OFBmMXRBNldMVnc1M1N4?=
 =?utf-8?B?RXFKK0tsK3F1Rlk5c2gxZHBJOUR1TXkreVkwYXV5cDVMWVRWeFRBY1V6ZTc2?=
 =?utf-8?B?SkVMNEY2dkJQT1RXQjdSQkNCRFllUE1wS1U1TGlOQndvSmc1YTQ0c1llWGVJ?=
 =?utf-8?B?RjdTM3E4OWFjK1dqQ3BYcTFkTXd1RG0wa3VkZk8zUGpnSllIR0M0ODRmTFJv?=
 =?utf-8?B?MTRHTFBBTmNhMlBBM1hZSlN3MVZCTFJwQkN3dEpYWEZoR1lBUElPcDJGbDFy?=
 =?utf-8?B?YnlEWXZCUGJTci9SQjFndzdueGwwdXJsS0k2d2RnL1piU0JRZU9QbjA4QTNC?=
 =?utf-8?B?V1NHWEgwSzA2bGFrci9wRTZmWUpjMDJ0RnBpckJiZktNMFdxZExTcHJFOWJN?=
 =?utf-8?B?UmdKVEVqZnl0c2tTbC9EU2owUkdZblFMVVU3K3FaWmNGQnhhckczcWVwQXV0?=
 =?utf-8?B?cUFFNkNaMmRvSWVHSjlCSzdCU3R2REQxUmhWb3g5NWVDR084cGhSUWpZOEho?=
 =?utf-8?B?bkxwV1p2MGVxNWpRUUk4VnAydWdOR0Y2U3R0ZmN0MTM4MnQ0YzR6aE9qVVE5?=
 =?utf-8?B?NmNzYm1HK2VqWXN6WmprWS9mRlU1cGJmSVlRRUQ0T0dVUDJyN3F2Y2ZITytD?=
 =?utf-8?B?L1FrQldmRzBtZi9CTEltRVRtaVBtYnNBU3o5Ym0xY0JYSGRmL2VLbkR6KzZS?=
 =?utf-8?B?KzBkWkVVZW03bFpqNzFrdXpXWXU5bDd5ZC9hbmFkeXhrMXh0UVhQTFU1SldY?=
 =?utf-8?B?OHhmbGdwK1NxYjk5WGwrTTVlRXZuaFlUUktoTExTNm12U2pqME9xUFc1SEF3?=
 =?utf-8?B?K1VYUW1CU1g5a21VMWJiNnJIZ2hiUk9IcEhJUm4yeXZhcnZEbW4vMWR0amhX?=
 =?utf-8?B?WFZZSmE2NUxyQmdJUFpxYjVNOGZlZnlEM2tsWjYzL3FGSmpmL3V5S1ZpSFdw?=
 =?utf-8?B?b3JHWFkxeEs4Witlc2JBUkR6Q0tHMnVxZE1jeit6dk1BNXZnd0U3Zk9WemJj?=
 =?utf-8?B?UW4vaVdVMmhwNVRjaEo2MmduV3A2eE9JNTdERXJCcnJHVFh5U25nTmJZNEI2?=
 =?utf-8?B?M092aFZhUmxNWlR2V0dycXpMMlIwaGNyc2UyelNVTnkwWE54S1h3dk5VQ2hn?=
 =?utf-8?B?N0xIY0VMcERyaVBTUTl0VUlZa0tpMXgyQ1F5bGt0SkdpZU52YnZoWDlFeEt0?=
 =?utf-8?B?MEwwYlJoQnk3bmpTbWhqQmNqZnRhRHg3cEdYSXJnYnkvZmY2YURIc3F3cG5r?=
 =?utf-8?Q?YQa3RFXzgDFeIGvtOC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be93d836-9774-4072-cfd1-08df43d75dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 11:47:18.1268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZalfXLlsML1KuGSjiq8odnUu8HiUYcQU2hWpGbruX36MKvuueWWwDyZoQjBs8eAHe+Nk/50elu+HoUiJlXGvew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7126
X-purgate-ID: tlsNG-bad1c0/1794829641-BD4C3034-40B9BFEC/0/0
X-purgate-type: clean
X-purgate-size: 6536
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WGVuJ3MgZG1hbV9hbGxvY19jb2hlcmVudCgpIHJldHVybnMgY2FjaGVhYmxlIG1lbW9yeS4gQSBu
b24tY29oZXJlbnQNClNNTVUgY2Fubm90IHNlZSB3cml0ZXMgdGhhdCByZW1haW4gaW4gdGhlIENQ
VSBjYWNoZS4NCg0KT24gT3JhbmdlIFBpIDUgKFJLMzU4OFMpLCBOVk1lIGluaXRpYWxpemF0aW9u
IGZhaWxlZCB3aXRoIENfQkFEX1NUUkVBTUlEDQpmb3IgU0lEIDB4NDEwMCB3aGlsZSB0aGUgQ1BV
IHNhdyBhIHBvcHVsYXRlZCBMMSBkZXNjcmlwdG9yLg0KDQpDbGVhbiBuZXcgc3RyZWFtIHRhYmxl
cyBiZWZvcmUgdXNlLiBDbGVhbiB1cGRhdGVkIFNURSBkYXRhIGluDQphcm1fc21tdV9zeW5jX3N0
ZV9mb3Jfc2lkKCkgYmVmb3JlIGlzc3VpbmcgQ0ZHSV9TVEUgYW5kIENNRF9TWU5DLg0KS2VlcCBi
b3RoIHN5bmMgcG9pbnRzIGFyb3VuZCB0aGUgZHN0WzBdIHVwZGF0ZS4NCg0KQ2xlYW4gdGhlIEwy
IHRhYmxlIGJlZm9yZSB3cml0aW5nIGl0cyBMMSBwb2ludGVyLCB0aGVuIGNsZWFuIHRoZSBwb2lu
dGVyLg0KU2tpcCB0aGVzZSBjYWNoZSBvcGVyYXRpb25zIG9uIGNvaGVyZW50IFNNTVVzLg0KDQpT
ZWUgQXJtIElISSAwMDcwRy5iLCBzZWN0aW9ucyAzLjE1IGFuZCAzLjIxLjMuMS4NCg0KRml4ZXM6
IDQ1MmRkYmUzNTkyYiAoInhlbi9hcm06IHNtbXV2MzogQWRkIHN1cHBvcnQgZm9yIFNNTVV2MyBk
cml2ZXIiKQ0KQXNzaXN0ZWQtYnk6IENvZGV4OkdQVC02LjENClNpZ25lZC1vZmYtYnk6IE15a29s
YSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KLS0tDQpDaGFuZ2VzIGluIHYyOg0KLSBS
ZW5hbWUgYXJtX3NtbXVfY2xlYW5fc3RydGFiKCkgdG8gYXJtX3NtbXVfY2xlYW5fZGNhY2hlKCku
DQotIFBhc3MgdGhlIFNURSBwb2ludGVyIGFuZCBjbGVhbiBzaXplIHRvIGFybV9zbW11X3N5bmNf
c3RlX2Zvcl9zaWQoKS4NCiAgQ2xlYW4gdGhlIGdpdmVuIHJhbmdlIHRoZXJlIGJlZm9yZSBDRkdJ
X1NURSBhbmQgQ01EX1NZTkMuIEtlZXAgdGhlDQogIG9yaWdpbmFsIGNsZWFuIHJhbmdlcywgYm90
aCBzeW5jIHBvaW50cyBhcm91bmQgZHN0WzBdLCBhbmQgdGhlDQogIGV4cGxpY2l0IGNsZWFuaW5n
IGR1cmluZyB0YWJsZSBpbml0aWFsaXNhdGlvbi4NCi0tLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS9zbW11LXYzLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQppbmRleCAyMzJkZjI0MjFjLi45NDVhMThhN2ExIDEw
MDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KQEAgLTYzNyw2ICs2MzcsMTQg
QEAgc3RhdGljIGludCBhcm1fc21tdV9jbWRxX2lzc3VlX3N5bmMoc3RydWN0IGFybV9zbW11X2Rl
dmljZSAqc21tdSkNCiB9DQogDQogLyogU3RyZWFtIHRhYmxlIG1hbmlwdWxhdGlvbiBmdW5jdGlv
bnMgKi8NCitzdGF0aWMgdm9pZCBhcm1fc21tdV9jbGVhbl9kY2FjaGUoc3RydWN0IGFybV9zbW11
X2RldmljZSAqc21tdSwNCisJCQkJY29uc3Qgdm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSkNCit7DQor
CS8qIFhlbidzIGRtYW1fYWxsb2NfY29oZXJlbnQoKSByZXR1cm5zIGNhY2hlYWJsZSBtZW1vcnku
ICovDQorCWlmICghKHNtbXUtPmZlYXR1cmVzICYgQVJNX1NNTVVfRkVBVF9DT0hFUkVOQ1kpKQ0K
KwkJKHZvaWQpY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKHB0ciwgc2l6ZSk7DQorfQ0KKw0KIHN0YXRp
YyB2b2lkDQogYXJtX3NtbXVfd3JpdGVfc3RydGFiX2wxX2Rlc2MoX19sZTY0ICpkc3QsIHN0cnVj
dCBhcm1fc21tdV9zdHJ0YWJfbDFfZGVzYyAqZGVzYykNCiB7DQpAQCAtNjQ5LDcgKzY1Nyw4IEBA
IGFybV9zbW11X3dyaXRlX3N0cnRhYl9sMV9kZXNjKF9fbGU2NCAqZHN0LCBzdHJ1Y3QgYXJtX3Nt
bXVfc3RydGFiX2wxX2Rlc2MgKmRlc2MpDQogCXdyaXRlX2F0b21pYyhkc3QsIGNwdV90b19sZTY0
KHZhbCkpOw0KIH0NCiANCi1zdGF0aWMgdm9pZCBhcm1fc21tdV9zeW5jX3N0ZV9mb3Jfc2lkKHN0
cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsIHUzMiBzaWQpDQorc3RhdGljIHZvaWQgYXJtX3Nt
bXVfc3luY19zdGVfZm9yX3NpZChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LCB1MzIgc2lk
LA0KKwkJCQkgICAgICBjb25zdCBfX2xlNjQgKmRzdCwgc2l6ZV90IHNpemUpDQogew0KIAlzdHJ1
Y3QgYXJtX3NtbXVfY21kcV9lbnQgY21kID0gew0KIAkJLm9wY29kZQk9IENNRFFfT1BfQ0ZHSV9T
VEUsDQpAQCAtNjU5LDYgKzY2OCw3IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X3N5bmNfc3RlX2Zv
cl9zaWQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkNCiAJCX0sDQogCX07
DQogDQorCWFybV9zbW11X2NsZWFuX2RjYWNoZShzbW11LCBkc3QsIHNpemUpOw0KIAlhcm1fc21t
dV9jbWRxX2lzc3VlX2NtZChzbW11LCAmY21kKTsNCiAJYXJtX3NtbXVfY21kcV9pc3N1ZV9zeW5j
KHNtbXUpOw0KIH0NCkBAIC03MzYsNyArNzQ2LDggQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfd3Jp
dGVfc3RydGFiX2VudChzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyICptYXN0ZXIsIHUzMiBzaWQsDQog
CQkgKiB0aGUgU1RFIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgb2xkIHZhbHVlIHdhcyBsaXZl
Lg0KIAkJICovDQogCQlpZiAoc21tdSkNCi0JCQlhcm1fc21tdV9zeW5jX3N0ZV9mb3Jfc2lkKHNt
bXUsIHNpZCk7DQorCQkJYXJtX3NtbXVfc3luY19zdGVfZm9yX3NpZChzbW11LCBzaWQsIGRzdCwN
CisJCQkJCQkgIFNUUlRBQl9TVEVfRFdPUkRTIDw8IDMpOw0KIAkJcmV0dXJuOw0KIAl9DQogDQpA
QCAtNzYyLDkgKzc3Myw5IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X3dyaXRlX3N0cnRhYl9lbnQo
c3RydWN0IGFybV9zbW11X21hc3RlciAqbWFzdGVyLCB1MzIgc2lkLA0KIAkJZHN0WzFdIHw9IGNw
dV90b19sZTY0KEZJRUxEX1BSRVAoU1RSVEFCX1NURV8xX0VBVFMsDQogCQkJCQkJIFNUUlRBQl9T
VEVfMV9FQVRTX1RSQU5TKSk7DQogDQotCWFybV9zbW11X3N5bmNfc3RlX2Zvcl9zaWQoc21tdSwg
c2lkKTsNCisJYXJtX3NtbXVfc3luY19zdGVfZm9yX3NpZChzbW11LCBzaWQsIGRzdCwgU1RSVEFC
X1NURV9EV09SRFMgPDwgMyk7DQogCXdyaXRlX2F0b21pYygmZHN0WzBdLCBjcHVfdG9fbGU2NCh2
YWwpKTsNCi0JYXJtX3NtbXVfc3luY19zdGVfZm9yX3NpZChzbW11LCBzaWQpOw0KKwlhcm1fc21t
dV9zeW5jX3N0ZV9mb3Jfc2lkKHNtbXUsIHNpZCwgZHN0LCBzaXplb2YoKmRzdCkpOw0KIA0KIAkv
KiBJdCdzIGxpa2VseSB0aGF0IHdlJ2xsIHdhbnQgdG8gdXNlIHRoZSBuZXcgU1RFIHNvb24gKi8N
CiAJaWYgKCEoc21tdS0+b3B0aW9ucyAmIEFSTV9TTU1VX09QVF9TS0lQX1BSRUZFVENIKSkNCkBA
IC04MDUsNyArODE2LDEwIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW5pdF9sMl9zdHJ0YWIoc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkNCiAJfQ0KIA0KIAlhcm1fc21tdV9p
bml0X2J5cGFzc19zdGVzKGRlc2MtPmwycHRyLCAxIDw8IFNUUlRBQl9TUExJVCk7DQorCS8qIENs
ZWFuIHRoZSBMMiB0YWJsZSBiZWZvcmUgd3JpdGluZyB0aGUgTDEgcG9pbnRlci4gKi8NCisJYXJt
X3NtbXVfY2xlYW5fZGNhY2hlKHNtbXUsIGRlc2MtPmwycHRyLCBzaXplKTsNCiAJYXJtX3NtbXVf
d3JpdGVfc3RydGFiX2wxX2Rlc2Moc3RydGFiLCBkZXNjKTsNCisJYXJtX3NtbXVfY2xlYW5fZGNh
Y2hlKHNtbXUsIHN0cnRhYiwgU1RSVEFCX0wxX0RFU0NfRFdPUkRTIDw8IDMpOw0KIAlyZXR1cm4g
MDsNCiB9DQogDQpAQCAtMTc0NCw2ICsxNzU4LDcgQEAgc3RhdGljIGludCBfX2luaXQgYXJtX3Nt
bXVfaW5pdF9xdWV1ZXMoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkNCiBzdGF0aWMgaW50
IGFybV9zbW11X2luaXRfbDFfc3RydGFiKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQog
ew0KIAl1bnNpZ25lZCBpbnQgaTsNCisJc2l6ZV90IHNpemU7DQogCXN0cnVjdCBhcm1fc21tdV9z
dHJ0YWJfY2ZnICpjZmcgPSAmc21tdS0+c3RydGFiX2NmZzsNCiAJdm9pZCAqc3RydGFiID0gc21t
dS0+c3RydGFiX2NmZy5zdHJ0YWI7DQogDQpAQCAtMTc1Nyw2ICsxNzcyLDkgQEAgc3RhdGljIGlu
dCBhcm1fc21tdV9pbml0X2wxX3N0cnRhYihzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0K
IAkJc3RydGFiICs9IFNUUlRBQl9MMV9ERVNDX0RXT1JEUyA8PCAzOw0KIAl9DQogDQorCXNpemUg
PSBjZmctPm51bV9sMV9lbnRzICogKFNUUlRBQl9MMV9ERVNDX0RXT1JEUyA8PCAzKTsNCisJYXJt
X3NtbXVfY2xlYW5fZGNhY2hlKHNtbXUsIGNmZy0+c3RydGFiLCBzaXplKTsNCisNCiAJcmV0dXJu
IDA7DQogfQ0KIA0KQEAgLTE4MjMsNiArMTg0MSw3IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW5p
dF9zdHJ0YWJfbGluZWFyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQogCWNmZy0+c3Ry
dGFiX2Jhc2VfY2ZnID0gcmVnOw0KIA0KIAlhcm1fc21tdV9pbml0X2J5cGFzc19zdGVzKHN0cnRh
YiwgY2ZnLT5udW1fbDFfZW50cyk7DQorCWFybV9zbW11X2NsZWFuX2RjYWNoZShzbW11LCBzdHJ0
YWIsIHNpemUpOw0KIAlyZXR1cm4gMDsNCiB9DQogDQotLSANCjIuNTMuMA0K

