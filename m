Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F089DCA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 20:13:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437882.1656823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC0fw-0000qL-Gr; Wed, 30 Sep 2026 20:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437882.1656823; Wed, 30 Sep 2026 20:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC0fw-0000qE-Dr; Wed, 30 Sep 2026 20:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1437882;
 Wed, 30 Sep 2026 20:13:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3f301220003f66@swg.vates.tech>)
 id 1xC0fv-0000q8-3H
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 20:13:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xC0ft-00DMeU-DA
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 22:13:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3f301220003f66@swg.vates.tech>)
 id 6abd6d2c-e002-0a2a0a5209dd-0a2a4503a752-42
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:13:09 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3f301220003f66@swg.vates.tech>)
 id 6abd6d55-fae8-0a2a45030019-b9ff1c22ab5f-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:13:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f3f301220003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 20:13:04 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4A69F81CBA;
 Wed, 30 Sep 2026 22:13:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=JgXpFqkqvqOWPtTZR70bJwroxkwDSwxy9xQtcotDg7I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bwc70Lch/zRuq7mKZ12CUu3bTAyc/kxWXep/gBUfoqAPTxDezoQeqmnXtS4pxbK/L8juiN55Q
 kWOlYflMy8OdX3uCXx/NUe9k1D1W8uLmF8r3afwjbeDpJESGnNU3Lhj9qWpvchpAU98Aq818FK0
 epLVIG4sYhXQQhTVRN0yVEeC2R+Q5eRR0MnJoUu6fI0xduLb1fhGScwNReAnE1UaIVG/hQiuuri
 UCT+xYNQun5iFBD65X4VtG6qXUpYoldV/tFplyi8rPAv6N+RYWv9H578hMgANLkWm+N/UJrFSHU
 DPtfGCZ1FwMw81AINi10SC46EqC0fpJgGkWpduirwwzg==
X-Zone-Loop: fbb1364fd099f1654edf068f68972dbc73ce64a7f0de
x-campaign-type: default
x-transaction-id: 56df8976-a6d3-46fd-9632-fac5d695294e
x-swg-uid: 01-899b0312-e2fc-4ac8-b958-1a515fd2bd24
X-Mailer: Sweego
Message-ID:
 <1790799184.8631fc262581453bbf619ec5b2062170.1a0f3f301220003f66@vates.tech>
x-swg-bid: 1790799184.8631fc262581453bbf619ec5b2062170.1a0f3f301220003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 30 Sep 2026 22:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] x86/ACPI: optimise C3 entry on AMD CPUs
To: Olivier Lambert <olivier.lambert@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zg0xTqThLMTT05wGJ3Ydv80n"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790799183450
X-purgate-ID: tlsNG-33051d/1790799189-6F8C54E9-1193A3FC/0/0
X-purgate-type: clean
X-purgate-size: 9766

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zg0xTqThLMTT05wGJ3Ydv80n
Content-Type: multipart/mixed; boundary="------------Som7zvJlsQqdVDayyX3i4n3b";
 protected-headers="v1"; hp="clear"
Message-ID: <fa3cb326-8f9e-4ad7-b0bd-70d5e5c14d93@vates.tech>
Date: Wed, 30 Sep 2026 22:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] x86/ACPI: optimise C3 entry on AMD CPUs
To: Olivier Lambert <olivier.lambert@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>

--------------Som7zvJlsQqdVDayyX3i4n3b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDkvMjAyNiDDoCAyMTozMywgT2xpdmllciBMYW1iZXJ0IGEgw6ljcml0wqA6DQo+
IEFsbCBaZW4gb3IgbmV3ZXIgQ1BVIHdoaWNoIHN1cHBvcnQgQzMgc2hhcmVzIGNhY2hlLiBJ
dHMgbm90IG5lY2Vzc2FyeSB0bw0KPiBmbHVzaCB0aGUgY2FjaGVzIGluIHNvZnR3YXJlIGJl
Zm9yZSBlbnRlcmluZyBDMy4gVGhpcyB3aWxsIGNhdXNlIGRyb3AgaW4NCj4gcGVyZm9ybWFu
Y2UgZm9yIHRoZSBjb3JlcyB3aGljaCBzaGFyZSBzb21lIGNhY2hlcy4gQVJCX0RJUyBpcyBu
b3QgdXNlZA0KPiB3aXRoIGN1cnJlbnQgQU1EIEMgc3RhdGUgaW1wbGVtZW50YXRpb24uIFNv
IHNldCByZWxhdGVkIGZsYWdzIGNvcnJlY3RseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERl
ZXBhayBTaGFybWEgPGRlZXBhay5zaGFybWFAYW1kLmNvbT4NCj4gQWNrZWQtYnk6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYWZh
ZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+DQo+IE9yaWdpbjog
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9wL2E4ZmI0MDk2NmYxOQ0KPiBbUG9y
dCB0byBYZW4uICBJbmNsdWRlIEh5Z29uLl0NCj4gQXNzaXN0ZWQtYnk6IENsYXVkZS1Db2Rl
OmNsYXVkZS1vcHVzLTUtNQ0KPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIExhbWJlcnQgPG9s
aXZpZXIubGFtYmVydEB2YXRlcy50ZWNoPg0KPiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1
ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICAg
IENoYW5nZXMgaW4gdjI6DQo+ICAgICAgIC0gUmVzZW5kIHdpdGggZ2l0IHNlbmQtZW1haWw6
IG15IG1haWwgY2xpZW50IHN0cmlwcGVkIHRoZSB3aGl0ZXNwYWNlIGZyb20NCj4gICAgICAg
ICB2MSwgc28gaXRzIGRpZmYgY291bGQgbm90IGJlIGFwcGxpZWQuICBObyBjb2RlIGNoYW5n
ZS4NCj4gICAgICAgLSBQaWNrZWQgdXAgSmFzb24ncyBSZXZpZXdlZC1ieS4NCj4gICAgICAN
Cj4gICAgICBGb3VuZCBvbiBYQ1AtbmcgOC4zIChYZW4gNC4xNy42KSBvbiBhIFJ5emVuIDUg
NzYwMCAoWmVuIDQsIGZhbWlseSAweDE5KQ0KPiAgICAgIHdob3NlIF9DU1QgbGlzdHMgQzEg
KEhMVCkgcGx1cyBDMiBhbmQgQzMgYXMgU1lTSU8gc3RhdGVzIChDMyBleGl0DQo+ICAgICAg
bGF0ZW5jeSAzNTB1cykuICBXaXRoIGJtX2NoZWNrID09IDAsIGV2ZXJ5IEMzIGVudHJ5IGV4
ZWN1dGVzIFdCSU5WRC4NCj4gICAgICANCj4gICAgICBNZWFzdXJlZCB1bmRlciBhIFZNLXRv
LVZNIG5ldHdvcmsgbG9hZCwgaW4gMjVzIHdpbmRvd3M6DQo+ICAgICAgIC0gfjE0MCBXQklO
VkQvcywgNjUtNjl1cyBlYWNoIG9uIGF2ZXJhZ2UsIDMwMHVzIGF0IHdvcnN0Lg0KPiAgICAg
ICAtIFNwaW5uaW5nIG9uIGVhY2ggQ1BVIGluIHR1cm4gd2l0aCBJUlFzIG9mZiBhbmQgcmVh
ZGluZyB0aGUgVFNDIHNob3dzDQo+ICAgICAgICAgZ2FwcyBvZiB1cCB0byAyMjJ1czsgbm9u
ZSB3aXRoIHRoaXMgY2hhbmdlLiAgVGhlIFNNSSBjb3VudCAoUE1DIGV2ZW50DQo+ICAgICAg
ICAgMHgyYiwgdmFsaWRhdGVkIGJ5IGNvdW50aW5nIGN5Y2xlcyBvbiB0aGUgc2FtZSBjb3Vu
dGVyKSBzdGF5ZWQgYXQgMCwNCj4gICAgICAgICBhbmQgTk1JcyBkaWRuJ3QgbGluZSB1cCB3
aXRoIHRoZSBnYXBzLg0KPiAgICAgICAtIGNyZWRpdDEncyBkb19zY2hlZHVsZSgpIG9jY2Fz
aW9uYWxseSB0b29rIHVwIHRvIDI2MnVzLCB3aXRoIElSUXMNCj4gICAgICAgICBvZmY7IGF0
IG1vc3QgNC40dXMgd2l0aCB0aGlzIGNoYW5nZS4NCj4gICAgICAgLSB4ZW5wbSBzZXQtbWF4
LWNzdGF0ZSAxIHJlbW92ZXMgdGhlIHN0YWxscyB0b28sIHdoaWNoIHBvaW50cyBhdCBDMw0K
PiAgICAgICAgIGVudHJ5Lg0KPiAgICAgIA0KPiAgICAgIFRoaXMgY2hhbmdlIHdhcyBib290
ZWQgYW5kIG1lYXN1cmVkIGFzIGEgYmFja3BvcnQgb24gNC4xNy42IG9ubHkuICBPbg0KPiAg
ICAgIHN0YWdpbmcgaXQgaXMgYnVpbGQtdGVzdGVkLiAgSXQgYWxzbyBjb3ZlcnMgSHlnb24s
IGFzIExpbnV4IGRvZXMgdG9kYXkNCj4gICAgICB0aHJvdWdoIFg4Nl9GRUFUVVJFX1pFTjsg
dGhlIG9yaWdpbmFsIExpbnV4IGNvbW1pdCB3YXMgQU1ELW9ubHkuDQo+ICAgICAgDQo+ICAg
ICAgVGhpcyB3aWxsIGNvbmZsaWN0IHRyaXZpYWxseSB3aXRoIEFsZWphbmRybydzIHBlbmRp
bmcgIng4Ni9hY3BpOiBNaWdyYXRlDQo+ICAgICAgdmVuZG9yIGNoZWNrcyB0byBjcHVfdmVu
ZG9yKCkiOyBoYXBweSB0byByZWJhc2Ugb24gdG9wIG9mIGl0Lg0KPiAgICAgIA0KPiAgICAg
IFBvc3NpYmx5IGEgYmFja3BvcnQgY2FuZGlkYXRlLg0KPiANCj4gICB4ZW4vYXJjaC94ODYv
YWNwaS9jcHVfaWRsZS5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvYWNwaS9jcHVfaWRsZS5jIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYw0KPiBp
bmRleCA1NmIyMmEyLi5iMmJjYTRkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvYWNw
aS9jcHVfaWRsZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMNCj4g
QEAgLTEwNjUsNiArMTA2NSwyNCBAQCBzdGF0aWMgdm9pZCBhY3BpX3Byb2Nlc3Nvcl9wb3dl
cl9pbml0X2JtX2NoZWNrKHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9mbGFncyAqZmxhZw0KPiAg
ICAgICAgKi8NCj4gICAgICAgaWYgKCBjLT52ZW5kb3IgPT0gWDg2X1ZFTkRPUl9JTlRFTCAp
DQo+ICAgICAgICAgICBmbGFncy0+Ym1fY29udHJvbCA9IDA7DQo+ICsNCj4gKyAgICBpZiAo
IChjLT52ZW5kb3IgJiAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSkgJiYN
Cj4gKyAgICAgICAgIGMtPmZhbWlseSA+PSAweDE3ICkNCg0KSSBndWVzcyB3ZSBjYW4gYXNz
dW1lIHRoYXQgSHlnb24gQ1BVcyBzaGFyZSB0aGUgc2VtYW50aWNzIG9mIFplbiBDUFVzLCAN
CmFzIHJlY2VudCBIeWdvbiBDUFVzIGFyZSB+WmVuIG9uZXMuDQoNCj4gKyAgICB7DQo+ICsg
ICAgICAgIC8qDQo+ICsgICAgICAgICAqIEZvciBhbGwgQU1EIFplbiBvciBuZXdlciBDUFVz
IHRoYXQgc3VwcG9ydCBDMywgY2FjaGVzDQo+ICsgICAgICAgICAqIHNob3VsZCBub3QgYmUg
Zmx1c2hlZCBieSBzb2Z0d2FyZSB3aGlsZSBlbnRlcmluZyBDMw0KPiArICAgICAgICAgKiB0
eXBlIHN0YXRlLiBTZXQgYm1fY2hlY2sgdG8gMSBzbyB0aGF0IFhlbiBkb2Vzbid0DQo+ICsg
ICAgICAgICAqIG5lZWQgdG8gZXhlY3V0ZSBjYWNoZSBmbHVzaCBvcGVyYXRpb24uDQo+ICsg
ICAgICAgICAqLw0KPiArICAgICAgICBmbGFncy0+Ym1fY2hlY2sgPSAxOw0KPiArICAgICAg
ICAvKg0KPiArICAgICAgICAgKiBJbiBjdXJyZW50IEFNRCBDIHN0YXRlIGltcGxlbWVudGF0
aW9uIEFSQl9ESVMgaXMgbm8gbG9uZ2VyDQo+ICsgICAgICAgICAqIHVzZWQuIFNvIHNldCBi
bV9jb250cm9sIHRvIHplcm8gdG8gaW5kaWNhdGUgQVJCX0RJUyBpcyBub3QNCj4gKyAgICAg
ICAgICogcmVxdWlyZWQgd2hpbGUgZW50ZXJpbmcgQzMgdHlwZSBzdGF0ZS4NCj4gKyAgICAg
ICAgICovDQo+ICsgICAgICAgIGZsYWdzLT5ibV9jb250cm9sID0gMDsNCj4gKyAgICB9DQo+
ICAgfQ0KPiAgIA0KPiAgICNkZWZpbmUgVkVORE9SX0lOVEVMICAgICAgICAgICAgICAgICAg
ICgxKQ0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRl
Y2g+DQoNClRlZGR5DQo=

--------------Som7zvJlsQqdVDayyX3i4n3b--

--------------zg0xTqThLMTT05wGJ3Ydv80n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq9bU4FAwAAAAAACgkQZg+p0QLLz9Bx
DQwAk6oPAB+CDd6hlL8VA3S5gu6gQjWlpOrJ7+lP+RXKgO4L2NuRmw4X1ov/85DXCsWAtbJmfsXM
dfoSXzAiLXUGKIYBmoR/TmnvLYGVtd4a1DKrjDbje9yyxTGrh80rZIfZkv/48j1oUgc0b2M/ThIh
RnIRjWbvSMPHj3QzOQMAH7OsJUiBFRLVAQJ14zDuppa569QePBCICMC1lVj/Rkn25IrvocXiJLKv
z1/iBCl6WxKg8PrKuAgVnarIK7FCsAcZ1Q8emIIoNKOI8ltJ8mxN+bVUoFhMycIcoctRwnkQlliN
z+ZJ3RO+NNVd7pQhlLYzkckWKlH1Xs2WMMPhTloQ+9PhpWj2rWZ3U0z9aOTaIl7C/S9vhJyhTL5h
lxckBwfC0gEW9zozo+GM0jveIJ1YQJGzdF/Gr7tAI0lueM2YouNLYRoV8/K5QcGMPMvD2qtyCCNu
CBF5nn3VIH8NMSf6IpWin0fd+7T4FaT5Na30DVdJ++xs6pF/PUzvdvqfgEVq
=7TJ4
-----END PGP SIGNATURE-----

--------------zg0xTqThLMTT05wGJ3Ydv80n--

