Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D9CC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:51:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366523.1616416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllb7-0003IK-EP; Mon, 20 Jul 2026 10:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366523.1616416; Mon, 20 Jul 2026 10:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllb7-0003ID-BR; Mon, 20 Jul 2026 10:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1366523;
 Mon, 20 Jul 2026 10:51:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wllb5-0003I7-Mk
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wllb4-00FXa4-VM
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:51:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dfdb4-e002-0a2a0a5209dd-0a2a450bb516-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:51:42 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dfdbe-b7e8-0a2a450b0019-d155802ce5ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:51:42 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4955484387cso8852775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:51:42 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e499c2sm27223883f8f.4.2026.07.20.03.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 03:51:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784544702; x=1785149502; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OdpTwlIHZNIU6FyGB9ndmA6uIhXXTHA5qlaMf7inl1c=;
        b=eHWIz4CLdxmQi7mw6aH5WasYUlTqza4yV5KCLkfCmB2T9AlNa/OqHKWHbm7fULEB2+
         mA5hN9mpPT3lXG+e8zqsRvtiGx5Vu+k4jEHy8b90nEmTlFgMZCcffb9fYEFqec/c9+78
         6etd2w+LhHnVjOKYMiBwyOs5JPBWXS2eCUi7gXHktKt3BPI9274oKV8nDzXk6mtfNgx2
         4GlDjVl6rlWka7kYFzYvAxUQF05OUpQEuYuhFhLLWUxGmXKT5NSmQncCd5gSdV3QAD96
         ANHvE5GwacvhHXRAtR+zahFHcH1qo27X3zg+vb+MWfweZCHXSRqhWumshXn5qAcXanhG
         LhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544702; x=1785149502;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdpTwlIHZNIU6FyGB9ndmA6uIhXXTHA5qlaMf7inl1c=;
        b=k2s2FJ5epkSYf9WyV9dYUkae4rjPyX47zMSfwGIKQLBX9Svz4wYgeoBxnktWxPNvq7
         tVD+gm3/QdgEnPxLLaRO4CCSvt3Sv/mvVG3FjtDwgbVxEr7sBjSTfiPF96BhtYe6L0bv
         2nxim9SJeWcEwjmeWGgU4okxHsUiFHXGFzPAluA7IXhD53P+B/YErB9iGBP4mYvIA01D
         UaK4E2T/mzNz2qXt0caiGpaH1OYMQlPAfJFbTW6FDzuNngjIZQuJNLKmB9140+6bNjgh
         SGhRhPNOVnwkVtl6zWjogcajx/vaEJlyViL/APz7XFYNzwi3MKtgC+Vf8TvmOM/ipm0L
         yhkw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Ie9ZZ3VJSDECUo2ke17JqI8B5CHdwDtj/EINnI08iZkHxuh8PXzEVQYi2Xj7cjwmzKi8MzGK/bo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3W1aax8JF4sF6iRz1y5tkwIw9c/pYsrZCgQnNdn7W8tFqJOPv
	kVa/ilU3wyzfl7ONkg/K5PM5IQ5SsCLfHw9mds8TBrYojIDH2W7c6oFPdq7eP87T2ha6e3bQcoh
	r/KMVKi0=
X-Gm-Gg: AfdE7cl2UHgxP1clzadgTROyjIGW3Fh7VphRbuGBLzFotJa/154IwraijmGpGEK6RnN
	aPicmw+ufu5ffxb/2E0ByD0REiBY83qPLCHV7B/TshygzX7hlQl5jy0N7II5GvwDTAdAF4/Oh6z
	etIcewoqSu6NvEZ9jfrQyAajqAUbDqd6vt5gORmwcG+iXOfC/1fpEnwdIH99oldNLNOHOBqEN4t
	d3XOoBJWW+151LNz6Z9LhPgeXLE3nmnkw4TnYuPehxaoduxOT/8Fs4NvZ63k8/NMmZHWnG9MQwq
	Am79GrgmBDXZt7ox0RjLpIAvKPAAjUmFBXaWAgBDKUG0Cuwi9r3K+s0W99e219Yo/BAZxehP8+b
	o/ujQMNw8nkG4Qxsu3OYaglvv1mWF4Spr+0b6tLJbfB7oSWVCsBNm3yQl7aTDOHqmP5N+x9ZTUF
	hUDn0kOG+o42M4JDyqUr76OHA72wXMnp6bKRew9Zi8uHxEmPkw+5TsnHN7YYmU5s8RqE26D2fOb
	C06w13uJzmyh18qykmk3ZhOTh/za6GY
X-Received: by 2002:a05:600c:8b74:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49558909180mr64338815e9.7.1784544702182;
        Mon, 20 Jul 2026 03:51:42 -0700 (PDT)
Message-ID: <033fe556-bfcb-4b59-acc2-2cc783241ea3@suse.com>
Date: Mon, 20 Jul 2026 12:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
 <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
 <1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@vates.tech>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z4eM6catzJhp7QGRgYp39wfE"
X-purgate-ID: tlsNG-42698a/1784544702-A90CD9EA-09FEE214/0/0
X-purgate-type: clean
X-purgate-size: 8592

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z4eM6catzJhp7QGRgYp39wfE
Content-Type: multipart/mixed; boundary="------------0fy4DhScTNzAH6cWgUShIdrH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <033fe556-bfcb-4b59-acc2-2cc783241ea3@suse.com>
Subject: Re: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
 <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
 <1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@vates.tech>
In-Reply-To: <1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@vates.tech>

--------------0fy4DhScTNzAH6cWgUShIdrH
Content-Type: multipart/mixed; boundary="------------GixFWorK5wOSwlV9Rb6n2FDz"

--------------GixFWorK5wOSwlV9Rb6n2FDz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDcuMjYgMTI6MzgsIFR1IERpbmggd3JvdGU6DQo+IE9uIDIwLzA3LzIwMjYgMTI6
MjksIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyMC4wNy4yNiAxMToyNywgVHUgRGlu
aCB3cm90ZToNCj4+PiBVc2UgWEVOX0RPTUNUTF9TRU5EVFJJR0dFUl9ERUJVRyB0byBhbGxv
dyBwcmludGluZyBkaWFnbm9zdGljcw0KPj4+IGluZm9ybWF0aW9uIG9mIGEgc3BlY2lmaWMg
ZG9tYWluLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVHUgRGluaCA8bmdvYy10dS5kaW5o
QHZhdGVzLnRlY2g+DQo+Pj4gLS0tDQo+Pj4gIMKgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxf
ZG9tYWluLmPCoCB8IDQgKysrKw0KPj4+ICDCoCB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5
cGVzLmlkbCB8IDEgKw0KPj4+ICDCoCB0b29scy94bC94bF9jbWR0YWJsZS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAyICstDQo+Pj4gIMKgIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvDQo+Pj4gbGlieGxf
ZG9tYWluLmMNCj4+PiBpbmRleCAzN2ZjZDkyODcxLi4yZDgyOTBkYmZhIDEwMDY0NA0KPj4+
IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tYWluLmMNCj4+PiArKysgYi90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2RvbWFpbi5jDQo+Pj4gQEAgLTIxOTAsNiArMjE5MCwxMCBA
QCBpbnQgbGlieGxfc2VuZF90cmlnZ2VyKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdA0KPj4+
IGRvbWlkLA0KPj4+ICDCoMKgwqDCoMKgIGNhc2UgTElCWExfVFJJR0dFUl9TM1JFU1VNRToN
Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbWFpbl9zM19yZXN1bWUoYW8sIGVnYywgZG9t
aWQpOyAvKiBtdXN0IGJlIGxhc3QgKi8NCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBBT19JTlBST0dSRVNTOw0KPj4+ICvCoMKgwqAgY2FzZSBMSUJYTF9UUklHR0VSX0RFQlVH
Og0KPj4+ICvCoMKgwqDCoMKgwqDCoCByYyA9IHhjX2RvbWFpbl9zZW5kX3RyaWdnZXIoY3R4
LT54Y2gsIGRvbWlkLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFTl9ET01DVExfU0VORFRS
SUdHRVJfREVCVUcsDQo+Pj4gdmNwdWlkKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7
DQo+Pg0KPj4gWW91IGFyZSBzZW5kaW5nIFZJUlFfREVCVUcgb25seSB0byBvbmUgdmNwdS4g
V291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBhZGQNCj4+IHRoZSBjYXBhYmlsaXR5IHRvIHNl
bmQgaXQgdG8gYWxsIHZjcHVzIG9mIGEgZG9tYWluPw0KPj4NCj4+DQo+PiBKdWVyZ2VuDQo+
IA0KPiBJdCdzIGEgY3VycmVudCBsaW1pdGF0aW9uIG9mIHhsIHRyaWdnZXIgdGhhdCBpdCBj
YW4gb25seSBzZW5kIHRyaWdnZXJzDQo+IHRvIDEgdmNwdSBhdCBhIHRpbWUuIFBlcmhhcHMg
YSBzcGVjaWFsIHZjcHVpZCB2YWx1ZSBjb3VsZCBiZSBkZWZpbmVkIGZvcg0KPiB0aGlzIHB1
cnBvc2UsIHRoZW4geGwgdHJpZ2dlciBjYW4gdXNlIHRoaXMgdmFsdWUgd2hlbiAiYWxsIiBp
cyBzcGVjaWZpZWQNCj4gb24gdGhlIGNvbW1hbmQgbGluZT8NCg0KVGhlIHF1ZXN0aW9uIGlz
IHdoZXRoZXIgd2Ugd2FudCB0aGlzIHNwZWNpYWwgaGFuZGxpbmcgaW4gdGhlIGh5cGVydmlz
b3Igb3INCmluIHRoZSB0b29scy4NCg0KSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaGFu
ZGxlZCBhdCB0b29scyBsZXZlbCwgYnV0IEknbSBub3QgZmVlbGluZyBzdHJvbmcNCmluIHRo
aXMgcmVnYXJkLg0KDQoNCkp1ZXJnZW4NCg==
--------------GixFWorK5wOSwlV9Rb6n2FDz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GixFWorK5wOSwlV9Rb6n2FDz--

--------------0fy4DhScTNzAH6cWgUShIdrH--

--------------Z4eM6catzJhp7QGRgYp39wfE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpd/b0FAwAAAAAACgkQsN6d1ii/Ey+O
uQf/es+QSQKT2GDl4ZYGV3GvbIzV8DNwxqr6gyOYWJKSud2UjgjdwUdY++Ti5rh75FBx/bUJstZe
c/S4y8U15zJyiOPf8PtpPmLZ19cf0naCHKKItAGGZXp2ZvKYdWWafe3pTFbTQunNIQJ6bwUts/kD
0L8GJSPZWO96tIvnLESx9zVQzKJqDZyAxcv8KZ7trt+qraveneBBOVP8IXYAQ+4bCxPwibH49ly/
axhGC+ULEza0laSlkcUo2vd0Eba6YJITjeELrDpfV6Nd7v1EUD3z6qU9HPDiG+GwF6bxxqDr+IK8
A+gf+4ykJvftQomwKMFoiE8YuJW0KYPuLe3rtAp8cw==
=9cHA
-----END PGP SIGNATURE-----

--------------Z4eM6catzJhp7QGRgYp39wfE--

