Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC8606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=YYrz7gq9
Received: from list by lists.xenproject.org with outflank-mailman.1481541.1685444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjmp-0004gr-0k; Tue, 10 Nov 2026 11:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481541.1685444; Tue, 10 Nov 2026 11:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQjmo-0004gk-U2; Tue, 10 Nov 2026 11:13:10 +0000
Received: by outflank-mailman (input) for mailman id 1481541;
 Tue, 10 Nov 2026 11:13:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c529629e000403d@swg.vates.tech>)
 id 1xQjmm-0004e9-QE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:13:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQjml-00CXCM-PC
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:13:07 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c529629e000403d@swg.vates.tech>)
 id 6af2fc24-2eae-0a2a0a5409dd-0a2a450b819e-44
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:13:07 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c529629e000403d@swg.vates.tech>)
 id 6af2fc43-b7e8-0a2a450b0019-b9ff1c129bf7-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:13:07 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c529629e000403d.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 11:13:06 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5C20181D70;
 Tue, 10 Nov 2026 12:13:05 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Xn1ZIdL8IdJfHIJkCyRaAsjuByGzD9RKM5M5FZaGuUc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=YYrz7gq9lpkAMEfZwL6r8quoc4S/BN+WvjSFT4XORWzENCwdmg5aPzR3K3MwcjcJ/55walpV8
 ZJl60Xzx6bYLBVml5c+NFyVNjdM7t//keBqCSNIVJZHm3BVZmCTYhQAGapn5EDjVDAK2yeUya+t
 2RPjiYAOL7fDF7hALpyTuGd+dowvRszl81SxaI9tIH32gfLNnkEUZBVMJKe2OO2uYTw6KHI1ECf
 bH1Mm5UTd/B0uSj/ii/aEd8V2Z51wGerJR3bnWOaQdnMfylPoh3bIAO8JeWGKjaHYHKI89QYNuA
 uVF7T0aXse+sIxyNaJ1i7F+RnvgQg4N8wf/uD891KR4Q==
X-Zone-Loop: b56d4617e70f1a3eaed2ee976fd67330ff002a8a346e
x-campaign-type: default
x-transaction-id: adcd202d-3dcf-44b7-b53d-ee94a3e5ff8a
x-swg-uid: 01-e6caa9cb-4daf-4bd4-9b11-3879d978ecba
X-Mailer: Sweego
Message-ID:
 <1794309186.8631fc262581453bbf619ec5b2062170.1a1c529629e000403d@vates.tech>
x-swg-bid: 1794309186.8631fc262581453bbf619ec5b2062170.1a1c529629e000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 10 Nov 2026 12:13:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/28] x86/hvm: vlapic: add checks before posted
 interrupt delivery
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-16-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261105013347.719392-16-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------juUlBStEz8F02jEWHmzN0aji"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794309185564
X-purgate-ID: tlsNG-42698a/1794309187-188C99EA-3E31647A/0/0
X-purgate-type: clean
X-purgate-size: 7000
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------juUlBStEz8F02jEWHmzN0aji
Content-Type: multipart/mixed; boundary="------------aRqOYLOuWjQ672pk9QgQW1ie";
 protected-headers="v1"; hp="clear"
Message-ID: <95c6240c-31ef-4f9c-85b0-950fe00ff7ca@vates.tech>
Date: Tue, 10 Nov 2026 12:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/28] x86/hvm: vlapic: add checks before posted
 interrupt delivery
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-16-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261105013347.719392-16-dmukhin@ford.com>

--------------aRqOYLOuWjQ672pk9QgQW1ie
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDUvMTEvMjAyNiDDoCAwMjozNywgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBGcm9tOiBEZW5pcyBNdWtoaW4gPGRtdWtoaW5AZm9yZC5jb20+DQo+IA0KPiBIb2lzdCBJ
UlIgY2hlY2sgZm9yIHBlbmRpbmcgdmVjdG9yIGluIHF1ZXN0aW9uIHRvIGF2b2lkIGNhbGxp
bmcgaW50bw0KPiBwb3N0ZWQgaW50ZXJydXB0IGRlbGl2ZXJ5IGNhbGxiYWNrLg0KPiANCj4g
QWxzbywgYXZvaWQgY2FsbGluZyBwb3N0ZWQgaW50ZXJydXB0cyB3aGVuIGN1cnJlbnQgdkNQ
VSBpcyB0YXJnZXQgdkNQVS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE11a2hpbiA8
ZG11a2hpbkBmb3JkLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2L2h2bS92bGFwaWMu
YyB8IDEwICsrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KDQpIbW0sIHRoYXQgcGF0Y2ggbGlrZWx5IGludHJvZHVj
ZXMgaXNzdWVzIHdpdGggSW50ZWwgQVBJQ3YuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdmxhcGljLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jDQo+IGluZGV4
IDIyYzQ3MmQ1NjliNS4uMjIyYTc4YjAyYjc3IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZsYXBpYy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMNCj4g
QEAgLTE2NCw5ICsxNjQsMTcgQEAgdm9pZCB2bGFwaWNfc2V0X2lycShzdHJ1Y3QgdmxhcGlj
ICp2bGFwaWMsIHVpbnQ4X3QgdmVjLCB1aW50OF90IHRyaWcpDQo+ICAgICAgIGlmICggaHZt
X2Z1bmNzLnVwZGF0ZV9lb2lfZXhpdF9iaXRtYXAgKQ0KPiAgICAgICAgICAgYWx0ZXJuYXRp
dmVfdmNhbGwoaHZtX2Z1bmNzLnVwZGF0ZV9lb2lfZXhpdF9iaXRtYXAsIHRhcmdldCwgdmVj
LCB0cmlnKTsNCj4gICANCj4gKyAgICBpZiAoIHZsYXBpY190ZXN0X2FuZF9zZXRfaXJyKHZs
YXBpYywgdmVjKSApDQo+ICsgICAgICAgIC8qIEludGVycnVwdCB2ZWN0b3IgaXMgYWxyZWFk
eSBwZW5kaW5nICovDQo+ICsgICAgICAgIHJldHVybjsNCg0KT24gSW50ZWwgQVBJQ3YsIHdl
IHVzdWFsbHkgZG9uJ3QgZGlyZWN0bHkgc2V0IHZMQVBJQyBJUlIsIGJ1dCB1c2UgdGhlIA0K
ZGVkaWNhdGVkIFBJUiB0byBpbmplY3QgYSBpbnRlcnJ1cHQgKHdoaWNoIHdpbGwgY2F1c2Ug
YSB1cGRhdGUgdG8gdkxBUElDIA0KSVJSLCBkZXRhaWxzIGluICJQb3N0ZWQtSW50ZXJydXB0
IFByb2Nlc3NpbmciIHNlY3Rpb24gb2YgU0RNKS4gV2l0aCB0aGlzIA0KY2hhbmdlLCB0aGVy
ZSBhcmUgY2FzZXMgd2hlcmUgd2Ugc2V0IGJvdGggdkxBUElDIElSUiBhbmQgUElSIHdoaWNo
IHdpbGwgDQpjYXVzZSBpc3N1ZXMuDQoNCj4gKw0KPiArICAgIGlmICggdGFyZ2V0ID09IGN1
cnJlbnQgKQ0KPiArICAgICAgICAvKiBLaWNrIHJlbW90ZSB2Q1BVcyBvbmx5ICovDQo+ICsg
ICAgICAgIHJldHVybjsNCj4gKw0KDQpUaGVyZSBtYXkgYmUgY2FzZXMgd2hlcmUgY3VycmVu
dCBpcyBibG9ja2VkLCBzbyBJIGRvbid0IHRoaW5rIHdlIGNhbiANCnNhZmVseSBza2lwIHZj
cHVfa2ljaygpIGluIHRoaXMgY2FzZS4NCg0KPiAgICAgICBpZiAoIGh2bV9mdW5jcy5kZWxp
dmVyX3Bvc3RlZF9pbnRyICkNCj4gICAgICAgICAgIGFsdGVybmF0aXZlX3ZjYWxsKGh2bV9m
dW5jcy5kZWxpdmVyX3Bvc3RlZF9pbnRyLCB0YXJnZXQsIHZlYyk7DQo+IC0gICAgZWxzZSBp
ZiAoICF2bGFwaWNfdGVzdF9hbmRfc2V0X2lycih2bGFwaWMsIHZlYykgKQ0KPiArICAgIGVs
c2UNCj4gICAgICAgICAgIHZjcHVfa2ljayh0YXJnZXQpOw0KPiAgIH0NCj4gICANCg0KVGVk
ZHkNCg==

--------------aRqOYLOuWjQ672pk9QgQW1ie--

--------------juUlBStEz8F02jEWHmzN0aji
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmry/EAFAwAAAAAACgkQZg+p0QLLz9D2
rAv6AmH/AMasZEpOR3PPJIfCe7WW/VQ+F1H0n+RQhj+yLctfIoylBkmzj4RHJtEKtdu+/srGb732
oOp17+Lz2LeI5wYkIYM1Hb0ChSreofIg5i0mCKRnqnlWitTTTyvTuUHmkXxNi80wdsbB0H3NgH2y
oV5h1P1c+nqrVC0pyORFQOCxFlc1R2Ekie7DVOFtg9zIq3E5HX8m8+jooUzLVBn41OZpHrST1z0T
6Ufnh0/Y1+YM8kQ2e8lqSBvlVDLG7LDcx0vdTIjk/B+yQYMK89EfixBsdM6cnvnvAiU8I8/4QA0b
zkGW7WT50juHu2B4F8wbE+FveYnqfBAQIm7CBqU85heicgxlX8Ez8AmF6EKXHQvRkEUhirfhKZQ1
p+vr0G6w9FUl6QuasYmNQXrCHJDZb8cGSRmirv8FNRfc/BvuOYSfr8/jPYumUAjvd4sRiwzhZcNG
FvJozIZPQ+KbgMK+F0JVVYUk6Vcts4UA7Faq4oMqsPbSZnKwomV09gCCqhsa
=xxFx
-----END PGP SIGNATURE-----

--------------juUlBStEz8F02jEWHmzN0aji--

