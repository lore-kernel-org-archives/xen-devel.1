Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B88C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 16:11:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413452.1643679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Kso-0006wM-VM; Wed, 09 Sep 2026 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413452.1643679; Wed, 09 Sep 2026 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Kso-0006wF-Sh; Wed, 09 Sep 2026 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1413452;
 Wed, 09 Sep 2026 16:10:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086ef8e26000c4f3@swg.vates.tech>)
 id 1x4Ksn-0006w9-FH
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:10:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Ksm-00HTqS-JC
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 18:10:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086ef8e26000c4f3@swg.vates.tech>)
 id 6aa184fe-bab6-0a2a0a5309dd-0a2a45049102-16
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 18:10:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086ef8e26000c4f3@swg.vates.tech>)
 id 6aa18504-b57f-0a2a45040019-b9ff1c228b11-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 18:10:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a086ef8e26000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 16:10:41 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CCEFF80518;
 Wed,  9 Sep 2026 18:10:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9NNFCQfDU3iYqavqMiFq2UaeIBizjyCH9ddiAciEbIk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QGkX+mUWzoQGL3fk2fEKytfaQvO92LzGEB8DCYLqtLCJhNkFE8pnRk+Vg2fvLGN393R1iIfQA
 nrzxgWx+hWgu6k7eQTTk2faZQbg4HV1ON//C96qH7ikFerJKNzb4NuzoK6l2cali7MQpmt9tWkV
 6VvyFVvrWLg/4fCWwZxqbibIwZiZ7nVyWt9w21/OYz3E35UOxgZS7dUZPyM03kvpMac5pBfmxjt
 hB/VNVTCiM3IR0Y6TRrV7fyLTJqRPXa2YM0MWCQUOQu2qj99YQJI9T9QdkT8CkqMuCenvwHGifR
 q8JkeJpaKN5VB6zLRmiKmL3mxGJ1zEso3p3rjs+LRuiQ==
X-Zone-Loop: 2c8db8930fe5dacf6d665c819fb9df91e0dc6f15b598
x-campaign-type: default
x-transaction-id: 6c587687-abb4-4aac-b3d0-8a09a7e70e3b
x-swg-uid: 01-1e5a0017-6422-4002-9f9f-b0acdada2fdd
X-Mailer: Sweego
Message-ID:
 <1788970241.8631fc262581453bbf619ec5b2062170.1a086ef8e26000c4f3@vates.tech>
x-swg-bid: 1788970241.8631fc262581453bbf619ec5b2062170.1a086ef8e26000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 9 Sep 2026 18:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@xenproject.org,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
 <4413f32d-3c76-4248-b7f9-577576bb4ea2@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <4413f32d-3c76-4248-b7f9-577576bb4ea2@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZTrvgSBTHOXXfsRvAG3m0tPG"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788970240971
X-purgate-ID: tlsNG-ebf023/1788970244-534C3B50-5554A5CD/0/0
X-purgate-type: clean
X-purgate-size: 9123

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZTrvgSBTHOXXfsRvAG3m0tPG
Content-Type: multipart/mixed; boundary="------------gF5QGscVnOhz5eh172NZunRi";
 protected-headers="v1"; hp="clear"
Message-ID: <222d4212-9091-4fa2-a48a-4d13249ba145@vates.tech>
Date: Wed, 9 Sep 2026 18:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@xenproject.org,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
 <4413f32d-3c76-4248-b7f9-577576bb4ea2@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <4413f32d-3c76-4248-b7f9-577576bb4ea2@citrix.com>

--------------gF5QGscVnOhz5eh172NZunRi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDkvMDkvMjAyNiDDoCAxNzozNSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAwOS8wOS8yMDI2IDE6MTIgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4gV2hlbiBzZXR0
aW5ncyBIVk1fUEFSQU1fSURFTlRfUFQsIHNraXAgZG9tYWluIHBhdXNpbmcgd2hlbiA6DQo+
PiAtIHRoZXJlIGlzIG5vIHZjcHUNCj4+IC0gdW5yZXN0cmljdGVkIGd1ZXN0IGNhcGFiaWxp
dHkgaXMgdXNlZA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5h
c3RpZUB2YXRlcy50ZWNoPg0KPj4gLS0tDQo+PiBSZWdhcmRpbmcgY2hlY2tpbmcgZm9yIGh2
bV9wYWdpbmdfZW5hYmxlZCh2KSAocHJvcG9zZWQgaW4gdjIgcmV2aWV3KSwgd2UgY2FuJ3QN
Cj4+IGFzIGh2bV9wYWdpbmdfZW5hYmxlZCgpIGlzIHZDUFUgc3BlY2lmaWMsIGFuZCB2Q1BV
IDAgbWF5IGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUNCj4+IHRvIGFub3RoZXIgb25lLg0KPj4N
Cj4+IHYzOg0KPj4gICAtIHJlYmFzZWQgcGF0Y2hlcyB3aXRoIHN0YWdpbmcNCj4+ICAgLSBh
ZGp1c3RlZCBmb3JtYXR0aW5nDQo+Pg0KPj4gdjI6DQo+PiAgIC0gcmViYXNlZCBwYXRjaGVz
IHdpdGggc3RhZ2luZw0KPj4NCj4+ICAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDUgKysr
Ky0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYw0KPj4gaW5kZXggOWE0MTQ3YjYyZS4uMjk4MWE2MWNlZSAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMNCj4+IEBAIC00MjM3LDExICs0MjM3LDE0IEBAIHN0YXRpYyBpbnQg
aHZtX3NldF9wYXJhbShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0
X3QgdmFsdWUpDQo+PiAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsNCj4+ICAgICAgICAg
ICBicmVhazsNCj4+ICAgICAgIGNhc2UgSFZNX1BBUkFNX0lERU5UX1BUOg0KPj4gKyAgICAg
ICAgdiA9IGRvbWFpbl92Y3B1KGQsIDApOw0KPj4gKw0KPj4gICAgICAgICAgIC8qDQo+PiAg
ICAgICAgICAgICogT25seSBhY3R1YWxseSByZXF1aXJlZCBmb3IgVlQteCBsYWNraW5nIHVu
cmVzdHJpY3RlZF9ndWVzdA0KPj4gICAgICAgICAgICAqIGNhcGFiaWxpdGllcy4gIFNob3J0
IGNpcmN1aXQgdGhlIHBhdXNlIGlmIHBvc3NpYmxlLg0KPj4gICAgICAgICAgICAqLw0KPj4g
LSAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV9zaGFkb3coZCkgfHwgIXVzaW5nX3ZteCgpICkN
Cj4+ICsgICAgICAgIGlmICggcGFnaW5nX21vZGVfc2hhZG93KGQpIHx8ICF1c2luZ192bXgo
KSB8fCAhdiB8fA0KPj4gKyAgICAgICAgICAgICB2bXhfdW5yZXN0cmljdGVkX2d1ZXN0KHYp
ICkNCj4+ICAgICAgICAgICAgICAgYnJlYWs7DQo+IA0KPiBUaGUgY29tbWVudCBpc24ndCBy
ZWFsbHkgY29ycmVjdCwgYW5kIHVzaW5nIHZteF91bnJlc3RyaWN0ZWRfZ3Vlc3QoKQ0KPiBp
c24ndCByZWFsbHkgY29ycmVjdCBlaXRoZXIuDQo+IA0KPiBIb3cgYWJvdXQgdGhpcyBpbnN0
ZWFkOg0KPiANCj4gIMKgIMKgIMKgIMKgIC8qDQo+ICDCoCDCoCDCoCDCoCDCoCogSURFTlRf
UFQgaXMgbmVlZGVkIG9ubHkgZm9yIE5laGFsZW0tZXJhIFZULXgsIHdoZXJlIEVQVCBpcw0K
PiAgwqAgwqAgwqAgwqAgwqAqIGF2YWlsYWJsZSBidXQgVW5yZXN0cmljdGVkIEd1ZXN0IGlz
IG5vdC4NCj4gIMKgIMKgIMKgIMKgIMKgKg0KPiAgwqAgwqAgwqAgwqAgwqAqIFRoZSBpZGVu
dGl0eSBwYWdldGFibGUgaXMgY29uZmlndXJlZCBieSB0aGUgdG9vbHN0YWNrIG9yIGh2bWxv
YWRlciwNCj4gIMKgIMKgIMKgIMKgIMKgKiBhbmQgdGhlIHBhcmFtIG5lZWRzIHRvIG1vdmUg
aW4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0gaW4gY2FzZSB0aGUgVk0NCj4gIMKgIMKgIMKgIMKg
IMKgKiBsYW5kcyBvbiBhbiBFUFQgJiYgIVVucmVzdHJpY3RlZCBzeXN0ZW0uDQo+ICDCoCDC
oCDCoCDCoCDCoCoNCj4gIMKgIMKgIMKgIMKgIMKgKiBOb3RoaW5nLCBiZXNpZGVzIHJlY29y
ZGluZyB0aGUgdmFsdWUsIG5lZWRzIHRvIGhhcHBlbiBvdGhlciB0aGFuDQo+ICDCoCDCoCDC
oCDCoCDCoCogZm9yIFZULXggRVBUICYmICFVbnJlc3RyaWN0ZWQgVk1zLg0KPiAgwqAgwqAg
wqAgwqAgwqAqDQo+ICDCoCDCoCDCoCDCoCDCoCogVE9ETzogVW5yZXN0cmljdGVkIEd1ZXN0
IHNob3VsZCBiZSBhIGRvbWFpbiBwcm9wZXJ0eSBub3QgYSB2Q1BVDQo+ICDCoCDCoCDCoCDC
oCDCoCogcHJvcGVydHkuDQo+ICDCoCDCoCDCoCDCoCDCoCovDQo+ICDCoCDCoCDCoCDCoCB2
ID0gZG9tYWluX3ZjcHUoZCwgMCk7DQo+ICDCoCDCoCDCoCDCoCBpZiAoICF1c2luZ192bXgo
KSB8fCAhcGFnaW5nX21vZGVfaGFwKGQpIHx8ICF2IHx8DQo+ICDCoCDCoCDCoCDCoCDCoCDC
oCDCoHZteF91bnJlc3RyaWN0ZWRfZ3Vlc3QodikgKQ0KPiAgwqAgwqAgwqAgwqAgwqAgwqAg
YnJlYWs7DQo+IA0KDQpJJ20gb2sgd2l0aCBpdCAodGhvdWdoIHJlZ2FyZGluZyBwYWdpbmdf
bW9kZV9oYXAsIEkgdGhpbmsgDQpwYWdpbmdfbW9kZV9zaGFkb3cgaXMgcHJlZmVyZWQgaGVy
ZSBiZWNhdXNlIGl0IHdpbGwgdHJhbnNsYXRlIGludG8gDQpkaXJlY3RseSAwIGlmIHNoYWRv
dyBwYWdpbmcgaXMgZGlzYWJsZWQsIG90aGVyd2lzZSB3ZSBjaGVjayBmb3IgDQpQR19IQVBf
ZW5hYmxlLCBhdCBsZWFzdCwgdGhhdCdzIHdoYXQgWzFdIHNlZW1zIHRvIGJlIGFib3V0KS4N
Cg0KQnV0IGlmIHdlIG1vdmUgdW5yZXN0cmljdGVkIGd1ZXN0IGFzIGJlaW5nIGEgZG9tYWlu
LXdpZGUgcHJvcGVybHkgKG9yIA0KYWx0ZXJuYXRpdmVseSBhIHN5c3RlbS13aWRlIG9uZSk7
IHRoYXQgY291bGQgbWFrZSB0aGluZ3Mgc2ltcGxlci4NCg0KWzFdIHg4Ni9wYWdpbmc6IHJl
cGxhY2UgIXBhZ2luZ19tb2RlX2hhcCgpIHdpdGggcGFnaW5nX21vZGVfc2hhZG93KCkNCg0K
PiANCj4gVGhlIGNhc2Ugb2Ygbm8gdkNQVXMgaXNuJ3QgdmVyeSBpbnRlcmVzdGluZzsgaW4g
dGhhdCBjYXNlLCBwYXVzaW5nIHRoZQ0KPiBkb21haW4gaXMgZnJlZS7CoCBXZSBjYW4gYXQg
bGVhc3Qgbm90ZSB0aGF0IHRoZSBkYXRhIGlzIGluIHRoZSB3cm9uZw0KPiBwbGFjZSwgZXZl
biBpZiB3ZSBkb24ndCBmaXggaXQgeWV0Lg0KPiANCg0KVGhlIGNoZWNrIGZvciAhdiBpcyBt
b3N0bHkgcmVxdWlyZWQgZm9yIHZteF91bnJlc3RyaWN0ZWRfZ3Vlc3QodikgdG8gbm90IA0K
ZGVyZWZlcmVuY2UgTlVMTC4NCg0KPiB+QW5kcmV3DQoNClRlZGR5DQo=

--------------gF5QGscVnOhz5eh172NZunRi--

--------------ZTrvgSBTHOXXfsRvAG3m0tPG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqhhQAFAwAAAAAACgkQZg+p0QLLz9Dc
igv9FxG36GXQ1Sg8SZ6fH34KGiBBkz1pcBSvxYB92Q+cXuzwnTUp81gYt/NPbciLXzp1YR3IglTf
ZQgdScSS/kX7Xma/Lafhia9sa0a7b/rd9ONEh2nIRrUQmwHxXhJsBvMkTRMHC1wFtxsW1GoWSn8a
P/uWpLfMWzFtJHHq+7aqGX2QD28GxFux92arelxVCG7VzXs5jRbkAd3T8240cLZAuNw2rl5Yn8Uf
dFX8pfCjvxs5akNyFCG8ZNzl0nfHDZ3EkU0nLvDZZFHqSBeAOCZa64adgMuNCMQJEs+rD+5y+Nx3
5NpS4an2xv3boFKi+q07+MBn/0uAXGMSr5cPD0rKbo8ZKHThxV4AxqIEHOYLcIQz4AO/MhWUNT/o
jO9fjGQYNi6Yv/sXfA5Xm2QXLRzfn4+xr85iWuLwW22StcO1LunR466VpIFVkJArK/CxMN8wbkq/
tKkavA22X2lOZzclrINu9iNYGPhZK56Xx0ih3gps6V3P0fegiARulTp3Pzy5
=6LWX
-----END PGP SIGNATURE-----

--------------ZTrvgSBTHOXXfsRvAG3m0tPG--

