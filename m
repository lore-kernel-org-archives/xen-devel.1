Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E74C4450A
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 00:36:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364570.1615639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkWYE-0005hL-3v; Fri, 17 Jul 2026 00:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364570.1615639; Fri, 17 Jul 2026 00:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkWYD-0005hD-V5; Fri, 17 Jul 2026 00:35:37 +0000
Received: by outflank-mailman (input) for mailman id 1364570;
 Fri, 17 Jul 2026 00:35:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wkWYB-0005h7-Eu
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 00:35:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkWY9-000bdc-Um
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 02:35:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a597897-e002-0a2a0a5209dd-0a2a4502e11a-44
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 02:35:33 +0200
Received: from [52.101.125.130]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5978d2-6ca4-0a2a45020019-34657d823a63-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 02:35:33 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB7155.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:321::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 00:35:28 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 00:35:28 +0000
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
 b=q0hk9BrjaAkaQC0rgoFxaGYJEclKJb7LUIUI2Y/FksRFEGdvaNLAa9ieUMXvSqxNY2my3cF2xggZjAKeypKXL5rlqZhl9fR5RguqzWx6eu9nnX4HMDla90975B/KXWnIzo2lRaDQCaY2Pgqw9aOmz+Y8ajn7o6fN3o+hfAGQo/Y0XxbJogwp/XqakpliICsy+5kzKtXvxR2N6yRPl06oJfefzPvMVFBMSvs6FegDkV7IBB+aB1EKKIA7flCn2B7aL8wPwv5BgWwTthuCbBs0hriGN6H8yG7XRBfUQS1tib63WEi6jaJCdz2aZgzuoNvjEgBJZPhmVUZKhpXH03RgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoWRHa4xF/l4LzpvetZuoD3h/B4XloEuOzvYZ6X+OWw=;
 b=nnYlIP1ctuYKwUwnaCIH6F565elZuCAiP6LOL82UI0q9IYTE7SLIsm/h6ufZ3OlwDntkfbpCUa53+jADh4iZjVfr/ZFJyX1A2vjdwI6Y3Q+8LcOwZ5dNl7FSXsjL6d3tNt7lPBsGgcwHep9We6ewFTwPaJ7kQYKP8bTBWUhdN+yewE41STK4jdFzYT6Xg8+naLTSvjGrEvIJsw5lTuRlwC7T26gVW8cAxDTRYfp6W7gAdaP+X0zuasSvQLcxQRZeLlWUjMvs2ngx1G6Rd4BGke1BQOzUITQXUvqNYpS+sxuhKYtLWpM+xuCnZ0W2P7GHkGvs7gb2eYHZOQLtmuBMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoWRHa4xF/l4LzpvetZuoD3h/B4XloEuOzvYZ6X+OWw=;
 b=ECFi2zEqt+H+Jb6BXTmNh6i8N91uX8sDVXtQZKTd88oPGgJ9MBXkargnKCck4wsBggEOYUuMTIUJyezsxGGsnTqmnTVYyMoo/KwyoddRf0ITd888xTldttVBV6IjeVTuZbKh6np3qSImxHBZ/dyuPz50qzSC+cD9dNklJBbCAyw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdE336EabuJxSEHUSo4bExE1f467ZthrLggAAB8dCAAJJWgIACxhTw
Date: Fri, 17 Jul 2026 00:35:28 +0000
Message-ID:
 <OS9P286MB7222B943BCE5602656CFF74882C62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-6-taka@valinux.co.jp>
 <OS9P286MB7222D458C3248E908695F2DB82F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <OS9P286MB72222CC8A5C8B0E329F8A9B082F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <199ad904-79c7-4f7c-b856-44ad68fed49c@suse.com>
In-Reply-To: <199ad904-79c7-4f7c-b856-44ad68fed49c@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB7155:EE_
x-ms-office365-filtering-correlation-id: 474c39dd-d9ed-4898-5b32-08dee39b4cdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|10067099003|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ut6ZXNe/O0T9s1gDRPuLIgf/8EzWLHntqyZjDytGJkDOiYDvX0YOgPa81CKi/Fw0j4XRXMR+4q5yPcCwHMje7BI5f4mK8xSSAsunUzeUXE2y3Sq9EqH9Nx35NhWuPIC2saXJDbjIsLMCFNXcLYVgxwDxpgcomsGNBgvcxerDctwQJ5B0fBuXGjTd7JQdub7XbKo5/WUUjePIL7NtcFIO/zOvNNsNXWjB59Fy0D/BHkDd7d8TURrqUtECLOaOhlizykwtqHSgEKmI/41myvj45wH8Pe1jmIWqZ6Z7S/WmSfSf6+IY6ON8xIPSvz22kP9BA9x6CV1v8VnhWDXMc0mJpDFGnamzcxrijSBq86Q00JUgqXD1RMAZ2H/Vgsmu8DZc7JKMywszTKtdLhqo/VoeNkrt8xRfLGJazPMEyPgWufYf/a6vv+pYvBk7o9CsuYu8raILxKJvAX9yL6g3OKCnih65djavxqSDUy+KnYo80B2dDyY7Uoro1fBxdUyRHBykb3eMC0zDGjeGttXGw5RlVST7tcn9fhqh5/vl7ItiCy6ucUmn4KPbY/wp3YbfCnBKIGKsXPNFOI+ka1f72W4yChSUgiwDQUzMTBCVAQLOLesKIrUFeoiOM6Zo/k8V2j6uLS+JQH0qsSXRwQ53Gsrqvbvx2Ev+B/r47LtrXpHoLUn1lUBL2M72P6a0rOhBABCqZMzDAX09+QSBTLxzMNVDeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3ZGblIyZEYyMit0UEFlRTQ4YzArWjhFYllXS0d0N3A0L1dpaDFqZDBZRE9m?=
 =?utf-8?B?L1p0ZXVJek1Iem9RbUVxZFlsZW91Q0Vma2l1MFBCTnlxYUs2YjRIa0pYdFpo?=
 =?utf-8?B?VFpMblBOdEdqUlBJZ1F4N3ZMQWNwck9FcUpxZVNPMDdneFR6NTlkTDlBbUtS?=
 =?utf-8?B?UTF4ZFd5UVk5MTFKRW9jKzEyVEVlN3BZbWF6cC85SEhUN2Zzb21uTlpPSFFp?=
 =?utf-8?B?a2tLdFBOU3J1VXJJQ1U4cFkvZ2lHbm90OGVzZ1ZEdFg1T3d3Z2x3V3V0QWN3?=
 =?utf-8?B?Z2ZrSmNvT3B3NnB2OTdyZkM0bkZJcS8vbkRON3VXUVJyWUlSLzcrYTNaOEkr?=
 =?utf-8?B?SUpETlhMU0c2dWdjWmwydk9iSEtCYm8xWitWd3dZN0xHdzlheHNrQlhTU1JN?=
 =?utf-8?B?ZzExT2pZSE5teDR0eEpZbHRNZllTS3A3WG9tQU1LOGF0VVJScHRKN1RDSTh6?=
 =?utf-8?B?LzdyZ3BlTWtVNzZGZmhFYlNUTW05TStLZktIZm1kT212YkJGUFQvOUhxeUFo?=
 =?utf-8?B?MC91a3A4V215SHJmUGtETjRveFBGZk9KcnVITTIxN0t0OExGa0JEVC9vSzhu?=
 =?utf-8?B?aFNId3pxQmREa1lyNDRyMU11eU5LQ0ZUUTZ3TkZDckNPbnFPQ2RsSDJCQkN0?=
 =?utf-8?B?d3JqeFdWMkp1MEJtR0ZiRHYxdmwrakJ6RWtzWlFuUlRid0drYW95RTZGdWlC?=
 =?utf-8?B?VFVmTEpKMi9yWU5sUHZZQ2JBSlNmMW43RXVCRHpoRHF1RzNHeXh6UDdaUUZj?=
 =?utf-8?B?aDM2TG5xVWlTR1o5amdCZTEwV2g0V1Y5ckNiVCs1Q29pZUtIT2pDRFllSkJ2?=
 =?utf-8?B?Y2lvWkJzazFRdlhjdW8vWHRNTXhSajZHVVNoeHFicVR2dVVLdjI4NGE5RlpO?=
 =?utf-8?B?eUp4L3Bjamx0aWR0WXBRbkNYdlJ1VFUxRCsvU2t1SUJsbXRVd2x6V1pCSEs0?=
 =?utf-8?B?NVRONzdEaUpPT053dlJ2dVN0ZXZKcDdvUGdLS1EyVmh1M1hBejc3SFhqM09L?=
 =?utf-8?B?NnJCVVNNbDJ3eFBEcWI1UjZERm9zd0w4NkladnJnQkZLeUNZWjdsU2Iyc3VS?=
 =?utf-8?B?dy92SzcrL2o0T1k2R3VPcnBPNzdIQnJ1RklCUmJVNzlFNEhpQUt5NVRVelpO?=
 =?utf-8?B?Q1FiU0Y2dDVlMTBjbHY5dit4OER3SzFWVG1Rd2xkaTI2bXpoQURlTkRGZXds?=
 =?utf-8?B?d00waXZ3engwS29XUTZ0Qnp1YTVjS3g0cWZBV2Q0eVhTSHFSVTJLaEhIQSs2?=
 =?utf-8?B?SndxaTBhOHFBbFEwNm4rdTYvK2V0TkhkZnE1ZVhxUXBrMlp6VGtVVGU5Y2Jo?=
 =?utf-8?B?djFnY1JLb09PaGNNcmgra3hTakluWmxGTmpWRVZuQkFnekx5RjM1MmJ6NFBo?=
 =?utf-8?B?cndkcmtIaU1hYWlNbWFlNk13azRmV0FhcUhDMVgzYUdLK1BaOUdpY1Vybk1Z?=
 =?utf-8?B?SE04SkU0SUIxY2R2QTV2c1A1bGJBL0hvcno0M3RGMXhxQ041eGlKaEhiSUpQ?=
 =?utf-8?B?cjdsQWVSUUM4R2s0a3V5UW1weUt5dHY0emN2YlFLV2dhOHJQN1lyaVhJeUIw?=
 =?utf-8?B?d0wzSFd1aTRrQ0k3cFEzMUdyQ3RCVFVYeWdjcG5LTDBPNjZCU2xRd3ZnaFRn?=
 =?utf-8?B?aE16N0JxYmdUcGxoamdSalhHL1dXZFZwTTJTY3BPdlgzVVVtUVhXaGJUQ2VL?=
 =?utf-8?B?WUxyNlVIeGJLOUNrcnpTTERZT3JQQWV4YndRN1JOQ1g0Vk9CYVIzMjFWblR4?=
 =?utf-8?B?b2lLKzFBZVcvUE1ZZjZZQkdDZFYvektqSEcyblB5ODdEZnpibEpzVW1SbTBY?=
 =?utf-8?B?djBQUXJ6alBqa2lkTkJYZXRvRGVndjZNZmRWdjZ3Vy9mZU9iRHpBekdyVVNh?=
 =?utf-8?B?ekpXcytYZkJZYUkwb05rUVRxeWNmKzMvWHJjeHNkb1ZsN1dYZ1N1U0NiQUNY?=
 =?utf-8?B?ZDZXWHAxT25xUXk0aVk4SGo1b0x1UkFqb2xwWjBhQzJyNjhnUThNYW0yajVj?=
 =?utf-8?B?Unl0SFFMRGtXWFI0RUhPZGM2SzhZamFjUlVVaVE3NGl5Y1FBK1k5U1Q4SENV?=
 =?utf-8?B?bkFENEEyNFJ3bWFUTmM4dkZQYmhUQzFOM0NGMFBaRnZXa3E3dGJBTW9VOWt4?=
 =?utf-8?B?NktOMTlqT0s2N01rZ0MwV3JVYnlPbSs3MXhkYlBselBGc0J5OHM2WVNDQ1NU?=
 =?utf-8?B?U2F4a0tBWXNFcy8wcHUwNzh6VTZUeWVzTjNOMWprV1U0WVJVZkFrNDU5Z3Q2?=
 =?utf-8?B?ei9OUXJMTDJHbnBpSTdVUFQ4S2wrVE5sbVJQMzRTdDJDeXpkdjlCM1U0bjA4?=
 =?utf-8?Q?CzA/6OZD2l8hPewXIw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 474c39dd-d9ed-4898-5b32-08dee39b4cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 00:35:28.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvdZJdk+aupo4Q92TzaQ+eUeirn8Z+RGzvXKnsZA1c9kBxk1DpRSpyWdoaaBivIV3TxdViPbD0SQDs7n/xe1Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB7155
X-purgate-ID: tlsNG-720697/1784248533-F16AF2AC-36050C72/0/0
X-purgate-type: clean
X-purgate-size: 1224

SGVsbG8sDQoNCj4gPj4+IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvdG9wb2xvZ3kuYw0KPiA+Pj4g
KysrIGIveGVuL2RyaXZlcnMvYWNwaS90b3BvbG9neS5jDQo+ID4+DQo+ID4+DQo+ID4+PiAgaW50
IF9faW5pdCBhY3BpX2luaXRfY3B1X3RvcG9sb2d5KHZvaWQpDQo+ID4+PiAgew0KPiA+Pj4gKyAg
ICBhY3BpX3N0YXR1cyBzdGF0dXM7DQo+ID4+PiArICAgIHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRl
ciAqdGFibGVfaGVhZGVyOw0KPiA+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgYWNwaV90YWJsZV9wcHR0
ICpwcHR0Ow0KPiA+Pj4gKyAgICB1bnNpZ25lZCBpbnQgbnVtX3NvY2tldHMgPSAwOw0KPiA+Pj4g
KyAgICB1bnNpZ25lZCBpbnQgbnVtX2NsdXN0ZXJzID0gMDsNCj4gPj4+ICsgICAgdW5zaWduZWQg
aW50IG51bV9jb3JlcyA9IDA7DQo+ID4+PiArICAgIHVuc2lnbmVkIGludCAqc29ja2V0X21hcCA9
IHhtYWxsb2NfYXJyYXkodW5zaWduZWQgaW50LA0KPiBucl9jcHVfaWRzKTsNCj4gPj4+ICsgICAg
dW5zaWduZWQgaW50ICpjbHVzdGVyX21hcCA9IHhtYWxsb2NfYXJyYXkodW5zaWduZWQgaW50LA0K
PiBucl9jcHVfaWRzKTsNCj4gPj4+ICsgICAgdW5zaWduZWQgaW50ICpjb3JlX21hcCA9IHhtYWxs
b2NfYXJyYXkodW5zaWduZWQgaW50LA0KPiBucl9jcHVfaWRzKTsNCj4gPj4NCj4gPj4gVGhlc2Ug
aGF2ZSB0byBiZSB4em1hbGxvY19hcnJheSgpLg0KPiA+DQo+ID4geHphbGxvY19hcnJheSgpDQo+
IA0KPiB4dnphbGxvY19hcnJheSgpLiBBbmQgdGhlIG90aGVycyB4dm1hbGxvY19hcnJheSgpLiBT
ZWUgdGhlIHRvcCBvZg0KPiB4ZW4veHZtYWxsb2MuaC4NCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJ
IHdpbGwgZml4IGl0Lg0KIA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

