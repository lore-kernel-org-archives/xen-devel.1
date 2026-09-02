Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27219C624D4
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 22:52:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406277.1639640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1toX-0005sh-Dt; Wed, 02 Sep 2026 22:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406277.1639640; Wed, 02 Sep 2026 22:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1toX-0005sa-Aw; Wed, 02 Sep 2026 22:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1406277;
 Wed, 02 Sep 2026 22:52:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@swg.vates.tech>)
 id 1x1toV-0005sT-C1
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 22:52:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1toU-000LwR-4Y
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:52:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@swg.vates.tech>)
 id 6a98a897-e002-0a2a0a5209dd-0a2a4508cebc-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:52:09 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@swg.vates.tech>)
 id 6a98a893-f659-0a2a45080019-b9ff1c22904b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:52:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a064527434000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Sep 2026 22:52:00 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 58DB885EC7;
 Thu,  3 Sep 2026 00:51:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CK3C5Y/18iCVBZZ2hyVX1QpYXrpr0vXywX4Tj/6spNA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=AqTvYXEXmpkZPXF8XlTSxFUNJwZFj+rz5ZdFizLzV97UzCAWmxaJKsIpcsKhYmbQZi/yQguo/
 Zgrv9CkYtOwoGWL5X8qWmfRsB8NLgM1mae+e40hMwlh2gQVc0V1s1Xbx3kzMx13SHiR7fIQ3ka/
 x9TS374YeK8Wx9o2qMHF6mHTdaHH4mNcYSBSpuRSfnAWLKbZ6JGzbJCSlE/TO6wJvttgZT3M2j8
 KPaCNTD0Do7fpDd39IImIdaD6Pc2v/S6IVYTcVlyPYWp5NR1BOsIGXM0mD5soTf/ZupYgerrp6v
 GOxlsNI8DDS9lxKaMsUdcIIgmrqhsCIw+xOzhu6Z2Q1Q==
X-Zone-Loop: a9b0216049483c9c8b228e1296ce4d931935d9cd03a6
x-campaign-type: default
x-transaction-id: d23813cd-44b0-4b8e-80bf-3b2bbeedd875
x-swg-uid: 01-b2dc0ef8-bc52-46df-ad58-43f01a3e51ab
X-Mailer: Sweego
Message-ID:
 <1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@vates.tech>
x-swg-bid: 1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 3 Sep 2026 00:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6H4PmcArdL9dnUggMSTVkPNg"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788389519471
X-purgate-ID: tlsNG-c1860d/1788389529-CE94287B-481F807C/0/0
X-purgate-type: clean
X-purgate-size: 8696

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6H4PmcArdL9dnUggMSTVkPNg
Content-Type: multipart/mixed; boundary="------------djJmaOhfXGhknmtRNdhkEBtR";
 protected-headers="v1"; hp="clear"
Message-ID: <2c2c2043-82be-458d-99cc-102f78b93c61@vates.tech>
Date: Thu, 3 Sep 2026 00:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260902221000.2967167-1-andrew.cooper3@citrix.com>

--------------djJmaOhfXGhknmtRNdhkEBtR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDMvMDkvMjAyNiDDoCAwMDoxNCwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBC
bG9jayBsb2FkcyB3aGljaCBhcmUga25vd24gdG8gaGFuZyB0aGUgc3lzdGVtLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz4NCj4gQ0M6IFRlZGR5
IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gQSBtb3JlIGNvbXBsZXRl
IHNvbHV0aW9uIGlzIGluIHRoZSB3b3JrcywgYnV0IGl0J3MgdGFrZW4gNCBtb250aHMgdG8g
Z2V0IHRoaXMNCj4gbXVjaCBwdWJsaXNoZWQuLi4NCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2
L2NwdS9taWNyb2NvZGUvaW50ZWwuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYyBiL3hlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMNCj4gaW5kZXggYzQ1YjAwYzZiMDMzLi4yMTYw
YmVmZDMxOTcgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2lu
dGVsLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYw0KPiBA
QCAtMjcsNiArMjcsNyBAQA0KPiAgICNpbmNsdWRlIDx4ZW4vc3RyaW5nLmg+DQo+ICAgI2lu
Y2x1ZGUgPHhlbi94bWFsbG9jLmg+DQo+ICAgDQo+ICsjaW5jbHVkZSA8YXNtL2ludGVsLWZh
bWlseS5oPg0KPiAgICNpbmNsdWRlIDxhc20vbXNyLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9w
cm9jZXNzb3IuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPg0KPiBAQCAtMjczLDYg
KzI3NCwzNSBAQCBzdGF0aWMgYm9vbCBtaWNyb2NvZGVfZml0c19jcHUoY29uc3Qgc3RydWN0
IG1pY3JvY29kZV9wYXRjaCAqbWMpDQo+ICAgICAgIHJldHVybiBmYWxzZTsNCj4gICB9DQo+
ICAgDQo+ICtzdGF0aWMgYm9vbCBtaWNyb2NvZGVfc2FmZV90b19sb2FkKGNvbnN0IHN0cnVj
dCBtaWNyb2NvZGVfcGF0Y2ggKm1jKQ0KPiArew0KPiArICAgIHN0cnVjdCBjcHVfc2lnbmF0
dXJlICpjcHVfc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOw0KPiArDQo+ICsgICAgLyoNCj4g
KyAgICAgKiBUcmVhdCBwcmUtcHJvZHVjdGlvbiBhcyBhbHdheXMgc2FmZSAtIGFueW9uZSB1
c2luZyBwcmUtcHJvZHVjdGlvbg0KPiArICAgICAqIG1pY3JvY29kZSBrbm93cyB3aGF0IHRo
ZXkgYXJlIGRvaW5nLCBhbmQgY2FuIGtlZXAgYW55IHJlc3VsdGluZyBwaWVjZXMuDQo+ICsg
ICAgICovDQo+ICsgICAgaWYgKCBjcHVfc2lnLT5yZXYgPCAwIHx8IG1jLT5yZXYgPCAwICkN
Cg0KY3B1X3NpZy0+cmV2IGNhbid0IGJlIG5lZ2F0aXZlIGFzIGl0J3MgdW5zaWduZWQgaW50
Lg0KSSBndWVzcyB0aGF0J3Mgc29tZXRoaW5nIHRvIGZpeCBpbiBvdXIgc3RydWN0IGNwdV9z
aWduYXR1cmUgYW5kIGhvdyB3ZSANCmdldCBpdC4gVGhvdWdoIHRoZSBzdHJ1Y3R1cmUgaXMg
c2hhcmVkIHdpdGggQU1ELCBhbmQgSSBkb24ndCBrbm93IGlmIGl0IA0KYWxzbyB1c2VzICJu
ZWdhdGl2ZSIgcmV2aXNpb25zIGZvciBub24tcHJvZHVjdGlvbiB1Y29kZSAoUFBSIGRvZXNu
J3QgDQp0ZWxsIGFueXRoaW5nIGluIHRoYXQgcmVnYXJkKS4NCg0KPiArICAgICAgICByZXR1
cm4gdHJ1ZTsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogR05SOTguICBHcmFuaXRlIFJh
cGlkcyBzeXN0ZW1zIGhhbmcgd2hlbiBsb2FkaW5nIG5ldyB1Y29kZSBvbg0KPiArICAgICAq
IHN1ZmZpY2llbnRseSBvbGQgZmlybXdhcmUuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCBi
b290X2NwdV9kYXRhLnZmbSA9PSBJTlRFTF9HUkFOSVRFUkFQSURTX1ggJiYNCj4gKyAgICAg
ICAgIGJvb3RfY3B1X2RhdGEuc3RlcHBpbmcgPT0gMSAmJiAoY3B1X3NpZy0+cGYgJiAweDk1
KSAmJg0KPiArICAgICAgICAgY3B1X3NpZy0+cmV2IDwgMHgwMTAwMDQwNSAmJg0KPiArICAg
ICAgICAgbWMtPnJldiAgICAgID4gMHgwMTAwMDQwNSApDQo+ICsgICAgew0KPiArICAgICAg
ICBwcmludGtfb25jZShYRU5MT0dfV0FSTklORw0KPiArICAgICAgICAgICAgICAgICAgICAi
bWljcm9jb2RlOiBHcmFuaXRlIFJhcGlkcyBlcnJhdHVtIEdOUjk4IGRldGVjdGVkLiAgU2tp
cHBpbmcgdWNvZGUgMHglMDh4XG4iDQo+ICsgICAgICAgICAgICAgICAgICAgICJtaWNyb2Nv
ZGU6IEZpcm13YXJlIHVwZGF0ZSByZWNvbW1lbmRlZFxuIiwgbWMtPnJldik7DQo+ICsgICAg
ICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICByZXR1cm4gdHJ1ZTsN
Cj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW50ZWxfY29tcGFyZSgNCj4g
ICAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqb2xkLCBjb25zdCBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoICpuZXcpDQo+ICAgew0KPiBAQCAtMzY1LDYgKzM5NSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjZl9jaGVjayBpbnRlbF91Y29kZV9wYXJz
ZSgNCj4gICAgICAgICAgICAqIG9uZSB3aXRoIGhpZ2hlciByZXZpc2lvbi4NCj4gICAgICAg
ICAgICAqLw0KPiAgICAgICAgICAgaWYgKCBtaWNyb2NvZGVfZml0c19jcHUobWMpICYmDQo+
ICsgICAgICAgICAgICAgbWljcm9jb2RlX3NhZmVfdG9fbG9hZChtYykgJiYNCj4gICAgICAg
ICAgICAgICAgKCFzYXZlZCB8fCBjb21wYXJlX3JldmlzaW9ucyhzYXZlZC0+cmV2LCBtYy0+
cmV2KSA9PSBORVdfVUNPREUpICkNCj4gICAgICAgICAgICAgICBzYXZlZCA9IG1jOw0KPiAg
IA0KDQpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lOyBhcyBteSBjb25jZXJuIGlzIHVucmVs
YXRlZCB0byBjaGFuZ2UgaXRzZWxmIA0KKGFuZCBkb2Vzbid0IGFmZmVjdCBwcm9kdWN0aW9u
IG1pY3JvY29kZSBhbnl3YXkpLg0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5
LmFzdGllQHZhdGVzLnRlY2g+DQo=

--------------djJmaOhfXGhknmtRNdhkEBtR--

--------------6H4PmcArdL9dnUggMSTVkPNg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqYqI4FAwAAAAAACgkQZg+p0QLLz9AZ
NQv9GFZMFc2AqqtktECnLNJb0D4mSMPyfhlpXITLNC3RUixrkOgjeAD41J5gNn3SfbEsBXKtdEoS
b5BAb1oieWyoXOIBFF+vg0NYT2Zw7QKekPwF3jVzuIfctpGogvGC5fGM89R9hH0J60RwU8SX9j5g
p7m13XaOUAMkjZ4lP6Jzz2qCFjc8kUDNgtqfU7hoCpFfayrfRMkhHL1JeuS4BNULE7F9vH1hzTrv
VODVTnXSLU6dlUSUdPt9KXIMw0NRinMMGDekHq+6HsonVHNAnYU6flWsfgz49Reg1BLVM3F+gwSF
qEcy9IKW7nOGm6dFvj3SapgRc448rs5hil8hSrt0ETslr4H/k2cI594pq3CNtWSqMqJuQemG9//g
BLD0SSr5XJrsElX/Oq9ZIFY39xI81ISFoxTm40XeO61YOoyaAEu3GHWbafqYMSLrneVfrG3nj8My
mXN2ABW/RD/0t6V3N5a8/+9IQpy5qHzjHGS0r7RNl4z9jvtiq63oWHjYmkSx
=9Sy2
-----END PGP SIGNATURE-----

--------------6H4PmcArdL9dnUggMSTVkPNg--

