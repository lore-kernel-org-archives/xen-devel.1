Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1797C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:14:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393891.1632702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGpH-00078a-BY; Tue, 18 Aug 2026 10:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393891.1632702; Tue, 18 Aug 2026 10:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGpH-00078T-8A; Tue, 18 Aug 2026 10:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1393891;
 Tue, 18 Aug 2026 10:13:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwGpF-00078N-Le
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:13:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGpE-005o81-F0
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:13:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a84304c-bab6-0a2a0a5309dd-0a2a4503c996-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:13:44 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a843058-fae8-0a2a45030019-d155da35b850-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:13:44 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so583944366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:13:44 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3d8596435sm1518244a12.20.2026.08.18.03.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:13:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1787048024; x=1787652824; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8r6c7UhsU8GKVZQ8YLSiHdWTlDTRxcwRsc+LFXj+kU=;
        b=Rwew15p5kacUwJsx3uZMmIsAoJvJ36APr9nurMO+QwIOJnnJfKhhLoCg7ad6XScpHs
         sCmk2miVQtvKkhlYgHRbN0x5IF19x/SKZP6bzexBTcxbkORqBGj/2LOiFMBb0F1gfAmQ
         qWgXEPA8pIUk+O/Xf2h7Minr2A8CuUERQ15yhmY7+L0Qk7/JiS9MvFRJgxtHIXUHo+fd
         Nfyv6q40Q7FoTTcewWASvTeE+Uy3i/Sx298QOkLd/uGjkwUQDiWf1QkCm+aL6ldho0go
         8sMYUroJwmn3qDBkjxYzrpBbfDRPIif8sfxyEVwOhRLb27rEpx3ej43k48ackO1Mb1QL
         gaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048024; x=1787652824;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8r6c7UhsU8GKVZQ8YLSiHdWTlDTRxcwRsc+LFXj+kU=;
        b=n3yQoifrpEkzO48iQ0cGniolUc5W1Sjy8bAV4FrqppSRi0LvXARlPsLR/6INi2UJHo
         aGs7VLQtikTyW8U46d6A+b87VRhyZuDA40W4KMgVHvVDir8Y0CAIXryTEbhJHDn4WmRY
         1GDD1KLolZELYVx/8WgCaHvGDphhlj6QLM6kRnQ/K2Etyh4sOY47m+ctQb9kjY41qkzH
         DIWqVPD4k9KUhPCqXzHIpxPYWy+Rkxoc8PW3JekwtJjKC0mgOtqboxBzlV8nwhYSeDZ1
         En4KcuiqhteQenAZtxo9dEQfHcgiz1AfPiiak5avTTegWkcNAbcIsMgsVJpD5FDOCojC
         vxtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru+nA+8B+mZi++OIy7ljPXPlC6QRFHts7xaVZydTDtS8fCsX7Ai5NvdSUyMi3etKmO2AetMdOAhnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLpYhbJoOCq2sUcxlSFyN7/1U0k3Qk7pCWsHawGJfE5in+dBx8
	SZ8rycmFj1QuWAS3a3rObvVvRmWKnccqbs/w5g3i59ExBsglX6Qt9En1rARzhbKb2o4=
X-Gm-Gg: AR+sD11+qeYscQMH68ThCAKrabsncT0LA6w8xJnAGK12GeKGL2RSJwJw8mfrB8KfJlf
	ubOxIzgXFTCr57yBnPQPDzzRAWrZehqflH7+W8SHLjP7pF0Hrd6WJ+hiT0xh9jsPxwnUpEFdrjd
	ofcV0FfMhE1K37iuMCfKYLuQO8Y916NLnsVXCELu94qs+dvztyUKgt3PybYvFQr0nvbFpRRhY1U
	1n3ldN0F/hoBPeGBOrxCoz+Ken9C/kcLsqxUxMtrdAfKenCCW8lzsbk1FYsDqDXrwhe5ng+hYGq
	69FPo2afoYRF9KXkgCzecycvZ3nzZtkBen6MEDruyuIKi/fDHjikgU/4tg8NaOgkgeHIRpx8I5t
	weNNWhYFqWF6DsIeSNDrC1G/eGv8b9wImn3HUUvJt29EkV8x+81gsOj5xcLRtr30FW4Be07QsAo
	XgBHOe+iFTTm3i24rXp0Tnfg3oo4Z6c2eDdIkPAc/SCPBjudB8kYM78Cm2XZYhh7KzffdHN1cHd
	t30VmHeRy5DVkS/1gJ/WtFUEXK5/QauOtAM+xaNn+vrvxvm3c1JvuKSKOse77Ec00ggMGJ3erTc
	S1k2HG4ahUyXkQ==
X-Received: by 2002:a17:907:6b05:b0:c20:74db:50c7 with SMTP id a640c23a62f3a-c21885150damr446451666b.13.1787048023539;
        Tue, 18 Aug 2026 03:13:43 -0700 (PDT)
Message-ID: <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
Date: Tue, 18 Aug 2026 12:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
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
In-Reply-To: <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Og4p1i93BPivoCxW76jncXBj"
X-purgate-ID: tlsNG-33051d/1787048024-6F0C94E9-A741D20D/0/0
X-purgate-type: clean
X-purgate-size: 13970

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Og4p1i93BPivoCxW76jncXBj
Content-Type: multipart/mixed; boundary="------------Jl1Ur1M09zZ0jOUw6VMaiPnv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org
Message-ID: <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
In-Reply-To: <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
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

--------------Jl1Ur1M09zZ0jOUw6VMaiPnv
Content-Type: multipart/mixed; boundary="------------c0FZ40kblfKT6yQODYUd7hlP"

--------------c0FZ40kblfKT6yQODYUd7hlP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMTI6MDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE4LzA4LzIw
MjYgODo1MyBhbSwgRnVya2FuIMOHYWzEscWfa2FuIHdyb3RlOg0KPj4gT24gOC8xOC8yNiAx
MDoxMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAxOC4wOC4yNiAwODozMiwgRnVy
a2FuIENhbGlza2FuIHdyb3RlOg0KPj4+PiBzY2hlZF9tb3ZlX2RvbWFpbigpIGRlcml2ZXMg
dGhlIG51bWJlciBvZiB1bml0cyB0byByZWJ1aWxkIGZyb20NCj4+Pj4gZC0+bWF4X3ZjcHVz
LCB3aGljaCBpcyBmaXhlZCBhdCBkb21haW4gY3JlYXRpb24gYW5kIG5ldmVyIHJvbGxlZA0K
Pj4+PiBiYWNrIGlmIHZjcHVfY3JlYXRlKCkgZmFpbHMgcGFydHdheSB0aHJvdWdoIGJ1aWxk
aW5nIGEgZG9tYWluLiBTbw0KPj4+PiBkLT52Y3B1W2ldIGNhbiBiZSBOVUxMIGZvciBzb21l
IGkgZXZlbiB0aG91Z2ggbWF4X3ZjcHVzIHN0aWxsDQo+Pj4+IGNvdW50cyBpdCAtIHRoaXMg
aGFwcGVucyBpZiBzY2hlZF9hbGxvY191ZGF0YSgpIHJldHVybnMgTlVMTC4NCj4+Pj4NCj4+
Pj4gVGhlIHBlci11bml0IGxvb3AgZG9lc24ndCBjaGVjayBmb3IgdGhpczogaXQgc2V0cw0K
Pj4+PiB1bml0LT52Y3B1X2xpc3QgPSBkLT52Y3B1W3VuaXRfaWRdIChOVUxMKSBhbmQgaGFu
ZHMgdGhhdCBicm9rZW4NCj4+Pj4gdW5pdCBzdHJhaWdodCB0byB0aGUgZGVzdGluYXRpb24g
c2NoZWR1bGVyJ3MgYWxsb2NfdWRhdGEoKSwNCj4+Pj4gd2hpY2ggYXNzdW1lcyB2Y3B1X2xp
c3QgaXMgYWx3YXlzIHZhbGlkIGFuZCBjcmFzaGVzIFhlbiB3aGVuDQo+Pj4+IGl0IGlzIG5v
dC4NCj4+Pj4NCj4+Pj4gUmVwcm9kdWNlZCBieSBidWlsZGluZyBhIGRvbWFpbiBpbiBhIG5v
bi1kZWZhdWx0IGNwdXBvb2wgd2hlcmUNCj4+Pj4gdmNwdSBjcmVhdGlvbiBmYWlscyBwYXJ0
d2F5IHRocm91Z2gsIHRoZW4gZGVzdHJveWluZyBpdC4NCj4+Pj4gZG9tYWluX2tpbGwoKSBt
b3ZlcyB0aGUgZG9tYWluIGJhY2sgdG8gdGhlIGRlZmF1bHQgY3B1cG9vbCB2aWENCj4+Pj4g
c2NoZWRfbW92ZV9kb21haW4oKSBiZWZvcmUgYWN0dWFsbHkgZGVzdHJveWluZyBpdCwgY3Jh
c2hpbmcNCj4+Pj4gaW5zaWRlIHRoZSBkZXN0aW5hdGlvbiBzY2hlZHVsZXIncyBhbGxvY191
ZGF0YSgpIChzZWVuIGluDQo+Pj4+IENyZWRpdDIncyBjc2NoZWQyX2FsbG9jX3VkYXRhKCkg
LT4gaXNfaWRsZV91bml0KCkgLT4gTlVMTCBkZXJlZikuDQo+Pj4+DQo+Pj4+IEJlZm9yZSBi
dWlsZGluZyBhIHVuaXQgaW4gc2NoZWRfbW92ZV9kb21haW4oKSwgY2hlY2sgdGhhdCBhbGwg
b2YNCj4+Pj4gaXRzIHZjcHUgc2xvdHMgYXJlIHBvcHVsYXRlZCwgYW5kIHNraXAgaXQgaWYg
YW55IGFyZSBtaXNzaW5nLiBUaGUNCj4+Pj4gcmVzdCBvZiB0aGUgZnVuY3Rpb24gd2Fsa3Mg
dGhlIHZjcHVzIHRoYXQgYWN0dWFsbHkgZXhpc3QsIHZpYQ0KPj4+PiBmb3JfZWFjaF92Y3B1
KCkgcmF0aGVyIHRoYW4gbl91bml0cywgc28gc2tpcHBpbmcgYSB1bml0IGhlcmUNCj4+Pj4g
ZG9lcyBub3QgbGVhdmUgYW55dGhpbmcgZWxzZSBvdXQgb2Ygc3luYy4NCj4+Pj4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29t
Pg0KPj4+PiAtLS0NCj4+Pj4gIMKgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgMTkgKysr
KysrKysrKysrKysrKysrKw0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5j
IGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+Pj4gaW5kZXggZDNhMGE5N2UxZC4uZDU0
MmM3NjU0MyAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+
Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+Pj4gQEAgLTc0NSw2ICs3NDUs
MjUgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBj
cHVwb29sICpjKQ0KPj4+PiAgwqAgwqDCoMKgwqDCoCBmb3IgKCB1bml0X2lkeCA9IDA7IHVu
aXRfaWR4IDwgbl91bml0czsgdW5pdF9pZHgrKyApDQo+Pj4+ICDCoMKgwqDCoMKgIHsNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogU2tpcCB0
aGlzIHVuaXQgaWYgYW55IG9mIGl0cyB2Y3B1cyBpcyBtaXNzaW5nLiBCb3VuZGVkIGJ5DQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWF4X3ZjcHVzLg0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoCAqLw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgYm9vbCB2Y3B1X2ZhaWxlZCA9IGZhbHNl
Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9
IDA7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpIDwgZ3JhbiAmJiB1bml0
X2lkeCAqIGdyYW4gKyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQ0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgew0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFkLT52Y3B1W3Vu
aXRfaWR4ICogZ3JhbiArIGldICkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgew0K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZjcHVfZmFpbGVkID0gdHJ1
ZTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+
PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHZjcHVfZmFpbGVkICkNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+Pj4gSSBkb24ndCB0aGluayB0aGlz
IGlzIGNvcnJlY3QuDQo+Pj4NCj4+PiBJZiB0aGVyZSBhcmUgc29tZSB2Y3B1cyBpbiB0aGUg
dW5pdCB5b3Ugd2lsbCBsb29zZSB0aGVtIChpLmUuIG1ha2UgdGhlbSBubw0KPj4+IGxvbmdl
ciBiZSBhYmxlIHRvIGJlIHNjaGVkdWxlZCksIHJpZ2h0Pw0KPj4+DQo+Pj4gRm9yIGEgZHlp
bmcgZG9tYWluIHRoaXMgbWlnaHQgYmUgb2theSwgYnV0IG5vdCBmb3Igb25lIHN0aWxsIGFj
dGl2ZS4gU28gSSB0aGluaw0KPj4+IHlvdSBzaG91bGQgYXQgbGVhc3QgdmVyaWZ5IHRoZSBk
b21haW4gaXMgZHlpbmcsIG90aGVyd2lzZSBzY2hlZF9tb3ZlX2RvbWFpbigpDQo+Pj4gc2hv
dWxkIGp1c3QgZmFpbC4NCj4+Pg0KPj4+IEFuIGFsdGVybmF0aXZlIG1pZ2h0IGJlIHRvIGZp
eCB0aGUgTlVMTCBkZXJlZmVyZW5jaW5nIHdoZXJlIG5lZWRlZCwgYnV0IHRoaXMNCj4+PiBj
b3VsZCBiZWNvbWUgdGVkaW91cy4NCj4+Pg0KPj4+DQo+Pj4gSnVlcmdlbg0KPj4gUmlnaHQu
IE15IGluaXRpYWwgYXR0ZW1wdCBvbmx5IGNoZWNrZWQgJ2QtPnZjcHVbdW5pdF9pZHgqZ3Jh
bl0nDQo+PiBmb3IgdGhlIGhlYWQgdkNQVS4gVGhlIGNyYXNoIGhhcHBlbnMgd2hlbiB1bml0
LT52Y3B1X2xpc3QgaXMgc2V0DQo+PiB0byBkLT52Y3B1W3VuaXRfaWR4KmdyYW5dICh3aGlj
aCBpcyBOVUxMKSBhbmQgcGFzc2VkIHRvICdhbGxvY191ZGF0YSgpJywNCj4+IGNhdXNpbmcg
YSBOVUxMIGRlcmVmZXJlbmNlLg0KPj4NCj4+IEkgZXhwYW5kZWQgdGhlIGxvb3Agb3ZlciAn
Z3JhbicgdG8gaGFuZGxlIGNvcmUtc2NoZWR1bGluZyBjYXNlcyB3aGVyZSBhDQo+PiBzdWJz
ZXF1ZW50IHZDUFUgZmFpbHMgbWlkLXVuaXQsIGJ1dCBhcyB5b3UgcG9pbnRlZCBvdXQsIHRo
YXQgZHJvcHMgdGhlDQo+PiB3aG9sZSB1bml0IGZvciBhY3RpdmUgZG9tYWluLg0KPj4NCj4+
IEknbGwgdXBkYXRlIHRoZSBwYXRjaCB0byBjaGVjayBkLT5pc19keWluZyB0byBza2lwIGlu
Y29tcGxldGUgdW5pdHMNCj4+IG9ubHkgZm9yIGR5aW5nIGRvbWFpbnMsIGFuZCBoYXZlIHNj
aGVkX21vdmVfZG9tYWluKCkgZmFpbCBpZiBhbiBhY3RpdmUNCj4+IGRvbWFpbiBoYXMgbWlz
c2luZyB2Q1BVcw0KPiANCj4gSSdtIGFmcmFpZCB0aGF0IHdvbnQgZml4IGV2ZXJ5dGhpbmcu
DQoNCldoeSBub3Q/DQoNCj4gWW91ciBzY2VuYXJpbyBpcyByYXJlLCBidXQgc2FkbHkgd2Ug
aGF2ZSBubyBpbnRlcmxvY2sgdG8ga2lsbCB0aGUgZG9tYWluDQo+IGlmIGEgc2V0bWF4dmNw
dXMgaHlwZXJjYWxsIGZpbmlzaGVzIG1pZC13YXkgdGhyb3VnaC7CoCBGdXJ0aGVybW9yZSwg
Zm9yDQo+IGRvbTAgYXQgbGVhc3QsIHdlIGFjdGl2ZWx5IGRvIHdhbnQgdG8gcnVuIGluIHRo
aXMgY29uZmlndXJhdGlvbiBpZiB3ZQ0KPiBlbmQgdXAgaW4gaXQsIGJlY2F1c2UgdGhhdCBh
dCBsZWFzdCBoZWxwcyByZWNvdmVyeSBvZiB0aGUgc3lzdGVtLg0KDQpJdCBpcyBvbmx5IGFi
b3V0IG1vdmluZyBhIGRvbWFpbiB0byBhbm90aGVyIGNwdXBvb2wuIERvbTAgY2FuJ3QgYmUg
bW92ZWQNCmFueXdheSwgYW5kIG5vdCBiZWluZyBhYmxlIHRvIG1vdmUgYSBjcmlwcGxlZCBk
b21haW4gaXMgYmV0dGVyIHRoYW4gYSBjcmFzaC4NCg0KU28gd2hhdCBpcyB0aGUgcHJvYmxl
bSB0aGVuPw0KDQoNCkp1ZXJnZW4NCg==
--------------c0FZ40kblfKT6yQODYUd7hlP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------c0FZ40kblfKT6yQODYUd7hlP--

--------------Jl1Ur1M09zZ0jOUw6VMaiPnv--

--------------Og4p1i93BPivoCxW76jncXBj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqEMFYFAwAAAAAACgkQsN6d1ii/Ey8r
bQf/Z5E+0/cJmkeOmPt7jKseymoUz50PBpI11Ip/ZdG7adkZ3fe/738Mrr/Ik353zxKTsqD8F+cf
Nl+CSQEF7efkWIL9cjUGdaQds5Ck3BuAdHoYja8oomK8jLqo+/mMbFmYkUFnaHUbYmphjT3zaBr+
R1VTZr7AJ747gBA1lQa+hfa5vjxMRGhX7v3Z3C2rm32FXyq3uUq9n+f8cCktAwi2WUR3NRhV9djX
OULQiS8rz8i2RNOiU+eaN1VEFvYnxFMhKap+VpzeoqGITTXsiRf8/e8MnKfnoa38JekiN5REETLI
X5deagQQ+e3J46FFJjyvqCjivSxXdBAZwqRqrn3r1Q==
=NEn8
-----END PGP SIGNATURE-----

--------------Og4p1i93BPivoCxW76jncXBj--

