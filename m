Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE88C982DA
	for <xen-devel@archiver.kernel.org>; Sun, 20 Sep 2026 18:58:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1426948.1649654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Mjg-0006C8-7T; Sun, 20 Sep 2026 18:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1426948.1649654; Sun, 20 Sep 2026 18:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Mjg-0006C0-2m; Sun, 20 Sep 2026 18:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1426948;
 Sun, 20 Sep 2026 18:57:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c02e920400072c4@swg.vates.tech>)
 id 1x8Mje-0006Bu-7J
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 18:57:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Mjd-00A1Ik-Ha
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 20:57:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c02e920400072c4@swg.vates.tech>)
 id 6ab02c64-8faa-0a2a0a5109dd-0a2a450592c2-44
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 20:57:57 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c02e920400072c4@swg.vates.tech>)
 id 6ab02cb4-4cb1-0a2a45050019-b9ff1c229669-3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 20:57:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c02e920400072c4.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 20 Sep 2026 18:57:52 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C02B88122C;
 Sun, 20 Sep 2026 20:57:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CfY+Qr7ruLH0DzTt08bPMhcwcpLiIiRaaixLr8qwoNQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=l2PYwBMXe8iw8tuHijUx0G37E1Uy280eb95O4EEZWv+ipRGzzVfF55mgJ+sycibJTdx4K8FSg
 MfcNAWQrQdopo/FoqyfbMUMPFIkPsihX7TRjdNZNTuIjjJQHagq2zImJbymf6ZvbGnhN5toNQF2
 VzJYrInFiFhzSXStCeusj6af56K7XZW/vn/jhVHa2/YkNbsMHfUYYeSDYThBqgpgwZK1Tr1ImtV
 KDOmAW6XV8o/t9JGLca4KNKFOfdTE6zAFA3XEwV4oj78KwXQBmgqBce8v5hjhIvCVD2Iij6jzjU
 6RJJVQa4/2lmGAUiStizjEYYNsyB7m9YMey4f7Sbx2Lg==
X-Zone-Loop: 6b0b6f668fcbbc9a9c72f49ef5bd0bcb2909d740d1f8
x-campaign-type: default
x-transaction-id: bfe6d20b-be3c-4996-aff0-7c4680007fe5
x-swg-uid: 01-f9093745-2215-44be-938c-2ee94e09f04f
X-Mailer: Sweego
Message-ID:
 <1789930672.8631fc262581453bbf619ec5b2062170.1a0c02e920400072c4@vates.tech>
x-swg-bid: 1789930672.8631fc262581453bbf619ec5b2062170.1a0c02e920400072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Sun, 20 Sep 2026 20:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Don't clear TLB_CONTROL on #VMEXIT
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <cf664749ee96e217cfb9a15e4e99ee1b8add3745.1789875186.git.lin.liu01@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <cf664749ee96e217cfb9a15e4e99ee1b8add3745.1789875186.git.lin.liu01@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cWwYWl0VZV0KrmeAEOC7nfEB"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789930670934
X-purgate-ID: tlsNG-c201ff/1789930677-F64B42A1-8AD231DB/0/0
X-purgate-type: clean
X-purgate-size: 6288

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cWwYWl0VZV0KrmeAEOC7nfEB
Content-Type: multipart/mixed; boundary="------------MugX0LNgEVw04fn9RsC7Ai9I";
 protected-headers="v1"; hp="clear"
Message-ID: <25b0a9d2-b94b-4571-8842-0c7b5c0499de@vates.tech>
Date: Sun, 20 Sep 2026 20:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Don't clear TLB_CONTROL on #VMEXIT
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <cf664749ee96e217cfb9a15e4e99ee1b8add3745.1789875186.git.lin.liu01@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <cf664749ee96e217cfb9a15e4e99ee1b8add3745.1789875186.git.lin.liu01@citrix.com>

--------------MugX0LNgEVw04fn9RsC7Ai9I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDkvMjAyNiDDoCAwNTozNywgTGluIExpdSBhIMOpY3JpdMKgOg0KPiBuc3ZtX3Zt
Y2JfcHJlcGFyZTR2bWV4aXQoKSB6ZXJvZXMgVExCX0NPTlRST0wgaW4gdGhlIEwxLXByb3Zp
ZGVkIFZNQ0IuDQo+IFRoYXQgVk1DQiBpcyBtYXBwZWQgd3JpdGFibGUsIHNvIHRoZSBzdG9y
ZSBsYW5kcyBpbiBMMSdzIG1lbW9yeSBhbmQgTDENCj4gc2VlcyBhIGZpZWxkIGl0IHdyb3Rl
IGNvbWUgYmFjayBhcyAwLg0KPiANCj4gQVBNIHZvbCAyIHJldiAzLjQ1IDE1LjE2LjEgKHAu
NTUwKTogIlRoZSBWTVJVTiBpbnN0cnVjdGlvbiByZWFkcywgYnV0DQo+IGRvZXMgbm90IGNo
YW5nZSwgdGhlIHZhbHVlIG9mIHRoZSBUTEJfQ09OVFJPTCBmaWVsZC4iDQo+IA0KPiBGaXhl
czogOWE3NzllNGZjMTYxICgiSW1wbGVtZW50IFNWTSBzcGVjaWZpYyBwYXJ0IGZvciBOZXN0
ZWQgVmlydHVhbGl6YXRpb24iKQ0KPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVz
LTUNCj4gU2lnbmVkLW9mZi1ieTogTGluIExpdSA8bGluLmxpdTAxQGNpdHJpeC5jb20+DQo+
IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jIHwgMyAtLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L25lc3RlZHN2bS5jDQo+IGluZGV4IGE4YjE1ZDZlYWUuLjFhYzJlNTdiM2IgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jDQo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jDQo+IEBAIC05OTEsOSArOTkxLDYgQEAgbnN2
bV92bWNiX3ByZXBhcmU0dm1leGl0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4gICAgICAgLyogQVNJRCAqLw0KPiAgICAgICAvKiB2bWNiX3NldF9h
c2lkKG5zX3ZtY2IsIHZtY2JfZ2V0X2FzaWQobjJ2bWNiKSk7ICovDQo+ICAgDQo+IC0gICAg
LyogVExCIGNvbnRyb2wgKi8NCj4gLSAgICBuc192bWNiLT50bGJfY29udHJvbCA9IDA7DQo+
IC0NCj4gICAgICAgLyogVmlydHVhbCBJbnRlcnJ1cHRzICovDQo+ICAgICAgIG5zX3ZtY2It
Pl92aW50ciA9IG4ydm1jYi0+X3ZpbnRyOw0KPiAgICAgICBpZiAoICFzdm0tPm5zX2hvc3Rm
bGFncy5maWVsZHMudmludHJtYXNrICkNCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0
ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0K

--------------MugX0LNgEVw04fn9RsC7Ai9I--

--------------cWwYWl0VZV0KrmeAEOC7nfEB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqwLK4FAwAAAAAACgkQZg+p0QLLz9C0
6gv9Gxu5D7v8C4T1+vu32t50YKAN63F1A3uofFRcfCBX+wPb0X43Y3IjO3RSl2sexfrneEZOeolP
H4Y3TAKvw6DCDEBN1SOEtkIxzyI3AfR/CelzJbmZl5gtUNrZEbktSHS1HTaKE77EScowFaHtgVhk
HD5dDSr1SIm7DXkoalIqjTFc2tXI9uswN9xKU4Pt+o0jZMx8pYpiNOhs2ChQ+c7+8uOXTFQrdHen
QTex+aRgZ0/5r05Ksc01Hel3Y962+oc+vI121/cEU9AqMZb3eMCppuiij3OoY4CDKhKOgHYDiQuG
ni7erL/QeofWms3FnrECdUXCMHiySmGnsn8IMCy7/A9PbVbf7c+wDLT+eQapSweGZbahjpOxo7BI
i7pchiXLpNCwhAQsP9md+M22qZL36EdBar3srF4M98UWv2uq0laMQu445+a2HYy7R90zxWoWJtaj
IBh4lAKcYydt5kQdurKlXzMZQ55GK1UvL0ux8C63QFdEuT/N5QsZX3VBrvGk
=ulns
-----END PGP SIGNATURE-----

--------------cWwYWl0VZV0KrmeAEOC7nfEB--

