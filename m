Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E1C61DD3
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 15:15:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402147.1637520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzyI8-0003VD-Ls; Fri, 28 Aug 2026 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402147.1637520; Fri, 28 Aug 2026 15:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzyI8-0003V6-JG; Fri, 28 Aug 2026 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 1402147;
 Fri, 28 Aug 2026 15:14:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wzyI7-0003V0-62
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:14:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzyI6-00F0n8-Iz
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 17:14:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a91a5de-8faa-0a2a0a5109dd-0a2a4507abb0-2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 17:14:45 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a91a5e5-b4ea-0a2a45070019-d155d031b9b5-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 17:14:45 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6a082b3671fso1409303a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:14:45 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a611c7773asm698728a12.31.2026.08.28.08.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 08:14:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1787930085; x=1788534885; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Chw7Z0YDubxS/jUiv6/zEGR1NZfWXVa7KNTPT8Aydg=;
        b=d9ak4dLRoZyP9fXLIjRawJ43Bx9JNMct1aDO07foCAR2CjrqPViNSTj0CpQcf0eM9D
         TKnDHUWGnWbFD0IkGU+qZU7zoD9uV+r7gxXF+mruU/zcsqDCEG8v5Vlw0abxZorYIouc
         sgayNm57bj/C7Vk1Ynrr6i8RNx9vosU+aO/SfuAsWo9uWxsxmJOVESMIhORLDKoO7pWL
         T8qNntsHM4vdpKTC+7h8WaLe/vgAJ4bm6B7KmFXgbv0wFypH53BGmdEb7+7wGnpTe5Zx
         FRqXLImEqWE9Kh0cutN5sAn7gePSUHVTDqqI3kjcKC1v5MQ6Hj6PciG9nvLztVttH6q1
         ZxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930085; x=1788534885;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Chw7Z0YDubxS/jUiv6/zEGR1NZfWXVa7KNTPT8Aydg=;
        b=gT+fh8JM9B9tZpawzDu5yf4VeTRQSiD4lXQoyMxyMtWXKmFvt6hbywG9In6yuxZEVT
         FgXqcj/Yiw64l8yL64wiurzuZy0Wi7vdlJr2kawBkDH6zVlkBgx7bSxy9tl+EW4V3suZ
         eARL18kUQ1KyKa4VRfQaqLBfXJOn+ddm2sXJ5pGYMZgwP2GEtAIKpcxcXn/bmFBsduZP
         DE+NkrBlia2XW81RUSbm4lES29Jgbc27LHvDSUFEWUDl8GyLQgo/Gh04Rb/trepfa5j1
         WGRGI3+kHitriblU7UkPxa/Pgdp3xhuxfMqSI7ef/VOt6XSk925hmVgjKYhP54I19PU7
         D8Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rqwm6DKYQYGKh+WGete0IN5VcsnBv1V9RmLJ2JCysS3WBtB5xCSCik0e/zLLRULHzAh30dYtvm+1P0=@lists.xenproject.org
X-Gm-Message-State: AFuF++llXE+3Lafc2/zVZaPOgu9DHoCZCArhu55NfqRfD8C6xTyCr+e3
	2cSXaxApAmF36pXQJuqs01VhZLuXaD2PxrJ9GQUA0HCq/HPekB8qLAHsBkG0WHedLRpKwIKEnb9
	x0F5R+iw=
X-Gm-Gg: AR+sD10sY4qKAndiXN5KNJ19AUXi4pMC+qooGBPrUpInDE6rs8xIBmJFO0FjzajsbMJ
	VwGeMGeth40xKwyvj2N48ouQJ+80VfkT/1S+Mwv/smyFTY+2Vlxh5Tha9zst2xQCQIrE0ii9iF3
	zADgmJvadb6wEpqoZNgci7F1yFgglWfWDPKGlwHlYnUsehadxoP53QlzazvqpBl83vDcUFVk0Fq
	OvYVrslw0DgKn3niKEpBfFyzfADBy0cFUm9yhQ9Qxz8UFR7XISm+djtKlZ9mAPThI1v0sBt0DHc
	GdYnLLd0KscbqqqXh5fHdE4iiOrMHRauwCd+g3uydhLJlVD+9sJvBBgr0hYp6ac4WCG9yqp29BP
	YXe7UUGegR1+3aeOqjjTyILlc6QQ9XeW5A7hz+B36xezDpCUBsp/fPtbX+Mby2ZPodCfGZY5qbz
	NhAgF1WPaj0PmKZyIp93l3VfqScblHebMVgnrLfTuRl1N4s7zPPp3lnEUCwwCXH8rRgEgyzhe3C
	F/lUaUTwRuSeRtrJojVb5xx6dxCkAdd9dKqhN+1VG/FOjq3uG/x13FuQHRJMStMbuTsMDHrakjt
	N3xKgnlGbD0yscoSIC5dJn7k
X-Received: by 2002:a05:6402:354a:b0:698:af31:5a9b with SMTP id 4fb4d7f45d1cf-6a60d3bbaefmr5062966a12.9.1787930084790;
        Fri, 28 Aug 2026 08:14:44 -0700 (PDT)
Message-ID: <d27b5ef4-65b5-4c59-8128-5be8a0eaa15e@suse.com>
Date: Fri, 28 Aug 2026 17:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?=
 <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, dfaggioli@suse.com, gwd@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
 <e0f91d0e-0b08-4d69-bf94-243bd26f67df@gmail.com>
 <f687da3b-a9f7-4df3-a113-3cdd0b817e3d@suse.com>
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
In-Reply-To: <f687da3b-a9f7-4df3-a113-3cdd0b817e3d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0jGiln0RDKSyqUe4kRIHgRBN"
X-purgate-ID: tlsNG-ef75cf/1787930085-358C1AE4-5EE96BB7/0/0
X-purgate-type: clean
X-purgate-size: 10513

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0jGiln0RDKSyqUe4kRIHgRBN
Content-Type: multipart/mixed; boundary="------------fFracx2fzOYQEeIfk5WirJaB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?=
 <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, dfaggioli@suse.com, gwd@xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <d27b5ef4-65b5-4c59-8128-5be8a0eaa15e@suse.com>
Subject: Re: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-3-frn1furkan10@gmail.com>
 <f9471a2b-6306-41fb-af52-2336af77dfc9@suse.com>
 <e0f91d0e-0b08-4d69-bf94-243bd26f67df@gmail.com>
 <f687da3b-a9f7-4df3-a113-3cdd0b817e3d@suse.com>
In-Reply-To: <f687da3b-a9f7-4df3-a113-3cdd0b817e3d@suse.com>
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

--------------fFracx2fzOYQEeIfk5WirJaB
Content-Type: multipart/mixed; boundary="------------NI1zbHGiYvPMsrRAiqhMPkky"

--------------NI1zbHGiYvPMsrRAiqhMPkky
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDguMjYgMTI6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wOC4yMDI2
IDEyOjM5LCBGdXJrYW4gw4dhbMSxxZ9rYW4gd3JvdGU6DQo+PiBPbiA4LzE5LzI2IDEwOjIy
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wOC4yMDI2IDA3OjE1LCBGdXJrYW4g
Q2FsaXNrYW4gd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+
Pj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IEBAIC01ODksNiArNTg5
LDkgQEAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdikNCj4+Pj4gICAgICAg
dW5pdC0+cHJpdiA9IHNjaGVkX2FsbG9jX3VkYXRhKGRvbV9zY2hlZHVsZXIoZCksIHVuaXQs
IGQtPnNjaGVkX3ByaXYpOw0KPj4+PiAgICAgICBpZiAoIHVuaXQtPnByaXYgPT0gTlVMTCAp
DQo+Pj4+ICAgICAgIHsNCj4+Pj4gKyAgICAgICAga2lsbF90aW1lcigmdi0+cGVyaW9kaWNf
dGltZXIpOw0KPj4+PiArICAgICAgICBraWxsX3RpbWVyKCZ2LT5zaW5nbGVzaG90X3RpbWVy
KTsNCj4+Pj4gKyAgICAgICAga2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7DQo+Pj4+ICAg
ICAgICAgICBzY2hlZF9mcmVlX3VuaXQodW5pdCwgdik7DQo+Pj4+ICAgICAgICAgICByY3Vf
cmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+Pj4gICAgICAgICAgIHJldHVy
biAxOw0KPj4+DQo+Pj4gVGhpcyBhbG1vc3QsIGJ1dCBub3QgcXVpdGUgb3Blbi1jb2RlcyBz
Y2hlZF9kZXN0cm95X3ZjcHUoKS4gV291bGQgYmUgbmljZQ0KPj4+IGlmIHRoZSBjbGVhbnVw
IGxvZ2ljIHdhcyBzaGFyZWQuIFRoZSBzY2hlZF9mcmVlX3VuaXQoKSBjYWxsIHRoZXJlIGNv
dWxkIGJlDQo+Pj4gbGV2ZXJhZ2VkIGhlcmUgYXMgd2VsbDsgd2hhdCB3b3VsZCBuZWVkIHNr
aXBwaW5nIGFyZSB0aGUgc2NoZWRfZnJlZV91ZGF0YSgpDQo+Pj4gYW5kIHNjaGVkX3JlbW92
ZV91bml0KCkuIEFuZCBvZiBjb3Vyc2UgdGhlIFJDVS1sb2NraW5nIHdvdWxkIG5lZWQgc29y
dGluZy4NCj4+DQo+PiBXb3VsZCBzb21ldGhpbmcgbGlrZSBiZWxvdyBiZSBva2F5Pw0KPiAN
Cj4gTWF5YmUsIGJ1dCB5b3UgbmVlZCB0byBhc2sgdGhlIG1haW50YWluZXJzIG9mIHRoaXMg
Y29kZSwgd2hpY2ggSSdtIG5vdCBhIHBhcnQNCj4gb2YuIFdoYXQgSSBpbiBwYXJ0aWN1bGFy
IGNhbid0IGVhc2lseSBqdWRnZSBpcyB3aGV0aGVyIC4uLg0KPiANCj4+IC0tLSBhL3hlbi9j
b21tb24vc2NoZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0K
Pj4gQEAgLTU4OSw4ICs1ODksOCBAQCBpbnQgc2NoZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1
ICp2KQ0KPj4gICAgICAgdW5pdC0+cHJpdiA9IHNjaGVkX2FsbG9jX3VkYXRhKGRvbV9zY2hl
ZHVsZXIoZCksIHVuaXQsIGQtPnNjaGVkX3ByaXYpOw0KPj4gICAgICAgaWYgKCB1bml0LT5w
cml2ID09IE5VTEwgKQ0KPj4gICAgICAgew0KPj4gLSAgICAgICAgc2NoZWRfZnJlZV91bml0
KHVuaXQsIHYpOw0KPj4gICAgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOw0KPj4gKyAgICAgICAgc2NoZWRfZGVzdHJveV92Y3B1KHYpOw0KPj4gICAgICAg
ICAgIHJldHVybiAxOw0KPj4gICAgICAgfQ0KPiANCj4gLi4uIHRoaXMgaW50ZXJtZWRpYXRl
IGRyb3BwaW5nIG9mIHRoZSBsb2NrIGlzIGVudGlyZWx5IG9rYXkgKGl0IGxvb2tzIHRvIGJl
DQo+IGF0IHRoZSBmaXJzdCBnbGFuY2UpLg0KDQpXaHkgZG9uJ3QgeW91IGp1c3QgcmVwbGFj
ZSBzY2hlZF9mcmVlX3VuaXQoKSB3aXRoIHNjaGVkX2Rlc3Ryb3lfdmNwdSgpPw0KDQpyY3Vf
cmVhZF9sb2NrKCkgY2FsbHMgY2FuIGJlIG5lc3RlZCwgZXZlbiBmb3IgdGhlIHNhbWUgbG9j
ay4gVGhpcyB3b3JrcyBiZWNhdXNlDQp0aGVyZSBpcyBubyByY3Vfd3JpdGVfbG9jaygpIChz
ZWUgY29tbWVudCBpbiByY3VwZGF0ZS5oKS4NCg0KDQpKdWVyZ2VuDQo=
--------------NI1zbHGiYvPMsrRAiqhMPkky
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NI1zbHGiYvPMsrRAiqhMPkky--

--------------fFracx2fzOYQEeIfk5WirJaB--

--------------0jGiln0RDKSyqUe4kRIHgRBN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqRpeQFAwAAAAAACgkQsN6d1ii/Ey/k
7gf/Wl1ZDUjmQANv023an/uTlykmIoOlalvAL03P/rTYsazXnOeVZ1Td1yKGHtYsJHv0aRezPlG2
Bdbw4LFLAty1N1f8KqppLOi6kVQh/Q3Oj+rxhLcfa1+CqdBS+hogCwiT/Yfy+kA+QU44qt0tqytN
1BtjSQ0EJjwxbAAsOHcBWcsqDPrOdJkzx0MduKAu2PNeXXoJsmAIhHUQBRh18vc78fzCOcbpkHDK
dXw7jzf1u12gkR3rv0Tv2+oCD6BOBMnTbgbi44+HyRm1umjfJRbPrAfMM3AWbOAmPnTchbXkwKB3
pqIdkjqGU6VQrQtXYC/5lXRp4GNFZ0MsXOL1efptpw==
=PVtq
-----END PGP SIGNATURE-----

--------------0jGiln0RDKSyqUe4kRIHgRBN--

