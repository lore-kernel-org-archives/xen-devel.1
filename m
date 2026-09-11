Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A3DC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:46:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416152.1645316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xpV-0007gv-Rx; Fri, 11 Sep 2026 09:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416152.1645316; Fri, 11 Sep 2026 09:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xpV-0007go-Mu; Fri, 11 Sep 2026 09:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1416152;
 Fri, 11 Sep 2026 09:45:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@swg.vates.tech>)
 id 1x4xpU-0007gL-95
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:45:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xpT-00AzpU-Ls
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:45:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@swg.vates.tech>)
 id 6aa3cdd2-8faa-0a2a0a5109dd-0a2a450985a0-10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:45:55 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@swg.vates.tech>)
 id 6aa3cdd3-be1a-0a2a45090019-b9ff1c239e05-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:45:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08fdbf3c0000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 09:45:51 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2532781BAF;
 Fri, 11 Sep 2026 11:45:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=EEfSzCAbvLllS00o88eaJybHOrGbl1PMmJi+1iERHnQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HXposf3bmXN/88pfVAEyYKhOB77NOirb8NZa4LiUek+/d9cr/2p9oLxuANzAW1+VumdC3xhwV
 GkrgiNE7WqKB9HvM7hMduR4yGH96JgxAfcvavJtObS/DIf/B+5ZeWebuiTBMF7HwT7GBUXtrJ0w
 ZmvGtmbEVB/2/snbTT11OH+FhIaIr5vVx2BaW1iyjlUyBJ1xuv+U1DCzOQDxQydYSZrtnWikr72
 CuhFwv2+Zr2CNnwki7zNjH/95f1vtno3/7H2FzPVeswSde7+D8Xje1VG6vD1b1EP1xAV/jb10KU
 JtPSLr8lknunayUnXHx0yDDabB+naGWjudqozaf5LENg==
X-Zone-Loop: 16d4d63a05cbacc8c52bac7aee67794555b5bcfb420c
x-campaign-type: default
x-transaction-id: ab4cf21d-6da3-4725-9ed9-01c222ab6147
x-swg-uid: 01-9cbcf87e-a18b-4d44-bfce-85f8c980a824
X-Mailer: Sweego
Message-ID:
 <1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3@vates.tech>
x-swg-bid: 1789119951.8631fc262581453bbf619ec5b2062170.1a08fdbf3c0000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 11 Sep 2026 11:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple
 operation flags
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com,
 George Dunlap <george.dunlap@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-2-kevin.lampis@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260910203113.462943-2-kevin.lampis@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SJHzMivFsmVnRN2gUvj0mZe3"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789119951276
X-purgate-ID: tlsNG-bad1c0/1789119955-FC817034-7E32185A/0/0
X-purgate-type: clean
X-purgate-size: 8978

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SJHzMivFsmVnRN2gUvj0mZe3
Content-Type: multipart/mixed; boundary="------------7I3YwTxfAcPSKONF7ikWQgUf";
 protected-headers="v1"; hp="clear"
Message-ID: <39fc7a86-89f1-4bd3-b569-f41d95257ed6@vates.tech>
Date: Fri, 11 Sep 2026 11:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple
 operation flags
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com,
 George Dunlap <george.dunlap@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-2-kevin.lampis@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260910203113.462943-2-kevin.lampis@citrix.com>

--------------7I3YwTxfAcPSKONF7ikWQgUf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTAvMDkvMjAyNiDDoCAyMjozMSwgS2V2aW4gTGFtcGlzIGEgw6ljcml0wqA6DQo+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENoYW5n
ZXMgaW4gdjI6DQo+IC0gTmV3IHBhdGNoDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9tbS5j
ICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gICB4ZW4vYXJjaC94ODYvcHYvbW0uaCB8IDEzICsrKysrKystLS0tLQ0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiBp
bmRleCBiMTU4NzQyNDA4ZjkuLjVmNzc4NTU3YjFlNiAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMNCj4gQEAgLTIxNDksMTAg
KzIxNDksOSBAQCBzdGF0aWMgdm9pZCBsM3RfdW5sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBh
Z2UpDQo+ICAgDQo+ICAgLyogVXBkYXRlIHRoZSBMMSBlbnRyeSBhdCBwbDFlIHRvIG5ldyB2
YWx1ZSBubDFlLiAqLw0KPiAgIHN0YXRpYyBpbnQgbW9kX2wxX2VudHJ5KGwxX3BnZW50cnlf
dCAqcGwxZSwgbDFfcGdlbnRyeV90IG5sMWUsDQo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICBtZm5fdCBnbDFtZm4sIHVuc2lnbmVkIGludCBjbWQsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBtZm5fdCBnbDFtZm4sIHVuc2lnbmVkIGludCB1cGRhdGVfZmxhZ3MsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZjcHUgKnB0X3ZjcHUsIHN0cnVjdCBk
b21haW4gKnBnX2RvbSkNCj4gICB7DQo+IC0gICAgYm9vbCBwcmVzZXJ2ZV9hZCA9IChjbWQg
PT0gTU1VX1BUX1VQREFURV9QUkVTRVJWRV9BRCk7DQo+ICAgICAgIGwxX3BnZW50cnlfdCBv
bDFlID0gbDFlX3JlYWQocGwxZSk7DQo+ICAgICAgIHN0cnVjdCBkb21haW4gKnB0X2RvbSA9
IHB0X3ZjcHUtPmRvbWFpbjsNCj4gICAgICAgaW50IHJjID0gMDsNCj4gQEAgLTIxNzIsNyAr
MjE3MSw3IEBAIHN0YXRpYyBpbnQgbW9kX2wxX2VudHJ5KGwxX3BnZW50cnlfdCAqcGwxZSwg
bDFfcGdlbnRyeV90IG5sMWUsDQo+ICAgICAgICAgICB9DQo+ICAgDQo+ICAgICAgICAgICAv
KiBUcmFuc2xhdGUgZm9yZWlnbiBndWVzdCBhZGRyZXNzLiAqLw0KPiAtICAgICAgICBpZiAo
IGNtZCAhPSBNTVVfUFRfVVBEQVRFX05PX1RSQU5TTEFURSAmJg0KPiArICAgICAgICBpZiAo
ICEodXBkYXRlX2ZsYWdzICYgUFRFX1VQREFURV9OT19UUkFOU0xBVEUpICYmDQo+ICAgICAg
ICAgICAgICAgIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwZ19kb20pICkNCj4gICAgICAgICAg
IHsNCj4gICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQ7DQoNCiguLi4pDQoNCj4gQEAg
LTI0MzUsNyArMjQzNCw3IEBAIHN0YXRpYyBpbnQgbW9kX2w0X2VudHJ5KGw0X3BnZW50cnlf
dCAqcGw0ZSwNCj4gICAgICAgZWxzZSBpZiAoIHB2X2wxdGZfY2hlY2tfbDRlKGQsIG5sNGUp
ICkNCj4gICAgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7DQo+ICAgICAgIGVsc2UgaWYgKCB1
bmxpa2VseSghVVBEQVRFX0VOVFJZKGw0LCBwbDRlLCBvbDRlLCBubDRlLCBtZm4sIHZjcHUs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJlc2VydmVfYWQp
KSApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBkYXRlX2Zs
YWdzKSkgKQ0KPiAgICAgICB7DQo+ICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gICAg
ICAgfQ0KPiBAQCAtNDEzNSwxOCArNDEzNCwyMyBAQCBsb25nIGRvX21tdV91cGRhdGUoDQo+
ICAgDQo+ICAgICAgICAgICAgICAgaWYgKCBwYWdlX2xvY2socGFnZSkgKQ0KPiAgICAgICAg
ICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdXBkYXRlX2ZsYWdz
ID0gKGNtZCA9PSBNTVVfUFRfVVBEQVRFX1BSRVNFUlZFX0FEKQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/IFBURV9VUERBVEVfUFJFU0VSVkVf
QUQNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAo
Y21kID09IE1NVV9QVF9VUERBVEVfTk9fVFJBTlNMQVRFKQ0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gUFRFX1VQREFURV9OT19UUkFOU0xB
VEUgOiAwOw0KPiArDQoNCkknbSBub3QgZnVsbHkgY29udmluY2VkIGJ5IHRoZSBkb3VibGUt
dGVybmFyeSBvcGVyYXRvciBoZXJlLiBXaGlsZSBpdCdzIA0KYSBiaXQgbW9yZSBjb21wYWN0
LCBJIGRvbid0IGZpbmQgaXQgdmVyeSByZWFkYWJsZSwgSSB3b3VsZCBwcmVmZXIgDQpzb21l
dGhpbmcgbGlrZQ0KDQp1bnNpZ25lZCBpbnQgdXBkYXRlX2ZsYWdzID0gMDsNCmlmICggY21k
ID09IE1NVV9QVF9VUERBVEVfUFJFU0VSVkVfQUQgKQ0KICAgICB1cGRhdGVfZmxhZ3MgPSBQ
VEVfVVBEQVRFX1BSRVNFUlZFX0FEOw0KaWYgKCBjbWQgPT0gTU1VX1BUX1VQREFURV9OT19U
UkFOU0xBVEUgKQ0KICAgICB1cGRhdGVfZmxhZ3MgPSBQVEVfVVBEQVRFX05PX1RSQU5TTEFU
RTsNCg0KV2hpY2ggaXMgb25lIGxpbmUgbG9uZ2VyLCBidXQgbG9va3MgdG8gbWUgbW9yZSBj
bGVhciBvbiB3aGF0IGl0IGRvZXMuDQoNCj4gICAgICAgICAgICAgICAgICAgc3dpdGNoICgg
cGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfdHlwZV9tYXNrICkNCj4gICAgICAgICAg
ICAgICAgICAgew0KPiAgICAgICAgICAgICAgICAgICBjYXNlIFBHVF9sMV9wYWdlX3RhYmxl
Og0KPiAgICAgICAgICAgICAgICAgICAgICAgcmMgPSBtb2RfbDFfZW50cnkodmEsIGwxZV9m
cm9tX2ludHB0ZShyZXEudmFsKSwgbWZuLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjbWQsIHYsIHBnX293bmVyKTsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdXBkYXRlX2ZsYWdzLCB2LCBwZ19vd25lcik7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gICANCiguLi4pDQoNClRoZSByZXN0IGxv
b2tzIGdvb2QgdG8gbWUgdGhvdWdoLg0KDQpUZWRkeQ0K

--------------7I3YwTxfAcPSKONF7ikWQgUf--

--------------SJHzMivFsmVnRN2gUvj0mZe3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqjzc4FAwAAAAAACgkQZg+p0QLLz9CI
RQv/QE33vk872PyPc9N/YJvxC0cX5iUxo48u1gsOBf2wgQrBYUcLvRbiO56+Wfoiby56xSAtkFJk
hK41Y45OM8/XdbT4OEZsVaug40B5RlOCyy+2Xv34/xB+T7xAIYz1dHvHPgYSE0UEN8tjUz6SdRIs
A7EhgyMNcNtdvN7feCyVAuRSlOhzWRlW1PJlHKwtcTj21i3ZG6iiM+1RoKvMf4nelnC3+GB9w5J0
o9XOIu2LOde7hei6PJGG7xhSqAKObDii5vPY6L6WlkJAAoiXqT9q5J93moUvjcLL3SfEmEh/JUoj
YRnH+C8po4JmlLRIMcl5aacIvf+RhE5MYKNQlEy+RKh6SHVpho03itlwNnKH9Vx8TjPF96JiLKka
EsK8SAdizfJIJ73r9N3AwUELCKNPssnhF4EF8cwGphStBbz6RW5dhrdlfFUqiQluzJIKHKOU3W/Z
mAiGimax/zWToIE3FezBW18wrhdM8iSr6Yw2FkbfV1MklJ26AiNePNe3Xjry
=wmLW
-----END PGP SIGNATURE-----

--------------SJHzMivFsmVnRN2gUvj0mZe3--

