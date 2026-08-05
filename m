Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A01FC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 04:32:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382789.1626080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrTI7-0004fu-Km; Wed, 05 Aug 2026 04:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382789.1626080; Wed, 05 Aug 2026 04:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrTI7-0004fn-I8; Wed, 05 Aug 2026 04:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1382789;
 Wed, 05 Aug 2026 04:31:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wrTI5-0004fa-5d
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 04:31:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrTI3-00GgVP-W3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:31:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a72bc93-e002-0a2a0a5209dd-0a2a45068884-24
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:31:39 +0200
Received: from [52.101.228.94]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a72bca8-195a-0a2a45060019-3465e45eb222-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:31:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4891.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 04:31:34 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 04:31:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK/iTdvDfV/p3i7iy1AGEslip0Q2W5J5X2MH9DNreQArwXN9JfG5eQSNdnJkNcxjMKOw9NggyD/donfIcAGZTZ8AF8ImE8aS0lIzgRV50nCHROj2Wxc6zUDA1+9lYurAgO/2Ub9DF1jU4WiqgoENluohVrKXuiQK9ZLThg5gVYRVBr3Wk05BwSzCVVtbu8Fk2YDv2ZV/L2ldVMyyqb1j5GXa9s3oXI7lY5kKkmspBs5rgkL6qtSevbud8sLYRJzu0byCg3eZxwjFHuF/pYld+tvL8AIWaZgrGCSUnuWqE+1D6hcJdcAeKFh7HOc/jMwMjhttyajv8apQ529nxpuqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bngy3RvD5jAQEeCq3S+xlBbepXg3MzqbFfz4C23Ujg=;
 b=V/rGH+5eaGcmBXmuKVXUjMG51SfsoZvhxOlEI3ggrOnthAINDDMktTnPrvspxp7nKzmCZSOGL8J7bcETQD5JxQTQTJ5sW98v0z/cJBdfrOKA8LPv0vPjz5r1ldv8zo+rodNsyBcmEL9oLmkamToTeon7d8J+GNrxR5xwsZ2nDrREMqfu3lUhWVmUEIS7VFnl9ko9uu6EcTrVMptw4Tdb5TyycwqofirZMGgnoVvwVUx1vLQa3uKfVBBVUrRsxY/e4lPEYStQ8+9bd/It+mg7MBsvQcRYsTwpiwJa7UIXWQCc8/kz5uWPl4ICnjVeAdAcByJUfZBz4O6Y8Q2/AfdoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bngy3RvD5jAQEeCq3S+xlBbepXg3MzqbFfz4C23Ujg=;
 b=bIleaxANhSNVC1RKDLnV0VFHSZ0JrOCKtaJBVkJY/Xsm8k3X+KCiz4KTRnM/+UYadpOm+JWrT4XeTKG09nwLWMTHaqoB8M4RdvjkMaZUWBQbBTCxnFGmM+3A6z9aKne3lFtdHkvxd1lLziQw/rslxMRwz/HGDnTSzIRv+7rAICQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Hide PMU feature
Thread-Topic: [PATCH] xen/arm: Hide PMU feature
Thread-Index: AQHdIuEazfVQgCaihUe50qminMMbcraL5wiAgAL2WTA=
Date: Wed, 5 Aug 2026 04:31:33 +0000
Message-ID:
 <OS9P286MB7222D076D36F722B479A549F82D32@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260803004245.693844-1-taka@valinux.co.jp>
 <dbb32862-b3d2-4fb5-b4ef-49675fa243b2@xen.org>
In-Reply-To: <dbb32862-b3d2-4fb5-b4ef-49675fa243b2@xen.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB4891:EE_
x-ms-office365-filtering-correlation-id: 70d199a9-4b35-4d30-096e-08def2aa6e11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|3023799007|38070700021|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 SPDwRhCmFzfMpPvKby2NGFECLSxQxNCSDPjgcWNVEm1QkQAUusCkLfvyDWCym2T6YxX7cenwmCA8mCZo4Y1kEekYD9hIJv2PSS4CfAtSQHToVvtoFJVhrwKPuW/SsNI/1gTYtLsqm6pNl2l8MU9TcYmpjDwAiHGsgI7fmad7s9MjH21JqaTpNmYsox0+/+BB6lc+u6RdakJgSEKg+0Q9Nvxnw1mjPKOKgVAgkl1Iokg4X6FiYk7zSjNrRjyYfuYdXHjXCxuy/fnrOwnk4On41V/P9GpSuuEGGDCgj5louaCmt8buzmN1CfwjtLs0UKDfk6tq5VjI84f3nW67GZObY6sT1n8rOe2HWrE3C7RKM8jc5w/xryMSRVwVMj4cCBzbkGG+zyY9iMtNaKCBHmnPQ90e2ckiKAO4UHE7chjAXKUFomHSqt03ghgxykWgueOt0Pj00j+od8XlL5/On4dPJHK2p+vdFmaihwlaihoYrG7YMDw47BX4SGwZORvu1tVZa//qLZBcUszpV4WjYwpqC0aj0e+s1Quqk0fVuzjZYqO/xbsAIMVWKWeZQ3klFz5eYhQiuFRtLZ2MJj+OSxjJ8CMqpTWe/DxQMWUGHC9sniSveuOMyxyplRCysyMHhe8AHUouEzH822oYq8xmIUrg6x87YGoWe7KdVjV3vZutY87KahE5iHPW/M9TTnkO5uLWG5OoAcnSO6GWW2UuKlCi8prXJ804I8XDJI6zf12hoiA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(3023799007)(38070700021)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEZtdGpGbmpnQUwxSVBDTmRLVjFnUmowU1FHSC9HRi9Lb0lIV0N2QTlmZjJl?=
 =?utf-8?B?eHZBam1nREpBSFBDd1N3bU1Ha3dBczFmTWF5anhUaGMrZW0wMXd6YVl4WURJ?=
 =?utf-8?B?Y2svdGV0VVdMeDBBRnlYV0hkZUlSQVNxS0hqU2dLdS8rMjlBK3BHQ0p3TU5q?=
 =?utf-8?B?M3hpTFFLYTdLRE1Xb1lGYmNzZDF3QW10ZnkvYzJHazY2bVJIVXBTd3hMYU5C?=
 =?utf-8?B?dWk2TEtWZE9QK2ZFcjZGWUN2RnhjWDN2VGp3OEtYalpLeDhSajhLRDZFSFhj?=
 =?utf-8?B?TDNTMkJ5ZGptc25BL2lxZXo5dXZZL1VFcjRjTytHY2ZhRTcwT1BuQ3AzNU9o?=
 =?utf-8?B?dWtlS1RnSVhpRlRBMVpkcUFxMkgwQnlFY2tpdlFncjFBSGFkYzE4TGN5UWdw?=
 =?utf-8?B?SHlYOWJ4blBjWnNPMnAvOVpYMlJiUzhqenRwaXpGUmd1UnZlaGl0NEVrM3g5?=
 =?utf-8?B?TFY5K01sMlZ1WXlUb1BxVTNldXQrNEtnZytnMHdqU1NHTmp1MytLc1hsLzdO?=
 =?utf-8?B?eTE2WDNNaXNuT2IyZlhLWk1zRDJUK1U4UE1yWmJGUFRGNEJuKzZyd09sckZw?=
 =?utf-8?B?TUcrcmhFVEpyQTllemRXTGZEVnhMQlhPV08vSXEzNnh0eDAyaXV1MHJ1SXAy?=
 =?utf-8?B?dzRLaUw2YXBteTRoRVJ5VndEcTdLdVU4TjlXKzJTVFVtQVprOFRReGN5dzIz?=
 =?utf-8?B?MERkaWRNNXZVMVoyRm5CVDBlUFZxT3B3Ung5NkdHcEdRMmk1YVFwVmFMeEJk?=
 =?utf-8?B?aFpRWVBpYUVTemUrd2xCU3Q2MnlkYjNRN01MYytjSlMxc0VoN0MzQzE0dUdC?=
 =?utf-8?B?VWUvakNyOXNMbkV2VklGR3pTN3hENEQxd09LcHYxRml4MHJLYXd0RkwwREw2?=
 =?utf-8?B?Z0dueFBCRmtDWTNSbFlybzZ6ckMyb0dTSGdrc1ZhNjFkZnVHSDdKYVJTMUpD?=
 =?utf-8?B?ZFVwK2t5L1FuK2RQakZkSkZIZEdZamNXTGNxRlpYRlk3eC9WQlZEWEV2WVhR?=
 =?utf-8?B?RjV2amNKa2FrVk5ZSnNrekhhcE01M1dJOU0yWHY4ZzlhaWdWVy9nQU9wVDVt?=
 =?utf-8?B?VHhpbWtrK0FqZGNpVVNiMHZsUyttc0EybkljY2pwWTMxbzN6alM2Vy9nZzBy?=
 =?utf-8?B?cnFhMGkvR2d5cVQzUFJVRzNBYWZzV3dVam00bHpJdkJxaDVhUnF4bEMyZ2F5?=
 =?utf-8?B?WWxPVzVkZ0c1RG8zeFRxbFhhRFZGNkd6Z3phYldHdFg3SGlodW85R0haUjV0?=
 =?utf-8?B?WXJhNVcrQ2tOazc0OU9HU2tlbDZjT2N6TmNjSWEwQTZQRTExRHhIbGllOG51?=
 =?utf-8?B?dlp1SDluMmFnODgweGdIdDBoZHBvNjNFSHB5THBkUGhFSjdabzBTQ3RveUJk?=
 =?utf-8?B?N2YwcU5xanZCcVN1SmMwNVdudlRkSE90TE1UazhMcUc4cFFuUmlXVW5MY0Nw?=
 =?utf-8?B?aE1pYXYxeEZPOXg2dzFyYzYvNzFCcHdtMnhoTmYzQUlObm5PeVZNQ0ZsRlZq?=
 =?utf-8?B?TlduS2lZTWlLM0ordlVLSlYrVFNHNTVUN2pxQmhGWlpjS3hCbk03Tmt3Y2Zr?=
 =?utf-8?B?Qzh0YnBSaDZ1N0pQQXoyY2lGTGR1MXNwVVpPU01Vd3R4djF4OVlyVERFVk5D?=
 =?utf-8?B?RXdMMHJZbk4zTFBuZWJpazd2S24wYkl5andkVFBjekJVVEptV1Z3NHRDOG9V?=
 =?utf-8?B?OHdoalJRdXJSVi83Z0NSL09CMTVVMTBYQjVVbHk3bFV1MGkvL1dKOThPaXV0?=
 =?utf-8?B?eHdUODU4ZWw1UjRCYnF6eVpBQ2IyZytET2ZxVFp6Ykhnb3Q1bmlQcUNqZmxj?=
 =?utf-8?B?dU9oUXVkU3E1UmN5U0hOM1hVMldQd3JEQUd2cmxOL09wc0RrVzhvekJPZXE3?=
 =?utf-8?B?QkZJSDZ6aUgrR3V4eFBMWDhXSUtuNDlHR0xIYWZaYU1ZUEx6K0xwY21aTU5K?=
 =?utf-8?B?NUJNbVc5UHJOMTI1Uis1ZEI3MGtId1d2MGhSR1NjWCtQdDhKdk90QlVUWGc5?=
 =?utf-8?B?YThOS0dBVnExZDNnaGs1Y0VWNW5IamJZVk1vbm5MdUhLOFVsa0JMTnlnM3FG?=
 =?utf-8?B?VUMwaFpLMTBJRG5TSVNkaGh5UjI3bTBNbERSdFZMZXBNRnBNangxdkJYZzNS?=
 =?utf-8?B?LzdmNmdSRVNBdTNjYllVNWEvR0VFTWtqclVJazFDUkJZV3Z2N3RYQUk3ZVMx?=
 =?utf-8?B?M1M1cENHZEVDQUJTNG8wWlhPbzhoNnpBUUR2TWdsMnFHRWEvMmFRVnoreVdH?=
 =?utf-8?B?dEN4eHBKNXAvWGVqL2MvazArMmE5QTMrbUJCMlBjVDZKb3VmcWxHcWdqTmpt?=
 =?utf-8?Q?SA2KdVx/es187graRs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d199a9-4b35-4d30-096e-08def2aa6e11
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 04:31:33.7351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8iiLBt/N6OMrU38Poxvceb4GGtyMcsFdfINBISNiY0mfB8fl1HQVOFw3+rgRdHDuojD1R9THUJ3tCFrygSxZ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4891
X-purgate-ID: tlsNG-16d1c6/1785904299-FEA7477B-8D14F3E6/0/0
X-purgate-type: clean
X-purgate-size: 5178

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnRzLg0KDQo+ID4gRHVyaW5nIHRoaXMgcHJv
YmUsIExpbnV4IGFjY2Vzc2VzIFBNTUlSX0VMMSwgd2hpY2ggY2F1c2VzIHVuaGFuZGxlZA0KPiA+
IHJlZ2lzdGVyIHRyYXBzIGFuZCBjcmFzaGVzIHRoZSBkb21haW4uIE1lcmVseSBhZGRpbmcgZW11
bGF0aW9uIGNvZGUNCj4gPiBmb3IgUE1NSVJfRUwxIGluIFhlbiBpcyBpbnN1ZmZpY2llbnQgdG8g
Zml4IHRoZSBpc3N1ZSwgYXMgdGhlIGd1ZXN0DQo+ID4gUE1VIGRyaXZlciBzdWJzZXF1ZW50bHkg
c3RhbGxzIGR1cmluZyBpdHMgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UuDQo+ID4NCj4gPiBGaXgg
dGhpcyBieSBleHBsaWNpdGx5IG1hc2tpbmcgUE1VIGNhcGFiaWxpdHkgZmllbGRzIGluDQo+ID4g
Y3JlYXRlX2RvbWFpbl9jcHVpbmZvKCkuIEFkZGl0aW9uYWxseSwgcHJlZW1wdGl2ZWx5IG1hc2sg
b3RoZXINCj4gPiBjYXBhYmlsaXR5IGZpZWxkcyB0byBwcmV2ZW50IHNpbWlsYXIgcG90ZW50aWFs
IGlzc3Vlcy4NCj4gDQo+IFdoaWxlIEkgYWdyZWUgWGVuIGRvZXNuJ3Qgc3VwcG9ydCBQTVUgY2Fw
YWJpbGl0eSBmb3IgZXZlcnkgZ3Vlc3QsIEkNCj4gYmVsaWV2ZSB3ZSBhcmUgc3RpbGwgYWxsb3dp
bmcgdG8gZXhwb3NlIHRoZSBQTVUgaW4gc29tZSBjYXNlcyAoc2VlDQo+IGNvbW1pdCBkYmI5NDgx
MTBhICJ4ZW46IEV4cG9zZSB0aGUgUE1VIHRvIHRoZSBndWVzdHMiKS4gU28gd2UgY2FuJ3QNCj4g
c2ltcGx5IG1hc2sgdGhlIGZlYXR1cmVzLiBTbyBJIHRoaW5rIC4uLg0KDQpJIHdpbGwgbW9kaWZ5
IHRoZSBzeXNyZWcgdHJhcCBoYW5kbGVyIGZvciBJRF9BQTY0REZSMF9FTDEgdG8gZHluYW1pY2Fs
bHkNCm1hc2sgdGhlIGJhc2ljIFBNVSBjYXBhYmlsaXRpZXMgYmFzZWQgb24gdGhlIGRvbWFpbidz
IHZQTVUNCmNvbmZpZ3VyYXRpb24uDQoNCj4gPiBGaXhlczogMzY2OWExY2I5NTk4ICJ4ZW4vYXJt
OiBjcmVhdGUgYSBjcHVpbmZvIHN0cnVjdHVyZSBmb3IgZ3Vlc3QiDQo+ID4gU2lnbmVkLW9mZi1i
eTogSGlyb2thenUgVGFrYWhhc2hpIDx0YWthQHZhbGludXguY28uanA+DQo+ID4gLS0tDQo+ID4g
ICB4ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysr
KysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCB8IDEwICsr
KysrKy0tLS0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5j
IGIveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0KPiA+IGluZGV4IDk0ZDE0ZmI2YTkuLjcxZDc0
NWQzY2IgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMNCj4gPiBAQCAtMjE5LDggKzIxOSwyNCBAQCBz
dGF0aWMgaW50IF9faW5pdCBjcmVhdGVfZG9tYWluX2NwdWluZm8odm9pZCkNCj4gPiAgICAgICBk
b21haW5fY3B1aW5mby5pc2E2NC5hcGkgPSAwOw0KPiA+ICAgICAgIGRvbWFpbl9jcHVpbmZvLmlz
YTY0LmdwYSA9IDA7DQo+ID4gICAgICAgZG9tYWluX2NwdWluZm8uaXNhNjQuZ3BpID0gMDsNCj4g
PiArDQo+ID4gKyAgICAvKiBIaWRlIFBNVXYzIHN1cHBvcnQgYXMgWGVuIGRvZXMgbm90IHN1cHBv
cnQgaXQgKi8NCj4gPiArICAgIGRvbWFpbl9jcHVpbmZvLmRiZzY0LnBtdV92ZXIgPSAwOw0KPiA+
ICsgICAgZG9tYWluX2NwdWluZm8uZGJnNjQubXRwbXUgPSAwOw0KPiA+ICsgICAgZG9tYWluX2Nw
dWluZm8uZGJnNjQucG1zcyA9IDA7DQo+IA0KPiAuLi4gdGhpcyBzZWN0aW9uIG5lZWRzIHRvIGJl
IGNvbmRpdGlvbmFsLg0KDQpPa2F5Lg0KIA0KPiA+ICsNCj4gPiArICAgIC8qIEhpZGUgU1BFLCBU
UkJFLCBCUkJFLCBhbmQgVHJhY2UgRXh0ZW5zaW9ucyAqLw0KPiA+ICsgICAgZG9tYWluX2NwdWlu
Zm8uZGJnNjQucG1zX3ZlciA9IDA7DQo+ID4gKyAgICBkb21haW5fY3B1aW5mby5kYmc2NC50cmFj
ZV92ZXIgPSAwOw0KPiA+ICsgICAgZG9tYWluX2NwdWluZm8uZGJnNjQudHJhY2VfZmlsdCA9IDA7
DQo+ID4gKyAgICBkb21haW5fY3B1aW5mby5kYmc2NC50cmFjZV9idWZmZXIgPSAwOw0KPiA+ICsg
ICAgZG9tYWluX2NwdWluZm8uZGJnNjQuZXh0X3RyY19idWZmID0gMDsNCj4gPiArICAgIGRvbWFp
bl9jcHVpbmZvLmRiZzY0LmJyYmUgPSAwOw0KPiANCj4gVGhpcyBzZWN0aW9uIHNob3VsZCBiZSBm
aW5lIHRvIHVuY29uZGl0aW9uYWxseSBtYXNrLg0KDQpPa2F5Lg0KDQo+ID4gICAjZW5kaWYNCj4g
Pg0KPiA+ICsgICAgLyogSGlkZSBQTVV2MSx2MiBzdXBwb3J0IGFzIFhlbiBkb2VzIG5vdCBzdXBw
b3J0IGl0ICovDQo+ID4gKyAgICBkb21haW5fY3B1aW5mby5kYmczMi5wZXJmbW9uID0gMDsNCj4g
PiArDQo+ID4gICAgICAgLyogSGlkZSBBTVUgc3VwcG9ydCAqLw0KPiA+ICAgI2lmZGVmIENPTkZJ
R19BUk1fNjQNCj4gPiAgICAgICBkb21haW5fY3B1aW5mby5wZnI2NC5hbXUgPSAwOw0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oDQo+IGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaA0KPiA+IGluZGV4IGJmOTAyYTM5NzAu
LmM5MmIyNjUxYzcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Nw
dWZlYXR1cmUuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jcHVmZWF0dXJl
LmgNCj4gPiBAQCAtMjE2LDE2ICsyMTYsMTggQEAgc3RydWN0IGNwdWluZm9fYXJtIHsNCj4gPiAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdHJhY2VfdmVyOjQ7DQo+ID4gICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHBtdV92ZXI6NDsNCj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgYnJwczo0Ow0KPiA+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fcmVzMDo0Ow0KPiA+
ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBtc3M6NDsNCj4gPiAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgd3Jwczo0Ow0KPiA+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fcmVz
MTo0Ow0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNlYmVwOjQ7DQo+ID4gICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGN0eF9jbXBzOjQ7DQo+ID4gICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHBtc192ZXI6NDsNCj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZG91
YmxlX2xvY2s6NDsNCj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdHJhY2VfZmlsdDo0
Ow0KPiA+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fcmVzMjo0Ow0KPiA+ICsgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHRyYWNlX2J1ZmZlcjo0Ow0KPiA+ICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBtdHBtdTo0Ow0KPiA+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fcmVz
MzoxMjsNCj4gPiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBicmJlOjQ7DQo+ID4gKyAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZXh0X3RyY19idWZmOjQ7DQo+ID4gKyAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgaHBtbjA6NDsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgLyogREZSMSAqLw0K
PiA+ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBfX3JlczQ6NjQ7DQoNClRoYWsgeW91LA0K
SGlyb2thenUgVGFrYWhhc2hpLg0K

