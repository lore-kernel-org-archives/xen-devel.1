Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB75FCA5FF5
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 20:06:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441150.1658750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDowJ-0003GK-N2; Mon, 05 Oct 2026 20:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441150.1658750; Mon, 05 Oct 2026 20:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDowJ-0003GD-KQ; Mon, 05 Oct 2026 20:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1441150;
 Mon, 05 Oct 2026 20:05:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDowI-0003G7-Ej
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 20:05:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDowH-009sB9-Nb
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 22:05:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac402f8-bab6-0a2a0a5309dd-0a2a4503d116-30
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:05:33 +0200
Received: from [52.101.69.119]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac4030d-fae8-0a2a45030019-34654577a9d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:05:33 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by PAVPR03MB9140.eurprd03.prod.outlook.com
 (2603:10a6:102:32f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 5 Oct
 2026 20:05:31 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 20:05:31 +0000
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
 b=sTC4PuHp7OjbWfSoigK/8YHbIwUQ6XULiGOiL0U9fAJRhhOSkAJ2UaNz/acajxIiLxRglzoRPwo3Wn/ZS3QjwPIGbR9M/1QoS07N5ePQK7ZgWteBoLtLoNyLXISt8t8neIuASRdWqC/CJnhpopZ801TPt9/Okibn1t3uJCtTgsi60hhpZ1EHbHXkufPeA5FW5siqiupl/7sKvjPzrLrdtbtaLH6UyqrWWMcJ0SLfrYTCW4hNs/9MDEB83iA0kvlP2Xct5XK/q15Hd4AXqf6KjWb/HzwEW8nMksSfo8FMhIxywsS4f5Lw88aoFNjDzn4sHTb7tSaJOG/0h/jE0tW0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNfr8oWxnmynHo8sSb62Z4SD4mE4QOwGJ0QSVd6ndr8=;
 b=gN0zceRL0brh0WmWIe2X0PSY4h2gZaO8kVHTYlM33g/z7Lpxqmd/p0hrtZo6rTKaQFimphcVIdutEsGTlCtmUL9cAAX+51n2EYG+vUMK0BTFfIbrv7Wpb3IxFE3Dhy7z0+uiGSnsLat4qH+OUxLl/XSqw+mBEFLA7UORNm1dSkhVzrql0rPjiNwJIWr2G3FQ17yFOtdxImIUdfHH2n6NgZrYZOc2MP+qtDPwTjFwTRpC1aEkOcHuSA78RtGkAMTXtGQl8Iwfbtp/4/LXkd+SEj77sbOBoCScHSbzl0/DnD7dvUyBoS7gI8MpaD+rhGXSohkYF3BKGhI1MB2bK4DWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNfr8oWxnmynHo8sSb62Z4SD4mE4QOwGJ0QSVd6ndr8=;
 b=J41ztSI45dtfvdscp4n4XkH1lfWwKjk8iFCodT56dEVXtYGH7wbIkPEQpEkgSXG08heeD/UBYI4ipnTeYesH+ZWKR9cEizDc2ygqliZFuIcWsHj1aelbSiJ4Nk0ZPPCosvSNLtSAlUiwVaiwwx2CHqmVljd4byCGj7+R9Tw/5cTnai0mVOp9ETtJQLtK65tevGcEWCj3r2S45O39/G0ZBsEx3FX/CIxMiWK5TkrTM1K65TloHNKzD1v6gya2pZhOF3XSmNmNle94phBHnSOJQxjONcx3LEQdDrib48hcClhy3Shgiz9M00v3uf965qD4JEUuVLJZodMoGOZl2C8vag==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/4] x86/kexec: address Misra rule 11.1 violation in
 machine_kexec_load()
Thread-Topic: [PATCH 4/4] x86/kexec: address Misra rule 11.1 violation in
 machine_kexec_load()
Thread-Index: AQHdO5mkZaB4SEWRjUSJMpU0C1g6K7bvkooA
Date: Mon, 5 Oct 2026 20:05:31 +0000
Message-ID: <6e8c4670-b614-40d6-9948-75abbba621e8@epam.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
In-Reply-To: <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|PAVPR03MB9140:EE_
x-ms-office365-filtering-correlation-id: ee4c987f-8b8e-4a73-0648-08df231c023c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|42112799006|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 UQ7MdWW/hmFxf1ZwBuwuVKp48idRV/EOe/lNLhtaG3l4bqLRYrR0t+kF7Tyc/jNr5GbR2cb1INlWh/Dr+sqmmsQdVrGuPFgnsUAPYV2FdIM116WElRUi+ahetRBK2Sjd0BdQsy0/gtbkr7KgCapiIuAek5vHCpHmmDKuA6Rp8jLHIJIGuNfz92faxQCJDG9B+j3ZKat3hUBGFbdhrTabGs9JcaRcwwekJ1VTN82suGCJxmks2w/uSKyXd72BocmEjvIy5e36unbNgZMZZdPKr6dD5UadFksdrbelkItNkcBwimnu1G9okK2n1IXHyDjAecnyyrON8ZnRbEeUiRVeJ9dy9iw6nlDWZjU75DCQi7uWMYR7YjmjNdeDj9cJu8w7TQqr7YqQHIe/g8K1RalcwtIoBIXtCOag4rIHraqkRu5odVc1CSN/V4pmhvjQV8pHMP3bW7fwtRFq9VKjUG8puSeVs2tsTVTxIfLWgW4D10x9EQvsNo4vZIfdSNwURtXKCmE9DSJ284H0bGIkZhz6+clq39tzv+vRsb7fuHBZl8nrCHV3wgOAyfEzS/MdxnO2NKSca0v44BkjjaZvZk5v1XssfOG0ecaEzMM8UyN2umx3V/aqjlbuVYv38FS7Y5Hco9GREjNScUMj6T4XtJSrqAlGwzhvU/ssBjqgAoyDNE5VPJp3JhZSHVLsv5KkeA2NNC0AFTzmA/dosP97Cznexw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(42112799006)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHdGTDcwQzY1RkF4MDkweGVrVlRKQ3phWkl0UFh1WnJ3ZDVYZGJaVU5ranQ3?=
 =?utf-8?B?OTZtdW9xK0ZGMjhEdGxhSUI5YUk2Z3VNT0p5ekxNVWRQUEpDUUFxY1RhZUkx?=
 =?utf-8?B?eklqT09XMFEyY09teU5tSWFCTnpBWnFKelNGZDdNdUNKR2dCQmM3dSthZlhK?=
 =?utf-8?B?NWJ2bGE1SFlMNHM1VFdneWUrWHMvQjVseXpGRXNBNGVSWmxZZ3lxL0h4OEox?=
 =?utf-8?B?eWJxVXhTOU1RME1MMFBPNzlEejVKanJTYnQ3TkVHSDJsWGVUK1drbnNUTDNK?=
 =?utf-8?B?RjRYNDQ5OGpEWWdENHh0VEpwa3BmZ1VHNDRCeVc0bVN0S0Rvd1J3S0lkWkVI?=
 =?utf-8?B?dlljWFBPV0FKaU5wQ1lVU0ViTXNsZDBDTFlsa3ZUMnNEd1QxYkMrdi9nbmsy?=
 =?utf-8?B?NzM2VHFZdVhyUDBzeWFTK2JqS2dLRDFucHJGUmNTM2dhWUozb3RSWTdCUk9l?=
 =?utf-8?B?aUM0dW1BeVBoUzVyVzRRWkNBNThJL2t3dXorOHo2TU9QaDk3dHNqbEVEN00w?=
 =?utf-8?B?WlRJUnBtalR0dDlQL0lqQk9EUXVla1F5blBYZ3JMSmtwVm1KdEN6YXp0V2Nt?=
 =?utf-8?B?Tjdoa3BKZktuSW0zclBJZzZobElIMU1OODFsWExYM3BJNWNmVGw0dlVXK1pS?=
 =?utf-8?B?eGwyeFVRM2JyU0NHZmYzb1N1c211TzNCTGRNbG9Kei82RnRVVCt0VGtoOFp0?=
 =?utf-8?B?UVhGSHJiSzZWV3lXWXZQM1hVeFdSMDNwSm4zY3R5Q2szb1h3UTg4bWg1Zng0?=
 =?utf-8?B?OUF2MjFmKzh6RVRiNXpHQU9TdWNqS3RqMC9PdVpuRS81OEVwdHIybXdmR0FP?=
 =?utf-8?B?blRHZllhaGYvbVpYbnJJeThnSW1kREdhaVY4aEhiTzFqQzZYTTZ6bzJUZjJO?=
 =?utf-8?B?eUdvVStQeFY3UDFHMnlTNjVacGFKc1FsbTNOWC84VC9EUzU4L1RZSC91QUxn?=
 =?utf-8?B?dmZ1UllJamNSdVNOWTZkNkZnUzdTZTdFd3FHcGdCbWdIS3lmanErd2JQNWJG?=
 =?utf-8?B?clJjWEg2VzBXN24rbGxUKzNua0dnbC9aY3VobkdDSjFMY3JJeGN1c1RiZlpj?=
 =?utf-8?B?ZCtNUHZYcEdJSXBkY0F2ODAwdTNVQnl6a3R2c09jT1RZRHRHSlhZOXNMa0VQ?=
 =?utf-8?B?dUl0eW0zTTRBbXYyK1F6eVU4V1p0WS84VVVFWjN1OHpaL2ROR2t4M0xxaVlv?=
 =?utf-8?B?b1NJREFnTlUzc1h5VThSQi9oSk5XOTZQalFZNmE2dGI0b0VrVGNLbFFmRE0v?=
 =?utf-8?B?UVFabE93cXZOSlptVG9xNmpHSW1MMlZlaE1vU1k4SXBMb0N4dGZGN0FISXda?=
 =?utf-8?B?T3BGSGR5WHpEdk9YQkw0V3lSdU9DaVlGQnRXZTVIQmJOazVEaTZHS25oaEpr?=
 =?utf-8?B?OWlhM1J6bHY0a254V3FSSUMwMXY2Z2ZCNjZ3K2Fla0hNNzh5Vi9tSlFTdGZn?=
 =?utf-8?B?QlRYbGluRC92NXBtN1M5RDNjNHZPQ1BxdHcvcjR0VUw1Qy80Ykl3MjlpRVI5?=
 =?utf-8?B?OElqOTBPRStJemRRR1JaWThvZUdyUktia2FsWE9VS1orNzR6dHJHUlZXTVpT?=
 =?utf-8?B?UDJnR3kxYThvdExxWnNxN2NCVlpYUEZqajZqcFczclNHVEdBU1JZRHgxc2l5?=
 =?utf-8?B?NTIwVVJ3R0ZBdWtyWXc5aXZxTFhKYWNIQll5T1VnSTVleDR1Y0k1UUtFZ3RP?=
 =?utf-8?B?L3JSK1JnY1YvdXliTEluRTZnZHMvbzJQMlI1cllxOE8rOVl6MzJxZ2pDdnZI?=
 =?utf-8?B?NjZMZmtFVmlRRVpOSmpzb3Z0SW5VUk52MWdXQ3VPMWZ5STZRT001cVBjTGxB?=
 =?utf-8?B?VWNmcm1DK1pVWmRkSHJob0JiaGdzY2pKZTJGdnNzbjZHWmtkUTB5ZjAwV0Jj?=
 =?utf-8?B?SGlQUkxEMzZDOFlENFBtVWVIKy91M3k2cWczQngxenNlVWxkOGQrNmw3d0VD?=
 =?utf-8?B?c0pmcFJ5Z3pUcmZ4VGVENWJ1cG5aYkxCQi80WXJyb25LTkVKaUJZNVBsdGJp?=
 =?utf-8?B?NHlJa1FBajBSQ2M5NVVZd3MzN29RdnJHMTlJaTFRdXBra0JzeFpaZkN6UERR?=
 =?utf-8?B?UUhaV0ROMzZLQjBmb0VZNXQza05TQmthM0ozRERSV0pFT1k1YTJ0WXJPa3JG?=
 =?utf-8?B?YTJLV3VGKzUwQWk1S3JEQ1NkSEdYRFYxekRuQm1HL2h0TG9LL2NkV1BXZ0Rw?=
 =?utf-8?B?bzM5Y1BmMnc5NXJXRjVWeDBCWEw4V3R3MVUvN3JUZmdDR0ZYeTFMdWdpcjZK?=
 =?utf-8?B?cDlZRWgzdktQenJEdFZldktCb1h1dElWbjBEYWtrZEQxUFBNeDgrdU9TZm51?=
 =?utf-8?B?bEVJYjVhTUVkUFMvaDVuQUtIOTNtendrYk10bU1iWllDMDJDdnI1LzVhb3ZO?=
 =?utf-8?Q?gjZ1RhMdx9oUj55w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C922CE53624B43B3611EF15ADBD237@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4c987f-8b8e-4a73-0648-08df231c023c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 20:05:31.2827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOiq/pI3PSPFfnbRYAji3RXvEvqzIOHWeEKcebvA9n+hxPY6AvFGQIQspvCq3fwfRM7W57oQaRtWsyHUyu77bUyfqSl2tJnB8NjaaA6fDy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9140
X-purgate-ID: tlsNG-33051d/1791230733-752854E9-3F0DA092/10/78276251493
X-purgate-type: spam
X-purgate-size: 1180

DQoNCk9uIDkvMy8yNiAxNDo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE1pc3JhIHJ1bGUgMTEu
MSBkZW1hbmRzIG5vIGNvbnZlcnNpb24gdG8gZGlmZmVyZW50IHR5cGVzIGF0IGFsbC4gV2UNCj4g
ZGV2aWF0ZSBjb252ZXJzaW9ucyB0byBsb25nLCB1bnNpZ25lZCBsb25nLCBhbmQgdm9pZCAqLCB0
aG91Z2ggLSBsZXZlcmFnZQ0KPiB0aGF0IGRldmlhdGlvbiBoZXJlLg0KPiANCj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbWFjaGluZV9rZXhl
Yy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMNCj4gQEAgLTEyMSw3ICsx
MjEsOCBAQCBpbnQgbWFjaGluZV9rZXhlY19sb2FkKHN0cnVjdCBrZXhlY19pbWFnDQo+ICAgICAg
IH0NCj4gICANCj4gICAgICAgY29kZV9wYWdlID0gX19tYXBfZG9tYWluX3BhZ2UoaW1hZ2UtPmNv
bnRyb2xfY29kZV9wYWdlKTsNCj4gLSAgICBtZW1jcHkoY29kZV9wYWdlLCBrZXhlY19yZWxvYywg
a2V4ZWNfcmVsb2NfZW5kIC0gKGNoYXIgKilrZXhlY19yZWxvYyk7DQo+ICsgICAgbWVtY3B5KGNv
ZGVfcGFnZSwga2V4ZWNfcmVsb2MsDQo+ICsgICAgICAgICAgIGtleGVjX3JlbG9jX2VuZCAtIChj
b25zdCBjaGFyICopKHVuc2lnbmVkIGxvbmcpa2V4ZWNfcmVsb2MpOw0KPiAgICAgICB1bm1hcF9k
b21haW5fcGFnZShjb2RlX3BhZ2UpOw0KPiAgIA0KPiAgICAgICAvKg0KDQpSZXZpZXdlZC1ieTog
RG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4NCg0KQlIsIERt
eXRyby4=

