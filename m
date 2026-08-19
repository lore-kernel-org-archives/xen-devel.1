Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84048C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:12:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394709.1633377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaSy-0005Hu-Ay; Wed, 19 Aug 2026 07:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394709.1633377; Wed, 19 Aug 2026 07:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaSy-0005Hn-8P; Wed, 19 Aug 2026 07:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1394709;
 Wed, 19 Aug 2026 07:12:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwaSw-0005Hf-Qw
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:12:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaSw-001aGL-7W
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:12:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a85572c-bab6-0a2a0a5309dd-0a2a4503aeec-30
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:12:02 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a855741-fae8-0a2a45030019-d1558031dcbc-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:12:02 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49978908b35so4620295e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:12:02 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aaef1665sm35726875e9.5.2026.08.19.00.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:12:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787123521; x=1787728321; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEHv+CzXB3/Fiyf4F4VjBjL5OCrtiPJUOpuAMs0AdoE=;
        b=f8cUW3pChEPCgbWBTQ83j9FPKnF/F93RAi0v/a2jANlB8B0kWsGxKfWnt8g4ZLzGOA
         03wEQTXXjxeJ1mDPX20ECUzMiWvTFJU7CUHddpFE54TDzVdh73kW9e+UF2rFjLlp3OAa
         fjRPH9OuauOwZlUUSvXU7IeWdZ9vrkK2vhjq1ohxpwH82my4HEYTv3r7oaI+zq/WNDO7
         XLRekIBTbWRwbXFW8px+zweJZy12fDRcyU3HVbk85DTdj4mK9qr6F6Rmyj7nAhz6W82L
         d68oP9n1I8Rcf9ciz4N0x9fAfdrfnyRCTAshfGzgEtIzouFKEkwqr4Q1QGlr/P+2UEH8
         RiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123521; x=1787728321;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEHv+CzXB3/Fiyf4F4VjBjL5OCrtiPJUOpuAMs0AdoE=;
        b=UmF0SE5en16LwoqdnIzUVHeE+E7HhMfXGTVfdd4yQVqzInkuNCg4ergLO1xAZADTCF
         rYdBa3HqmU6/LJ5a6P5b+MNGXVXN9Jp23lwUrxFLZLeLDVFyWO5tLEysPADfvkDs7RoQ
         6GF7QRAIDv/glmuBF9DGK/kk3/u/1gjXANo2FfErP83VkI3LAuwxmC1vFqh5X3+pzdQv
         wdD40Ahlw5N4j8JbRyKyPXlsgx7QYmHlQZ+DMJSDO0fXEgZljE280i0wgTmG/dl2BfPn
         9wONzdJd6CiRNyJFFzW8/RXSecCLZmIQzdbKcFy3wQ0gybU6MwaiI0CkHqQBFUZQSldp
         YY1w==
X-Forwarded-Encrypted: i=1; AHgh+RqOET8iM9Q8ftwIuRDpzfsZbZtR3jCjibTphKZE3ag/wzwVrh7OZY9rBFv2JJrFekhdfKtK43Kq+r4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBJ1hIxJ1lgs9xc2NvJBysjd96XCskiraKVUtZQu1Qls4+zSC0
	9bxda0bBCA1OkDa0Bj5g327Y2erYjmo/hbrjjzzw+6pOrJgE69mE/bqumg8PUGtUPmqWaeYQTfb
	oQGLguVM=
X-Gm-Gg: AR+sD12KT8nk+Id0PRuGYI5aeAE76pqmngkt8c0TxxlSdB6YPfOmQL9BAMzt8Nnl8TJ
	KYwWA0JT4wubcmke5XlqPSRXnwoYoJRKHewa+i05hQ5ZpUWyhwBVoOHAhZ2u5fcwx1qGDCfUY1z
	1h6TiqJgy2gKiQW5m43o/jLPBQC8RieF0xX0iA/qHaizgdbxWaolo7YUOcj5SNiHsOmD8EH++PO
	MtoVrckTcCFvsUkJuwUPT506edhhMKAymIARueYQ/ulctVc8J3LuEFqD9DyGKzitGdNjVfo3FZz
	NNGHdVEnfH/89/qD+x7YkFSLl28znQ8vPoO3erYoQXfE5QVgEqgENUjeneWHaYcAd+d+Mw4MTqR
	iG21QqJDOT2DxGfPXA+ekwFnmSXCs21zA/lM9hwvPqT4iPJhHZEJhlgeheXI9o2wfqKyI2BllsT
	9AXjvYU+ZcgczV2vHhRpfdbJrxZHutvcaPYRtwXff9CLNTVgCNP0X0UARDOea8epN+1tS6siYhJ
	CncbxdOxcFBczriurX71DCOpY5douoLDcCU8yed/S7LWI2nT4icUkiyRk/tLzPwhUpKEwLdugdX
	jTmKIxdBa58ftA==
X-Received: by 2002:a05:600c:8b70:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-499aa1ea322mr41505155e9.15.1787123521493;
        Wed, 19 Aug 2026 00:12:01 -0700 (PDT)
Message-ID: <ab78351b-6b03-407c-9bcd-74b1566fd853@suse.com>
Date: Wed, 19 Aug 2026 09:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com> <aoTRyxN4gzsEwJa5@end>
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
In-Reply-To: <aoTRyxN4gzsEwJa5@end>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6u4Zdt0q1c61OmVqarKYgq0b"
X-purgate-ID: tlsNG-33051d/1787123522-6DCD34E9-D4F821D7/0/0
X-purgate-type: clean
X-purgate-size: 8593

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6u4Zdt0q1c61OmVqarKYgq0b
Content-Type: multipart/mixed; boundary="------------2Hkm9I00nWh2bfGBkdpYqawm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <ab78351b-6b03-407c-9bcd-74b1566fd853@suse.com>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com> <aoTRyxN4gzsEwJa5@end>
In-Reply-To: <aoTRyxN4gzsEwJa5@end>

--------------2Hkm9I00nWh2bfGBkdpYqawm
Content-Type: multipart/mixed; boundary="------------CjbwuI0AhnZvKZgA9rzYxhBL"

--------------CjbwuI0AhnZvKZgA9rzYxhBL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMjM6NDIsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSsO8cmdlbiBH
cm/DnywgbGUgbWFyLiAxOCBhb8O7dCAyMDI2IDA3OjQzOjM0ICswMjAwLCBhIGVjcml0Og0K
Pj4gT24gMTcuMDguMjYgMTg6MzcsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+PiBKdWVy
Z2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIwMjYgMTA6MjQ6MDIgKzAyMDAsIGEgZWNy
aXQ6DQo+Pj4+IE9uIDE3LjA4LjI2IDA5OjQ4LCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+
Pj4+PiBKdWVyZ2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIwMjYgMDk6MTg6NDEgKzAy
MDAsIGEgZWNyaXQ6DQo+Pj4+Pj4gVGhlcmUgaXMgbm8gdXNlciBvZiBsaWJwY2kgbGVmdCBp
biBzdHViZG9tcy4NCj4+Pj4+Pg0KPj4+Pj4+IFJlbW92ZSBsaWJwY2kgZnJvbSB0aGUgc3R1
YmRvbSBidWlsZCBzeXN0ZW0uDQo+Pj4+Pg0KPj4+Pj4gV291bGRuJ3QgaXQgYmUgdXNlZnVs
IHRvIGtlZXAgdGhpcyBmb3IgYW55Ym9keSB3aG8gd291bGQgd2FudCB0byBkcml2ZSBhDQo+
Pj4+PiBQQ0kgY2FyZCBmcm9tIGEgc3R1YmRvbWFpbj8NCj4+Pj4+DQo+Pj4+PiBJIG1lYW4s
IGluIHRoZSB6bGliIGNhc2UsIGl0J3MgcmVhbGx5IGEgbWVyZSBxdWVzdGlvbiBvZiBidWls
ZCAmIGxpbmssDQo+Pj4+PiBzbyB3ZSBkb24ndCBuZWVkIHRvIHNoaXAgaXQsIHBlb3BsZSBj
YW4gZG8gaXQgdGhlbXNlbHZlcyBlYXNpbHkgbGlrZSBmb3INCj4+Pj4+IGFueSBvdGhlciBs
aWJyYXJ5Lg0KPj4+Pj4NCj4+Pj4+IEJ1dCBoZXJlIHRoZXJlIGlzIGFjdHVhbCBwb3J0aW5n
IHdvcmssIHRoYXQgd2UnZCBiZXR0ZXIgbm90IGxvc2UgYnV0DQo+Pj4+PiBrZWVwIHNoaXBw
aW5nLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGFsbCBzdGlsbCBhdmFpbGFibGUgdmlhIGdpdC4N
Cj4+Pg0KPj4+IE5vLCBpdCBpcyBub3QgcmVhbGx5Lg0KPj4+DQo+Pj4gSSBrZWVwIHJlYWRp
bmcgdGhpcyBhcmd1bWVudCwgYnV0IHBlb3BsZSB3aWxsIG5vdCBrbm93IHRoYXQgc29tZXRo
aW5nDQo+Pj4gZXhpc3RzIGluIHRoZSBnaXQgaGlzdG9yeSwgYW5kIHdpbGwganVzdCBhc3N1
bWUgdGhhdCBpdCBkb2VzIG5vdCBleGlzdA0KPj4+IGFuZCBoYXMgdG8gYmUgd3JpdHRlbi4N
Cj4+DQo+PiBXaGF0IGFib3V0IGFkZGluZyBhIGNvbW1lbnQgdG8gdGhlIHN0dWJkb20gTWFr
ZWZpbGUgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgbGlrZToNCj4+DQo+PiAjIHBjaXV0aWxzIHN1
cHBvcnQgaGFzIGJlZW4gcmVtb3ZlZCB3aXRoIGNvbW1pdCA8Y29tbWl0LWlkPiwgcmV2ZXJ0
IHRoYXQgcGF0Y2gNCj4+ICMgaW4gY2FzZSBpdCBpcyBuZWVkZWQgYWdhaW4uDQo+Pg0KPj4g
SSB0aGluayB0aGlzIHdvdWxkIGJlIHByZWZlcmFibGUgb3ZlciB1bnVzZWQgYW5kIHByb2Jh
Ymx5IGJpdC1yb3R0ZW4gY29kZSBpbg0KPj4gdGhlIHJlcG9zaXRvcnkuDQo+IA0KPiBJIGRv
bid0IHNlZSB3aHkgaXQgd291bGQgYmUgYml0LXJvdHRlbiwgc2luY2UgdGhlIHBjaXV0aWxz
IHZlcnNpb24gaW4NCj4gdXNlZCBpcyBmaXhlZCwgaXQncyBhIGxpYnJhcnkgdGhhdCBoYXMg
YSBxdWl0ZSBzdGFibGUgQVBJLCBhbmQgdGhlIHBjaQ0KPiB4ZW4gaW50ZXJmYWNlIGlzIHN1
cHBvc2VkIHRvIGtlZXAgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCg0KVGhlbiBJJ2QgcmF0
aGVyIGFkZCBpdCB0byBNaW5pLU9TIChwcm9iYWJseSBiZWhpbmQgYW5vdGhlciBDT05GSUcg
b3B0aW9uKSB0aGFuDQpoYXZpbmcgaXQgaW4gdGhlIFhlbiB0cmVlLg0KDQpUaGlzIHdheSBp
dCBjb3VsZCBiZSB0ZXN0LWJ1aWx0IG11Y2ggZWFzaWVyIHdpdGggTWluaS1PUywgdGh1cyBh
dm9pZGluZyBhbnkNCmJyZWFrYWdlIGluIGNhc2UgZS5nLiBhIHBjaWZyb250IGludGVyZmFj
ZSBpcyBjaGFuZ2VkLg0KDQoNCkp1ZXJnZW4NCg==
--------------CjbwuI0AhnZvKZgA9rzYxhBL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CjbwuI0AhnZvKZgA9rzYxhBL--

--------------2Hkm9I00nWh2bfGBkdpYqawm--

--------------6u4Zdt0q1c61OmVqarKYgq0b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqFV0AFAwAAAAAACgkQsN6d1ii/Ey8H
OQf7BlkHTXqrxdOdphZJFu+dVI34Y9OBwMw6BUdUtOmO2cSZtlej59nt6z/O+R+alAAz6dhaH1Dg
8zuYsdgtFSZubjIv6FVh/UYvvyhyMPajTFdCNUQkmfbdOR6YnLGVjCkIpabU2zcCo3aKJXo/7k/H
gjC1oCSD9DpoYzUjWgQkjs05gyr/Y0u62CthRFrh5JK8JkqNSxCOeNP2Pm6QvteNEvrv8zTdeBKi
jjyM514PSltoWGS05xxdAMBVDUuLV07EM0JL49rrg2ccUpzzJkeHU3pHSFCjD7350ALzznqFOOZD
pkhJ1xPl31K2RKWpcMp37sFYmL8mxcC3y75uD/vpRA==
=w521
-----END PGP SIGNATURE-----

--------------6u4Zdt0q1c61OmVqarKYgq0b--

