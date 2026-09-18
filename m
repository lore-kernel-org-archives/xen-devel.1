Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDAEC982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 07:47:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424807.1649024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TJQ-0004R3-Vm; Fri, 18 Sep 2026 07:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424807.1649024; Fri, 18 Sep 2026 07:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TJQ-0004Qw-T2; Fri, 18 Sep 2026 07:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1424807;
 Fri, 18 Sep 2026 07:47:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x7TJP-0004Qa-HL
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 07:47:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TJN-00G0Kc-NG
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:47:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aacec70-e002-0a2a0a5209dd-0a2a45029a0e-42
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:47:09 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aacec7c-6ca4-0a2a45020019-4a7de18ca9c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:47:08 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so3549445e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 00:47:08 -0700 (PDT)
Received: from [172.18.88.57] (195-200-20-130.mclarenap.oninferno.net.
 [195.200.20.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7ceb92asm32081995e9.6.2026.09.18.00.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 00:47:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1789717627; x=1790322427; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qlBffCAVKG+keMuYn7lVKUDo3cAsqTTy6FKRP74v+Uc=;
        b=RNOVyffOc6T9WiMDvMMQib5I4z+vo2uKA8mpm0ELfhcEmITUQZMe7Eae8zGvvwUaD7
         z8e4NhahdmlzzSRagMa6Uwa7rvSiLL/FSK8MKrhMNe5+FXU4+kCB0OPYvYDjr1xpyFQU
         4t/AU/flNu0bD4wtAhGnNPFtuT7QB9Kx8dZgyjYJv7GvVEv5/BhkiD24njEqfedAfdgt
         Hkcx3/1IRKylVydFaEy9h/4Xbd1quWRbR7xkVcEhOjfJSWti38EnY0f2f4cPP++y3PRZ
         Noyt4JMugQDkp0BVRZZ07vICX0bC1Dog3Fe22BmneouvLMMxR04RlR/H+DJUEpeS5Epd
         4zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717627; x=1790322427;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlBffCAVKG+keMuYn7lVKUDo3cAsqTTy6FKRP74v+Uc=;
        b=H5HLOpLze8hu/9y0HHzGpQ/hP52Lo1j9zziPcuaKsT7dRliUi97SlJLWaH/KlAc8xJ
         uLGtvNMAP4wv2RG1sx0x2yaWhKEQpCKJ676aanrNEOPE+kpWJK7r1U+o7bTrsAbNxjNn
         oyoR00AFrgR09mktC+AuYMjNkMbNxsZSJCmkM9mIMqyuC515jLN2v+Ab26pP1XLelDkN
         JUAriS8S9YMgDlI3tme5SkTmZnbkEd4jXGqL+6ZVCszo62PpaPoBPJNDlYpyv0k75jnx
         9rwtSe6OpzQ9RnPkxBrRz0jpYrsjoCf6ZkCIz2DIbRIFQ8bk2pLqc0n3ztjEKHZyg9l6
         R68g==
X-Forwarded-Encrypted: i=1; AKwUvBzKaKxgQz/lMnCZ+qOtrhkBnDIc0LDubIVFK21IHn+GmvzY/qYctbkrPUnBdiS/w4C73+p1eAUJMOE=@lists.xenproject.org
X-Gm-Message-State: AFuF++klap4NIA+lDrHMmxviWMqoMu6zt6a8JrvaSZYTvYOnyKB7158r
	gn8cu4X8bBF8vPF+R9OwBBj3nNLucqj+4+3St9gqhpPj8qpXjijEXNxfH2DxW4IKlxQ=
X-Gm-Gg: AYBFou2x6Isx/Tl82QMSCD/NMvOFOUh8f/U+ufcREmYvuClIJyX2rTOIuKGlAX45EZb
	yqIgOHeMSlLC9EmGa5bnPXL2GBzoy3/6sFT3Q7MNnuu1fGPpye0SPEQrF7sKTGbA/C+YIwRyfhe
	+4T4CytxoHC8ZZH5Csxlp7MseDAFoGudNBWCxEcwwpfIvqbzrWx66X1o0ggPGnbYWVnEjYJfIky
	bTcdYdjRNwZrerp/ceivW4XyHTyzg776w9d7BW2L6hZTHhiUbt/Iv2BgGysFpX70rhkwG5N2tl2
	7VQfQRtp+7pHLdXuRIO6WnMlYotISa08yzEp76ueuKtL2xN6NnMf6Po18XB23Z5oksR+XaGBrTZ
	peQUnXO4nykazbxNJZZf5Uo/4BY3qdaJ1h/xKfVIXKvKyzBoX3rlOP/ijsOvZualDZE8YRqSU6T
	88jNoqeoh6QGPHsvXRBR5xCaC5N9d2Umt6fsDxsqptjTi7UKO6luMioIrV8eJhpVvH/MbMky8I0
	iC7OUWipJq2qiNA91fH+HYnc6Qe2oWEvTI7gII=
X-Received: by 2002:a05:600c:3512:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fc56aee64mr17835935e9.12.1789717627523;
        Fri, 18 Sep 2026 00:47:07 -0700 (PDT)
Message-ID: <502268de-9e38-425b-bbc5-6202ed981398@suse.com>
Date: Fri, 18 Sep 2026 09:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
 <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
 <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
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
In-Reply-To: <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QN3QB5THt2LtBSjw2TUYcOhI"
X-purgate-ID: tlsNG-720697/1789717628-668B42AC-3ACAC121/35/110847
X-purgate-type: clean
X-purgate-size: 11914

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QN3QB5THt2LtBSjw2TUYcOhI
Content-Type: multipart/mixed; boundary="------------tBXNJeeDFfkE0os3pybH0RNc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
Message-ID: <502268de-9e38-425b-bbc5-6202ed981398@suse.com>
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
 <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
 <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
In-Reply-To: <0899d0b5-431a-450d-9aec-796f73f92a83@gmail.com>
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

--------------tBXNJeeDFfkE0os3pybH0RNc
Content-Type: multipart/mixed; boundary="------------RT3b0kFl1ayTUZPnQRNCa8rz"

--------------RT3b0kFl1ayTUZPnQRNCa8rz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDkuMjYgMTI6NDAsIEZ1cmthbiDDh2FsxLHFn2thbiB3cm90ZToNCj4gDQo+IE9u
IDkvMTQvMjYgMTI6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAyNi4wOC4yNiAw
Njo1NywgRnVya2FuIENhbGlza2FuIHdyb3RlOg0KPj4+IE5vdyB0aGF0IHdlIGhhdmUgaW50
cm9kdWNlZCBhZG1pc3Npb24gY29udHJvbCBmb3IgbmV3IGFuZA0KPj4+IHJlbW92ZWQgdW5p
dHMuIEV4dGVuZCBpdCB0byBYRU5fRE9NQ1RMX1NDSEVET1BfcHV0aW5mbyBhbmQNCj4+PiBw
dXR2Y3B1aW5mbywgc28gZ3Jvd2luZyBhbiBleGlzdGluZyByZXNlcnZhdGlvbiB2aWENCj4+
PiB4bCBzY2hlZC1ydGRzIGlzIGNoZWNrZWQgdG9vLg0KPj4+DQo+Pj4gcHV0aW5mbyBzZXRz
IHRoZSBzYW1lIChwZXJpb2QsIGJ1ZGdldCkgZm9yIGV2ZXJ5IHVuaXQgb2YgYQ0KPj4+IGRv
bWFpbiBhdCBvbmNlLCBzbyBpdCB0ZXN0cyB0aGUgd2hvbGUgZG9tYWluJ3MgdXRpbGl6YXRp
b24NCj4+PiBkZWx0YSBhdG9taWNhbGx5LCByYXRoZXIgdGhhbiB1bml0LWJ5LXVuaXQsIHdo
aWNoIGNvdWxkDQo+Pj4gc3B1cmlvdXNseSByZWplY3QgYW4gb3ZlcmFsbC1hY2NlcHRhYmxl
IGNoYW5nZSBkZXBlbmRpbmcgb24NCj4+PiBpdGVyYXRpb24gb3JkZXIuDQo+Pj4NCj4+PiBw
dXR2Y3B1aW5mbyBjaGFuZ2VzIG9uZSB1bml0IGF0IGEgdGltZSwgc28gaXQganVzdCBjYWxs
cw0KPj4+IHJ0X2FkbWlzc2lvbl90ZXN0KCkgZGlyZWN0bHkuDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBGdXJrYW4gQ2FsaXNrYW4gPGZybjFmdXJrYW4xMEBnbWFpbC5jb20+DQo+Pj4g
LS0tDQo+Pj4gIMKgIHhlbi9jb21tb24vc2NoZWQvcnQuYyB8IDQyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWQvcnQuYyBiL3hlbi9jb21tb24vc2NoZWQvcnQuYw0KPj4+IGluZGV4IDkxMjYzMjA4MDEu
Ljk2NDNhMjc3ZmUgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+
Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+Pj4gQEAgLTE1MjcsMTEgKzE1Mjcs
NDMgQEAgcnRfZG9tX2NudGwoDQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBvcC0+dS5ydGRz
LmJ1ZGdldCA9IFJURFNfREVGQVVMVF9CVURHRVQgLyBNSUNST1NFQ1MoMSk7DQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiAgwqDCoMKgwqDCoCBjYXNlIFhFTl9ET01D
VExfU0NIRURPUF9wdXRpbmZvOg0KPj4+ICvCoMKgwqAgew0KPj4+ICvCoMKgwqDCoMKgwqDC
oCB1aW50NjRfdCBkb21fb2xkX3V0aWwgPSAwLCBuZXdfdXRpbCwgbmV3X3RvdGFsOw0KPj4+
ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbnJfdW5pdHMgPSAwOw0KPj4+ICsNCj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gcnRfdmFsaWRhdGVfcGFyYW1zKCZvcC0+dS5y
dGRzLCAmcGVyaW9kLCAmYnVkZ2V0KTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgg
cmMgKQ0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiAgwqAg
K8KgwqDCoMKgwqDCoMKgIG5ld191dGlsID0gcnRfdW5pdF91dGlsaXphdGlvbihwZXJpb2Qs
IGJ1ZGdldCk7DQo+Pj4gKw0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2ly
cXNhdmUoJnBydi0+bG9jaywgZmxhZ3MpOw0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
LyoNCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFNhbWUgKHBlcmlvZCwgYnVkZ2V0KSBmb3Ig
ZXZlcnkgdW5pdCBvZiBkOiB0ZXN0IGFuZCBjb21taXQNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIHRoZSBkb21haW4ncyB3aG9sZSB1dGlsaXphdGlvbiBkZWx0YSBhdG9taWNhbGx5LCBy
YXRoZXINCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHRoYW4gdW5pdC1ieS11bml0LCB3aGlj
aCBjb3VsZCBzcHVyaW91c2x5IHJlamVjdCBhbg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
b3ZlcmFsbC1hY2NlcHRhYmxlIGNoYW5nZSBkZXBlbmRpbmcgb24gaXRlcmF0aW9uIG9yZGVy
Lg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGZvcl9l
YWNoX3NjaGVkX3VuaXQgKCBkLCB1bml0ICkNCj4+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN2YyA9IHJ0X3VuaXQodW5pdCk7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tX29sZF91dGlsICs9IHJ0X3VuaXRfdXRpbGl6YXRp
b24oc3ZjLT5wZXJpb2QsIHN2Yy0+YnVkZ2V0KTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBucl91bml0cysrOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gKw0KPj4+ICvC
oMKgwqDCoMKgwqDCoCBuZXdfdG90YWwgPSBwcnYtPnV0aWxpemF0aW9uIC0gZG9tX29sZF91
dGlsICsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVp
bnQ2NF90KW5yX3VuaXRzICogbmV3X3V0aWw7DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoIG5ld190b3RhbCA+IHBydi0+dXRpbGl6YXRpb24gJiYgbmV3X3RvdGFsID4gcnRf
dXRpbGl6YXRpb25fY2FwKGQpICkNCj4+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gLUVJTlZBTDsNCj4+DQo+PiBJcyBFSU5WQUwgYSBn
b29kIGNob2ljZSBoZXJlPyBJIHRoaW5rIGEgZGlmZmVyZW50IGVycm9yIGNvZGUgbWlnaHQg
YmUgd2FudGVkLg0KPiANCj4gV291bGQgRUJVU1kgYmUgb2theSBoZXJlPyBPciB3aGF0IGVs
c2Ugd291bGQgeW91IHN1Z2dlc3Q/DQoNCkVCVVNZIGlzIGEgbGlpdGxlIGJpdCBiZXR0ZXIu
IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IEVOT1NQQz8NCg0KDQpKdWVyZ2VuDQo=
--------------RT3b0kFl1ayTUZPnQRNCa8rz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RT3b0kFl1ayTUZPnQRNCa8rz--

--------------tBXNJeeDFfkE0os3pybH0RNc--

--------------QN3QB5THt2LtBSjw2TUYcOhI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqs7G8FAwAAAAAACgkQsN6d1ii/Ey/3
jAf/ZWggMGchX5YBGOrPVJaIAYqG3UAeIeDrm0cXASBy5sjVgWPjqKc8R+Yvh0e8/43wkJgFL1HN
BzK6Sk937YFNbF4sEFtFIet9JSu7PGuWN/ajoozxMvWouGECDfDMPZx6PAwV4xM3Y0xGNDXui2WF
thN1wJgClQLrl4kYQRABgoVPiNdNAY8KakSu576hxDooahBWX2Zy86RBqpS7JtQ3s9R09RMBuIbD
Gp86/1fR+Bgnjf7tgUDHzam5D7iHtlIezo+0BzmzJUTnOLutFJXFFRpuy0Mpp/wTC8c+9Gvm9cHR
G3Wl56R0gB5TWdZFt94tdg4Zc7UME+2nXPkH+vE5rg==
=kunD
-----END PGP SIGNATURE-----

--------------QN3QB5THt2LtBSjw2TUYcOhI--

