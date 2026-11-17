Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FF606A337
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 01:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=kD1LHtPd
Received: from list by lists.xenproject.org with outflank-mailman.1491675.1692428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cs-0004Yf-Mv; Tue, 17 Nov 2026 01:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491675.1692428; Tue, 17 Nov 2026 01:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT7cs-0004YY-IR; Tue, 17 Nov 2026 01:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1491675;
 Tue, 17 Nov 2026 01:04:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT7cr-0004Wr-Ua
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 01:04:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT7cr-009f9E-BC
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 02:04:45 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba7fc-bab6-0a2a0a5309dd-0a2a4503c8be-20
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:45 +0100
Received: from [52.101.69.116]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afba82d-fae8-0a2a45030019-3465457462ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 02:04:45 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB3PR0302MB9234.eurprd03.prod.outlook.com
 (2603:10a6:10:42b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:04:43 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:04:43 +0000
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
 b=sIUdVxvP3L8QOn3GcQi6iRqbQs1voFaSHhExX1T2VMJbcw2CVZjcCvheY3Ouv+fQxoifnX+zhjah2gOjNL1bV5yZUxuu/PQgbd0AjeDDjVX68g15MA1xIE7DJnF+a37phLfxDOxUqXVzXje55zym5Vj+Mai+skaWcdPasUZNrdcrKhWVRGwTJ88cMl3tT/7BSSOCYhTDNgvW3BhjYSeEorrGqRzBihpWaE0+EDsb7AoNEfZw9yOXjapUSyoKlXcg27qBnhUbGckSrEreN89mz4LQzMXiMJ73dFTzW9pFLlVgXRjTxdksAf1G71TU+d3U6RuZ8fEUbz1x6IrbAEEnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCArjUmzNOiOp6zyOZn8I72ksulMgb9hRJgcIjStqvw=;
 b=Aob5YQWDovB5ROeg1SgNHIVeoxDCu4z+LWmtbho9IeZEeG1TR0BGAMJe8OqLIpb0xUXt/As9NB3E+lsqkE19IOIAPfbKwOjmGz0HaelQPpsOO8SlsdzYMP9D/ufWE8tH6wL8+bpETTHsVxo/JGYQ9Xmo/VLvMqXxZSzwfs0cYaxTzYAExZ3+zfdHGp2R4yTyeAIyCF2/U3xGbPdUPqsiLM00I+7dW8t5NVHlk6iCWp8zqeS3ns1sAHHKkvZEbUZov/W+wP1SiC2pAJSphKG5W3QQ/wEMWILj66Ut4uiOBfgAwlz5PzSKyS9OX4jLLXqelW62CCdJwlMh3oHIGUIH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCArjUmzNOiOp6zyOZn8I72ksulMgb9hRJgcIjStqvw=;
 b=kD1LHtPdW2wicyio+fqlU+60SqTjOxSmxmgMNSajdFgvzOVRTc1ojCzn8VrumbhHNMih1WM5XAEg266oqJA7X5gSqW6Q+3W3Y7/C+GvANTBeOT+IlWNSY1G+PYRlLbcVOFQnBG3VgCNL4iQjtvVv+Im+jf94uXWr25bxe6TVK3yyAdqKx8NLs2B0Z1Je/+Bwk6+SfyGzcjcg94spvn/dGt1OPDs88Z+GASoKp4NELudArszAJf9yII7+BJA19xw/+DqEYsVs1uQZTdE6iqxAS3r/y1UHxKHhwNQ4bMohn7Jrz87P8UXSdfPOhw3RAZTOiLfSLjy6qD7mPJoLUu+ebA==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v14 07/15] xen/arm: tee: keep init_tee_secondary() for hotplug
 and resume
Thread-Topic: [PATCH v14 07/15] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Index: AQHddi+huyhOXDLDSUCSXAPQOH2FDg==
Date: Tue, 17 Nov 2026 01:04:43 +0000
Message-ID:
 <c4e455331f400919f9adf66e9b1b3a3005c8a330.1794873792.git.mykola_kvach@epam.com>
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
x-ms-office365-filtering-correlation-id: cedf81e6-5187-4ea0-2345-08df4446c3e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|56012099006|261021121427099003|11063799006|261021123027099003|261102123227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 TpQF+kstWaxJHIT8KG12TRgfl0ALZpkdcYCSI9B5cW6b1DGEicMK+sSUZG1NV6f8W5fEslp3YUq3oo2lYJ+x41OcVEHKjys1II+FesUVlDgZrS+MFxa8X2pHlhBalvh0W1biBKdYBoEvlRYyJJH5DBsZV+OIMmMPOmy3UorB3G47rKsK/DT8nsECloWtIjh24CYOSgUjUR2vFebFV1Wu9LA/k77VRaAtpeJlRgdJaD0CE59fiqzlOW4Qe7njHCYXABBoS+mQxH+Z/DrTO2JISY0uyUBwbTN0F+urj7WsT0LYSCFqrg9EQ0mRopzabRjGzO16Kyreq4Xa9Z+AN72szqTzj4LhNK9qoqpu/rIeUWswfkDOoVhru/T2rUDtxZrZ12a5ko44Vpyjjv/8olDbiOuBhQmoShektGa31SjdPA68LMA7E2eH7GrhZ6h8eLroW/3mtijdv7phjyzsU+I9y5Erm5psF4g2hF6weL6UOmfhi7IR+CbwmJmnQLFXgks8PMjU8Y2MG3uNGLDvkNQptckiMKi4G4HwzTOlaunyw6TEcVm8JxfRLTu0hekv1X4tutFaqM7hy4FtTSGzJMQb/fXK0RYSjn4Ot81GXdC228/ieHzyl4pYoOR7RQywR/YWQtUX7Zw/O5hVhDxnteUD4LuDTsFnnPtDUHiXrr/kzlsUxH3waRNG/tEK+3tZmBRp66IayhtGOtQr7wsz4Pl0ZFI+lnWUQFVIBe2TBzqbmII=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(261021121427099003)(11063799006)(261021123027099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG1NUko3Wno2WTJBL0J2dXVxOXVEakJMUXJVcFNWZ3RBQkdQK25SVnV1bTM1?=
 =?utf-8?B?S1lDWGx5bk53cERQMGowNmtzMnJGOERRM0lNTlBaeHFGY0NQbGZ2ZlgxY1pW?=
 =?utf-8?B?UFJoRkZhU09iVDZyR0FSOGNtR0V3Unk3TFRuMldMR3NVWEdzdlh4a1NjZmRy?=
 =?utf-8?B?RHJFZWhTdEVEQm1HU3JFWFhhbXJCYTd3UEJZSTBtMjg1bDhsYzVpdzhMaDR1?=
 =?utf-8?B?MzdCZUdiNmFDZDB6VnRCbXc0SHFOZ25ubXE5SDNaTDJVd1VPNnlHOFdYTUFn?=
 =?utf-8?B?TGN2QlNSeUhxVjc0dFVXQi9xbEtYRU1oenllSUYxVHdtUmZERktCQUoyNkht?=
 =?utf-8?B?R0dQcVA0Y3hRbGwySHNaOHppUzkwSkZ4REhlbVgvenJwMFd2eXBDZXpnUGRz?=
 =?utf-8?B?NldPNWNUZGRvcHRhNHlqcEN1OEo0dnNWWm90VFc3amQySld0em1EemJmWG5C?=
 =?utf-8?B?Vk9WWkhqa0ROT2QzNjkxdm9wTnlTTTVLVk96VXZYV1ROSUxpVEw2d3JjTE5S?=
 =?utf-8?B?Q2dJZ0xEcDdCTHBNWjdscFFrQi9oQ0pzZ21aUzQyQjhURWc2YVpJWi9xMWpq?=
 =?utf-8?B?QkJReHFrb1J6ZjFOZmVWUEVDYXdHR3hBdkJHMm5ESmtFMU5LVHdEWmhHUHlS?=
 =?utf-8?B?Slc4di9QNzRwMGk3SjBTZmh2Tm92RGpudXVTOTRCUG04RGdaQnhMQThDQzN4?=
 =?utf-8?B?RVR3TnF5T0xUczhJZkVDanBaSjlDdTJvUjdhNEQ5VnFnKzRteTZmN3ZuRDY3?=
 =?utf-8?B?dzhUY2pKbDMyS2hScENnejlFR1NLTHZMWG9WSFlJL1hjZkZmbHdDUmFJTE55?=
 =?utf-8?B?OVRXQmNuM0ZwM3ZkNWE0cWFGTEVzQkJQQjg1K3E0Uyt2cGUzdUNPNTRCM2ZU?=
 =?utf-8?B?cVRMRmtPdkUxNmJQVjJNSzk3eXY3SGJtZ3d4RVB3SDFXTkRWN1ZxNVg2eXMy?=
 =?utf-8?B?QzN4VnJ2bm9Ub0QzaDNNWWRJazVqdllqb1AwZ1Viejc0dDBRaVVOMDlOTjh0?=
 =?utf-8?B?eGo2OTM4a0FSdS9IekxHR3kvUEkxc2R2N0VaRE5NRE8xLzk1TmtTWG5rd3Y5?=
 =?utf-8?B?WVd2cXYrWE9PU1g3TUNQZ3VMMDR0ODh3dk9TS3RwUFFRdXJkMDRUaDZlaWZW?=
 =?utf-8?B?OGFvZDl0VDlwdmtoWDJNMUphYnJ4TlJIRFNmNlVVeFM5MlFMaURBWm1sTHVl?=
 =?utf-8?B?Mm1oenladElTeEVVSmwvSTBmd1c4cllTN3lvRUV2d3dlVWFwNE1DUGZrYVFG?=
 =?utf-8?B?UVFKVFZWRHBsbzRRZm5HejMxaWZ4NktMQ09zYlhNYWprRERFOGtONVRncWwy?=
 =?utf-8?B?bW5PdExxczR6b1VoNitxbGErUFFrbmVYTHdKUys4K0lFUExRbmFpV05BZ3pK?=
 =?utf-8?B?Wk5vNU41Ky9LbTliSXNOcklmeGYvcmtJeHhBZmY5Q1hhRWhOdElnN3ZhblR0?=
 =?utf-8?B?SWg2SE14YXZLSDl4R0VOSUhheXdFODBYanp5S0xvOUQyQzZ6cC9KbWxrTUFT?=
 =?utf-8?B?TDVIdUVNK0hDRUgvM1RYWWVvb1FZM3Vod3pvS1JLUm96OGpmUVRxbzByamgw?=
 =?utf-8?B?WUl0UTZJa0l6OHh2SUhqeGtqNytLbjJtS0oveWs5dW9vY0lPSHd2YUhheVJx?=
 =?utf-8?B?UVJXR291M0RnWkhPN2NWaG0zNEVMbjBnKzAwZk9pVk81MWw5b0U5cHkwQW9C?=
 =?utf-8?B?TUIrVFFpT1ozbnJEZlc2TWxKeFBucFhGOC90a01KQUdQT0JzOWIrY2xOcXAr?=
 =?utf-8?B?Nyt3eVl0R0wyeEN1RFNwOEpIS3B4Y0pjRGtTdTlGdDNmZm1rV0hsS0F0QlV1?=
 =?utf-8?B?RHdCQ0lHeUZuT1A1U2U0VTRHUCtSejdBdW1rcjBBSGtGdTBhVXVQM0poSmFs?=
 =?utf-8?B?aXlrd1hYMHZzMTYzaFdobDhjbFBobkJiNUxkQ0hmem44NThhTkk2R09Sd3hJ?=
 =?utf-8?B?dlAzM250YWhOajNlZ1M4RkJJUVJqWnA1NzY4bmx4bTEwSUxnWG0rdDJSMzdy?=
 =?utf-8?B?ZHl5LytwR1FmekZjWUhERkhWN0dhUEw4QmZiVCsxSEVPUldtSGJtV0MydVpQ?=
 =?utf-8?B?eC9GRWJ4WENlNmt6V0JhTWZ1akcrZjZXUlkvVWJ1WWdBN3pzYWdzNm92cTh3?=
 =?utf-8?B?aVNOOTVrTno1WnpLZ1dqbUVaSEhZQm8vQUNFNWNGWkJSSVBGYnMrc1UzVElR?=
 =?utf-8?B?Tkg3UzBpeWY1eG5OTGdZVkE5ZEtwYTJ6MnFIakovOXZKY3BkeVJXUkVPR3FC?=
 =?utf-8?B?VnZJYVZjYS9PcDJIOTZpVE5xbVJOUkxmU0xlWE51Z2NHWjJTWDJYekQwbUFT?=
 =?utf-8?Q?cz16eW8Gx6dDlvLmnG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf81e6-5187-4ea0-2345-08df4446c3e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:04:43.4181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cZFr0gq2KsDGeFhTuaYPKovIu/P0/+hpaZY8/OWHlhCp8nhxJxB9WG1XYHecJzg4I6U94tYU/CY9AuitdmsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9234
X-purgate-ID: tlsNG-33051d/1794877485-768FA4E9-76815B70/0/0
X-purgate-type: clean
X-purgate-size: 1392
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aW5pdF90ZWVfc2Vjb25kYXJ5KCkgd2FzIG1hcmtlZCBfX2luaXQgYW5kIGZyZWVkIGFmdGVyIGJv
b3QuIENhbGxpbmcgaXQNCmZyb20gdGhlIENQVSBob3RwbHVnL3Jlc3VtZSBwYXRoIHRoZW4gZXhl
Y3V0ZWQgZGlzY2FyZGVkIGNvZGUsIHdoaWNoDQpjb3VsZCBjcmFzaCBYZW4uIERyb3AgX19pbml0
IHNvIHRoZSBURUUgbWVkaWF0b3Igc2Vjb25kYXJ5IGluaXQgY2FuIHJ1bg0Kc2FmZWx5IG9uIGhv
dHBsdWdnZWQgYW5kIHJlc3VtZWQgQ1BVcy4NCg0KU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNo
IDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4NClJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9s
b2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQotLS0NCiB4ZW4vYXJjaC9hcm0vdGVlL3RlZS5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS90ZWUuYyBiL3hlbi9hcmNoL2FybS90ZWUvdGVl
LmMNCmluZGV4IDg1MDE0NDNjOGUuLjAwZTU2MWZjNzggMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9h
cm0vdGVlL3RlZS5jDQorKysgYi94ZW4vYXJjaC9hcm0vdGVlL3RlZS5jDQpAQCAtMTI4LDcgKzEy
OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHRlZV9pbml0KHZvaWQpDQogDQogcHJlc21wX2luaXRj
YWxsKHRlZV9pbml0KTsNCiANCi12b2lkIF9faW5pdCBpbml0X3RlZV9zZWNvbmRhcnkodm9pZCkN
Cit2b2lkIGluaXRfdGVlX3NlY29uZGFyeSh2b2lkKQ0KIHsNCiAgICAgaWYgKCBjdXJfbWVkaWF0
b3IgJiYgY3VyX21lZGlhdG9yLT5vcHMtPmluaXRfc2Vjb25kYXJ5ICkNCiAgICAgICAgIGN1cl9t
ZWRpYXRvci0+b3BzLT5pbml0X3NlY29uZGFyeSgpOw0KLS0gDQoyLjUzLjANCg==

