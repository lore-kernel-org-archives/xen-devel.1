Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A5FC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 08:27:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412658.1643042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4De4-0005TJ-UU; Wed, 09 Sep 2026 08:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412658.1643042; Wed, 09 Sep 2026 08:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4De4-0005TC-Re; Wed, 09 Sep 2026 08:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1412658;
 Wed, 09 Sep 2026 08:27:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085470866000c4f3@swg.vates.tech>)
 id 1x4De3-0005T3-Sy
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:27:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4De3-00G3Hj-9j
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:27:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085470866000c4f3@swg.vates.tech>)
 id 6aa11851-8faa-0a2a0a5109dd-0a2a4507ee22-12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:27:03 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085470866000c4f3@swg.vates.tech>)
 id 6aa11856-b4ea-0a2a45070019-b9ff1c228f6b-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:27:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a085470866000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 08:27:00 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6CD1C81B2C;
 Wed,  9 Sep 2026 10:26:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UgkyHAm7i5n0tVB7RoWZhcSpVXwxZSQ6WKMYeexxndU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=M/hA2OzXQuhBuwKMnSEYpbS0FTD50ahBJKqtNEsYKokVkxMTx+wG8vfGMRTJSlhiZKw36h0NU
 7fWgcJSNq6KOrvYXdjnTPTaEg3/jvvPc0jbXQCXIEN2dmO2UL+MPDJALTLhDr4biwIrfzn43EH2
 BaB7sJe47vW7bJHBtaSDOGS47vDNu6QuSeN3K4m94sSx1v8rMjahx/DFErsBbGLMdCrLxleKn0X
 ClL9/Q05TXbm/JgqaH5SKOJLTxHNDNE0X43tk43CRW3Vwfp2UBofVEmQf7t/kbjDT01K8yUfnBP
 K/PWoqBbiEhK7JgR8SkFIVPkiEO/VY58jQ3/Eh0YZukg==
X-Zone-Loop: 2c9a917afd961e7d0242bce26598f4f8c0f7646b4fd6
x-campaign-type: default
x-transaction-id: 250231dc-9e70-40e3-9cab-f70f1cf75a7c
x-swg-uid: 01-1a2172cc-abba-4296-b591-6dc7e0b53fbc
X-Mailer: Sweego
Message-ID:
 <1788942420.8631fc262581453bbf619ec5b2062170.1a085470866000c4f3@vates.tech>
x-swg-bid: 1788942420.8631fc262581453bbf619ec5b2062170.1a085470866000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 9 Sep 2026 10:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/3] x86/PCI: use pci_sbdf_t also for pci_dev_base()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
 <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z7zWYfpnEEUceiZJalqurD43"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788942419549
X-purgate-ID: tlsNG-ef75cf/1788942423-A5AC0AE4-3D8E94B3/0/0
X-purgate-type: clean
X-purgate-size: 6698

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z7zWYfpnEEUceiZJalqurD43
Content-Type: multipart/mixed; boundary="------------v3KcJk2Is8aD75En0Qk8dll4";
 protected-headers="v1"; hp="clear"
Message-ID: <074b9d6f-9db5-4310-8d0c-e5cb6d47e71c@vates.tech>
Date: Wed, 9 Sep 2026 10:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/3] x86/PCI: use pci_sbdf_t also for pci_dev_base()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
 <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>

--------------v3KcJk2Is8aD75En0Qk8dll4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDkvMDkvMjAyNiDDoCAwOToxNiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gTm8g
bmVlZCB0byBwYXNzIHRocmVlIGFyZ3VtZW50cyB3aGVuIGJvdGggY2FsbGVycyBhbHJlYWR5
IGhvbGQgU0JERiBpbg0KPiB0aGVpciBoYW5kcy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiAtLS0NCj4gV2l0aCBnY2MxNiB0aGlzIHR1cm5zIG91dCB0byBjaGFuZ2UgZ2Vu
ZXJhdGVkIGNvZGUgb25seSBpbiBzbyBmYXIgYXMgYQ0KPiBTSFIgbW92ZXMgcG9zaXRpb24u
DQo+IA0KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tY29uZmlnXzY0LmMNCj4gKysr
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZ182NC5jDQo+IEBAIC00NSwxNCArNDUs
MTUgQEAgc3RhdGljIGNoYXIgX19pb21lbSAqZ2V0X3ZpcnQodW5zaWduZWQgaQ0KPiAgICAg
ICByZXR1cm4gTlVMTDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgY2hhciBfX2lvbWVtICpw
Y2lfZGV2X2Jhc2UodW5zaWduZWQgaW50IHNlZywgdW5zaWduZWQgaW50IGJ1cywgdW5zaWdu
ZWQgaW50IGRldmZuKQ0KPiArc3RhdGljIGNoYXIgX19pb21lbSAqcGNpX2Rldl9iYXNlKHBj
aV9zYmRmX3Qgc2JkZikNCj4gICB7DQo+IC0gICAgY2hhciBfX2lvbWVtICphZGRyOw0KPiAr
ICAgIHVuc2lnbmVkIGludCBidXMgPSBzYmRmLmJ1czsNCj4gKyAgICBjaGFyIF9faW9tZW0g
KmFkZHIgPSBnZXRfdmlydChzYmRmLnNlZywgJmJ1cyk7DQo+ICAgDQo+IC0gICAgYWRkciA9
IGdldF92aXJ0KHNlZywgJmJ1cyk7DQo+ICAgICAgIGlmICghYWRkcikNCj4gICAgICAgICAg
IHJldHVybiBOVUxMOw0KPiAtICAgICByZXR1cm4gYWRkciArICgoYnVzIDw8IDIwKSB8IChk
ZXZmbiA8PCAxMikpOw0KPiArDQo+ICsgICAgcmV0dXJuIGFkZHIgKyAoKGJ1cyA8PCAyMCkg
fCAoc2JkZi5kZXZmbiA8PCAxMikpOw0KPiAgIH0NCj4gICANCj4gICBpbnQgcGNpX21tY2Zn
X3JlYWQoDQo+IEBAIC02Niw3ICs2Nyw3IEBAIGVycjogICAgICAgICp2YWx1ZSA9IC0xOw0K
PiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICBh
ZGRyID0gcGNpX2Rldl9iYXNlKHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+
ICsgICAgYWRkciA9IHBjaV9kZXZfYmFzZShzYmRmKTsNCj4gICAgICAgaWYgKCFhZGRyKQ0K
PiAgICAgICAgICAgZ290byBlcnI7DQo+ICAgDQo+IEBAIC05NCw3ICs5NSw3IEBAIGludCBw
Y2lfbW1jZmdfd3JpdGUoDQo+ICAgICAgIGlmICh1bmxpa2VseShyZWcgKyBsZW4gPiBQQ0lf
Q0ZHX1NQQUNFX0VYUF9TSVpFKSkNCj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAg
IA0KPiAtICAgIGFkZHIgPSBwY2lfZGV2X2Jhc2Uoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRm
LmRldmZuKTsNCj4gKyAgICBhZGRyID0gcGNpX2Rldl9iYXNlKHNiZGYpOw0KPiAgICAgICBp
ZiAoIWFkZHIpDQo+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICANCg0KUmV2aWV3
ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0K

--------------v3KcJk2Is8aD75En0Qk8dll4--

--------------z7zWYfpnEEUceiZJalqurD43
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqhGFMFAwAAAAAACgkQZg+p0QLLz9Cl
Kwv/Y3VRCRMuy2u2IHwfwIy0OAXBfLUcnfbUTPjbxXITz1Q9jop406XSmCKR+IuXfx0+U9cI0siL
u4hMzx9axvv1sipyBlWuEXtRNE9/JhdHh8FRXhvDGu6Z8t7+HrIp5REaitBam43PJSi6voBGdBwV
OB95dxgLw/Q/mapaus8RxpmKY5/1uYy1bIaBx6CxPR29hUlgg9HkfMRlstDBHXtAei1+BzN+q5LN
SEqfTuFCxWP6xMDMuvUtVMyOYVQJAoPLjKYlkDcUTd7NrbGjnwGuQ6tfc1zEuEdOcR9llc1trVA9
7FSa0o9c5qeB6CzA7U84ZmuWigNhqgza+AC7p6m0Egj5ESb8v0yC22yjSblFzsGO9BbkUThXdNT0
Yz0qI7D75qCr9m2JiZ4a1xITuyF7R/VU5+/056D9GdDcylj1mhv02QEP7IHY3DU4wPaCjyEBqZ0y
hRCOpEZj5Kok+EKL4xzDLCwe2xRfya5nCGtCjsdldyA/sIkfK/x9SJog01Re
=zkBp
-----END PGP SIGNATURE-----

--------------z7zWYfpnEEUceiZJalqurD43--

