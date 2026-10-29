Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA8606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=iDwRUq7Z
Received: from list by lists.xenproject.org with outflank-mailman.1465020.1675906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMTo9-0007sG-76; Thu, 29 Oct 2026 17:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465020.1675906; Thu, 29 Oct 2026 17:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMTo9-0007s9-4B; Thu, 29 Oct 2026 17:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1465020;
 Thu, 29 Oct 2026 17:20:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMTo7-0007rv-M1
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:20:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMTo7-00AHJl-2x
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 18:20:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae38058-e002-0a2a0a5209dd-0a2a450b96ba-48
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:20:55 +0100
Received: from [40.93.201.49]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ae38073-b7e8-0a2a450b0019-285dc9318828-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:20:54 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM8PR03MB6216.namprd03.prod.outlook.com (2603:10b6:8:27::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.9; Thu, 29 Oct 2026 17:20:50 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 17:20:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQH+prNia2ZfWTcfEvdW8abTbWH4S10KHVNDOlqdckZhXE9vw0r894zqsdyKybW/6elaIK66yDm3cDCJY4H/rxz/cyi0Kn0IeCojBxroqnfjdN1fmV7cmJWqU9hcrWhfSfRd+3t8bFkNChZAKr0GJJasN9jCG+hiSAIy3z17MMfrsl6UlhGP7OZbA5QUQZgOXTpPYXuuv/p33xfZTb2+DX/GvYWllOT8I52xYI3hxjuFPbP+qzjjqmCF8bZJFNkx+yXVtEE73/MHFzBP6Tprk/fQucz8fpvkCa7HOxIBxE8iodT5SXuAlpIRe4Rpvg78LZuIA0U9Nb1AprCgTPXsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbT830pLYAscc7TFwa+jWCqOWo8Y9+8zwFKojsnqdxw=;
 b=pFZAznbmwBjQonEm7MyhWNiWPs0yVgiyvPJwXG5QoAKJdSOeF8EPkZSAqcTjM/mFUpXgQkYupIOE7kruguD8bqsNvXV6K9xS4TuMzCGS3kHzw+/U8R9ScwhVlGNMxEsCzFU75ITEGuROjjTLjGrWzftQRPZdAika/LTIeYBB8XXuhadw6EMowPTsgpHUc8xuGQGRGgLhS1jM1MNPAEGU6w2DUR+J8zD+AT7Z++X88guyGI1hTZANTQgWKl1z8FeMTHBumG6dyEmd5HRpIjIyKOFbm6FvoXtprGml3C6O7YN5PAAccdq8amcNDolwqw3UcQ6UWcRmWsXZEE7OHrgAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbT830pLYAscc7TFwa+jWCqOWo8Y9+8zwFKojsnqdxw=;
 b=iDwRUq7ZfUmACvuoX/LXVJ4d7ieVRVD1vXMKUfQYE4nIwvLnrf43PiLHRCJcFFUMUp/Ag4Bh/9ryV4GJZjg3ij+VlQBjyr0SFOZs90O9FY98XwADTrRTdweA95Jj+YUGpxaJDyP5bNRKrSfQlp72AKVir16uBihI0XhD9z+F3Ik=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: =?utf-8?B?Q2h1bmppZSBaaHUg77yI5pyx5pil5p2w77yJ?= <chunjie.zhu@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "roger@xenproject.org" <roger@xenproject.org>,
	"jason.andryuk@amd.com" <jason.andryuk@amd.com>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>
Subject: Re: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears
 V_INTR_MASKING
Thread-Topic: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears
 V_INTR_MASKING
Thread-Index: AQHdXVVTRd+tP+KIck2rlzcwmbytZrcU2N01
Date: Thu, 29 Oct 2026 17:20:50 +0000
Message-ID:
 <CH8PR03MB8274BC92D24DC22A0E41AA63F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
In-Reply-To: <20261016100058.268266-1-chunjie.zhu@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|DM8PR03MB6216:EE_
x-ms-office365-filtering-correlation-id: a045a87b-031c-40d2-a124-08df35e0fa85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|261028144727099003|261021121427099003|261009223027099003|261026140227099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 +FhspT2XKOPK9BqnHHprCOgFLAP0oU6XTDkgoJbo2eBggy7pacQLz81OIp0dLnGRojT43HcA4HJGIlYbsnYHZW+rEnj0CJ/OiaAYSCg6vjam+dpA0VVTAwNxZRGR/MDB6vuEhkNLTb+sOPG6tZ9Kl3OlB+96aMzH5U7LC4oy/2tL3eiFsFSiGTYHbALZJdT0roRNLjlaLyTgBBWhrWsOIoEcybzR/drHmrhQwcSdIBTC3hXEP1x6oq/yZIZpiB4fbxLrm/xApQ/HprR5mpShuXD+UpVnqsgTF6CtuvZBC1mHqEUIY9/8Ok1linzbiV/6sFfyihKsbvr0OR1iY63eOPVOjDxhNECvj1D3FzGXh1h+R+q+iNyd7blvYJZGcplRW+8dwR2UnOjVNaAs+kDAP8DNcPj8h8ogd4SRd0v6bQNYFs/3thaYRsO/KFB4h3FIzEdOvqa3MLNxLN9aIt/BRI+2jhvxpV512fGpbwG84DiVzFcYBJsKZAX6yyvgNYthPHQf7LQYsxhbyaBBOHiBmcnGK898sgA/weHsPSBcMES0opgEsbWAbHB9rNg2PWzY54pr5oBzsDev/HMTxW/Px0f74FDZHYfiEC/KHpEDfiW+3xwLbpJB4aXLr890d22t/yKqGjTHWqsRFeO4zZrXLna/cnFB9cBEn/zQLHUQdj1y64VaAdT0W6LgY7bXtkBclKa/324oCjJi4YUg9aL1eQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261028144727099003)(261021121427099003)(261009223027099003)(261026140227099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVJEdVMvTXE3cWJsekxsaDk5MjdyVkJ5ZFhzU2VYTUp6RUwzbmJkOXBGMEZx?=
 =?utf-8?B?K3ZneER1MkF5SXpBYWdTY25VY05ia2ZnSlV0UHNBTGQ2ODlOYm8rMnVTaUdz?=
 =?utf-8?B?QkJjSThRSlZ0cHFlSzdmTUx2KzJGOUkzV2hNZ2dVVCs2Sy8rY2FCUVp0dy9D?=
 =?utf-8?B?Nk1ORFlsT0EyOHpySzRZdStJMGxJRC8vdDROYy9ZeUdoU0E4d3dTMURxS2t4?=
 =?utf-8?B?WkozeUdZVEZtbUxHNEVGK2dDcVJ2WWdQS0w3TmdXRW9JLy9rRDFGQjI1RWNY?=
 =?utf-8?B?VHhZVFdkblJBbjZLUjdBWUsvWVE2bXNWWmRRdU9yK0gvVit3WWh6UW51c0VW?=
 =?utf-8?B?TkxmamFCbm5CNVQvdjdVZEEvTWxyaTZId21mdFJ0OG0wUk05b0lISklCQjE2?=
 =?utf-8?B?Q0kzMFJmQVR1WHY1b1BWalVMd09tUUZCVjlRckZjOFd4RkdVTGRVYURZMm5z?=
 =?utf-8?B?UlVIOW5naGZ0d0Eyb1ZiaVpWRGw1RUgxdk5DZGU0eisrVjFST1BRQld0VGJz?=
 =?utf-8?B?QU9oY2FWYnlxRENUUlo3dkM0dWZYellkUEdRZE03MzhjdTdybkRuZ09KOVdB?=
 =?utf-8?B?VnZmR2p1c1JLMHFma1ZUL3pRNVZvYWdxYnVrQXBkY0R6TlFFelVvVUwwYmV4?=
 =?utf-8?B?eENienJhUC9vT1YrTjBrbUxpUGg0Q1Z0UFlZOUYvdUF4eU82cTlDa3R3emZn?=
 =?utf-8?B?YUpRVTYwSlY5b1pheVlCYmxKMzEyQU42Y3daRUYwTnZMWmtPZ1lUVE8wVUx5?=
 =?utf-8?B?MmpyUU80c3ZhUDVoY3p4UytYYWRqN0YvUXlCN2NBbERVMWRmSFoybzBNc3lK?=
 =?utf-8?B?VUExMGdBQmdDcjRjaUxWV3h3cFRZQmxZdzJhaTJlc1J1ZmFaaWU0UmdvQkhW?=
 =?utf-8?B?elJJR1hCd2FJOU5aNTIveXFNdUxVWU5kVzFDNDExejRVdW80OEd5bFBiY1c3?=
 =?utf-8?B?Nlh1RW5QZUYyd01oK1ltTElGdC9MZ2o4cHVSbkt1Q1FlY3JxZzdjUFpmVDJ1?=
 =?utf-8?B?Sko0L04vNUU4ZXk2Mkx0UjRCYkgvWm9EWnhrWjFVMUkxbUJuNkFXUTNKUWJt?=
 =?utf-8?B?RElhaHgreDBxMkVObWRDQ3U0SlVHRWc0VmxWRVpmcFkrR0NiZ1NCdUN1OFNR?=
 =?utf-8?B?RGVtZ0pjTU5CY0tUU3dKWlJRc2JJQ3hGSHlZLzdiRWEzM3VWQ21NdXJ5aWh6?=
 =?utf-8?B?M2RiZnovSU8rK3o0OFB4VDdqdjVJS0xZM0tuaVM3MUM5ckh4MkF6b20vWnQy?=
 =?utf-8?B?eS9VVjl3UmpVWE5BVkFvL1N3Y0ZGNzJrTHE3VzdjSzNxT3lBMUVGd254UVFI?=
 =?utf-8?B?UksyV0lFemNGWG9uK3ZHZGIrMC9VTEZ2ZEV3K2VoamRrV3ZpUkw0R0pOaWRx?=
 =?utf-8?B?WmJsNTVtQ0dLVFJ3aUQrVVBtRFA5SEJUTytXQkNUcG1rb0w5Q0xVZHBBVnEz?=
 =?utf-8?B?amtZSWNlVUVKNmMvTndBWFpmTzdjVWhjTXBISHF3TW15TXVpMGtjNGhIZThj?=
 =?utf-8?B?L2dnUlhlQ1NNbURLdDVwdFpvd3FqRENGUTVpZ01IV21IZzExUU9sbFYreWoy?=
 =?utf-8?B?ZnBBNjBpR1cxVlBqYjQyTUcrMmN3WkR4SVdJTjQ3QzhONjZ5UXJsMjVvQS9j?=
 =?utf-8?B?YmdMTS9TNGgxMHI2WGRNbGRsZkhFU3FOSkRaRkZJeHQ1djVTV01kcmJRa0w0?=
 =?utf-8?B?T2dacnZHVlo4elhJWGNzc3A2cEdnN3poSjIyWlY5YzlvUGw1L2hvdmtZaWVS?=
 =?utf-8?B?Y2hJMmVFQmNTaU9OK292cnFrMEIzNHRDTXgyb0tCYkhhT2g4cWxCN0lpSTBZ?=
 =?utf-8?B?RW9jNXJLQ3VuVHJRWXlWeExLL1Rmak90WnBCRjc1ZEN6MjluTUk2UExVaTRa?=
 =?utf-8?B?a293bGNIQ1RxMXFzaW0yNG9WamVhb0hsSC81QlpHeEpLN1RFNTl0Y05xK1dr?=
 =?utf-8?B?a2RMRXc4cHMxV3ZERk9ERFVabkVnTEFyakQ2R1BuN0dtYWZxYjZZcHhIUENM?=
 =?utf-8?B?TVlUMENlMCtxSmhBR2F5Y0REQmNLbTZHR1hhNmUvaWdCaUxlRllranFCT2ky?=
 =?utf-8?B?ZUVOVEQzbUtNUVlDcnBFQ2VEY2t1K3RQMnJMYVdSS1JCRU1RUkltWGovaTNU?=
 =?utf-8?B?d0dGc3I2eVdiOUxReE84MG1obW0yWTFzUzNxanQzcjRCWnRMdmVMa0EwcU5S?=
 =?utf-8?B?blREcnNGTldoeWZsMSsrWXhtWk5UU3lPQU5qeHNTOEJ2WURIRHJzMTJPUHhN?=
 =?utf-8?B?VlJKT1JqVVlxMmJ5OElOeUptOCt1L2svdkhLK1hqN0JPa2JMdkRZamJCTHVt?=
 =?utf-8?B?M3RqMkk3a3RQSnlnd2pXRmdVYjRzY3FuZVd5MUpvMHpVT05EcUZsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a045a87b-031c-40d2-a124-08df35e0fa85
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 17:20:50.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9aSEXPfub1FvgDK2veLmrLaMFRO5TCb7CbCGYqo7nlnYxuLlVib+hQQe6zbjQgIIY5TAoiSeIlx6GumFV6PW9qG4Y/uhX8fOsgU0yM5hxDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-purgate-ID: tlsNG-42698a/1793294454-1B4D39EA-5D3638EC/10/78276251493
X-purgate-type: spam
X-purgate-size: 4780
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3Jn
PiBvbiBiZWhhbGYgb2YgY2h1bmppZS56aHVAY2l0cml4LmNvbSA8Y2h1bmppZS56aHVAY2l0cml4
LmNvbT4KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTYsIDIwMjYgMTE6MDAKPiBUbzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+
Cj4gQ2M6IGpiZXVsaWNoQHN1c2UuY29tIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyByb2dlckB4ZW5wcm9qZWN0Lm9yZyA8cm9n
ZXJAeGVucHJvamVjdC5vcmc+OyBqYXNvbi5hbmRyeXVrQGFtZC5jb20gPGphc29uLmFuZHJ5dWtA
YW1kLmNvbT47IHRlZGR5LmFzdGllQHZhdGVzLnRlY2ggPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+
OyBDaHVuamllIFpodSDvvIjmnLHmmKXmnbDvvIkgPGNodW5qaWUuemh1QGNpdHJpeC5jb20+Cj4g
U3ViamVjdDogW1BBVENIIHYxXSB4ODYvbmVzdGVkc3ZtOiBob25vdXIgTDIncyBFRkxBR1MuSUYg
d2hlbiBMMSBjbGVhcnMgVl9JTlRSX01BU0tJTkcKPgo+Cj4gRnJvbTogQ2h1bmppZSBaaHUgPGNo
dW5qaWUuemh1QGNpdHJpeC5jb20+Cj4KPiBMMCBhbHdheXMgcnVucyBMMiB3aXRoIFZfSU5UUl9N
QVNLSU5HIHNldCwgc28gYSBwaHlzaWNhbCBpbnRlcnJ1cHQgZXhpdHMgdG8KPiBMMCByZWdhcmRs
ZXNzIG9mIEwyJ3MgRUZMQUdTLklGLsKgIG5zdm1faW50cl9ibG9ja2VkKCkgb25seSBibG9ja3Mg
d2hlbiBMMQo+IHJlcXVlc3RlZCBWX0lOVFJfTUFTS0lORz0xIGFuZCBMMSdzIElGIHdhcyBjbGVh
ci7CoCBXaXRoIFZfSU5UUl9NQVNLSU5HPTAKPiBhbmQgTDIncyBJRiBjbGVhciwgbmVzdGVkc3Zt
X3ZjcHVfaW50ZXJydXB0KCkgd291bGQgc3RpbGwgaW5qZWN0Cj4gVk1FWElUKElOVFIpIGludG8g
TDEuCj4KPiBQZXIgdGhlIEFQTSAodm9sLjIgcmV2IDMuNDQgIlBoeXNpY2FsIEludGVycnVwdCBN
YXNraW5nIGluIEVGTEFHUyIpLCB3aXRoCj4gVl9JTlRSX01BU0tJTkc9MCBMMidzIElGIG1hc2tz
IHBoeXNpY2FsIGludGVycnVwdHMsIGFuZCBhIG1hc2tlZCBpbnRlcnJ1cHQKPiBtdXN0IHN0YXkg
cGVuZGluZy7CoCBSZXR1cm4gTlNWTV9JTlRSX01BU0tFRCBmb3IgZXh0ZXJuYWwgaW50ZXJydXB0
cyBpbgo+IHRoYXQgY2FzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENodW5qaWUgWmh1IDxjaHVuamll
LnpodUBjaXRyaXguY29tPgo+IC0tLQo+IMKgeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3Zt
LmMgfCAxMSArKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jCj4gaW5kZXggZmFhY2ZlMDA3ODMyLi5hNDE5YjQ3
ZWI1ZjYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYwo+IEBAIC0xNTE0LDYgKzE1MTQs
MTcgQEAgbmVzdGVkc3ZtX3ZjcHVfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1
Y3QgaHZtX2ludGFjayBpbnRhY2spCj4gwqDCoMKgwqAgY2FzZSBodm1faW50c3JjX3BpYzoKPiDC
oMKgwqDCoCBjYXNlIGh2bV9pbnRzcmNfbGFwaWM6Cj4gwqDCoMKgwqAgY2FzZSBodm1faW50c3Jj
X3ZlY3RvcjoKPiArwqDCoMKgwqDCoMKgwqAgLyoKPiArwqDCoMKgwqDCoMKgwqDCoCAqIFdpdGhv
dXQgVl9JTlRSX01BU0tJTkcsIEwyJ3MgRUZMQUdTLklGIG1hc2tzIHBoeXNpY2FsIGludGVycnVw
dHMKPiArwqDCoMKgwqDCoMKgwqDCoCAqIChBUE0gdm9sLjIgcmV2IDMuNDQgIlBoeXNpY2FsIElu
dGVycnVwdCBNYXNraW5nIGluIEVGTEFHUyIpLsKgIEwwCj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBh
bHdheXMgcnVucyBMMiB3aXRoIFZfSU5UUl9NQVNLSU5HIHNldCwgc28gdGhlIGludGVycnVwdCB3
b3VsZAo+ICvCoMKgwqDCoMKgwqDCoMKgICogb3RoZXJ3aXNlIGV4aXQgdG8gTDAgYW5kIGJlIGZv
cndhcmRlZCB0byBMMSBldmVuIHdpdGggTDIncyBJRgo+ICvCoMKgwqDCoMKgwqDCoMKgICogY2xl
YXIuwqAgTGVhdmUgaXQgcGVuZGluZyBpbnN0ZWFkLgo+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4g
K8KgwqDCoMKgwqDCoMKgIGlmICggIXZjcHVfbmVzdGVkc3ZtKHYpLm5zX2hvc3RmbGFncy5maWVs
ZHMudmludHJtYXNrICYmCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhKGd1ZXN0X2NwdV91
c2VyX3JlZ3MoKS0+ZWZsYWdzICYgWDg2X0VGTEFHU19JRikgKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBOU1ZNX0lOVFJfTUFTS0VEOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgIGV4
aXRjb2RlID0gVk1FWElUX0lOVFI7Cj4gwqDCoMKgwqDCoMKgwqDCoCBleGl0aW5mbzIgPSBpbnRh
Y2sudmVjdG9yOwo+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gLS0KPiAyLjM0LjEKPgoKV291
bGQgaXQgbm90IG1ha2Ugc2Vuc2UgdG8gY2hlY2sgdGhpcyBpbiBuc3ZtX2ludHJfYmxvY2tlZCgp
IGluc3RlYWQ/ClRoZXJlIGlzIGFscmVhZHkgYSBzaW1pbGFyIChpbnZlcnNlKSBjaGVjayB0aGVy
ZSBzbyBleHRlbmRpbmcgdGhhdCBzZWVtcwptb3JlIGxvZ2ljYWwgdG8gbWUuCgpFLmcuIHNvbWV0
aGluZyBsaWtlIHRoaXMgKHVudGVzdGVkKToKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3N2bS9uZXN0ZWRzdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jCmluZGV4
IGIxOTJiZTBkNTZiMS4uOGJkZWQ4YjlhOWMyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3N2bS9uZXN0ZWRzdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYwpA
QCAtMTIxMyw4ICsxMjEzLDkgQEAgZW51bSBodm1faW50YmxrIGNmX2NoZWNrIG5zdm1faW50cl9i
bG9ja2VkKHN0cnVjdCB2Y3B1ICp2KQogICAgIHsKICAgICAgICAgc3RydWN0IHZtY2Jfc3RydWN0
ICpuMnZtY2IgPSBudi0+bnZfbjJ2bWN4OwoKLSAgICAgICAgaWYgKCBzdm0tPm5zX2hvc3RmbGFn
cy5maWVsZHMudmludHJtYXNrICYmCi0gICAgICAgICAgICAgIXN2bS0+bnNfaG9zdGZsYWdzLmZp
ZWxkcy5yZmxhZ3NpZiApCisgICAgICAgIGlmICggc3ZtLT5uc19ob3N0ZmxhZ3MuZmllbGRzLnZp
bnRybWFzayA/CisgICAgICAgICAgICAgIXN2bS0+bnNfaG9zdGZsYWdzLmZpZWxkcy5yZmxhZ3Np
ZiA6CisgICAgICAgICAgICAgIShndWVzdF9jcHVfdXNlcl9yZWdzKCktPmVmbGFncyAmIFg4Nl9F
RkxBR1NfSUYpICkKICAgICAgICAgICAgIHJldHVybiBodm1faW50YmxrX3JmbGFnc19pZTsKCiAg
ICAgICAgIC8qIHdoZW4gbDEgZ3Vlc3QgcGFzc2VzIGl0cyBkZXZpY2VzIHRocm91Z2ggdG8gdGhl
IGwyIGd1ZXN0CgpSb3Nz

