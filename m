Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10831606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=IVUdszSe
Received: from list by lists.xenproject.org with outflank-mailman.1504332.1699752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWkGX-0007O9-KX; Fri, 27 Nov 2026 00:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504332.1699752; Fri, 27 Nov 2026 00:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWkGX-0007O2-Hf; Fri, 27 Nov 2026 00:56:41 +0000
Received: by outflank-mailman (input) for mailman id 1504332;
 Fri, 27 Nov 2026 00:56:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xWkGW-0007Nw-HZ
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 00:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWkGV-009bYT-Ca
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 01:56:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b08d4da-8faa-0a2a0a5109dd-0a2a450883ec-42
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 01:56:37 +0100
Received: from [52.101.228.82]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b08d542-f659-0a2a45080019-3465e452c55a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 01:56:36 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB7074.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:322::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 00:56:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 00:56:31 +0000
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
 b=S24Cg0S09Pn9hAmfp0FMdljH1e0jb/dd7Ben299IxAW3FQ4PJik2XM764JkmMlArXjKllRNnibZMNMeO9tv/lF5p85Nuh+bVwx9RYLkmt5TeDnpNOWb5Mdvnn7FOJtpEUTDg15lt0ta4gwMlPpH+W/8iTelTRO21Ep4ZBEgdD1XsV/uX6FcyOVQF4Cnuadh4zsN2qyKoEM66eMe2DmhvKAXEuVwYCIOIB5L4LYpYP40qFwLwAdC38XuLO4rAzwgceiiW4y/l7cDr3aENGMDojfSOIpE6m53CkMRGrF1BECGffHwL5thxlYaIrXuL8m04y9kyPlgkYatEWaAvSmP02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL06gi2P6qEBoqtnSFpOIi2KMo0Eq58Rsfg0B1wIXIs=;
 b=Fcjkq4WjoU8VL3OhWNqrQ726Z+knZhO+mjRYPSwzozn9gLYBTIATPEepvww5Ss/gJ00wUXq5eB7FJX3T5dBFz5iFaZ+GRPdTaAMZW2tKZciH8YGPNXkTt55fY74m+p6abJVxOtufNZWLrdczFg3zELAPcSL7z+qi99Dhh23ZBBstr2rg8yunLhzS8Nm1WTYC8oSn9HDEil2IH/fuDVOEgTQyqs4ufaksgHEWFnWal42vsSgrd8nWQDtjsfBtlEMk1fMGZMb3Jsuo8t8fRimQDWHYQp+WyE8D9eDQsX4U1vz0Ta7s50Rp6viJX7MThD1hp7xTVXPLkbb+GqNns1chOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL06gi2P6qEBoqtnSFpOIi2KMo0Eq58Rsfg0B1wIXIs=;
 b=IVUdszSeVYfF5y8OhZt8YXvNCZNioSgjhGxs58Luj9hwhfgUKBlwmDqfWhx4mC8Cm8GQdfMB+SP/d0n5ZHkMqvhoYTUSaoNRNMYjGWyR+m5VRVFlgEtT3T67dD7vsbL7vvhFvfmq/fovSZfOns4VfIqH5pAhMuPSkz1hcWu37HU=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH v3] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Topic: [PATCH v3] xen/arm: Fix sibling mask setup to only include
 online CPUs
Thread-Index: AQHdfWDWX4jpBtDmIUiU0ilhK7g5qbdAFPWAgAEC4oA=
Date: Fri, 27 Nov 2026 00:56:30 +0000
Message-ID:
 <OS9P286MB72220080A37D94E1727CB47F82412@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261126044340.14779-1-taka@valinux.co.jp>
 <87b23da3-6418-40d1-9ec8-3b26f6b000b1@amd.com>
In-Reply-To: <87b23da3-6418-40d1-9ec8-3b26f6b000b1@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB7074:EE_
x-ms-office365-filtering-correlation-id: a7a4ac16-15b4-4439-235e-08df4c21467a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4143699003|18002099003|22082099003|3023799007|10067099003|56012099006|261028144727099003|261102123227099003|261021123027099003|261022075727099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info:
 yBEcNC3YrTJ83tDmETS4zs+R/vaiA5MgfQi0iDI5akTFebpj9Szzv7iwzkmMlBUriDUjq7g64qZGOD0wqZrXOmit93xTEAj5P19llxuFRiVUamXlshFGJn5CsbHkwcNqngUw5Ux6ND9asTu6C6SQFYDvhMTXILTZQfl5H47uz/qxLygbgInzN0S5zcSM5UZjdnymUmijBj0M30VF0kG/RPsx+cYqpXBQBvUUt9iGI19bv1FZZW1Ip6mnw7dCcQ0cM7SLYvCRjFjcSFjOZzZ85CZhPHQczncLPR2zWcxfnZymKMwh/UWOpSRzPt7H1ZszU9e7bnNgPzrqzSMmzPoxs62k8bAgwk8U7jxCEl4na5c5ARFa/f7WXp/6QhR5d8DLOJUgcEwxAc/IbgPt9yqPbx24s8FbH27twmUMqqDyks97tbyBOxHM1CX0polmGRlW5dgZ3mmMQ2gPFEiXcijbU07QVSEQBx9/UXGoaPeV7TlM8epCFJj9oWMuF6wXE2eda9MN+77u3jwjwdOvM1exjKSO4Zoiotd5pR/NeKitrxYDzJuMO9AyX3NkuIP5oYORTCw5d2WURdBFs1utMuKmsd3F/bHeiuGXyW1Kf0poG3jXXuxjTYshFIQPO0Ubt0z5eMILYiw9bqAwv8NSmHBSRfeGu8Rp8v6gQKdGT3WytBGFeRh+lY/HeZ0pjOa5xSD6mlyxrLGRQ3ONprq52y5BgljGK17PEATBJNJb7z2qaNQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261009223027099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzZTYWpkNUg5ZDlQdjJDUDZIZzNhVkdHeWVRdXRiT0kvcFhHMkkwK05aSWEz?=
 =?utf-8?B?cGNPMDVESU1XaDFPREk3NEkwRmdweVpzR21WZ0VXTnM4cFBZRjFSU0RLd0Fa?=
 =?utf-8?B?cE55Q1FyT2I5RC80WG9sMlNPVm92MmxpWnFFWE5FRXpVZkEwREJwY2FvdGVQ?=
 =?utf-8?B?aDNMdlp6MDZhcWxodmdVV0N5NzZQblFGelMrUkxSZ3crMXlQQkZwSnFMYUlP?=
 =?utf-8?B?azJLOVJsajRPTUJYdVhob28zSEltMHBLbmxQbi9XOGx2WklwMjQxUVJPK2Nj?=
 =?utf-8?B?b20vbzk4eE16WGVnT2JsdUNpN3BaMjBISERRNlhlUWNIOENqY1kzTGEzQXp3?=
 =?utf-8?B?bEltMTRRczA1MEFCYlVnNTN6M0lSeUF4QWppRnNQaCt3K1dXNlIyZERPWENi?=
 =?utf-8?B?NHNISFM5MUdZYk5zU0YyZnR0NHRiazRmanlCQ0NVd1JJblNpaU9SaVU5OXV5?=
 =?utf-8?B?dVRJb2NPN3JuMkxjVUpVWmhXbUpaMzRkMG9vR0VMY0FWd01vcDdzd3plRG1W?=
 =?utf-8?B?YnVXRVlpRjRsVmUvVmRYWmtxMDhPTDZqRXJMZkQ1V05lRWhQQ1RuOU9DbnFV?=
 =?utf-8?B?Myt0YlZZblFwbEMvY3Z1TjgxOTJRbFlhcUFSam8xTTI4Tkp6bW5kLy83TVdh?=
 =?utf-8?B?dGVVdnhxQVdXWUVYclUwb1BJampkVHd3LzNCY3RlUCtSWEE4SFV6ajllYmxq?=
 =?utf-8?B?ZkJndVNMdkluR3BXV3NsOXpvYTFrY1NnUlZsVFZtVnplRVA0SEwveVVpUHRt?=
 =?utf-8?B?d1hxWWJQeVk1eWxVRHN4T09FUWFJSkhTT3FUY1dXM0Q5K3VqNDQ1ejMxKzBs?=
 =?utf-8?B?QU5XdHY5MlJDT1ZvcWwvaEdBenk4N2VNUlFPUnBYZmwxRmwvR0lQdTlTZ25O?=
 =?utf-8?B?WEJENGNrcW5ZbEZ0Z2UwMENCTDJYdXBITXoyVEgxOWQ2M1QwY0s0ZUJ3enUr?=
 =?utf-8?B?Zkw0dVZQQkpqMFNvcEhPN01lcThzK0Z0UWFIY3pXdVl6V2RvSFRnNnJpU3gw?=
 =?utf-8?B?dm9wVkRiQm44c1RiMHpxeGpjZkpGcTVPaElPb1JaK3kzMlZjSVVyKzBlcnVx?=
 =?utf-8?B?WElnbmJKRlFwUFhFTEtnWGlkUkJ6ejZIczlFcUppSXMwbzQzZjIrNUMzY1J3?=
 =?utf-8?B?TDExZDJQMzJRNEtNZlhvMzdkRER2cW5hZTNUazhWSGFXUnRvUUFXV0VPYjha?=
 =?utf-8?B?RS84RHphTVg1cytaNGxWR1NqQ056ZG0wMEdNNEF0eFhxMHhpTXdQZEVyMzZP?=
 =?utf-8?B?RHBHSnNGaDFDc3ExNVVhUFZYYWZrOElaNFZXS1pQdVFON29Hb0NwOTlsY1VN?=
 =?utf-8?B?SkYzYk1xRmNnT3VydFNqNTJjWG9pK0xzNmtRdXJvUUs5eWZwVVZpN0NOVnZ1?=
 =?utf-8?B?WEU4Yk5IdTBZMkpGMUNVMk1LZEhRajVTNGptZFV5M2ZVMlVmMXJManpaeVpK?=
 =?utf-8?B?S2V0d3pRYVdpUlo5SUNpQUZRLy9jT0IwUHhrR0NqYzJkTzBCWjRJTlhBYU9R?=
 =?utf-8?B?WFJiM3JnRHFsUWJQWkN2NGJkbFh0UzY2dXdhOXk5bEJwaHlsNVNXVEhPVjdJ?=
 =?utf-8?B?SXg4aDVPYkRYaGtwY0dhZHpmREtxcWtJM3I0bHg4Nk94UDYzRHV1NnVBbm9H?=
 =?utf-8?B?MnNvSlhCZ1B3cFo4VmNnWVNyOGdhUGlxL2l2Y3RqRGkxb240WW9hWmNKaFFD?=
 =?utf-8?B?ODdpSUMvR0t0K0RBT0xBSkZ6REoybytFNmhqb0FVRGwzRjZqZ01ZUDhMNkF1?=
 =?utf-8?B?aGlqTXNoU2NacGdVaWRvS2N6UUxud3Z3bHBYcXF2NHowRkVxVlAxc2JwazVW?=
 =?utf-8?B?WTZLM0ZEMkgzYUd4R2R2bGttOUVjSzNjRisvdmlycUZkNjZ1ZmdTazYzTjIx?=
 =?utf-8?B?VWQrcGRmN3BKaElibG5NK21NcFZzblRmUVpGU1pQUmtKb2FoRWZtRW1zdzFW?=
 =?utf-8?B?ekdlMkZtc1l2aW9TUWFaMVBqQUo1Mkg0OGRQcVVJQ1RpMzY0VlhNTEhSYlh0?=
 =?utf-8?B?U0x2TkVXSWJLNHZhQTVKbWp1UjZFU3hqRmQvbXFHNjVXVlhyTk1ickF1YXAw?=
 =?utf-8?B?Mlo3SmVEeFoxOVdkRDkwYUtsaUZkTWRVeXlhbWI1dFV4dzB0cDBIQjM1NjlP?=
 =?utf-8?B?bC94MUFmZDVrZ2Z4dGR5SWR5ci85QmdzZDZDZ0VqNDNoTkhNZVQ5d0x0YTg4?=
 =?utf-8?B?ekw4MHpkcTJVRjNrVXJrbENEMDVLVEkzWWJaY0pqVkdWdSt0dExNTEZuM0xB?=
 =?utf-8?B?T3JSOWptVnhMN1JydnN0dUVvUWcwUTZ3RWU5bTlJTkJCS2hSd1VwaFUzU0lK?=
 =?utf-8?Q?r1Ey7jev5RNfnYbpWa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a4ac16-15b4-4439-235e-08df4c21467a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 00:56:30.9911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxGs1vwg+swOwlGH7yF7/U9iuFFmDqMuuemWGsss8cC4FvGHPqM0O9hb1sXzWaLj2j5QO0pGIqv9f3dsEPLDpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB7074
X-purgate-ID: tlsNG-c1860d/1795740997-D477387B-6E4572A5/0/0
X-purgate-type: clean
X-purgate-size: 5034
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIE1pY2hhbA0KDQpUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50cy4NCg0KPiA+IFBvcHVsYXRl
IHRoZSBDUFUgc2libGluZyBtYXAgb25seSB3aXRoIENQVXMgdGhhdCBhcmUgYnJvdWdodA0KPiA+
IG9ubGluZS4gQ3VycmVudGx5LCBhbGwgQ1BVcyBpbiBjcHVfcG9zc2libGVfbWFwIGFyZSBhZGRl
ZCwNCj4gPiB3aGljaCBsZWF2ZXMgQ1BVcyB0aGF0IGZhaWxlZCB0byBib290IGluIHRoZSBzaWJs
aW5nIG1hc2tzIGFuZA0KPiA+IG1heSBsZWFkIHRoZSBzY2hlZHVsZXIgdG8gbWFrZSBpbmNvcnJl
Y3QgZGVjaXNpb25zLg0KPiBQbGVhc2UgbWVudGlvbiB0aGUgcmVtb3ZhbCBwYXJ0IGFzIHdlbGwg
d2hpY2ggeW91IGFkZGVkIGluIHRoaXMgcmV2aXNpb24uDQoNCk9rYXkNCg0KPiA+IEZpeGVzOiA3
MDExOTBhYmIzZDUgKCJ4ZW4vYXJtOiBTZXQgY29ycmVjdCBwZXItY3B1IGNwdV9jb3JlX21hc2si
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEhpcm9rYXp1IFRha2FoYXNoaSA8dGFrYUB2YWxpbnV4LmNv
LmpwPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBSZW1vdmUgdGhlIENQVSBm
cm9tIHNpYmxpbmcgbWFwcyB3aGVuIGl0IGdvZXMgZG93biwgaW50cm9kdWNpbmcNCj4gPiAgIHJl
bW92ZV9zaWJsaW5naW5mbygpIHRvIG1hdGNoIHg4NiBYZW4uDQo+ID4gLSBDaGFuZ2UgdGhlIGNw
dSBwYXJhbWV0ZXIgdHlwZSBvZiBzZXRfY3B1X3NpYmxpbmdfbWFwKCkgdG8NCj4gPiAgICd1bnNp
Z25lZCBpbnQnIHRvIGFsaWduIHdpdGggeDg2IFhlbi4gQWxzbyB1c2UgJ3Vuc2lnbmVkIGludCcN
Cj4gPiAgIGZvciB0aGUgY3B1IHBhcmFtZXRlcnMgb2YgcmVtb3ZlX3NpYmxpbmdpbmZvKCkgYW5k
DQo+ID4gICByZW1vdmVfY3B1X3NpYmxpbmdfbWFwKCkuDQo+ID4gLSBNaW5vciBjb2RlIGNsZWFu
dXBzLg0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIFJlbmFtZSBpbml0X2NwdV9zaWJs
aW5nX21hcCgpIHRvIHNldF9jcHVfc2libGluZ19tYXAoKSB0byBhbGlnbg0KPiA+ICAgd2l0aCB4
ODYuDQo+ID4gLSBVc2UgQlVHX09OKCkgaW4gc2V0X2NwdV9zaWJsaW5nX21hcCgpIHRvIHZlcmlm
eSB0aGF0IHBlci1jcHUNCj4gPiAgIGNwdV9zaWJsaW5nX21hc2sgYW5kIGNwdV9jb3JlX21hc2sg
YXJlIGFsbG9jYXRlZC4NCj4gPg0KPiA+ICB4ZW4vYXJjaC9hcm0vc21wYm9vdC5jIHwgMzkNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+ID4g
aW5kZXggOGM5MDcyZjNjMS4uYzRjOWY1MzVlMyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vc21wYm9vdC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPiA+IEBAIC05
MSwxOCArOTEsNDQgQEAgc3RhdGljIGludCBzZXR1cF9jcHVfc2libGluZ19tYXAoaW50IGNwdSkN
Cj4gPiAgICAgICAgICAgIXphbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShjcHVfY29yZV9tYXNr
LCBjcHUpKSApDQo+ID4gICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiArICAgIHJl
dHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBzZXRfY3B1X3NpYmxpbmdf
bWFwKHVuc2lnbmVkIGludCBjcHUpDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBzaWJs
aW5nOw0KPiA+ICsNCj4gPiArICAgIEJVR19PTighcGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBj
cHUpKTsNCj4gPiArICAgIEJVR19PTighcGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpKTsNCj4g
PiArDQo+ID4gICAgICAvKg0KPiA+ICAgICAgICogQ3VycmVudGx5IHdlIGFzc3VtZSB0aGVyZSBp
cyBubyBtdWx0aXRocmVhZCBhbmQgTlVNQSwgc28NCj4gPiAtICAgICAqIGEgQ1BVIGlzIGEgc2li
bGluZyB3aXRoIGl0c2VsZiwgYW5kIHRoZSBhbGwgcG9zc2libGUgQ1BVcw0KPiA+ICsgICAgICog
YSBDUFUgaXMgYSBzaWJsaW5nIHdpdGggaXRzZWxmLCBhbmQgdGhlIGFsbCBvbmxpbmUgQ1BVcw0K
PiA+ICAgICAgICogYXJlIHN1cHBvc2VkIHRvIGJlbG9uZyB0byB0aGUgc2FtZSBzb2NrZXQgKE5V
TUEgbm9kZSkuDQo+ID4gICAgICAgKi8NCj4gPiAgICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsIHBl
cl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSk7DQo+ID4gLSAgICBjcHVtYXNrX2NvcHkocGVy
X2NwdShjcHVfY29yZV9tYXNrLCBjcHUpLCAmY3B1X3Bvc3NpYmxlX21hcCk7DQo+ID4gKyAgICBj
cHVtYXNrX2NvcHkocGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpLCAmY3B1X29ubGluZV9tYXAp
Ow0KPiA+ICsgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgcGVyX2NwdShjcHVfY29yZV9tYXNrLCBj
cHUpKTsNCj4gPg0KPiA+IC0gICAgcmV0dXJuIDA7DQo+ID4gKyAgICBmb3JfZWFjaF9vbmxpbmVf
Y3B1KHNpYmxpbmcpDQo+ID4gKyAgICAgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgcGVyX2NwdShj
cHVfY29yZV9tYXNrLCBzaWJsaW5nKSk7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBy
ZW1vdmVfY3B1X3NpYmxpbmdfbWFwKGludCBjcHUpDQo+ID4gK3N0YXRpYyB2b2lkIHJlbW92ZV9z
aWJsaW5naW5mbyh1bnNpZ25lZCBpbnQgY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBp
bnQgc2libGluZzsNCj4gPiArDQo+ID4gKyAgICBmb3JfZWFjaF9jcHUoc2libGluZywgcGVyX2Nw
dShjcHVfY29yZV9tYXNrLCBjcHUpKQ0KPiA+ICsgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNw
dSwgcGVyX2NwdShjcHVfY29yZV9tYXNrLCBzaWJsaW5nKSk7DQo+ID4gKw0KPiA+ICsgICAgZm9y
X2VhY2hfY3B1KHNpYmxpbmcsIHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkNCj4gPiAr
ICAgICAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywg
c2libGluZykpOw0KPiBPbiBBUk0gYSBDUFUgaXMgYSBzYmlsaW5nIHdpdGggaXRzZWxmIG9ubHks
IHNvIHRoaXMgbG9vcCBpcyByZWR1bmRhbnQuIFBsZWFzZSBkcm9wLg0KDQpPa2F5LCBJIHdpbGwg
cmVtb3ZlIGl0Lg0KQW5kIEkgd2lsbCBhZGQgdGhpcyBsb29wIGluIHRoZSBjcHUgdG9wb2xvZ3kg
cGF0Y2ggc2VyaWVzLg0KDQo+ID4gKyAgICBjcHVtYXNrX2NsZWFyKHBlcl9jcHUoY3B1X3NpYmxp
bmdfbWFzaywgY3B1KSk7DQo+ID4gKyAgICBjcHVtYXNrX2NsZWFyKHBlcl9jcHUoY3B1X2NvcmVf
bWFzaywgY3B1KSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHJlbW92ZV9jcHVf
c2libGluZ19tYXAodW5zaWduZWQgaW50IGNwdSkNCj4gV2UgdHJ5IG5vdCB0byBhZGQgdW5yZWxh
dGVkIGNoYW5nZXMgdG8gdGhlIHBhdGNoIHRoYXQgaXMgbWVhbnQgdG8gZG8gc29tZXRoaW5nDQo+
IGVsc2UgKGhlcmUgcy9pbnQvdW5zaWduZWQgaW50LykuIElmIGF0IGFsbCwgaXQgc2hvdWxkIGJl
IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1zZy4NCg0KT2theS4NCg0KPiBXaXRoIHRoYXQ6DQo+
IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGFu
ayB5b3UsDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

