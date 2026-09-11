Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA7C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:35:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416119.1645280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xey-0004PZ-3J; Fri, 11 Sep 2026 09:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416119.1645280; Fri, 11 Sep 2026 09:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xex-0004PS-Vr; Fri, 11 Sep 2026 09:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1416119;
 Fri, 11 Sep 2026 09:35:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@swg.vates.tech>)
 id 1x4xew-0004PM-1L
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:35:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xev-00DN2F-EK
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:35:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@swg.vates.tech>)
 id 6aa3cb40-bab6-0a2a0a5309dd-0a2a4504e7ca-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:35:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@swg.vates.tech>)
 id 6aa3cb44-b57f-0a2a45040019-b9ff1c239559-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:35:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08fd1f824000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 09:34:57 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD60B81DE6;
 Fri, 11 Sep 2026 11:34:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=V6ehQ3GislKOhcMO53ERQFc16kU74eLe/iSxzYSjlyk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dLjbqi4pvdNficxU+mrYf+99rP6sn5lBDjiUVRvydqbqs8qompgvZoTlF0kM1nIttS0gYuhVU
 96PMyN/qOC8UBTMqlGtXgzec0+qc7VdvSydkNnx9X44HNTeU0RRYQB8XxYBpUs9aec2R1fEK3/H
 ybVpyNz3L72kWN7z7RtRNyDaX7c0cfIAhjxUv9A9sv5M739513G5t3uV8CbYg2NN6+Dc42SkhH7
 Z/juQMMfCdlu3QwjD5IZ6/6rcNQH9gvROpyj/vcKkxhCGcbLu8UsS90mlNsbsgDAqTNS8Qn1lHu
 xF6V//ej5yvI4J5MlDjndrntwd1t2iy9QuZv2xbvUaAg==
X-Zone-Loop: 982c0ac3840f1e1bc86806bed730b104eb9ce1601069
x-campaign-type: default
x-transaction-id: d2faae3c-1351-47eb-946f-dbc3df930418
x-swg-uid: 01-6dc1cc93-3672-4030-8084-a6adfcc263b6
X-Mailer: Sweego
Message-ID:
 <1789119297.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3@vates.tech>
x-swg-bid: 1789119297.8631fc262581453bbf619ec5b2062170.1a08fd1f824000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 11 Sep 2026 11:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] vmx: Refactor vpid_sync_vcpu_gva()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
 <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------diKt5bgiUxQOPK85h8LhfW89"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789119296947
X-purgate-ID: tlsNG-ebf023/1789119301-51AD0B50-962C882B/0/0
X-purgate-type: clean
X-purgate-size: 8310

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------diKt5bgiUxQOPK85h8LhfW89
Content-Type: multipart/mixed; boundary="------------cdWuHpJTJGfKkHXL2uBsgWx0";
 protected-headers="v1"; hp="clear"
Message-ID: <bc54033b-a813-4349-928b-15c96dc2e032@vates.tech>
Date: Fri, 11 Sep 2026 11:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] vmx: Refactor vpid_sync_vcpu_gva()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
 <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1a42fad1-922d-441d-9837-f4c43854a5b1@suse.com>

--------------cdWuHpJTJGfKkHXL2uBsgWx0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTAvMDkvMjAyNiDDoCAxNzo0NSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MzEuMDcuMjAyNiAxNjo0NiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vaHZtL3ZteC92bXguaA0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2h2bS92bXgvdm14LmgNCj4+IEBAIC00NjAsMTkgKzQ2MCwxNiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdnBpZF9zeW5jX3ZjcHVfZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB1
bnNpZ25lZCBsb25nIGd2YSkNCj4+ICAgICAgICAqIElmIGluZGl2aWR1YWwgYWRkcmVzcyBp
bnZhbGlkYXRpb24gaXMgbm90IHN1cHBvcnRlZCwgd2UgZXNjYWxhdGUgdG8NCj4+ICAgICAg
ICAqIHVzZSBzaW5nbGUgY29udGV4dCBpbnZhbGlkYXRpb24uDQo+PiAgICAgICAgKi8NCj4+
IC0gICAgaWYgKCBsaWtlbHkoY3B1X2hhc192bXhfdnBpZF9pbnZ2cGlkX2luZGl2aWR1YWxf
YWRkcikgKQ0KPj4gLSAgICAgICAgZ290byBleGVjdXRlX2ludnZwaWQ7DQo+PiAtDQo+PiAt
ICAgIHR5cGUgPSBJTlZWUElEX1NJTkdMRV9DT05URVhUOw0KPj4gKyAgICBpZiAoIHVubGlr
ZWx5KCFjcHVfaGFzX3ZteF92cGlkX2ludnZwaWRfaW5kaXZpZHVhbF9hZGRyKSApDQo+PiAr
ICAgICAgICB0eXBlID0gSU5WVlBJRF9TSU5HTEVfQ09OVEVYVDsNCj4+ICAgDQo+PiAgICAg
ICAvKg0KPj4gICAgICAgICogSWYgc2luZ2xlIGNvbnRleHQgaW52YWxpZGF0aW9uIGlzIG5v
dCBzdXBwb3J0ZWQsIHdlIGVzY2FsYXRlIHRvDQo+PiAgICAgICAgKiB1c2UgYWxsIGNvbnRl
eHQgaW52YWxpZGF0aW9uLg0KPj4gICAgICAgICovDQo+PiAtICAgIGlmICggIWNwdV9oYXNf
dm14X3ZwaWRfaW52dnBpZF9zaW5nbGVfY29udGV4dCApDQo+PiArICAgIGlmICggdW5saWtl
bHkoIWNwdV9oYXNfdm14X3ZwaWRfaW52dnBpZF9zaW5nbGVfY29udGV4dCkgKQ0KPj4gICAg
ICAgICAgIHR5cGUgPSBJTlZWUElEX0FMTF9DT05URVhUOw0KPj4gICANCj4+IC1leGVjdXRl
X2ludnZwaWQ6DQo+PiAgICAgICBfX2ludnZwaWQodHlwZSwgdi0+YXJjaC5odm0ubjFhc2lk
LmFzaWQsICh1NjQpZ3ZhKTsNCj4+ICAgfQ0KPiANCj4gQnV0IHRoaXMgaXNuJ3QgZnVuY3Rp
b25hbGx5IGlkZW50aWNhbCB0byB0aGUgb3JpZ2luYWwsIGF0IGxlYXN0IGluIHRoZQ0KPiBj
cHVfaGFzX3ZteF92cGlkX2ludnZwaWRfaW5kaXZpZHVhbF9hZGRyICYmDQo+ICFjcHVfaGFz
X3ZteF92cGlkX2ludnZwaWRfc2luZ2xlX2NvbnRleHQgY2FzZS4gV2UnZCBub3cgZW5kIHVw
IHVzaW5nDQo+IElOVlZQSURfQUxMX0NPTlRFWFQgdGhlcmUsIHdoZW4gaXQgd2FudHMgdG8g
Y29udGludWUgdG8gYmUNCj4gSU5WVlBJRF9JTkRJVklEVUFMX0FERFIuDQo+IA0KDQpZZXMs
IHRob3VnaCBhIGdvb2QgcXVlc3Rpb24gaXMgdG8ga25vdyBpZiB0aGVyZSBleGlzdCBhIENQ
VSB0aGF0IGhhcyANCklOVlZQSURfSU5ESVZJRFVBTF9BRERSIHdpdGhvdXQgSU5WVlBJRF9T
SU5HTEVfQ09OVEVYVDsgb3RoZXJ3aXNlLCB3ZSANCmNhbiBqdXN0IHNheSB0aGF0IHRoaXMg
aXMgbm90IHN1cHBvc2VkIHRvIGhhcHBlbi4NCg0KT25lIGFsdGVybmF0aXZlIEkgaGF2ZSBp
biBtaW5kIHdvdWxkIGJlIHRvIGhhdmUgY2FzY2FkaW5nIGZhbGxiYWNrcyB0byANCiJsYXJn
ZXIgc2NvcGUiIGFsdGVybmF0aXZlcy4NCg0KaS5lDQoNCnN0YXRpYyBpbmxpbmUgdm9pZCB2
cGlkX3N5bmNfYWxsKHZvaWQpDQp7DQogICAgIF9faW52dnBpZChJTlZWUElEX0FMTF9DT05U
RVhULCAwLCAwKTsNCn0NCg0Kc3RhdGljIGlubGluZSB2b2lkIHZwaWRfc3luY192Y3B1X2Nv
bnRleHQoY29uc3Qgc3RydWN0IHZjcHUgKnYpDQp7DQogICAgIC8qDQogICAgICAqIElmIHNp
bmdsZSBjb250ZXh0IGludmFsaWRhdGlvbiBpcyBub3Qgc3VwcG9ydGVkLCB3ZSBlc2NhbGF0
ZSB0bw0KICAgICAgKiB1c2UgYWxsIGNvbnRleHQgaW52YWxpZGF0aW9uLg0KICAgICAgKi8N
CiAgICAgaWYgKCB1bmxpa2VseSghY3B1X2hhc192bXhfdnBpZF9pbnZ2cGlkX3NpbmdsZV9j
b250ZXh0KSApDQogICAgICAgICByZXR1cm4gdnBpZF9zeW5jX2FsbCgpOw0KDQogICAgIF9f
aW52dnBpZChJTlZWUElEX1NJTkdMRV9DT05URVhULCB2LT5hcmNoLmh2bS5uMWFzaWQuYXNp
ZCwgMCk7DQp9DQoNCnN0YXRpYyBpbmxpbmUgdm9pZCB2cGlkX3N5bmNfdmNwdV9ndmEoc3Ry
dWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgZ3ZhKQ0Kew0KICAgICAvKg0KICAgICAgKiBJ
ZiBpbmRpdmlkdWFsIGFkZHJlc3MgaW52YWxpZGF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQsIHdl
IGVzY2FsYXRlIHRvDQogICAgICAqIHVzZSBzaW5nbGUgY29udGV4dCBpbnZhbGlkYXRpb24u
DQogICAgICAqLw0KICAgICBpZiAoIHVubGlrZWx5KCFjcHVfaGFzX3ZteF92cGlkX2ludnZw
aWRfaW5kaXZpZHVhbF9hZGRyKSApDQogICAgICAgICByZXR1cm4gdnBpZF9zeW5jX3ZjcHVf
Y29udGV4dCh2KTsNCg0KICAgICBfX2ludnZwaWQoSU5WVlBJRF9JTkRJVklEVUFMX0FERFIs
IHYtPmFyY2guaHZtLm4xYXNpZC5hc2lkLCAodTY0KWd2YSk7DQp9DQoNClRoYXQgcmVxdWly
ZXMgaW50cm9kdWNpbmcgdnBpZF9zeW5jX3ZjcHVfY29udGV4dCgpIGFoZWFkLCBidXQgd291
bGQgDQphdm9pZCB0aGUgY29ybmVyIGNhc2Ugd2l0aG91dCBtYWtpbmcgdGhpbmdzIHRvbyBj
b21wbGV4Lg0KDQo+IEphbg0KDQpUZWRkeQ0K

--------------cdWuHpJTJGfKkHXL2uBsgWx0--

--------------diKt5bgiUxQOPK85h8LhfW89
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqjy0AFAwAAAAAACgkQZg+p0QLLz9BR
LQwAkp3KeVor4hR32DbMDuwGgOSye0kEZucv30/cDP2QJ3cusq50PMIpx28zT+p30iHcjuuqv8lg
o+Rw+zJDktUCDlN4DqywcqbB/rV0eZZefiQOoIQN0YSdSKrcXrCvKQ/MQicywqxI73iFQ5cpCZUT
iIzwpqXu7sJOVspoVT7uMttXQBlaqY+eYYsAmyWbg/Xzx2gws3zpPPlBJH8CI2rX3QPYjULv6NWu
+xhCE8EeKktpbakqFJWVbgkQNB1/JMuznOaDRQYSoPRyU+ZQVOf4C1t/qXdx7p/t0dVEUETLnvQq
pzCP41PnkoLLHczLAbh936gb+9E8Qu1r/XiXmtd6ukGSJ3kTyBmLhiFbErq0r1eXg1+XldJbWlI7
h/BiemZ8o+QBg/S9/wZupgSMToHMYTg1pLyEcIsnalE3N4AoBhZXHPZOF/lm3Q5DySdv+/aZ5Mhl
e77XawD105+ct7x/57jXNKEdlAonI4FRUoK7pKAZcjuMpxL6QQYvfNHUB7Dv
=zp7d
-----END PGP SIGNATURE-----

--------------diKt5bgiUxQOPK85h8LhfW89--

