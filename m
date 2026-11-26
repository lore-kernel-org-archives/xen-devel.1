Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4D606A321
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 03:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=f8TlM9X/
Received: from list by lists.xenproject.org with outflank-mailman.1503027.1698917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWQHw-0002it-80; Thu, 26 Nov 2026 03:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503027.1698917; Thu, 26 Nov 2026 03:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWQHw-0002il-3t; Thu, 26 Nov 2026 03:36:48 +0000
Received: by outflank-mailman (input) for mailman id 1503027;
 Thu, 26 Nov 2026 03:36:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xWQHt-0002ha-2R
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 03:36:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWQHs-00DhKv-3m
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 04:36:44 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b07a89f-8faa-0a2a0a5109dd-0a2a4506b672-46
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 04:36:43 +0100
Received: from [40.107.74.112]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b07a949-195a-0a2a45060019-286b4a708b77-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 04:36:43 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB6336.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:32e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 03:36:38 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 03:36:37 +0000
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
 b=n3snVIeNFVyqnoslEbTPC+PiOsDqecOm8MkcDyZANMzj4XZRmn0CBXn9qWYRJEqCEOcyfApHMVs/NO91yVhz2TcdtlZbsl7uwFA3lfaXdfBwiJ7Z1N1YgmboIDgERULZKBJdCOzBi60AMpMVjRACMbIQbOyszoVc5F2fT9T0v/FuQIwzvRdnuAKKzFcOJwFVwB8rhgzUfqX9vF/VoGfi7Auhu2oW68CLa/UOhNxro5WKvRr/w8oCxBaLcyDibiLdsOnpglIsraP7s7lFODabkibHzkPukgfkZqc1Ilbjw09D3qa5Esr7X8F4o1/wdI0ZXedOKrHIpVZOLm/H0JdM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+1xcuCRwFcMlPPQ0dWTURU4ZCHNXljmPkQB4An9Hh4=;
 b=oewozgE5vmhNgm5jWn+Xa092HkVp8KAqKJKh98mfSE92cuQvAEknVlTrRwNBqW7XvHW1FayQ6MSXSTMODuC21ki3nlZognwE+5qoPxE65pGvxFqV/Wb+vtT6e6wpZlroynmL3JRbfzrK5rR+050hH9kqAi20TF3EUoWskmimcSMxYVYwINs/TVX1+teFEOj5DSnQkS46kPF8iL7B8yR8DrZSjF2c1oSTAk08mmgNL4OjExRkMuBy/6Pbbni0TigwaDOTzhFsd53A9wVtSutWy16a3kq0dzUOTZm5eUSCCFoAmRvv0au3Af2fNZ9m3YwT0byUxkS2WXzu67QbKY1K0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+1xcuCRwFcMlPPQ0dWTURU4ZCHNXljmPkQB4An9Hh4=;
 b=f8TlM9X/m02C/7V+kc9Bp4C2WZA9h3nndqnws8eosSZjgE4iLtK0Gxd+ME4UPV52RW696WLq8hEdgdDck4bRcvyufwMpbgeg+Tg8YF0bPwUW9wN0RYp6ZbuyykfQBuLteMRKgiIeaZYVOQ8I0CSJH/AM8s8zORwceBfx5/xtDWo=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Topic: [PATCH v2] xen/arm: Fix sibling mask setup to only include
 online CPUs
Thread-Index: AQHdcA2DT3FSMPLxskS/PZRJxKJOO7c+oEeAgAEEahA=
Date: Thu, 26 Nov 2026 03:36:37 +0000
Message-ID:
 <OS9P286MB72224D5A8AACDCC1B3D5906F82422@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261109054515.1690-1-taka@valinux.co.jp>
 <317e6f9b-ea48-45bf-a42c-a59534bb5179@amd.com>
In-Reply-To: <317e6f9b-ea48-45bf-a42c-a59534bb5179@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB6336:EE_
x-ms-office365-filtering-correlation-id: d5d4e260-0a87-462c-c1eb-08df4b6e7a28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|38070700021|261102123227099003;
x-microsoft-antispam-message-info:
 p1+VdEsWTcgKtKzC1iMzdgHyz1NYTUGgEb5fXx9jiOtkC5ATX+XanE6xrFRAOE5X6r87VqArau7yt4lQvFWsQ+cbrsPt2wJUPzYo+PTBDUapGrOk5iYiurkcvhpPU/f7GVGeepxZC2yiyX1XtpY8TJr5kbHlEe6z86LRwBiVLGZAZQro6pnvuMGy67gfpmNr5Er+hO2aSxgfVyF3vaXK5lzfzFPUmBUCGNAtzRHyIdiOYV+z7WAoKI42C+WWvnuXfNCv8O49BgRX+VaKXXFIJ3JJ9unEhPcnE/Jizdr7U0aEaM09UktPWDSmgVOOkwgLKQaRHm+kseTsUxCS9JPgRG+POiZBuCuoB9fuWW3rHuvtZgnk+t8O9XSYQVoj3zaJygi4OQ8H4iC6X+4itDTrNLYB1EkTxVe8dcSg/SgzxPgM2CdoOTOZm5Ebq9wbyBCSh8BUzJj7ThRcFMQlElI0qAZVBCfoiy5IpFlFi9SudyK6M+Df0xww+sXI54KX77XGH5Bb8cybjSUns2Cyu0CxwegNf+W6tEj8Rt0lfMIm1l21hTPQ3c4batKvHAJqZBCz1kDE6S8sIGLjIiuYLpPT8MEejPpPpBrHY/lfyMYj1SYhBSck7mrT8iIhIJrYqwdtFn1G+/f7ULemWHCnMU3n4ndIlkvwZ7IMiV7Cmf1FjpLk2JKeq9hBxUklL5JAr+6n5HLWNfp/5geMrOjoF7P6Dkvnit9l+Of6ADC8kR4GghA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(38070700021)(261102123227099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YitEZzk0NnhvdG92Z00veXFSWWpKZ0ErSm4xRU9QMHJsc2NlYmEyTzcwa2xZ?=
 =?utf-8?B?eGQzTkhZQngyZmtYZ2tEb0I4SllIR2hERzNsbzA3LzlwRkdqcTF3OUZxbzJl?=
 =?utf-8?B?amlabUZELzN0MWZBS1Q2Qk9XZU9KQzJVZWo3MjR2SkJkd3J5SGVMWkROWERN?=
 =?utf-8?B?T01aRDc0YXkyazI3dnprdlhQS2hsTUdFRlRyMW9Eeno2WGcvcGptaWhKYkpy?=
 =?utf-8?B?VktYYUdXbmVZQ3htYVUydEFJbTVzTXg3bk83N3FWRWIrbzZ2aWZPa250TDc2?=
 =?utf-8?B?Y1RCckpMQ3kvNGtJcnhPbUZTLzNyV1VVYUI5MWpaaWFaNWF1cStsVnRoYWtN?=
 =?utf-8?B?eGtibElBOGNteThKZGlZb3BRREF6NGQ1TjYxenlOSUF5QjJWT1NHM2ZvRUZL?=
 =?utf-8?B?REpqK011WkpEMDl0bTIvMlhsQStSeXZ6ZEhBRlFOa0F2Ty9UVS9YNW5uR0NQ?=
 =?utf-8?B?Y0Zxa2F6aXNEamxuT01LVmVLQktPNVF3NTViYitwTFB4a1V4YXg5WVRkanhM?=
 =?utf-8?B?dUlySVBCMUxmM0FLTS9aRFZhUlkwcXkzWnQrWlk2Z0tuVE9udXlabEZFTjZW?=
 =?utf-8?B?LzI5Rzh6MW5FaExqUVhRMGQ2NEZpblJJdHR2NEhLLzFnTTZaeFo0bEtkK1Nr?=
 =?utf-8?B?M0JZcTQ3MVJlSGl3VEVxTXJBODRDMzJ2UnNDTVdacWMyQmdnM0FWSmpsa0Z0?=
 =?utf-8?B?NWsxdSs1Zm5UblIyaDVUdHBLdXh3OWlkaVVqaTg1WDRwOWVMbTdUMkhxeXhr?=
 =?utf-8?B?UFRaK2RXNEw4UlFJY1dSdXpmdHp3cCtEQjNZenkzN3RhSVl5ZHFpQ0Rhb1l5?=
 =?utf-8?B?TnZSNDdFdUpxbFY5R3pCWkZUZnB6elB5dW1ZMmRHN0tPalBGNnltbnlRSVZk?=
 =?utf-8?B?MXgreklPaE5IanNvUkg4VHQwcnpTUXo0dE4xRGp3YzhHNEdrYVpmK0FhYXNl?=
 =?utf-8?B?cFJSUzF6RDM3Y05lUlNJY0VZWHcyRlJUUDFBVFBzdVZJM1g3bU5OSVNaQWE1?=
 =?utf-8?B?QklnbGNmTXU1bURCS1FOS3dmb0VJOUt0aEU3SFQwMitNREtMNHd4NTdrVyts?=
 =?utf-8?B?eGdUT2l5SlRHbFYzc2wyMGJHNVBaUUVCR0oxUnNsVER0VGNHcmhoTmR0TW42?=
 =?utf-8?B?aE5PNzgyZWx6UXhVZkZqQks4RUlwSEovRHZPNDZmaTQxM0k1eTJkSGVmYlE1?=
 =?utf-8?B?L21naEhpU1JFRzBIeGplYmVVWHhxUUlxU0k2enp5NzZxcHNPeXRCbHhMT21p?=
 =?utf-8?B?cUJ6TFJQWHdqN3BzR2d3VFhZVzVRZms4bmwrOHpRemxxR2VqNkNWUTJ1S215?=
 =?utf-8?B?cElobHd2MnY1Tmg3cUk1RnI2dnVPbHJ3MDJWWGJ4MEYxa1E0Ymx3RzZoTmQ4?=
 =?utf-8?B?U29MSTlZMXFhVnA3ZWVQTDFzc1FEczlGK2RNM1NjTXl0ek5IcHgzTnpXYi9M?=
 =?utf-8?B?S2VxYitzaU1aZC9FNVZXRGlpUGVFOHVROVo2anprWlVQY2FzcHcwTWFlNERQ?=
 =?utf-8?B?V0ZXcmtWWVhBSHUwRFRhU0Q0UmZHeU1paUtoMDdWRmtFZmU2WFJ4d1ZFaytW?=
 =?utf-8?B?UytFNzk0RFFHNUdkRW5VZlFCOEY5OTdVbWFITVVFS0g4ZDNNYld3L21Ha0Iz?=
 =?utf-8?B?YTh6Rlg2WldQK2lxVFRIUlNFbGlPbWQzK3UwaGIyNHdrUTR3eUZpVU90TUFn?=
 =?utf-8?B?U0RhVlhjVjIzYlE3TXNZNlZkMEk1aGI3aDV4VW1KREpyZWVrRW54MTRSL0dV?=
 =?utf-8?B?RlJlWVJydHk1OWVIRU9DT2NXcmFrbVQ1bTNBUXBSWXpWaXJhRklURXJuTFdi?=
 =?utf-8?B?Q2pnU1FXeHJkcGQ1MDNlTCs4MWhkR1p1Vm5IZGZ3ZWFVUlBZT2V6MnhSUUlR?=
 =?utf-8?B?Ylc2ZEY1RTlWM1R0UUJVTG1HbG82aCt2YzR0MmFWRXFRNmxZS2MzRTNLVGdv?=
 =?utf-8?B?TTg4M3hLSC9aT1VMK1N3MEcwbFZxNjRDdGFBbUNLTTgzZDNoeklkTXJCOFR0?=
 =?utf-8?B?UXptM0VSSHVFQmY1K2RUc0tOWDI4M1VOeGg5QlVLZXFHdDNsbUxOMlg1WVda?=
 =?utf-8?B?b0JQNVZnS2N1TnFXK1VDWG1BcUJWUlRTTGlmYk1BdDhuUVFQNXlJa1dsU3Z4?=
 =?utf-8?B?RFA4UEdCcmdNbHN0MHFvOXVnNnVmaFlkSXNlSDVRc3lpNEtPVmRNeklnZ1ov?=
 =?utf-8?B?bjRkVWlZYmpNS05NaTJJOXVYNmxWSFFWMWlIMHNLTEw2V2kwYVNCL01NTWpS?=
 =?utf-8?B?dG1PMU9nV2ZFV0RxSTMyTVFkTHZVVWpQOUhxZGU0Qkd0ZEp3b29PeGpBa2NK?=
 =?utf-8?Q?AG0CaqQqUKbl/fkUJ3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d4e260-0a87-462c-c1eb-08df4b6e7a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 03:36:37.7747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PCfIT6dtHYEJRkzjEOfN86Vpe2jkAjOgp+W93tTpQBF4oaIz8X1wFOYFMSSlkf7gxbIO52DPbI1zFpuQq223Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6336
X-purgate-ID: tlsNG-16d1c6/1795664203-F5E0E77B-D9D4F9B8/0/0
X-purgate-type: clean
X-purgate-size: 2974
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIE1pY2hhbA0KDQo+ID4gUG9wdWxhdGUgdGhlIENQVSBzaWJsaW5nIG1hcCBvbmx5IHdpdGgg
Q1BVcyB0aGF0IGFyZSBicm91Z2h0DQo+ID4gb25saW5lLiBDdXJyZW50bHksIGFsbCBDUFVzIGlu
IGNwdV9wb3NzaWJsZV9tYXAgYXJlIGFkZGVkLA0KPiA+IHdoaWNoIGxlYXZlcyBDUFVzIHRoYXQg
ZmFpbGVkIHRvIGJvb3QgaW4gdGhlIHNpYmxpbmcgbWFza3MgYW5kDQo+ID4gbWF5IGxlYWQgdGhl
IHNjaGVkdWxlciB0byBtYWtlIGluY29ycmVjdCBkZWNpc2lvbnMuDQo+ID4NCj4gPiBDaGFuZ2Vz
IGluIHYyOg0KPiBUaGlzIHNob3VsZCBiZSBtb3ZlZCBhZnRlciAnLS0tJw0KDQpJIHdpbGwgZml4
IGl0Lg0KIA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiArKysgYi94ZW4v
YXJjaC9hcm0vc21wYm9vdC5jDQo+ID4gQEAgLTkxLDE1ICs5MSwyNyBAQCBzdGF0aWMgaW50IHNl
dHVwX2NwdV9zaWJsaW5nX21hcChpbnQgY3B1KQ0KPiA+ICAgICAgICAgICAhemFsbG9jX2NwdW1h
c2tfdmFyKCZwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpICkNCj4gPiAgICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gPg0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyB2b2lkIHNldF9jcHVfc2libGluZ19tYXAoaW50IGNwdSkNCj4gdW5zaWduZWQgYXMg
b24geDg2Pw0KDQpJbiB4ODYgWGVuLCB0aGUgY3B1IHBhcmFtZXRlciB0eXBlIGluIHRoZSBzaWJs
aW5nIG1hc2sgaGVscGVyIGZ1bmN0aW9ucyBpcyBhIG1peCBvZg0KJ2ludCcgYW5kICd1bnNpZ25l
ZCBpbnQnLiANCkl0IHNlZW1zICd1bnNpZ25lZCBpbnQnIHdpbGwgYmUgYmV0dGVyIGZvciBBUk0g
WGVuLg0KDQp4ODYgPiBzdGF0aWMgdm9pZCByZW1vdmVfc2libGluZ2luZm8oaW50IGNwdSkNCng4
NiA+IHN0YXRpYyB2b2lkIHNldF9jcHVfc2libGluZ19tYXAodW5zaWduZWQgaW50IGNwdSkNCng4
NiA+IHN0YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQgaW50IGNwdSwgYm9vbCBy
ZW1vdmUpDQogDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBzaWJsaW5nOw0KPiA+ICsN
Cj4gPiArICAgIEJVR19PTiAoIXBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSk7DQo+IHRo
ZXJlIHNob3VsZCBiZSBubyBzcGFjZSBiZXR3ZWVuIEJVR19PTiBhbmQgcGFyZW50aGVzaXMNCg0K
T2theS4NCg0KPiA+ICsgICAgQlVHX09OICghcGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpKTsN
Cj4gPiArDQo+ID4gICAgICAvKg0KPiA+ICAgICAgICogQ3VycmVudGx5IHdlIGFzc3VtZSB0aGVy
ZSBpcyBubyBtdWx0aXRocmVhZCBhbmQgTlVNQSwgc28NCj4gPiAgICAgICAqIGEgQ1BVIGlzIGEg
c2libGluZyB3aXRoIGl0c2VsZiwgYW5kIHRoZSBhbGwgcG9zc2libGUgQ1BVcw0KPiB5b3VyIGNo
YW5nZSBzd2l0Y2hlcyB0byBvbmxpbmUsIHNvIGEgY29tbWVudCBzaG91bGQgYmUgdXBkYXRlZA0K
DQpPa2F5Lg0KDQo+ID4gICAgICAgKiBhcmUgc3VwcG9zZWQgdG8gYmVsb25nIHRvIHRoZSBzYW1l
IHNvY2tldCAoTlVNQSBub2RlKS4NCj4gPiAgICAgICAqLw0KPiA+ICAgICAgY3B1bWFza19zZXRf
Y3B1KGNwdSwgcGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpKTsNCj4gPiAtICAgIGNwdW1h
c2tfY29weShwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSksICZjcHVfcG9zc2libGVfbWFwKTsN
Cj4gPiArICAgIGNwdW1hc2tfY29weShwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSksICZjcHVf
b25saW5lX21hcCk7DQo+ID4gKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCBwZXJfY3B1KGNwdV9j
b3JlX21hc2ssIGNwdSkpOw0KPiA+DQo+ID4gLSAgICByZXR1cm4gMDsNCj4gPiArICAgIGZvcl9l
YWNoX29ubGluZV9jcHUoc2libGluZykNCj4gPiArICAgICAgICBjcHVtYXNrX3NldF9jcHUoY3B1
LCBwZXJfY3B1KGNwdV9jb3JlX21hc2ssIHNpYmxpbmcpKTsNCj4gV2l0aCB5b3VyIGNoYW5nZSBJ
IHRoaW5rIHdlIHNob3VsZCByZW1vdmUgdGhlIGNwdSB0aGF0IGlzIGJlaW5nIHJlbW92ZWQgZnJv
bSBpdHMNCj4gZXZlcnkgc2libGluZydzIGNwdV9jb3JlX21hc2sgb24gQ1BVX0RFQUQuDQoNCk9r
YXksIEkgd2lsbCBpbXBsZW1lbnQgaXQuDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNo
aS4NCg==

