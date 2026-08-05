Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7268C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:44:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383208.1626467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYAN-0004iX-UD; Wed, 05 Aug 2026 09:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383208.1626467; Wed, 05 Aug 2026 09:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYAN-0004iQ-RX; Wed, 05 Aug 2026 09:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1383208;
 Wed, 05 Aug 2026 09:44:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrYAM-0004iK-BD
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:44:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrYAL-0041xN-Jb
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:44:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7305b8-2eae-0a2a0a5409dd-0a2a4503ce90-44
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:44:01 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7305e1-fae8-0a2a45030019-d155da29c161-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:44:01 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c1c4c7ddaf6so136317566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:44:01 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c20363e6e8fsm91963166b.39.2026.08.05.02.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:44:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1785923041; x=1786527841; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIxT2QYlt7MhR6tH5xbR++rCxhH8SJlguVhp+ZQ3HcE=;
        b=TB68hf9lg726mk2jjJKMyJjrPpCfpnS+SXRdAAolAvU7saGO1H3uxf0KHwhlcVzZOq
         YCFjTpMxFBbtkcbpT2mkZQcgnkWy27WpnUqLpx5t7FZ+Gyfz8TZkJWr3ri4NnSzPZlyW
         5vqFk2rckVHgfkXsr6uiOtfNua+3mwhkKdGTvuJSI8UT88wI2Xq/+M/+feV/Qrn/nI+T
         N0j3UCJjNauvCdS2qp4988utffYzsCB6rcnfBsTwVK+QrIY+sotGKz6OFZFUa+Mr5Iuo
         jUevN0xc+5Ejkux4SHmZO/RIF4ei1bZCT5DD0xdu19D7QQnmkehFbq01TPWTgj4Ap2Mt
         hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923041; x=1786527841;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIxT2QYlt7MhR6tH5xbR++rCxhH8SJlguVhp+ZQ3HcE=;
        b=PLSgfYXb8Iol1QdVoriPtFYl3ep2E9kw1SOmrhSGIM1Ju2iIUHlNB01PgJ+cKcyphP
         0Lndd/TBW79fPTfArbJE+bo4CL2go4yi6wl1BtLMBqsqQwE1zmaZsp1UfsbbO4l7VqoT
         +M0euj+SJPogaaRHVAymRjv2/uHU+Lg4Uh3o3i4p93li6tQNpIAg2fJoNYHeLrFqdu2/
         1JF9QQoOZINWMkJiCh0qwY6dqcJj92FyrUOnJasW5cawjf8bvwTWtGYdi9zuASQrEDNa
         0atAE6cQNnNrpkQMAtNdetF3GG0atZT0QLfZWSD9fwBY+Xs0nhNFQIFd8vi2cx4stAaB
         bNYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrI8OzIVgXIxMljQgVxcodzC3bFN9HV5Xa80B1N1pnnCqiAoogjDK68s5n9FqkbEDDNRHCGTFwEM+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyFjylmlLt9uTOs2zKvKD8ULP41HbyltVNi3usBEFWzgDyv5Nt
	sWkdAgzLCWHKKDahkRgA80L/3paXKdZ32Im4J9sLO9X7W0cFYUpTZjLfQuKu68XVLzk=
X-Gm-Gg: AR+sD12gTfwxSCIW8rLXTW3FDIdMHUg1dvk+Fuoz7f/ecVBlke46pWiXlWRQ6/hjK8y
	hAJul2Sc0nofVJFcY1kHIJP4ZqfvgpZnI8F7C5sf6ueizFlNHUo0hzGku0dPd6o6suexZXGmOAm
	4y9+HiSdnZzuYsM6iUGJAcdJPe++cUQrRKwSDWYZA01leDCvT3HzmKAAWK/O3hKMRNRGGZTUJoE
	NDkyqizdqBIb9da5cElSzkUwJv5Byd3uTGC0To66NYnFKjBAjJi/b4IZ19dze6xFO/SI9ZN1aJu
	yRMh+4dcgrnIvhZQEKerlvp53fK4fgYlgUfauq2FZKjOcvBIUzIL2CkpUNmAEty/U8FM+IErnhD
	H4FXlT10bqa/DJnsmfmZbHuPPZKoO1ZpDbeFDDHTabr9ysEmYZkctwQiyWNu5noiKjGFa3i1ZWO
	9G6C6VeAsi/RoyZj2O0QyETEZBk0X4cocAj3ZMdgh0qRrO2BFQBN6hfscaplA4JdK/+LdRogWc/
	tnS2JN4Uj5gkcjMdWq9VZMq3r4XzVKyIo3qIMJkdY3CDv3zR5hsNRK/bc/Qetzph8p/WzHnpNBC
	hJuHxuEq7AcZ7Ww=
X-Received: by 2002:a17:907:1b04:b0:c12:1651:17b2 with SMTP id a640c23a62f3a-c2039d256e2mr229300166b.9.1785923040816;
        Wed, 05 Aug 2026 02:44:00 -0700 (PDT)
Message-ID: <a5cce538-87d2-40e5-8a8c-21102fb37a52@suse.com>
Date: Wed, 5 Aug 2026 11:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 IngoMolnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 lkml <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
 <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
 <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
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
In-Reply-To: <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JLsQo2xsfStlXt0qsnHsk5Ct"
X-purgate-ID: tlsNG-33051d/1785923041-6CCDB4E9-0E4393B9/0/0
X-purgate-type: clean
X-purgate-size: 11313

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JLsQo2xsfStlXt0qsnHsk5Ct
Content-Type: multipart/mixed; boundary="------------0mvgBLd6VDmor8xQK9Xed228";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 IngoMolnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 lkml <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>
Message-ID: <a5cce538-87d2-40e5-8a8c-21102fb37a52@suse.com>
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
 <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
 <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
In-Reply-To: <bbae3eb9-6d1e-4caf-a647-25ca9ca8a61c@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------0mvgBLd6VDmor8xQK9Xed228
Content-Type: multipart/mixed; boundary="------------aNYvgKSbnjvWNPRRggTG00UI"

--------------aNYvgKSbnjvWNPRRggTG00UI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI2
IDEwOjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDUuMDguMjYgMTA6NDQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjA4LjIwMjYgMTA6MjEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL2FyY2gveDg2L3hlbi9NYWtlZmlsZQ0KPj4+PiArKysg
Yi9hcmNoL3g4Ni94ZW4vTWFrZWZpbGUNCj4+Pj4gQEAgLTM3LDggKzM3LDggQEAgb2JqLSQo
Q09ORklHX1hFTl9QVkgpCQkrPSBlbmxpZ2h0ZW5fcHZoLm8NCj4+Pj4gICAgb2JqLSQoQ09O
RklHX0VWRU5UX1RSQUNJTkcpCSs9IHRyYWNlLm8NCj4+Pj4gICAgDQo+Pj4+ICAgIG9iai0k
KENPTkZJR19TTVApCQkrPSBzbXAubw0KPj4+PiArb2JqLSQoQ09ORklHX1NNUCkJCSs9IHNt
cF9odm0ubw0KPj4+PiAgICBvYmotJChDT05GSUdfWEVOX1BWX1NNUCkgIAkrPSBzbXBfcHYu
bw0KPj4+PiAtb2JqLSQoQ09ORklHX1hFTl9QVkhWTV9TTVApICAJKz0gc21wX2h2bS5vDQo+
Pj4NCj4+PiBTaW1pbGFyIGlzc3VlIGhlcmUgLSBpbiBhIFBWLW9ubHkgY29uZmlnIHNtcF9o
dm0ubyBkb2Vzbid0IHdhbnQgLyBzaG91bGRuJ3QNCj4+PiBuZWVkIGJ1aWxkaW5nLg0KPj4N
Cj4+IE5vdGUgdGhhdCBJIGRpZG4ndCBjaGFuZ2UgYW55IGZ1bmN0aW9uYWxpdHkuDQo+Pg0K
Pj4gSSBhZ3JlZSB0aGF0IGl0IHNlZW1zIGEgbGl0dGxlIGJpdCBzdHJhbmdlLCBidXQgaW4g
dGhlIGVuZCBJIGJlbGlldmUNCj4+IHRoZSBjdXJyZW50IHN0YXR1cyBpcyBva2F5LWlzaC4g
UFYtb25seSBoYXNuJ3QgYmVlbiBzb21ldGhpbmcgaW4gdXBzdHJlYW0NCj4+IExpbnV4IHNp
bmNlIFhlbiBzdXBwb3J0IHdhcyBhZGRlZCwgYXMgUFYgd2FzIGFsd2F5cyBtZWFudCB0byBi
ZSBhbg0KPj4gYWx0ZXJuYXRpdmUgdG8gYmFyZSBtZXRhbCBzdXBwb3J0IHZpYSBwYXJhdmly
dCBwYXRjaGluZy4gSXQgbWlnaHQgaGF2ZQ0KPj4gYmVlbiBwb3NzaWJsZSB0byBidWlsZCBh
IGtlcm5lbCBub3QgcmVhbGx5IGZ1bmN0aW9uYWwgb24gYmFyZSBtZXRhbCwgYnV0DQo+PiB0
aGlzIHdhcyBtb3JlIGxpa2UgdGhlIGFiaWxpdHkgdG8gYnVpbGQgYSB4ODYga2VybmVsIG5v
dCB3b3JraW5nIG9uIGFueQ0KPj4gZXhpc3RpbmcgbWFjaGluZS4NCj4+DQo+PiBJTU8gdGhl
IFhlbiBrZXJuZWwgY29uZmlnIG9wdGlvbnMgc2hvdWxkIGFsbG93IGZvciBhZGRpbmcgWGVu
LXNwZWNpZmljDQo+PiBmZWF0dXJlcywgYnV0IG1pbmltdW0gWGVuIHN1cHBvcnQgc2hvdWxk
IGFsd2F5cyBoYXZlIGJhc2ljIEhWTSBzdXBwb3J0LA0KPj4gd2hpY2ggaW5jbHVkZXMgdGhl
IFhlbiBzcGVjaWZpYyBwZXJmb3JtYW5jZSBlbmhhbmNlbWVudHMuDQo+IA0KPiBJIGZlYXIg
SSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuIElmIEkgd2FudCBhIGtlcm5lbCBqdXN0IHRvIHJ1
biBhcyBQViBEb20wLA0KPiB3aHkgd291bGQgaXQgbmVlZCB0byBjYXJyeSBhbnl0aGluZyBI
Vk0taXNoPyBUaGF0IGlzIChvciBzaG91bGQgYmUpDQo+IGVudGlyZWx5IHVucmVsYXRlZCB0
byBiZWluZyBhYmxlIHRvIGFsc28gcnVuIHRoaXMgc2FtZSBrZXJuZWwgb24gYmFyZW1ldGFs
DQo+IHRoZW4uDQoNClRoZSBmYWN0IGlzIHRoYXQgWGVuIFBWLW1vZGUgd2FzIGFsd2F5cyBh
IGZlYXR1cmUgbm90IHJlYWxseSBsaWtlZCBlc3BlY2lhbGx5DQpieSB4ODYgbWFpbnRhaW5l
cnMgKHRoaXMgaXMgdGhlIHBvbGl0ZSB3YXkgdG8gcGhyYXNlIGl0KS4NCg0KQ2hhbmdpbmcg
c29tZXRoaW5nIG91dHNpZGUgb2YgeGVuLXNwZWNpZmljIHBhcnRzIG9mIHRoZSBrZXJuZWwg
aW4gZmF2b3Igb2YgUFYgaXMNCm5lYXJseSBhbHdheXMgYSBmaWdodCBhbmQgSSdtIHByZXR0
eSBzdXJlIEkgb25seSBnZXQgY2hhbmdlcyBpbiBieSBwbGF5aW5nIG5pY2UNCihub3QgY2hh
bmdpbmcgbW9yZSB0aGFuIGFic29sdXRlbHkgbmVjZXNzYXJ5IGFuZCBjbGVhbmluZyB1cCBj
b25zdGFudGx5KS4gSSB3aWxsDQpjZXJ0YWlubHkgbm90IHRyeSB0byBwdXNoIGZvciBhICJQ
Vi1vbmx5IiBrZXJuZWwgd2hpbGUgdGhlIGhvcGUgb2YgdGhlIHg4Ng0KbWFpbnRhaW5lcnMg
aXMgbW9yZSAiUFYgd2lsbCBnbyBhd2F5IHNvbWUgdGltZSBpbiBmdXR1cmUiLg0KDQpUaGUg
Y2FwYWJpbGl0eSB0byBjb25maWd1cmUgdGhlIGtlcm5lbCB3aXRob3V0IEhWTSBzdHVmZiBi
dXQgd2l0aCBYZW4gc3VwcG9ydA0KaXMgdGhlIHdheSBpdCBoYXMgYmVlbiBzaW5jZSBtYW55
IHllYXJzIG5vdy4gTm9ib2R5IGhhcyBtaXNzZWQgYSBQVi1vbmx5IGtlcm5lbCwNCnNvIEkg
Y29uY2x1ZGUgdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhhdC4gVGhlIGNsb3Nlc3Qgd2Ugd2ls
bCBnZXQgaGVyZSBpcyBhIFBWSA0Kb25seSBrZXJuZWwsIGFuZCB0aGlzIGlzIHBvc3NpYmxl
IGJ5IG5vdCBlbmFibGluZyBDT05GSUdfWEVOX1BWSFZNX0dVRVNULg0KDQoNCkp1ZXJnZW4N
Cg==
--------------aNYvgKSbnjvWNPRRggTG00UI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------aNYvgKSbnjvWNPRRggTG00UI--

--------------0mvgBLd6VDmor8xQK9Xed228--

--------------JLsQo2xsfStlXt0qsnHsk5Ct
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzBeAFAwAAAAAACgkQsN6d1ii/Ey/q
kwgAlENLixbffh1SBVhe3sWFz6j0uq2XADYRYKiwTMK9ic7L3Vvuu9roHT56SIivEKim2BzkL/7t
rBMTAV61qkqJs0DxOLajX5HcpYLX8nNxYGuSMNclukSCnEvuXpGSBoa5eZlizASZNyjWm3IpeSuO
E+FuxJfOEuN80H625y9YWocJmjRpTyW4fD/507Y5jCn9OWl/R65fQWwtZkM9WxR/iseqvibHGxg1
NWzOKzqOu+IEVQ1oUhjyN0iS43afKKe4wCf//LcULbgqahIxdawQ2y2wpC7mDOu2577h8ffiIdPH
PaiAx/zpbIj7xLAK7QQLlBELXKo/gw9bD3YKbiigbw==
=yloA
-----END PGP SIGNATURE-----

--------------JLsQo2xsfStlXt0qsnHsk5Ct--

