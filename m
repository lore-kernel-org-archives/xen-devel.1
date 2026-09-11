Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ADEC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:32:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416521.1645505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50Qj-0001Tw-5W; Fri, 11 Sep 2026 12:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416521.1645505; Fri, 11 Sep 2026 12:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50Qj-0001Tp-1N; Fri, 11 Sep 2026 12:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1416521;
 Fri, 11 Sep 2026 12:32:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@swg.vates.tech>)
 id 1x50Qi-0001TQ-4c
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:32:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50Qh-003k15-HX
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:32:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@swg.vates.tech>)
 id 6aa3f4d3-bab6-0a2a0a5309dd-0a2a450ae9a0-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:32:31 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@swg.vates.tech>)
 id 6aa3f4de-f2d2-0a2a450a0019-b9ff1c2387ef-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:32:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a09074801c000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:32:29 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 633EE81D14;
 Fri, 11 Sep 2026 14:32:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Kk7NzNvXOZksTSAI+a2kYysxHJXVE/FGLmfD1wrzn84=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XqXgqfN40xiwqrZgDY7FI/RcpcEeHztK626D0WDDHyCc8SiKxPq634mwUyzvpP6gZGqEN9qLt
 x0Uzjc3ts5v19W/rCYai9s3MIOJMVOJECBgQjCGKpnMP/SScF9O2JUZmJqorg880DSTGIFWgnw3
 EWDzU94z4WGMACY03Uh98jQLKKMWfdutlV9HqdXnVvk1+1SVCZdNDFmd//UouQMwFK5dz9aaP4i
 mevQHl9DUcU5l/uc8JiZO/qcgfZe/5uc2N798H2JwHZNnYlT0xtapwjF30iqeRtMOsKT7rbubKZ
 JJk9MRwd+Z7Q6LCztDN2cEzvQbGAgU7Tt3y8j+QIrAaw==
X-Zone-Loop: 27d5fc45d07db4df7df64b01726ef6561c315e2f293f
x-campaign-type: default
x-transaction-id: 5a007d59-e0ab-4e2b-b4a4-acfbfe1e75ab
x-swg-uid: 01-9fa27866-899c-4951-af94-de3b52ceb64e
X-Mailer: Sweego
Message-ID:
 <1789129949.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@vates.tech>
x-swg-bid: 1789129949.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 11 Sep 2026 14:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-6-kevin.lampis@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260910203113.462943-6-kevin.lampis@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7h9HIS3YKtZC0yLhDHFgqbdI"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789129948521
X-purgate-ID: tlsNG-4011c0/1789129951-524DFCFC-C429FEEC/0/0
X-purgate-type: clean
X-purgate-size: 8781

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7h9HIS3YKtZC0yLhDHFgqbdI
Content-Type: multipart/mixed; boundary="------------HeSB5bmwIxeXvPWMZ00Yz13d";
 protected-headers="v1"; hp="clear"
Message-ID: <8fdcb932-ea40-4a82-9b3b-02d383197c8c@vates.tech>
Date: Fri, 11 Sep 2026 14:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-6-kevin.lampis@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260910203113.462943-6-kevin.lampis@citrix.com>

--------------HeSB5bmwIxeXvPWMZ00Yz13d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTAvMDkvMjAyNiDDoCAyMjozMSwgS2V2aW4gTGFtcGlzIGEgw6ljcml0wqA6DQo+IEEg
bmV3IHN1Yi1vcCBNTVVfUFRfVVBEQVRFX1NXQVAgd2hlbiB1c2VkIHdpbGwgZG8gYW4gYXRv
bWljIHN3YXAgdG8gc2V0DQo+IHRoZSBuZXcgdmFsdWUgYW5kIHJldHVybiB0aGUgb2xkIFBU
RSB2YWx1ZSB0aHJvdWdoIHRoZSByZXEudmFsIGZpZWxkLg0KPiANCj4gLSBUaGUgbmV3IFBU
RSB2YWx1ZSBpbiByZXEudmFsIG11c3QgYmUgMCwgYXQgdGhlIG1vbWVudCB0aGlzIGlzIGlu
dGVuZGVkDQo+ICAgIGZvciBjbGVhcmluZyBvbmx5Lg0KPiANCg0KSSdtIG5vdCBzdXJlIHRo
aXMgaXMgYSBnb29kIGlkZWEgdG8gcmVzdHJpY3QgdGhlIGZlYXR1cmUgZm9yIG9ubHkgMC4g
SWYgDQppbiB0aGUgZnV0dXJlIHdlIHdhbnQgdG8gZXhwYW5kIHRoaXMgdG8gbm9uLTAgdmFs
dWVzLCB3ZSB3aWxsIG5lZWQgdG8gDQphZHZlcnRpc2UgdGhpcyBwcm9wZXJ0eSB0byB0aGUg
Z3Vlc3QgYXMgd2VsbCAoc28gdGhhdCBpdCBrbm93cyBpZiBub24tMCANCnZhbHVlcyBhcmUg
c3VwcG9ydGVkKS4gSSBkb24ndCBrbm93IHdoYXQgc3VwcG9ydGluZyAhMCB3b3VsZCByZXF1
aXJlIA0KKGJ1dCBpdCBjb3VsZCBiZSB1c2VmdWwgdG8gZ2V0IGEgaWRlYSBvZiBpdCkuDQoN
Cj4gLSBPbmx5IGwxIFBURXMgYXJlIHN1cHBvcnRlZCBiZWNhdXNlIHRoZXkgYXJlIHRoZSBt
b3N0IGZyZXF1ZW50IGFuZCBoYXZlIHRoZQ0KPiAgICBiaWdnZXN0IHBlcmZvcm1hbmNlIGlt
cGFjdC4NCj4gDQo+IC0gVGhlIG9sZCBQVEUgdmFsdWUgaXMgcGFzc2VkIGJhY2sgdG8gdGhl
IGd1ZXN0IHRocm91Z2ggdGhlIHJlcS52YWwgZmllbGQNCj4gDQo+IElmIE1NVV9QVF9VUERB
VEVfU1dBUCBpcyBub3Qgc2V0IHRoZW4gdGhlIG9sZCBiZWhhdmlvciBpcyBwcmVzZXJ2ZWQN
Cj4gICAgZG9fbW11X3VwZGF0ZSAtPiBtb2RfbDFfZW50cnkgLT4gVVBEQVRFX0VOVFJZIC0+
IHBhZ2luZ193cml0ZV9ndWVzdF9lbnRyeQ0KPiANCj4gVGhlIG5ldyBNTVVfUFRfVVBEQVRF
X1NXQVAgY2FsbCBjaGFpbiBsb29rcyBsaWtlIHRoaXMNCj4gICAgZG9fbW11X3VwZGF0ZSAt
PiBtb2RfbDFfZW50cnkgLT4gVVBEQVRFX0VOVFJZIC0+IHBhZ2luZ19jbXB4Y2hnX2d1ZXN0
X2VudHJ5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBMYW1waXMgPGtldmluLmxhbXBp
c0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBBZGQgYSBzdWIt
b3AgdG8gbW11X3VwZGF0ZSBpbnN0ZWFkIG9mIG5ldyBoeXBlcmNhbGwNCj4gLSBSZW5hbWUg
dG8gInN3YXAiIGluc3RlYWQgb2YgImNsZWFyIiwgYWx0aG91Z2ggb25seSBgMGAgaXMgYWNj
ZXB0ZWQNCj4gLSBSZW1vdmUgc3B1cmlvdXMgY3VybHkgYnJhY2UgZnJvbSBgY2FzZSBQR1Rf
bDFfcGFnZV90YWJsZTpgDQo+IC0gUmVzdHJ1Y3R1cmUgYGNhc2UgUEdUX2wxX3BhZ2VfdGFi
bGU6YCB0byBhdm9pZCBkaWZmIGNodXJuDQo+IC0gQWRkIG1pc3NpbmcgYE1NVV9QVF9VUERB
VEVfU1dBUGAgY2hlY2sgZm9yIHRoZSBzZWNvbmQNCj4gICAgYFBHVF93cml0YWJsZV9wYWdl
YCBibG9jaw0KPiANCj4gKEphbikgSSBkZWNpZGVkIG5vdCB0byByZW1vdmUgdGhlIGByYyA9
IC1FSU5WQUxgIGxpbmVzLiBFdmVuIHRob3VnaCBgcmNgDQo+IGFscmVhZHkgaGFzIHRoaXMg
dmFsdWUgSSB0aGluayBpdCdzIG1vcmUgcmVhZGFibGUgbGlrZSB0aGlzLiBMZXQgbWUga25v
dw0KPiBpZiBJIG1pc3VuZGVyc3Rvb2QgdGhlIGlzc3VlLg0KPiAtLS0NCj4gICB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ICAgeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIHwgIDEgKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMNCj4g
aW5kZXggNTlhZDVjZTE2NDg2Li5iNDk4YTg0NjA5MzUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+IEBAIC00MDU1LDYg
KzQwNTUsNyBAQCBsb25nIGRvX21tdV91cGRhdGUoDQo+ICAgICAgICAgICBjYXNlIE1NVV9O
T1JNQUxfUFRfVVBEQVRFOg0KPiAgICAgICAgICAgY2FzZSBNTVVfUFRfVVBEQVRFX1BSRVNF
UlZFX0FEOg0KPiAgICAgICAgICAgY2FzZSBNTVVfUFRfVVBEQVRFX05PX1RSQU5TTEFURToN
Cj4gKyAgICAgICAgY2FzZSBNTVVfUFRfVVBEQVRFX1NXQVA6DQo+ICAgICAgICAgICB7DQo+
ICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBwMm10Ow0KPiAgIA0KPiBAQCAtNDExOCw2ICs0
MTE5LDMwIEBAIGxvbmcgZG9fbW11X3VwZGF0ZSgNCg0KKC4uLikNCg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3hlbi5o
DQo+IGluZGV4IDIxNDliOGRkMzgwOC4uNTU5MTkwNjg4YTFlIDEwMDY0NA0KPiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3hl
bi5oDQo+IEBAIC0zNDksNiArMzQ5LDcgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVu
X3Vsb25nX3QpOw0KPiAgICNkZWZpbmUgTU1VX1BUX1VQREFURV9QUkVTRVJWRV9BRCAgMiAv
KiBhdG9taWNhbGx5OiAqcHRyID0gdmFsIHwgKCpwdHImKEF8RCkpICovDQo+ICAgI2RlZmlu
ZSBNTVVfUFRfVVBEQVRFX05PX1RSQU5TTEFURSAzIC8qIGNoZWNrZWQgJypwdHIgPSB2YWwn
LiBwdHIgaXMgTUEuICAgICAgKi8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogdmFsIG5ldmVyIHRyYW5zbGF0ZWQuICAgICAgICAgICAgICAgICAqLw0K
PiArI2RlZmluZSBNTVVfUFRfVVBEQVRFX1NXQVAgICAgICAgICA0DQoNClRoYXQgd2FudHMg
c29tZSBkb2N1bWVudGF0aW9uIDogdGhlIG9wZXJhdGlvbiBpdCBkb2VzLCBhbmQgdGhlIA0K
cmVzdHJpY3Rpb25zIHRoYXQgYXBwbGllcyAoaS5lIHRoZSBmYWN0IGl0J3MgTDEtb25seSwg
cmVzdHJpY3Rpb25zLCAuLi4pLg0KDQo+ICAgDQo+ICAgLyoNCj4gICAgKiBNTVUgRVhURU5E
RUQgT1BFUkFUSU9OUw0KVGVkZHkNCg==

--------------HeSB5bmwIxeXvPWMZ00Yz13d--

--------------7h9HIS3YKtZC0yLhDHFgqbdI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqj9NwFAwAAAAAACgkQZg+p0QLLz9B8
Kgv/TF6D050ils2h3oVJQ+CrAukvfZUKgTO6HZXLSIsCf+Qg5KmfpEXgfJ54MqdyAFgd7AcxAToP
r1t6KL9FbwE2xQelDVUtuu7AaaEGFnGASmXrktEMFQtGSnPyTWwfl8OZgjkyN+nxifP4ZxyzDG9n
bVKMsmqmBmT5STDhSCh93yIhoBLt2U4CfBZTBAjNSwYGO4YUqJc6/cZqEOcWCtEDdECChcEk++8t
6+RHHzTuF8hrC4pZNnwRdMZJ89RtOcpQSrUfJbAQvR6pAb3T3mbHTu5J9UtlQ/apH+1O9AQh+NNr
SmgPGP9bcIl94nfqDMUvE/bYIVA/4aBWHrsUh8U+JI6NfDl0AW0N1sz6Uve3S1HoiZdRTPnwpqJS
GEc/Lf1ohI/u64yRozejvDuLZgxhHhPwmq1Py/75wPW1sFMakcl4QbX96r57LiH5IrAc+jYXUeS+
l3zcJyADY/WODY14e8px1OQGHDg9KbCQHBDMhTlGnOgASvzsTFzyPUf63JyG
=JXLw
-----END PGP SIGNATURE-----

--------------7h9HIS3YKtZC0yLhDHFgqbdI--

