Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A8C44507
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 12:27:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363025.1614870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyhO-0003SE-3X; Wed, 15 Jul 2026 12:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363025.1614870; Wed, 15 Jul 2026 12:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyhO-0003S7-0k; Wed, 15 Jul 2026 12:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1363025;
 Wed, 15 Jul 2026 12:26:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65be6d46000edb5@swg.vates.tech>)
 id 1wjyhN-0003S0-8R
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 12:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjyhL-003AuI-QM
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:26:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65be6d46000edb5@swg.vates.tech>)
 id 6a577c81-2eae-0a2a0a5409dd-0a2a4504aa9e-16
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:26:47 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65be6d46000edb5@swg.vates.tech>)
 id 6a577c87-b57f-0a2a45040019-b9ff1c238b1d-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:26:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f65be6d46000edb5.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 12:26:46 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 92A2F8118B;
 Wed, 15 Jul 2026 14:26:45 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=IxCQFWyg3rGCS9osgVtlVhA13YDAVlc0maVHZYpJoZM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RQ+Bt8LAUrtpLnOv6Wq1pSd89IYeRhz45ARtv3RszgN0b7JPxYm1vVOIzf+8dVcpfYiTX8s7N
 nnKrTnt4bPrqZPLPVsG4SXUOVoc4OhRIsLAYM/WC1RGAXbxDShJPz9rRS692dXqCx/iOB14Qypk
 XYsFvkLkUlSoHmG+Z+VX8yOCLnGJKJhhYkd1/VdLKvTKCsffIfkHYhwrQ4Jmi2evkI+bBv5mV7v
 BwnKajjNxajG7cnqmVkeICRyYjgBy9AueZPv6AyQq2e7079+FjhiW+mD+F/gVN9rkl9SZveQ78o
 RZVnKHeCn7hn4zitjUAdKZD4pWH3QRPNRd1GKKTMEP+g==
X-Zone-Loop: e084db8892aa23256a8e1d2fa2785424effd824ddad6
x-campaign-type: default
x-transaction-id: 06fb8f2d-c315-4aa1-86cd-bd14859286c1
x-swg-uid: 01-d02d7e61-e218-44a2-b722-c42c1b6f7e43
X-Mailer: Sweego
Message-ID:
 <1784118406.8631fc262581453bbf619ec5b2062170.19f65be6d46000edb5@vates.tech>
x-swg-bid: 1784118406.8631fc262581453bbf619ec5b2062170.19f65be6d46000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 14:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/entry: Fix VERW offsets in restore_all_xen()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CryNDviOdkiduGpeiMZ9lE6t"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784118405727
X-purgate-ID: tlsNG-ebf023/1784118407-C3EC6B50-1D8D61E5/0/0
X-purgate-type: clean
X-purgate-size: 10530

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CryNDviOdkiduGpeiMZ9lE6t
Content-Type: multipart/mixed; boundary="------------EdL7XQXH4XkTL4yBMORhRcjO";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <19243d36-59d5-4992-8325-9139c840232c@vates.tech>
Subject: Re: [PATCH] x86/entry: Fix VERW offsets in restore_all_xen()
References: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260715104854.1813130-1-andrew.cooper3@citrix.com>

--------------EdL7XQXH4XkTL4yBMORhRcjO
Content-Type: multipart/mixed; boundary="------------TjCkp8CbvHitWWxxa03dJtgI"

--------------TjCkp8CbvHitWWxxa03dJtgI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTUvMDcvMjAyNiDDoCAxMjo1MywgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBB
cyBleHBsYWluZWQgaW4gdGhlIGNvbW1lbnQgcGFydGlhbGx5IGluIGNvbnRleHQsIGFuZCBj
b250cmFyeSB0byB3aGF0IHdhcw0KPiBzYWlkIGluIGNvbW1pdCA4YWYzMzdkZmI4ZTIgKCJ4
ODYvZW50cnk6IFVzZSBQT1BfR1BSUyBhbmQgcmVtb3ZlDQo+IFJFU1RPUkVfQUxMIiksIHRo
ZSByZXN0b3JlX2FsbF94ZW4oKSBwYXRoIGNhbm5vdCB1c2UgZGVmYXVsdCBvZmZzZXRzIGZv
cg0KPiBTUEVDX0NUUkxfQ09ORF9WRVJXLg0KPiANCj4gR2V0dGluZyB0aGlzIHdyb25nIGlz
IHN1cnByaXNpbmdseSBiZW5pZ24uICBWRVJXIGRvZXNuJ3QgZmF1bHQgZm9yIGFueSBsaW1p
dA0KPiBvciBkZXNjcmlwdG9yIHJlYXNvbnMuDQo+IA0KPiBIb3dldmVyLCBpbiBTVk0gdkNQ
VSBjb250ZXh0IExEVFIgaXMgdGhlIGd1ZXN0J3Mgbm90IFhlbidzLiAgV2hlbiB0aGUgc2Vn
bWVudA0KPiBzZWxlY3RvciBWRVJXIHVzZXMgaGFwcGVucyB0byBiZSBhbiBMRFQgc2VsZWN0
b3IsIHRoZSBDUFUgYWNjZXNzZXMgdGhlIGd1ZXN0DQo+IExEVFIgaW4gWGVuIGNvbnRleHQ6
DQo+IA0KPiAgICAoWEVOKSAtLS0tWyBYZW4tNC4yMy4wICB4ODZfNjQgIGRlYnVnPXkgIE5v
dCB0YWludGVkIF0tLS0tDQo+ICAgIChYRU4pIENQVTogICAgMTQNCj4gICAgKFhFTikgUklQ
OiAgICBlMDA4Ols8ZmZmZjgyZDA0MDIwMDdmMj5dIHg4Nl82NC9lbnRyeS5TI3Jlc3RvcmVf
YWxsX3hlbisweDcyLzB4ODANCj4gICAgKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDAy
ICAgQ09OVEVYVDogaHlwZXJ2aXNvciAoZDN2MSkNCj4gICAgLi4uDQo+ICAgIChYRU4pIFhl
biBjb2RlIGFyb3VuZCA8ZmZmZjgyZDA0MDIwMDdmMj4gKHg4Nl82NC9lbnRyeS5TI3Jlc3Rv
cmVfYWxsX3hlbisweDcyLzB4ODApOg0KPiAgICAoWEVOKSAgNWYgZjYgNDQgMjQgN2MgMDgg
NzQgMDUgPDBmPiAwMCA2YyAyNCA0NCA0OCA4MyBjNCAwOCA0OCBjZiAwZiAxZiAwMCBmYyAw
Zg0KPiAgICAuLi4NCj4gICAgKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+ICAgIChYRU4pICAg
IFs8ZmZmZjgyZDA0MDIwMDdmMj5dIFIgeDg2XzY0L2VudHJ5LlMjcmVzdG9yZV9hbGxfeGVu
KzB4NzIvMHg4MA0KPiAgICAoWEVOKSAgICBbPGZmZmY4MmQwNDAyZTc5ZjY+XSBGIG5lc3Rl
ZGhhcF9maXhfcDJtKzB4NWYvMHhjOQ0KPiAgICAoWEVOKSAgICBbPGZmZmY4MmQwNDAyZTdj
OGY+XSBGIG5lc3RlZGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQrMHgxMWUvMHgyMmUNCj4g
ICAgKFhFTikgICAgWzxmZmZmODJkMDQwMmNkNTlkPl0gRiBodm1faGFwX25lc3RlZF9wYWdl
X2ZhdWx0KzB4MWI4LzB4NWQyDQo+ICAgIChYRU4pICAgIFs8ZmZmZjgyZDA0MDJhZDdkZT5d
IEYgc3ZtX3ZtZXhpdF9oYW5kbGVyKzB4YmU5LzB4MThiMw0KPiAgICAoWEVOKSAgICBbPGZm
ZmY4MmQwNDAyMDI1NDI+XSBGIHN2bV9hc21fZG9fcmVzdW1lKzB4MTYyLzB4MTcyDQo+ICAg
IChYRU4pDQo+ICAgIChYRU4pIFBhZ2V0YWJsZSB3YWxrIGZyb20gMDAwMDAwMDAwMDAwZmZm
ODoNCj4gICAgKFhFTikgIEw0WzB4MDAwXSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZmZmZmZmZm
ZmZmZmZmZg0KPiAgICAoWEVOKQ0KPiAgICAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqDQo+ICAgIChYRU4pIFBhbmljIG9uIENQVSAxNDoNCj4gICAg
KFhFTikgRkFUQUwgUEFHRSBGQVVMVA0KPiAgICAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQ0K
PiAgICAoWEVOKSBGYXVsdGluZyBsaW5lYXIgYWRkcmVzczogMDAwMDAwMDAwMDAwZmZmOA0K
PiAgICAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+
IA0KPiBJbiB0aGlzIGNhc2UsIHRoZSBndWVzdCdzIExEVCBvYnZpb3VzbHkgaGFzIGEgYmFz
ZSBvZiAwIGFuZCBsaW1pdCBvZiAweGZmZmYNCj4gZm9yIHRoZSBzZWdtZW50YXRpb24gY2hl
Y2tzIHRvIHBhc3MgYW5kIGEgbWVtb3J5IGFjY2VzcyB0byBiZSBhdHRlbXB0ZWQuDQo+IA0K
PiBGaXhlczogOGFmMzM3ZGZiOGUyICgieDg2L2VudHJ5OiBVc2UgUE9QX0dQUlMgYW5kIHJl
bW92ZSBSRVNUT1JFX0FMTCIpDQo+IFJlcG9ydGVkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9z
cy5sYWdlcndhbGxAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gQ0M6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50
ZWNoPg0KPiBDQzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+
DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYyB8IDEgKw0K
PiAgIHhlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUyAgICAgICB8IDQgKysrLQ0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jDQo+IGluZGV4IDlkNDUzNjQwMjY2MS4uYmFm
MjY2YWI4MDEzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2FzbS1vZmZz
ZXRzLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zmc2V0cy5jDQo+IEBA
IC02NCw2ICs2NCw3IEBAIHZvaWQgX19kdW1teV9fKHZvaWQpDQo+ICAgICAgIERFRklORShz
eW0sIG9mZnNldG9mKHN0cnVjdCBjcHVfdXNlcl9yZWdzLCBtZW0pIC0gICAgICAgICAgICAg
ICAgICAgXA0KPiAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgY3B1X3VzZXJf
cmVncywgZXJyb3JfY29kZSkgX19WQV9BUkdTX18pDQo+ICAgDQo+ICsgICAgT0ZGU0VUX0VG
KEVGUkFNRV9lcnJvcl9jb2RlLCAgICAgIGVycm9yX2NvZGUpOw0KPiAgICAgICBPRkZTRVRf
RUYoRUZSQU1FX2VudHJ5X3ZlY3RvciwgICAgZW50cnlfdmVjdG9yKTsNCj4gICAgICAgT0ZG
U0VUX0VGKEVGUkFNRV9yaXAsICAgICAgICAgICAgIHJpcCk7DQo+ICAgICAgIE9GRlNFVF9F
RihFRlJBTUVfY3MsICAgICAgICAgICAgICBjcyk7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYveDg2XzY0L2VudHJ5LlMgYi94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMNCj4g
aW5kZXggMjI3MjliMWY0M2I4Li41OTk1M2M5ZjUyNWEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvZW50cnkuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L2Vu
dHJ5LlMNCj4gQEAgLTc2NSw3ICs3NjUsOSBAQCBVTkxJS0VMWV9FTkQoZXhpdF9jcjMpDQo+
ICAgICAgICAgICAgKiBzY2YgYW5kIHZlcl9zZWwgYWJvdmUgZWZsYWdzLCBhcyB3ZSBjYW4n
dCB1c2UgYW55IEdQUnMsDQo+ICAgICAgICAgICAgKiBhbmQgd2UncmUgYXQgYSByYW5kb20g
cGxhY2Ugb24gdGhlIHN0YWNrLCBub3QgaW4gYSBDUFVGSU5GTyBibG9jay4NCj4gICAgICAg
ICAgICAqLw0KPiAtICAgICAgICBTUEVDX0NUUkxfQ09ORF9WRVJXICAgICAvKiBSZXE6ICVy
c3A9ZWZyYW1lICAgICAgICAgICAgICAgICAgICBDbG9iOiBlZmwgKi8NCj4gKyAgICAgICAg
U1BFQ19DVFJMX0NPTkRfVkVSVyAgICAgLyogUmVxOiAlcnNwPWVmcmFtZSAgICAgICAgICAg
ICAgICAgICAgQ2xvYjogZWZsICovIFwNCj4gKyAgICAgICAgICAgIHNjZj1TVEtfUkVMKEVG
UkFNRV9zaGFkb3dfc2NmLCBFRlJBTUVfZXJyb3JfY29kZSksICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gKyAgICAgICAgICAgIHNlbD1TVEtfUkVMKEVGUkFNRV9zaGFkb3dfc2VsLCBF
RlJBTUVfZXJyb3JfY29kZSkNCj4gICA+ICAgICAgICAgICBhZGQgICAgICQ4LCAlcnNwICAg
ICAgICAvKiBQb3AgZXYvZWMgb2ZmIHRoZSBzdGFjayAqLw0KPiAgICAgICAgICAgaXJldHEN
Cj4gDQo+IGJhc2UtY29tbWl0OiAxY2MxZjRkN2EwNDcxZjNiZjkxMjZlZTdiMTk1NmRiNjZl
ZTI4YjU4DQoNClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMu
dGVjaD4NCg==
--------------TjCkp8CbvHitWWxxa03dJtgI
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------TjCkp8CbvHitWWxxa03dJtgI--

--------------EdL7XQXH4XkTL4yBMORhRcjO--

--------------CryNDviOdkiduGpeiMZ9lE6t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpXfIUFAwAAAAAACgkQZg+p0QLLz9AS
Nwv/UbIYAb9WQc/V7TyXUHsGr9UtTUreeJy9ZCdVaSFrEOg0fhCokeReuO2Tcw4YoK3Qa8CLCh3W
8pT/DTT//Lrjuphnje7zlkeVSbxlmssqrw87RkIitBGz9Z5lDiISkOmch6JN9etCHHYL54DLqKsI
dEKMey65ShnVefh+7loGXe9MUqX2p3VFt56MdxrGQOkKXP1hJg3PRZcr+3FIuxHbROopM73EEwIi
p8i0iZ212j1EQGK/AQW7uyQDv6ekUtgUR1rHXxY2kJrWiJd0LjKOyRtL+4UUBvsNQjxzO86kxh3w
Ha6pm2hf8eivO69BKF7RwSTrsu+ckDNN5ESJVO/Zrq+iwTdueDMqb4NWkz6/h/ObH6SewqtN2m36
O/HZM5mS2L5SRbXfMEmzwwCNfoZaskVHNNzoMZ4uQ7V8lJdOQFqEIvd2atrGG3b2aSWKmxXwDPuN
o1Gcu3ZMflHW61P6/4NvkNupmV8IreTKUwu3TixZycEYKSIXNUMH1ge5ZgE9
=7CQ7
-----END PGP SIGNATURE-----

--------------CryNDviOdkiduGpeiMZ9lE6t--

