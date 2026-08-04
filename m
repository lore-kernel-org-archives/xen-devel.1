Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90080C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 10:30:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382090.1625490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCPy-0003dJ-Tc; Tue, 04 Aug 2026 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382090.1625490; Tue, 04 Aug 2026 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrCPy-0003dC-R9; Tue, 04 Aug 2026 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1382090;
 Tue, 04 Aug 2026 10:30:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fcc534b55000e099@swg.vates.tech>)
 id 1wrCPx-0003d6-U4
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrCPx-008S8k-1s
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 12:30:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fcc534b55000e099@swg.vates.tech>)
 id 6a71bf48-bab6-0a2a0a5309dd-0a2a45018890-20
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:30:40 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fcc534b55000e099@swg.vates.tech>)
 id 6a71bf50-5984-0a2a45010019-b9ff1c2392cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 12:30:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fcc534b55000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Aug 2026 10:30:38 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D5A9882B38;
 Tue,  4 Aug 2026 12:30:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=zZvTd+A2AJmp5zfcAxTGKFv6JW42t67YlT7CJlkzJ2E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZfxHyD/dqMUR8OdMZ1EmSMLVn4gFHSliuuXtCc059BdXuDkOfYQ1VIEvVMaWvXGEOM2jj+GEf
 bQBpVmZ0EH4ELE4HECdtF8YeoNkW976m7WHGx/HthPbuR/biF2pZXNOGW+kw/jQXdesMjMZBiqY
 oRzvl9YFbHASRL8r3lFLGi3X3gmk9LedHc2lSVUGDDvich9KFo4rpID+j4q/+LzDFHO3HeZhM/x
 atuzuw1ALtCfa65IJEWOZOg1nPauCooWEdKi7ULAMOevxSp5IZgz9DpxIpkxVdD6e0tsjKNON3k
 mHI3I6fDwne0d1R5Ki5eT2w6BPo5BXBd061a66gQR8mw==
X-Zone-Loop: 5a14cca138ed5b2c24699c48932ac69c099221f97f91
x-campaign-type: default
x-transaction-id: b87eefd5-552d-4b01-b45d-3aa199a70e53
x-swg-uid: 01-d2f83eec-1717-4f12-9172-00c1fd93b1e0
X-Mailer: Sweego
Message-ID:
 <1785839438.8631fc262581453bbf619ec5b2062170.19fcc534b55000e099@vates.tech>
x-swg-bid: 1785839438.8631fc262581453bbf619ec5b2062170.19fcc534b55000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 4 Aug 2026 12:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/4] x86: add new pte_get_and_clear hypercall
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-5-kevin.lampis@citrix.com>
Content-Language: en-US
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260727150615.1373200-5-kevin.lampis@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MxACY9YVHgqPACfBH3sKssh2"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785839437997
X-purgate-ID: tlsNG-d62444/1785839440-1F262757-D7B2A83C/0/0
X-purgate-type: clean
X-purgate-size: 10018

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MxACY9YVHgqPACfBH3sKssh2
Content-Type: multipart/mixed; boundary="------------Lj3c0HMPasC8mjY3UC1lTLsW";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com
Message-ID: <515e7c68-19a0-4d8c-815c-ca062a1aad04@vates.tech>
Subject: Re: [PATCH 4/4] x86: add new pte_get_and_clear hypercall
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
 <20260727150615.1373200-5-kevin.lampis@citrix.com>
In-Reply-To: <20260727150615.1373200-5-kevin.lampis@citrix.com>

--------------Lj3c0HMPasC8mjY3UC1lTLsW
Content-Type: multipart/mixed; boundary="------------IFX40LrLar5N7Oq0qB0i5dsL"

--------------IFX40LrLar5N7Oq0qB0i5dsL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjcvMDcvMjAyNiDDoCAxNzowNywgS2V2aW4gTGFtcGlzIGEgw6ljcml0wqA6DQo+IFRo
aXMgbmV3IGh5cGVyY2FsbCB1c2VzIHRoZSBzYW1lIGludGVyZmFjZSBhcyB0aGUgbW11X3Vw
ZGF0ZSBoeXBlcmNhbGwgZXhjZXB0DQo+IHRoZSBvbGQgUFRFIHZhbHVlIGlzIHJldHVybmVk
IGluIHRoZSBtbXVfdXBkYXRlX3QtPnZhbCBmaWVsZC4NCj4gDQo+IFRoZSBwdXJwb3NlIG9m
IHRoaXMgbmV3IGh5cGVyY2FsbCBpcyB0byBpbXByb3ZlIHBlcmZvcm1hbmNlIG92ZXIgdGhl
IGN1cnJlbnQNCj4gdHJhcCBhbmQgZW11bGF0ZSBiZWhhdmlvci4gT25seSBsMSBQVEVzIGFy
ZSBzdXBwb3J0ZWQgYmVjYXVzZSB0aGV5IGhhdmUgdGhlDQo+IGJpZ2dlc3QgcGVyZm9ybWFu
Y2UgaW1wYWN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gTGFtcGlzIDxrZXZpbi5s
YW1waXNAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2L21tLmMgICAgICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIHhlbi9pbmNsdWRlL2h5
cGVyY2FsbC1kZWZzLmMgfCAgMiArKw0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAg
ICAgfCAgMSArDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVu
L2FyY2gveDg2L21tLmMNCj4gaW5kZXggMjc4Yjk5MmFjYTVjLi5lNWZkZmM2NjA4MWEgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jDQo+IEBAIC0zOTkzLDYgKzM5OTMsNyBAQCBzdGF0aWMgbG9uZyBfX2RvX21tdV91cGRh
dGUoDQo+ICAgICAgIHVuc2lnbmVkIGludCBjb3VudCwNCg0KLi4uDQoNCj4gICAjZW5kaWYg
LyogQ09ORklHX1BWICovDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9oeXBlcmNhbGwt
ZGVmcy5jIGIveGVuL2luY2x1ZGUvaHlwZXJjYWxsLWRlZnMuYw0KPiBpbmRleCBhNjI1ZDYz
NGI2OTQuLjA1NTJlOTNhYjU2MCAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvaHlwZXJj
YWxsLWRlZnMuYw0KPiArKysgYi94ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVmcy5jDQo+IEBA
IC0xNzQsNiArMTc0LDcgQEAgbXVsdGljYWxsKG11bHRpY2FsbF9lbnRyeV90ICpjYWxsX2xp
c3QsIHVuc2lnbmVkIGxvbmcgbnJfY2FsbHMpDQo+ICAgI2lmZGVmIENPTkZJR19QVg0KPiAg
IG1tdWV4dF9vcChtbXVleHRfb3BfdCAqdW9wcywgdW5zaWduZWQgaW50IGNvdW50LCB1bnNp
Z25lZCBpbnQgKnBkb25lLCB1bnNpZ25lZCBpbnQgZm9yZWlnbmRvbSkNCj4gICBtbXVfdXBk
YXRlKG1tdV91cGRhdGVfdCAqdXJlcXMsIHVuc2lnbmVkIGludCBjb3VudCwgdW5zaWduZWQg
aW50ICpwZG9uZSwgdW5zaWduZWQgaW50IGZvcmVpZ25kb20pDQo+ICtwdGVfZ2V0X2FuZF9j
bGVhcihtbXVfdXBkYXRlX3QgKnVyZXFzLCB1bnNpZ25lZCBpbnQgY291bnQsIHVuc2lnbmVk
IGludCAqcGRvbmUsIHVuc2lnbmVkIGludCBmb3JlaWduZG9tKQ0KPiAgIHN0YWNrX3N3aXRj
aCh1bnNpZ25lZCBsb25nIHNzLCB1bnNpZ25lZCBsb25nIGVzcCkNCj4gICBmcHVfdGFza3N3
aXRjaChpbnQgc2V0KQ0KPiAgIHNldF9kZWJ1Z3JlZyhpbnQgcmVnLCB1bnNpZ25lZCBsb25n
IHZhbHVlKQ0KPiBAQCAtMjMyLDYgKzIzMyw3IEBAIGNhbGxlcjogYXJtDQo+ICAgdGFibGU6
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdjMyICAgICBwdjY0ICAgICBodm0zMiAg
ICBodm02NCAgICBhcm0NCj4gICBzZXRfdHJhcF90YWJsZSAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdCAgIGRvICAgICAgIC0gICAgICAgIC0gICAgICAgIC0NCj4gICBtbXVfdXBkYXRl
ICAgICAgICAgICAgICAgICAgICAgICAgIGRvOjEgICAgIGRvOjEgICAgIC0gICAgICAgIC0g
ICAgICAgIC0NCj4gK3B0ZV9nZXRfYW5kX2NsZWFyICAgICAgICAgICAgICAgICAgZG86MSAg
ICAgZG86MSAgICAgLSAgICAgICAgLSAgICAgICAgLQ0KPiAgIHNldF9nZHQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0ICAgZG8gICAgICAgLSAgICAgICAgLSAgICAgICAg
LQ0KPiAgIHN0YWNrX3N3aXRjaCAgICAgICAgICAgICAgICAgICAgICAgZG86MiAgICAgZG86
MiAgICAgLSAgICAgICAgLSAgICAgICAgLQ0KPiAgIHNldF9jYWxsYmFja3MgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0ICAgZG8gICAgICAgLSAgICAgICAgLSAgICAgICAgLQ0KPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL3hlbi5oDQo+IGluZGV4IDIxNDliOGRkMzgwOC4uOWUyYmEwMTA3ZDNiIDEwMDY0NA0K
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgNCj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL3hlbi5oDQo+IEBAIC0xMTgsNiArMTE4LDcgQEAgREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUoeGVuX3Vsb25nX3QpOw0KPiAgICNkZWZpbmUgX19IWVBFUlZJU09SX3hlbnBtdV9v
cCAgICAgICAgICAgIDQwDQo+ICAgI2RlZmluZSBfX0hZUEVSVklTT1JfZG1fb3AgICAgICAg
ICAgICAgICAgNDENCj4gICAjZGVmaW5lIF9fSFlQRVJWSVNPUl9oeXBmc19vcCAgICAgICAg
ICAgICA0Mg0KPiArI2RlZmluZSBfX0hZUEVSVklTT1JfcHRlX2dldF9hbmRfY2xlYXIgICAg
NDMNCj4gICANCg0KSSdtIG5vdCBzdXJlIF9fSFlQRVJWSVNPUl9wdGVfZ2V0X2FuZF9jbGVh
ciBpcyBhIGdyZWF0IG5hbWUsIGFzIEkgDQp1bmRlcnN0YW5kIGl0LCBpdCdzIG1vcmUgdGhh
dCBpdCdzIGRvaW5nIChtb3JlIGdlbmVyYWwpIENNUFhDSEcgDQpvcGVyYXRpb24gYW5kIHJl
dHVybmluZyB0aGUgb2xkIHZhbHVlIHRoYW4gc3RyaWN0bHkgZG9pbmcgYSANCmdldF9hbmRf
Y2xlYXIgb25lICh3aGljaCBpcyB0aGUgbWFpbiBpbnRlbnQgZm9yIExpbnV4KS4NCg0KSSBh
bHNvIHRoaW5rIHdlIGNhbiBmaW5kIGEgd2F5IHRvIGV4cGFuZCBIWVBFUlZJU09SX21tdV91
cGRhdGUgaW5zdGVhZCANCm9mIGludHJvZHVjaW5nIGEgbmV3IGh5cGVyY2FsbC4NCg0KSFlQ
RVJWSVNPUl9tbXVfdXBkYXRlIGFjdHVhbGx5IGhhcyBhIHVuZG9jdW1lbnRlZCAiYWN0dWFs
bHkgcmVzZXJ2ZWQgDQpiaXQiIChhdCBsZWFzdCwgZm9yIFBWMzItcGFlIGFuZCBQVjY0IGd1
ZXN0cykgd2hpY2ggY3VycmVudGx5IG11c3QgYmUgDQp6ZXJvIChvdGhlcndpc2UsIGh5cGVy
Y2FsbCBmYWlscyk7IGJ1dCB3ZSBjYW4gcmVwdXJwb3NlIGl0IHRvIGV4cGFuZCANCmF2YWls
YWJsZSBjb21tYW5kIGNvdW50IHRvIGFkZCAiY21weGNoZyBzZW1hbnRpY3MiIHZhcmlhbnRz
LiBUaGF0IHdvdWxkIA0KZ3JlYXRseSBzaW1wbGlmeSB0aGUgaW1wbGVtZW50YXRpb24gYXMg
d2Ugd29uJ3QgaGF2ZSB0byBpbnRyb2R1Y2UgYSBuZXcgDQpzZXBhcmF0ZSBoeXBlcmNhbGwg
anVzdCBmb3IgdGhpcy4NCihJIHdpbGwgc2VuZCBhIHBhdGNoIHJlZ2FyZGluZyB0aGlzIGlu
IHBhcnRpY3VsYXIpDQoNCi0tLQ0KDQpBc2lkZSB0aGF0LCBuZXcgZmVhdHVyZXMgd2FudHMg
dG8gYmUgZW51bWVyYXRlZCBzbyB0aGF0IHRoZSBrZXJuZWwga25vd3MgDQp0aGF0IGl0J3Mg
c3VwcG9ydGVkIGJlZm9yZSB0cnlpbmcgdG8gdXNlIGl0LiBXZSBjYW4gZXhwYW5kIGZlYXR1
cmVzLmggDQp3aXRoIGEgbmV3IGZsYWcgZm9yIHRoaXMuDQoNCj4gICAvKiBBcmNoaXRlY3R1
cmUtc3BlY2lmaWMgaHlwZXJjYWxsIGRlZmluaXRpb25zLiAqLw0KPiAgICNkZWZpbmUgX19I
WVBFUlZJU09SX2FyY2hfMCAgICAgICAgICAgICAgIDQ4DQoNClRlZGR5DQo=
--------------IFX40LrLar5N7Oq0qB0i5dsL
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7L
TBVHV/XOZw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJ
T4ny+OGntnJntUoRKRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJA
WicutjkkUgd28Bh6HV9EIumHtCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO
8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaTVqMdqul07o72m3eA2mf+LMu9a04FX/d4
wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/EoucejoZ5SH49ksmVAmKOLkt
OaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+SPhHar7TPKjFz0G3D
PNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89MXfQXZ3q
t1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWj
moACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNz
uyOVCskwfUZPla6Zpd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp
0x0HfuhcYfAYPR46XHTvjaJEv99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuR
OxdK8G+YHccJY8PvWSq2K2yiae2KGiAv1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50
wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhPeP3IdpfWc8cyRLXF06Rk46YM
YCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcTUwgnYlFRk2FLq0Qe
KEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9Egr/Wmu3
MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEM
AKiQiZa3yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ
3DbVf+en3/FvdVZg2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTm
etSG5/52AjtmPFtlXAk0NmLvfJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0
s3109sJeXT5ImVdphFs9cvyZyBT9t1PbRowv58EgV0zE4hbAeVkULAbxFV5b/ExT
jjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKbYu6NCfiHfEyB3Xyg9hfdrRgj
MRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ovXoK4jm+Py0FiUGUa
A6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/eVtR2Q1w
ZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWj
moACGwwACgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiV
oUiHYN5QwhnbZnsaJDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764Qxy
X6rld2f2RcWkDuBHun55ZWXjby8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk
/dS0XTOQi2wVUb17sW/+ybCEokdVacZGzOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fu
oGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+lOWSvdNHgoEkWR0RXBPQjnGm
LKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/OffO485NOTKwGOxyWb0
06cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR8ULR9nX0
LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------IFX40LrLar5N7Oq0qB0i5dsL--

--------------Lj3c0HMPasC8mjY3UC1lTLsW--

--------------MxACY9YVHgqPACfBH3sKssh2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpxv00FAwAAAAAACgkQZg+p0QLLz9Ci
nQv/VvGFEbUTC5o7Bn7nY5jNoQgfXOeAu582//4PlPlCGmptOeSCXWRNBe148Yrbjsf89bQSYC9J
CuzJ2RSb2FFbRoHoTflR1biBJp22ptSnbi0mPMXKWODfGkNH6F8gmo045StniJr7TfVtu8PnIhXz
nZc0BUAmOG+Swq6/Udwl23VgG1qNXvCQRXQeWsyrEoNCTo8FM2LjTY5vEOaBU/iHkiFgHoblP7gS
wn4NUaqiK1aTZSxW4qhw29y8N2PVfXTKTbx+lfLZT2BRAqvKXXrkh54TI1HdzOmcRv11rhQPHzj4
p3qylNA3Fd7RwF61DAXDCux9J1MsAc8aYmkaEhxl1pgh2GiwOGFkHqbYmAJBqDVJXynTAutl4Djg
lGvwG75wVHGENZs2PfKJUmps55zIK2wCjs5hG7QU7EiUayHPyosiq3ozz6u2nCQZWvZJdaYukxjt
tidgAqN6/7yNqqREPTQKI+pVcIeEvNUV3pjrQiPbpHJQnER2d5jjp+K2vBET
=hjVR
-----END PGP SIGNATURE-----

--------------MxACY9YVHgqPACfBH3sKssh2--

