Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A0606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=ck+EIILb
Received: from list by lists.xenproject.org with outflank-mailman.1458597.1670745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzqs-0003u1-6E; Thu, 22 Oct 2026 20:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458597.1670745; Thu, 22 Oct 2026 20:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJzqs-0003tu-3N; Thu, 22 Oct 2026 20:57:30 +0000
Received: by outflank-mailman (input) for mailman id 1458597;
 Thu, 22 Oct 2026 20:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xJzqq-0003sT-Ml
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 20:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJzqq-003z4P-3i
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 22:57:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ada78b6-8faa-0a2a0a5109dd-0a2a4502ba6e-0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:57:26 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ada78b3-6ca4-0a2a45020019-34657d4fb3a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 22:57:25 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYRP286MB5138.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:116::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 20:57:21 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0546.017; Thu, 22 Oct 2026
 20:57:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOu++UVcjowZpjqteJTHpWalrnjJjeMEudPjmrnMJBcsoZtKqtTTxhZnCI98PO5H8dz2a0E7M7TIhF4RrYsp9/tECmsP60l15Mgw1uzYV+WdYo4Wyr+la+piUJuVZSzHMcPL/xImdYXje5eyT0PyZDCG4WwXa27FKWmIzJIzQYeOv8GENDaoHqKlOLOrt9ZyiKZaVHLPXXsHo/Ml9QVb8tDCSkPEq/c4FjK8r71UR1tv4/Necr4jxWAgr5wCYBW4juXzfKHHGarrfjVtFf+qzKeqCqJfqUT+wqHmCUGgVpE+W1xF9uCxr8U87vpXtOzXDMeVCoTbo0ydMC7tccogJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcPbvWO3fWCtg+TX/iVPDjxJ6aVeKoWU16tT0g+PwA8=;
 b=YHgiVxgLvnJG/ot1sJFeayIKOSTAPqMj2lbrq/Iwcoj1li3uc6omRKCJ8OGTguZlQIAaCxW2XI6KK1hssjup/Svj25xrgTyLREVkDoiPzd+gWYb6Wgg1V7jZ5nDar9m62SPowwFgnZ7zGhkBDE6QrGp4BMMwrj7GjNYtN6s53Au4xiQ9Hg7y0fV4a+9RwzH+AtsbO2xXiDfT20/FyRuuAMftkS2ULEM8+6IFCF/04Nsm9qSKiZ4K3x8jnd9UoLWYlVCJLZryDHTkEx9/f/kFkOBAdLL8AdzZAVxzKlDYzf75RuezA+GZtdI0vxohZ7GGrrmztrQYh3dqo23NN5XNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcPbvWO3fWCtg+TX/iVPDjxJ6aVeKoWU16tT0g+PwA8=;
 b=ck+EIILbOwBNFfAM+jK0gesp79b72cNNtyKMAoFYW5B8FocH3bH4DNl/rdMNy1oMb8yYraTc5KSsfN/4o20IBLFfTn1gjo0FqwaXx/qlfmY4q1cCJc1AGcyYSU/NpR1m/Buhq+zO4nIgZTNB4L9IZsD7V8nxMABBJ0gw2lAxmU4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "Mykyta_Poturai@epam.com"
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>
Subject: RE: [PATCH v12 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v12 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdX21OrO4+KL2GDkargycw+FU9OrcH2ImAgAIuzCA=
Date: Thu, 22 Oct 2026 20:57:21 +0000
Message-ID:
 <OS9P286MB72222EAD414AF5F1ED1964BB82652@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261019015749.48492-1-taka@valinux.co.jp>
 <20261019015749.48492-2-taka@valinux.co.jp>
 <22b3b21a-775e-4d82-b9bc-5fea1849294c@amd.com>
In-Reply-To: <22b3b21a-775e-4d82-b9bc-5fea1849294c@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYRP286MB5138:EE_
x-ms-office365-filtering-correlation-id: ccf00d1e-4987-46dd-3798-08df307f10d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|38070700021|4143699003|56012099006|5023799004|10067099003|261021121427099003|261009223027099003|22082099003|6133799003|18002099003|261022105027099003;
x-microsoft-antispam-message-info:
 dyoWCe5Xq/f32Uzlrq82e+5WTLqipUZRXNPFuyC01duWYm3ZPjUEVU7+kUE0YV3RGYmEJLNGwYuuLHbSysu6p2risg8P1aYRBYAeQ9PNF1y6JEuyVsiTkF9NQs5r9olpGk9Bx7OGCE5jqXH92xsqk3j5pv8EkFvDcNojWanep+SpEu31aVWn4D/ZfSUpQvOZpsdBWhPaEfOuSlBzWMfsAbF75k0OCTZ/5kqGsqvATVan/IlKjTvQMXwnTxJP3jhkVBqyLX7RGWNqYcCOXI+8WgEdzzvHnkGAONVnaK0cpagNxyuNtYBSwnig8dWCfixrAE9XK2K5zm2nkzGwWga2YzQfVywrt/liqj3cJa66eP08etGwn01NJAaFljenGs+Bz4St4QYLxTSDRWSkvnlrKaU9onPtOTn7yon8Sgy9CFJG/4CzqvXd33GHvX1ao9Fly4iHnZ87Ih9ZWXgRnYPmsqMzTc2Nus8/3bjJh+coEIhRlD49+SMeXm3GcWiEzgJODeHvtgPaJfhQWagtiiHCLjurxRolQabzoaW4+NyCL66/ci5RZYnA5meojSfhogkFxuEFgckV+Ip4mOoUlQY3reqlqw3W7aAuk1LtPXV7BXWHcWogVt3/VTu1CIwOQak95Xd0k4Qc/uF5MFSmKY7mphaHWsNst4GDR22PUTo84TCQ33tpjBS24ka65z6daKKHqOXKIdpphXr8FIQ/PiWYHw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(38070700021)(4143699003)(56012099006)(5023799004)(10067099003)(261021121427099003)(261009223027099003)(22082099003)(6133799003)(18002099003)(261022105027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFA5MEtoS2l5R3FwdnAzZXF1MXdDUXBqRy9XbEtDdlBvRVBrRmNoVHlCdk0y?=
 =?utf-8?B?Y29QajNMeXAyQ2k2NWtrYWVoYUprRElVaWZTN1hpa3ZXWmYrOUhPVmhRNDl0?=
 =?utf-8?B?bk9jOEFNc1BCREk5cWdudlJnN3ZpaTQ1dDNtd0R4LysvSm1IY0tGVVdqY2ZM?=
 =?utf-8?B?NGZXNjJtTmJNalpDWGQrZWtxcE9TLy94OC9NYWlFTkUzVnBRa3ZTbWw0aXJ3?=
 =?utf-8?B?bWZWS0JZV3FHR2x2b0VBQWN6TmhvYWRpM05USGpxN1FTVU1FdTBXSFVWNmFV?=
 =?utf-8?B?a3BCTzZZajlNaEJIM09UblZNeWNkV1lYNGlOb2pCZXIvZC9KVk5VSTI2bGsr?=
 =?utf-8?B?bXZTVXVodG01Mk9kVXJqaWlqR0tWV1NpcjY3WmEvQS9PQUNQd0RTVS9OUW5n?=
 =?utf-8?B?OTBVTFlxRVNGYmYycnhmelovOUMra1FHODNpR1NRSnhXTnRURm5LdHFsenZR?=
 =?utf-8?B?TFBlOHJuMVFrbVZjVXpvRzNBM1NETWJSUTZrVzRuQzZzTnlZVngvUmM0QXcv?=
 =?utf-8?B?eGNqTHFIWXFIZkNiWmE4QVZOSjdwZFhELzdhbVMveW9tdEN3eU5MM3cxSjBp?=
 =?utf-8?B?eHJXak83cTN6dEpkOGU2QmYwTmduVGYyYTZoNkZrcGR5dHVRTmZoc3owcW42?=
 =?utf-8?B?V3o5ekNOWEdBNXFhaFBVaXpPclFMZERoUkE0QXFhNzI5YWMzTFdwMzBZV2c2?=
 =?utf-8?B?VUI1ZzJWVGd6YzRsZ0tIckxzNUp4ZjByN2ZvQy8yUU1LeEttd1g4UHBMS05a?=
 =?utf-8?B?eXJEQTZhd3hDSFdIL0ZrR3BvbGRES2VpOWE0QlVSYXVWMUdzUXkvMDJSMk1C?=
 =?utf-8?B?Yyt6bnFHSjJuKzB3MFhIUWFsa2NOdFVNY1JGRk03VzZWdzR5dGZCTGhIMkVj?=
 =?utf-8?B?ZElRUEY3RWFHVUdjYm51emczaWJmR0ZZcUhaVzAyK1ZiaHF1MVRPeGxUNk9Z?=
 =?utf-8?B?MTNsZjlIejlEOFh2VWlWU0VoZ2NjeVJZbTFmTGp6NnovZldKaGZMYkU1QWxa?=
 =?utf-8?B?bUVCQnFBUnBOc3JPZWo1cGpmbThFMks5c0lSK2hLTjZjbk5CTHRYVWIzQXhY?=
 =?utf-8?B?KzE1MUh2SXFkbTFMbXhBSUxndGIzam1ZSGJSR04yZ1phWjNEcG95aXMrUURy?=
 =?utf-8?B?YjJidDM5Z0ladldlUXJTNjRCNkRVaHYvbVB6NjVFaVNpeS9vMVVQRldxVUVl?=
 =?utf-8?B?ekFrUmJDc21hMUVzbjN3WGt2Yks3eTFiaCszcmRyajQ2RWo0NjdpeTRkMUo2?=
 =?utf-8?B?L01PeWxyOGFnMUpJZk9Kbk1ZUmJCSjBucGgrQWhwVnpRTmY1Ti8wcWcvc1p6?=
 =?utf-8?B?NHdWc0wxNlVTdzlDVVJSMHdGeHVURC83VTQva2VKM0U0ZmJxL3NFRkgwUkwv?=
 =?utf-8?B?emJEdlRMU0ZWVXpQekloREdQaStnUnpsQXgySlJxVE9lYmJzNnRZemtjelRB?=
 =?utf-8?B?MUJZZXBHTlRCbFZZVnhkemxJQzdFNlFkUy9YMjNVVExIZFpGYk1RdmFLLzBD?=
 =?utf-8?B?UTl2R1NUMFdzc1lFS2xleENUR3k5UVlsdFdKUE9LSFVFOXdLUG9TWXIyMVNa?=
 =?utf-8?B?YXhKMlYvcmU5U1pNNFVRL0ZtdVRvWU82cithcFFpVUtZd0ExK2doQjBKR0Fj?=
 =?utf-8?B?NENjek5YdTFmSGZQbzNPQ29vWWRsWmY2cWxYOWhGR29DWGVqQ2VXeU5SazQ5?=
 =?utf-8?B?UEpiWUphWFMwMHVlSFFRcVRnWUZVVlRrK3VMM2ovQnVnb2pIZ2FlMmIvU2ZT?=
 =?utf-8?B?c1cvVDU5cEF3cXd0QllIVjVnTXlKbnRyQVEwNnJlb3M4NzNrbnphc2k1Uk9m?=
 =?utf-8?B?MG5WM3VBMWVOenpGUjJ4L3VWKzNuY2c5ZlI2WkwxVHNWZWlUNHZMWUo5azNo?=
 =?utf-8?B?MkJBSW5LQ3BHUCtmWUR5UGNnL0xDd2oyTEp4Mm50YXRxOEFRaVFHMklvbnRO?=
 =?utf-8?B?cVNpQ1NuLzFGWVlqRHYvRmFBOExxRnJ2RDJENFBlSm1FNjBvLzRPQUgrRU40?=
 =?utf-8?B?a3U5QjBKcXlSRUM0QXBJVXA5QS9vcUI3NVV3NFc3M0xjVTVRWjdVai9xYVNk?=
 =?utf-8?B?aXQwR1h6SW4vN1dkT0ROK3VoenRGYmp0c3IweHhMVTRVRUJiWXJaVXZLRzB4?=
 =?utf-8?B?cjhmbUwwbk1MMjlxUmxHRUNEQnpoM1RFa2RxYkxPdlhhZGpHbVZzMmtOd2gz?=
 =?utf-8?B?ZDNscktIYXZTa0l3ZkRTK1ZueG9obUxOWjdkQUJPaTBTU1F1QlVFTGthV2o4?=
 =?utf-8?B?Ti9hU1hSeWVJNThCL1gxSHE3VDRnYmFWMGNtWTVLY2EvTTBuUTJPbWMxR0h6?=
 =?utf-8?Q?h7ANbJhvYppi2C8BHY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf00d1e-4987-46dd-3798-08df307f10d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 20:57:21.1071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xH9vZg7YVd4gz2XxXEb2HPXs9rG6dJRYlq6PUrQnVL7uT9eredz5epDHFzRITZ/rqv6SXo+gpyAoABb84gr4iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5138
X-purgate-ID: tlsNG-720697/1792702646-F1CAA2AC-00194E63/0/0
X-purgate-type: clean
X-purgate-size: 4422
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWljaGFsLA0KDQo+ID4gIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvY3B1LXRvcG9sb2d5LmMg
fCAzNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2RyaXZlcnMvYWNwaS9N
YWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIHhlbi9kcml2ZXJzL2FjcGkvdG9wb2xv
Z3kuYyAgICAgICAgICAgfCAgNDMgKysrDQo+IFNob3VsZG4ndCB0aGlzIGZpbGUgYmUgY2FsbGVk
IGNwdS10b3BvbG9neSBsaWtlIHRoZSBEVCBlcXVpdmFsZW50Pw0KDQpPa2F5Lg0KDQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5j
DQo+ID4gaW5kZXggOGM5MDcyZjNjMS4uZDM0Mzk2ZjliMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4v
YXJjaC9hcm0vc21wYm9vdC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPiA+
IEBAIC05LDEwICs5LDEyIEBADQo+ID4NCj4gPiAgI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+ID4g
ICNpbmNsdWRlIDx4ZW4vY3B1Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vY3B1LXRvcG9sb2d5Lmg+
DQo+ID4gICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL2RlbGF5
Lmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4gPiAgI2luY2x1ZGUgPHhl
bi9kb21haW5fcGFnZS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2R0LWNwdS10b3BvbG9neS5oPg0K
PiBOb3RoaW5nIGluIHRoaXMgZmlsZSBzZWVtcyB0byB1c2UgdGhpcyBoZWFkZXINCg0KVGhpcyBo
ZWFkZXIgaXMgcmVxdWlyZWQgYmVjYXVzZSB0aGlzIGZpbGUgdXNlcyBtYXBfY3B1X3RvX2R0X25v
ZGUoKS4NClRoaXMgZXh0ZXJuIGRlY2xhcmF0aW9uIGlzIHByb3ZpZGVkIGluIGl0Lg0KDQo+ID4g
K3ZvaWQgX19pbml0IGluaXRfY3B1X3RvcG9sb2d5KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHVu
c2lnbmVkIGludCBjcHU7DQo+ID4gKyAgICBpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKyAgICBp
ZiAoIG51bV9wb3NzaWJsZV9jcHVzKCkgPT0gMSApDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+
ICsNCj4gPiArICAgIGNwdV90b3BvbG9neSA9IHh2emFsbG9jX2FycmF5KHN0cnVjdCBjcHVfdG9w
b2xvZ3ksIG5yX2NwdV9pZHMpOw0KPiA+ICsNCj4gPiArICAgIGlmICggY3B1X3RvcG9sb2d5ICkN
Cj4gPiArICAgIHsNCj4gPiArICAgICAgICBmb3IgKCBjcHUgPSAwOyBjcHUgPCBucl9jcHVfaWRz
OyBjcHUrKyApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBpZiAoICF6YWxsb2Nf
Y3B1bWFza192YXIoJmNwdV90b3BvbG9neVtjcHVdLnRocmVhZF9zaWJsaW5nKQ0KPiB8fA0KPiA+
ICsgICAgICAgICAgICAgICAgICF6YWxsb2NfY3B1bWFza192YXIoJmNwdV90b3BvbG9neVtjcHVd
LmNvcmVfc2libGluZykNCj4gfHwNCj4gPg0KPiArICAgICAgICAgICAgICAgICAhemFsbG9jX2Nw
dW1hc2tfdmFyKCZjcHVfdG9wb2xvZ3lbY3B1XS5jbHVzdGVyX3NpYmxpbmcpDQo+ICApDQo+ID4g
KyAgICAgICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0KPiBUaGUgbG9vcCBjb250aW51ZXMgYWxs
b2NhdGluZyBhZnRlciB0aGUgZmlyc3QgZXJyb3Igd2hpY2ggaXMgaW5jb3JyZWN0Lg0KDQpZb3Ug
YXJlIHJpZ2h0LiBJIHdpbGwgZml4IGl0Lg0KDQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0K
PiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgICAgIHJldCA9IC1FTk9NRU07DQo+ID4gKw0KPiA+ICsg
ICAgaWYgKCByZXQgIT0gMCApDQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJD
UFUgdG9wb2xvZ3kgdGFibGUgYWxsb2NhdGlvbiBmYWlsZWRcbiIpOw0KPiBBZnRlciBwcmludGlu
ZyB0aGlzIG9uZSB3ZSB3aWxsIGFsc28gcHJpbnQgdGhlICJGYWlsZWQgdG8gaW5pdGlhbGl6ZS4u
LiIgb25lLg0KPiBQbGVhc2UgZ290byB0aGUgZXJyb3IuDQoNCk9rYXkuDQoNCj4gPiArICAgIGVs
c2UgaWYgKCBhY3BpX2Rpc2FibGVkICkNCj4gPiArICAgICAgICByZXQgPSBkdF9pbml0X2NwdV90
b3BvbG9neSgpOw0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgICAgIHJldCA9IGFjcGlfaW5pdF9j
cHVfdG9wb2xvZ3koKTsNCj4gPiArDQo+ID4gKyAgICAvKiBGcmVlIHRoZSBDUFUgdG9wb2xvZ3kg
dGFibGUgaWYgaW5pdGlhbGl6YXRpb24gZmFpbHMuICovDQo+ID4gKyAgICBpZiAoIHJldCAhPSAw
ICkNCj4gSW4gdjExIEkgYXNrZWQgeW91IHRvIHByaW50IGVycm9yIG9uIHJlYWwgZmFpbHVyZSwg
bm90IGFsbCB0aGUgdGltZSBlLmcuIG9uIC0NCj4gRU9QTk9UU1VQUCBvciBFTk9FTlQgYXMgYSBy
ZXN1bHQgb2Ygbm90IGZpbmRpbmcgY3B1LW1hcC4NCg0KT2theQ0KIA0KPiA+ICsgICAgew0KPiA+
ICsgICAgICAgIHByaW50aygiRmFpbGVkIHRvIGluaXRpYWxpemUgY3B1IHRvcG9sb2d5IChlcnJv
ciAlZClcbiIsIHJldCk7DQo+IFhFTkxPR19FUlIvV0FSTklORz8NCg0KSSB3aWxsIGZpeCBpdC4N
Cg0KDQo+ID4gKyAgICAgICAgaWYgKCAhdGhyZWFkICkNCj4gPiArICAgICAgICAgICAgYnJlYWs7
DQo+ID4gKw0KPiA+ICsgICAgICAgIGxlYWYgPSBmYWxzZTsNCj4gPiArICAgICAgICByZXQgPSBn
ZXRfY3B1X2Zvcl9ub2RlKHRocmVhZCwgJmNwdSk7DQo+ID4gKyAgICAgICAgaWYgKCByZXQgKQ0K
PiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPiAr
ICAgICAgICAgICAgICAgICAgICIlczogTm8gQ1BVIGZvdW5kIGZvciB0aHJlYWRcbiIsIGR0X25v
ZGVfbmFtZSh0aHJlYWQpKTsNCj4gVXNlIGR0X25vZGVfZnVsbF9uYW1lKCkuIE90aGVyd2lzZSB0
aGUgcHJpbnRlZCBuYW1lIGNhbiBiZSBhbWJpZ3VvdXMuDQoNCk9rYXkuDQoNCj4gPiArICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIGlm
ICggY3B1ID09IElOVkFMSURfVE9QT19JRCApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAg
ICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgKiBJZ25vcmUgdGhpcyBDUFUgbm9kZSBkZWZpbml0
aW9uIGFzIHRoZSBjb3JyZXNwb25kaW5nIHBoeXNpY2FsDQo+ID4gKyAgICAgICAgICAgICAqIENQ
VSBmYWlsZWQgdG8gYm9vdC4NCj4gWW91IHVwZGF0ZWQgdGhlIHByaW50ayBtZXNzYWdlIGJ1dCBu
b3QgdGhlIGNvbW1lbnQuIFBsZWFzZSBmaXguDQoNCk9rYXkNCg==

