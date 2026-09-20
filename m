Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE49C982DA
	for <xen-devel@archiver.kernel.org>; Sun, 20 Sep 2026 19:11:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1426955.1649663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Mw4-0000cu-7v; Sun, 20 Sep 2026 19:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1426955.1649663; Sun, 20 Sep 2026 19:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Mw4-0000cn-4d; Sun, 20 Sep 2026 19:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1426955;
 Sun, 20 Sep 2026 19:10:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@swg.vates.tech>)
 id 1x8Mw3-0000cf-2Y
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 19:10:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Mw1-0023cb-Hp
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 21:10:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@swg.vates.tech>)
 id 6ab02f74-e002-0a2a0a5209dd-0a2a4507842e-30
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 21:10:45 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@swg.vates.tech>)
 id 6ab02fb4-b4ea-0a2a45070019-b9ff1c12988d-3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 21:10:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c03a526800072c4.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 20 Sep 2026 19:10:42 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CE9BB82323;
 Sun, 20 Sep 2026 21:10:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vd2emGBAA1YVEyr1TJTV6aQL+nPL02cQ9qt2KbopMns=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CZNyWUaEUnckdkJSeGG2voVE4Ys3h0jc26HNm34kczDanc+d9maSyTDnSOr1ZqSUKKt8Nkh1W
 nMRY3IwBoQiAJMGR3+sgOW5+rPq1O2VazwnkLCTwZV50DcIwIMok+W9XvNNHrnIRNtfQ70rcbKA
 Bc5JWv5EYkg++4Qdra/aWSssmt87vTRPIYeMziCtglsaADJmHKUSyzUogsPAX8xCJioqGFhdH2o
 TcEIZ9GiP0sF1+8b/A+4rhfAcoUjkb9R0pGcJs57kUpGAykHRQW9R56jRv8zcX/nGYdHQ7ApIqV
 KC/cgsi1hvXTeJ/1nksrC3SxhrLbWhGo1Rjg7cpyx/vQ==
X-Zone-Loop: 97ba5823c31eff2700d8d9b5587dffc20b84a634f22a
x-campaign-type: default
x-transaction-id: 2c22e0c4-f3f7-49c3-b313-7e95d2e3b159
x-swg-uid: 01-08a99b0c-a3ae-46c8-9379-c82e421f6bc8
X-Mailer: Sweego
Message-ID:
 <1789931442.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4@vates.tech>
x-swg-bid: 1789931442.8631fc262581453bbf619ec5b2062170.1a0c03a526800072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Sun, 20 Sep 2026 21:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3
 during VMEXIT to L1
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260918125205.374168-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260918125205.374168-1-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------800bwqfyCx0oDVZhxFjVwudK"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789931441989
X-purgate-ID: tlsNG-ef75cf/1789931445-A5EC6AE4-A8E2573B/0/0
X-purgate-type: clean
X-purgate-size: 8380

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------800bwqfyCx0oDVZhxFjVwudK
Content-Type: multipart/mixed; boundary="------------fzkdCnuWyFaSh1PIQ2B2crs4";
 protected-headers="v1"; hp="clear"
Message-ID: <957665ac-02f3-4c03-aa15-86cdadc498b8@vates.tech>
Date: Sun, 20 Sep 2026 21:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set VMCB(1-2)'s NP_ENABLE and N_CR3
 during VMEXIT to L1
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260918125205.374168-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260918125205.374168-1-ross.lagerwall@citrix.com>

--------------fzkdCnuWyFaSh1PIQ2B2crs4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTgvMDkvMjAyNiDDoCAxNDo1NCwgUm9zcyBMYWdlcndhbGwgYSDDqWNyaXTCoDoNCj4g
QXMgcGVyIHRoZSBWTVJVTiBwc2V1ZG9jb2RlIGluIEFQTSBWb2wgMyAzLjM4LCB0aGUgVk1D
QidzIE5QX0VOQUJMRSBhbmQNCj4gTl9DUjMgZmllbGRzIGFyZSBub3Qgc2V0IGR1cmluZyBh
IFZNRVhJVCBzbyBkb24ndCBkbyB0aGlzIHdoZW4gdXBkYXRpbmcNCj4gVk1DQigxLTIpLiBB
dCB0aGUgc2FtZSB0aW1lLCBjbGVhbnVwIHRoZSBzb21ld2hhdCBib2d1cyBhbmQgaXJyZWxl
dmFudA0KPiBjb21tZW50cy4gTm90IGNsZWFyaW5nIE5fQ1IzIGRvZXMgbm90IGludHJvZHVj
ZSBhIHNlY3VyaXR5IGhvbGUgYXMNCj4gc3RhdGVkIHNpbmNlIEwxIGNhbiBzZXQgaXQgcmVn
YXJkbGVzcyBhbmQgaXQgaXMgbmV2ZXIgdXNlZCBkaXJlY3RseSB3aGVuDQo+IHJ1bm5pbmcg
TDIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVk
c3ZtLmMgfCAzMiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMgYi94ZW4vYXJjaC94
ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYw0KPiBpbmRleCBhOGIxNWQ2ZWFlMDUuLmM2MmZjYTU3
MWQ3NSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMN
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMNCj4gQEAgLTEwMjMs
MzcgKzEwMjMsNiBAQCBuc3ZtX3ZtY2JfcHJlcGFyZTR2bWV4aXQoc3RydWN0IHZjcHUgKnYs
IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPiAgIA0KPiAgICAgICBuc192bWNiLT5l
dmVudF9pbmoucmF3ID0gMDsNCj4gICANCj4gLSAgICAvKiBOZXN0ZWQgcGFnaW5nIG1vZGUg
Ki8NCj4gLSAgICBpZiAoIG5lc3RlZGh2bV9wYWdpbmdfbW9kZV9oYXAodikgKQ0KPiAtICAg
IHsNCj4gLSAgICAgICAgLyogaG9zdCBuZXN0ZWQgcGFnaW5nICsgZ3Vlc3QgbmVzdGVkIHBh
Z2luZy4gKi8NCj4gLSAgICAgICAgdm1jYl9zZXRfbnAobnNfdm1jYiwgdm1jYl9nZXRfbnAo
bjJ2bWNiKSk7DQo+IC0gICAgICAgIG5zX3ZtY2ItPl9jcjMgPSBuMnZtY2ItPl9jcjM7DQo+
IC0gICAgICAgIC8qIFRoZSB2bWNiLT5oX2NyMyBpcyB0aGUgc2hhZG93ZWQgaF9jcjMuIFRo
ZSBvcmlnaW5hbA0KPiAtICAgICAgICAgKiB1bnNoYWRvd2VkIGd1ZXN0IGhfY3IzIGlzIGtl
cHQgaW4gbnNfdm1jYi0+aF9jcjMsDQo+IC0gICAgICAgICAqIGhlbmNlIHdlIGtlZXAgdGhl
IG5zX3ZtY2ItPmhfY3IzIHZhbHVlLiAqLw0KPiAtICAgIH0NCj4gLSAgICBlbHNlIGlmICgg
cGFnaW5nX21vZGVfaGFwKHYtPmRvbWFpbikgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgLyog
aG9zdCBuZXN0ZWQgcGFnaW5nICsgZ3Vlc3Qgc2hhZG93IHBhZ2luZy4gKi8NCj4gLSAgICAg
ICAgdm1jYl9zZXRfbnAobnNfdm1jYiwgZmFsc2UpOw0KPiAtICAgICAgICAvKiBUaHJvdyBo
X2NyMyBhd2F5LiBHdWVzdCBpcyBub3QgYWxsb3dlZCB0byBzZXQgaXQgb3INCj4gLSAgICAg
ICAgICogaXQgY2FuIGJyZWFrIG91dCwgb3RoZXJ3aXNlIChzZWN1cml0eSBob2xlISkgKi8N
Cj4gLSAgICAgICAgbnNfdm1jYi0+X2hfY3IzID0gMHgwOw0KPiAtICAgICAgICAvKiBTdG9w
IGludGVyY2VwdGluZyAjUEYgKGFscmVhZHkgZG9uZSBhYm92ZQ0KPiAtICAgICAgICAgKiBi
eSByZXN0b3JpbmcgY2FjaGVkIGludGVyY2VwdHMpLiAqLw0KPiAtICAgICAgICBuc192bWNi
LT5fY3IzID0gbjJ2bWNiLT5fY3IzOw0KPiAtICAgIH0NCj4gLSAgICBlbHNlDQo+IC0gICAg
ew0KPiAtICAgICAgICAvKiBob3N0IHNoYWRvdyBwYWdpbmcgKyBndWVzdCBzaGFkb3cgcGFn
aW5nLiAqLw0KPiAtICAgICAgICB2bWNiX3NldF9ucChuc192bWNiLCBmYWxzZSk7DQo+IC0g
ICAgICAgIG5zX3ZtY2ItPl9oX2NyMyA9IDB4MDsNCj4gLSAgICAgICAgLyogVGhlIHZtY2It
Pl9jcjMgaXMgdGhlIHNoYWRvd2VkIGNyMy4gVGhlIG9yaWdpbmFsDQo+IC0gICAgICAgICAq
IHVuc2hhZG93ZWQgZ3Vlc3QgY3IzIGlzIGtlcHQgaW4gbnNfdm1jYi0+X2NyMywNCj4gLSAg
ICAgICAgICogaGVuY2Ugd2Uga2VlcCB0aGUgbnNfdm1jYi0+X2NyMyB2YWx1ZS4gKi8NCj4g
LSAgICB9DQo+IC0+ICAgICAgIC8qIExCUiB2aXJ0dWFsaXphdGlvbiAtIGtlZXAgbGJyIGNv
bnRyb2wgYXMgaXMgKi8NCj4gICANCj4gICAgICAgLyogTmV4dFJJUCAqLw0KPiBAQCAtMTA4
Myw2ICsxMDUyLDcgQEAgbnN2bV92bWNiX3ByZXBhcmU0dm1leGl0KHN0cnVjdCB2Y3B1ICp2
LCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4gICANCj4gICAgICAgLyogQ1JuICov
DQo+ICAgICAgIG5zX3ZtY2ItPl9jcjQgPSBuMnZtY2ItPl9jcjQ7DQo+ICsgICAgbnNfdm1j
Yi0+X2NyMyA9IG4ydm1jYi0+X2NyMzsNCj4gICAgICAgbnNfdm1jYi0+X2NyMCA9IG4ydm1j
Yi0+X2NyMDsNCj4gICANCg0KSSB3b3VsZCBzdWdnZXN0IHRvIGdyb3VwIGFsbCB0aGUgQ1Ju
ICh0aGUgQ1IyIHBhcnQgaXMgY3VycmVudGx5IA0Kc2VwYXJhdGVkKS4gVGhhdCBjYW4gYmUg
ZG9uZSBzZXBhcmF0ZWx5Lg0KDQo+ICAgICAgIC8qIERSbiAqLw0KDQpSZXZpZXdlZC1ieTog
VGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQoNClRlZGR5DQo=

--------------fzkdCnuWyFaSh1PIQ2B2crs4--

--------------800bwqfyCx0oDVZhxFjVwudK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqwL7EFAwAAAAAACgkQZg+p0QLLz9Bj
mAv/eoG2vrcIjYpbJKOWKa40Lb8Ziu59BK/kHYuZ3UxjwyE6JnZO4Hc+lF1gr5aQxjHuSP97OWfr
3Tsz5vDW7DgJbo41sdr1sXirRwn8HNBe246ppXM2YFnRueLHae8JeY2opBFK5bHY4j6gMA9bOHK6
fq8mDWxfohoEvuKpDl5CdVeXUHlHY9tylx9pTu+kpwX3rdxtaRh+akh9Dq91fvNFYl7DxEBi39U1
yIgoxI+YQlS2MsXZb/DHhhvm3DgbiC49poVgjFPRZgbEHR3eS6pITLT5VKR0yBfh2D8XDpUBCRBr
W81kOK+KsAWuf3zbPy3AGBaptEodA7XJuDpeh5HKYImuZgy14V1bg+dKyKbi3VpkrsDJoDRafGQH
H92HtasmEew8hLedfnajd0JvrFy7IfqxsWDkKAik8u3XbYT6NQRepvJdW+aEdyt4cHbjKkH5cLHi
hertE6UoZvCES2Xqzi849dVYBUvQBaA8gdJMYVn/ALVSMJpxzzw6Z7PHCLtU
=cdgH
-----END PGP SIGNATURE-----

--------------800bwqfyCx0oDVZhxFjVwudK--

