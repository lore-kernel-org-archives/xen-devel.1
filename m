Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905AFC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:11:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393487.1632297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDyc-0008An-LZ; Tue, 18 Aug 2026 07:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393487.1632297; Tue, 18 Aug 2026 07:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDyc-0008Ag-Ip; Tue, 18 Aug 2026 07:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1393487;
 Tue, 18 Aug 2026 07:11:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwDya-0008Aa-Cd
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:11:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDyZ-00E9gW-Kw
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:11:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a84058f-2eae-0a2a0a5409dd-0a2a4507ca50-2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:11:11 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a84058f-b4ea-0a2a45070019-d155da2eb9c0-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:11:11 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c1f758014b8so432455566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:11:11 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2185bc9697sm114423866b.61.2026.08.18.00.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:11:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1787037071; x=1787641871; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJBBmG4p9SbIc89wJomJR4a4+EyqUaza4PNsuDUiDk8=;
        b=f5rW/EZVmwSn/5IZSvY76AP7dwqIj6wHM3yqMb9RTvJ6S3aoZrWWZYJWiP7E7xG4i+
         PAe2TY6pkmtVhfLLBOBIxBdUojMhl6mDxfWqQFFU7jQVR+Q7iSlrNkiqa/J/RRCQyzSJ
         U+OLzZJgBaa0JDbiWJS+mkZBGi7VM41LmpS1pDOI4eRi4KcO7gsPGJgIfkQhwtHnaUeR
         Nq9VekHw/9ZYDDw4hAB3emkhx+3WriyvIqYH0gUzdcvwml2vjzUPFCwGKvaoxCkGtt5X
         XCxBbKr38E8vbca/LAYz6bSjxf6JqLrc/j20Btp0zmc3xBRMiZHRyKEF+35IaoLXBZuk
         crDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037071; x=1787641871;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJBBmG4p9SbIc89wJomJR4a4+EyqUaza4PNsuDUiDk8=;
        b=Zum3v6aqTnGfKLZdYGXllha9HfVCw9pHGHjqNpM78oOGWQQJJIHrHK4lz9iWrhDbht
         bxxEHuXjFDMvZMsNqRPYLFb/dElNCxWScLY9wRSr3cYTU0FUKaJW5sxDDpEOLbr/Fz9r
         c4EFNj3JxE73TdHGpxG+kpZs2zbYJuRd8h/I/9sY2oMyIjiQg9bsmfyW2FZrXgx5+zey
         I4m4AxnY8T6ujUoXKq+wWMUrQ6MOVcQC6zYlxNU09wSyetXF/CIjNpx4r02I3Fyi6mpP
         ZjqfpCcvfqsW/REr2kY2lIUPhCxn1VoEr4L9RZt+vbOsouElNQycUnDI8bT/xRdxx7D5
         RQnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7LMmLgVqltqEdpEHy+VHhc4rCP2Dvo5bV0YtgJnF/iwyvTBL1yFRi3Z9zFy9ndxB7PY75RhJYonk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj8K76QgUnuWJ3IW32yMJ5i1QpYsomjY80iZVMYHu/y80oPGSm
	9zrSoFT++TgM6XXDyTtk9P9eK32PrCeBPmkPwHhMrQrGqnRM273a6fkHNWLQJFdoKoCH5ZSdfMC
	pWb01SHA=
X-Gm-Gg: AR+sD1041jIFlyy7AGDmprXOo4/sOQn+b1iDNiKYBUJtTsSvxq97r7UKBfvhH7WFTle
	E0v5a6Tdi32Dn8qTI7PelRXCw2keUhNclKgI6sCOgNgnKv3nbaFyKH+eFhNoXUm3n59Q4D0rBC2
	bXu25jAXl9XKWmsluS83Z4C0JGOG4rNC0S3xskN0QRDKI5KJ37TYVTjkcj6BxnMddvFgdvnSsiB
	90fiMvTEEnqX5yrSvwNemCixGESLEWmfyEwUmyMB1khZKKVJcAP4imSSP2GVNTABNv8781aDt4B
	BWvHJ/TRAAqFiwyY9rBoz4Hvkybt8D2h2X+y8Cz5FmuKZAFypXBouQTb3V2YDH2SzVPJSrsRTuS
	V0idboV+4fqwJPx3wZ28wvWP7Buljm0YWjrpNxfdLemLex1RsS9plHaotiCeatCNwAYzZRuA2/p
	pMPAp3KcZ271SM5B/W13o2r8jA/4Ru+rm6h8XP5SNvNPaXkoFoNVBASK+XwiI5PR9ie3n/NRxfx
	eqBpCoD838Rqnr0+BpoKbMFQA5IntAJoX+qg+L/0d02RaHA4i4U0PEUpLXrplovB15jvZkNY6Rb
	4S9vjpwnTIKOLQ==
X-Received: by 2002:a17:907:3d11:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c21884b519dmr276162866b.9.1787037070802;
        Tue, 18 Aug 2026 00:11:10 -0700 (PDT)
Message-ID: <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
Date: Tue, 18 Aug 2026 09:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260818063259.18733-2-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gooG7Y2TfRwRFUlti7DQtiGN"
X-purgate-ID: tlsNG-ef75cf/1787037071-35EC6AE4-1F475732/0/0
X-purgate-type: clean
X-purgate-size: 11474

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gooG7Y2TfRwRFUlti7DQtiGN
Content-Type: multipart/mixed; boundary="------------7hedWnIs9IyQlpaeDdjENRpr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
Message-ID: <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
In-Reply-To: <20260818063259.18733-2-frn1furkan10@gmail.com>
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

--------------7hedWnIs9IyQlpaeDdjENRpr
Content-Type: multipart/mixed; boundary="------------q5lpfLmyCi7F2MqenCajxyNi"

--------------q5lpfLmyCi7F2MqenCajxyNi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMDg6MzIsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gc2NoZWRfbW92
ZV9kb21haW4oKSBkZXJpdmVzIHRoZSBudW1iZXIgb2YgdW5pdHMgdG8gcmVidWlsZCBmcm9t
DQo+IGQtPm1heF92Y3B1cywgd2hpY2ggaXMgZml4ZWQgYXQgZG9tYWluIGNyZWF0aW9uIGFu
ZCBuZXZlciByb2xsZWQNCj4gYmFjayBpZiB2Y3B1X2NyZWF0ZSgpIGZhaWxzIHBhcnR3YXkg
dGhyb3VnaCBidWlsZGluZyBhIGRvbWFpbi4gU28NCj4gZC0+dmNwdVtpXSBjYW4gYmUgTlVM
TCBmb3Igc29tZSBpIGV2ZW4gdGhvdWdoIG1heF92Y3B1cyBzdGlsbA0KPiBjb3VudHMgaXQg
LSB0aGlzIGhhcHBlbnMgaWYgc2NoZWRfYWxsb2NfdWRhdGEoKSByZXR1cm5zIE5VTEwuDQo+
IA0KPiBUaGUgcGVyLXVuaXQgbG9vcCBkb2Vzbid0IGNoZWNrIGZvciB0aGlzOiBpdCBzZXRz
DQo+IHVuaXQtPnZjcHVfbGlzdCA9IGQtPnZjcHVbdW5pdF9pZF0gKE5VTEwpIGFuZCBoYW5k
cyB0aGF0IGJyb2tlbg0KPiB1bml0IHN0cmFpZ2h0IHRvIHRoZSBkZXN0aW5hdGlvbiBzY2hl
ZHVsZXIncyBhbGxvY191ZGF0YSgpLA0KPiB3aGljaCBhc3N1bWVzIHZjcHVfbGlzdCBpcyBh
bHdheXMgdmFsaWQgYW5kIGNyYXNoZXMgWGVuIHdoZW4NCj4gaXQgaXMgbm90Lg0KPiANCj4g
UmVwcm9kdWNlZCBieSBidWlsZGluZyBhIGRvbWFpbiBpbiBhIG5vbi1kZWZhdWx0IGNwdXBv
b2wgd2hlcmUNCj4gdmNwdSBjcmVhdGlvbiBmYWlscyBwYXJ0d2F5IHRocm91Z2gsIHRoZW4g
ZGVzdHJveWluZyBpdC4NCj4gZG9tYWluX2tpbGwoKSBtb3ZlcyB0aGUgZG9tYWluIGJhY2sg
dG8gdGhlIGRlZmF1bHQgY3B1cG9vbCB2aWENCj4gc2NoZWRfbW92ZV9kb21haW4oKSBiZWZv
cmUgYWN0dWFsbHkgZGVzdHJveWluZyBpdCwgY3Jhc2hpbmcNCj4gaW5zaWRlIHRoZSBkZXN0
aW5hdGlvbiBzY2hlZHVsZXIncyBhbGxvY191ZGF0YSgpIChzZWVuIGluDQo+IENyZWRpdDIn
cyBjc2NoZWQyX2FsbG9jX3VkYXRhKCkgLT4gaXNfaWRsZV91bml0KCkgLT4gTlVMTCBkZXJl
ZikuDQo+IA0KPiBCZWZvcmUgYnVpbGRpbmcgYSB1bml0IGluIHNjaGVkX21vdmVfZG9tYWlu
KCksIGNoZWNrIHRoYXQgYWxsIG9mDQo+IGl0cyB2Y3B1IHNsb3RzIGFyZSBwb3B1bGF0ZWQs
IGFuZCBza2lwIGl0IGlmIGFueSBhcmUgbWlzc2luZy4gVGhlDQo+IHJlc3Qgb2YgdGhlIGZ1
bmN0aW9uIHdhbGtzIHRoZSB2Y3B1cyB0aGF0IGFjdHVhbGx5IGV4aXN0LCB2aWENCj4gZm9y
X2VhY2hfdmNwdSgpIHJhdGhlciB0aGFuIG5fdW5pdHMsIHNvIHNraXBwaW5nIGEgdW5pdCBo
ZXJlDQo+IGRvZXMgbm90IGxlYXZlIGFueXRoaW5nIGVsc2Ugb3V0IG9mIHN5bmMuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBGdXJrYW4gQ2FsaXNrYW4gPGZybjFmdXJrYW4xMEBnbWFpbC5j
b20+DQo+IC0tLQ0KPiAgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgMTkgKysrKysrKysr
KysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KPiBpbmRleCBkM2EwYTk3ZTFkLi5kNTQyYzc2NTQzIDEwMDY0NA0KPiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVk
L2NvcmUuYw0KPiBAQCAtNzQ1LDYgKzc0NSwyNSBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4o
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpDQo+ICAgDQo+ICAgICAgIGZv
ciAoIHVuaXRfaWR4ID0gMDsgdW5pdF9pZHggPCBuX3VuaXRzOyB1bml0X2lkeCsrICkNCj4g
ICAgICAgew0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBTa2lwIHRoaXMgdW5pdCBp
ZiBhbnkgb2YgaXRzIHZjcHVzIGlzIG1pc3NpbmcuIEJvdW5kZWQgYnkNCj4gKyAgICAgICAg
ICogbWF4X3ZjcHVzLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgYm9vbCB2Y3B1X2Zh
aWxlZCA9IGZhbHNlOw0KPiArDQo+ICsgICAgICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0g
MDsNCj4gKyAgICAgICAgICAgICAgaSA8IGdyYW4gJiYgdW5pdF9pZHggKiBncmFuICsgaSA8
IGQtPm1heF92Y3B1czsgaSsrICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgaWYg
KCAhZC0+dmNwdVt1bml0X2lkeCAqIGdyYW4gKyBpXSApDQo+ICsgICAgICAgICAgICB7DQo+
ICsgICAgICAgICAgICAgICAgdmNwdV9mYWlsZWQgPSB0cnVlOw0KPiArICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgfQ0KPiArICAgICAgICB9DQo+ICsNCj4gKyAg
ICAgICAgaWYgKCB2Y3B1X2ZhaWxlZCApDQo+ICsgICAgICAgICAgICBjb250aW51ZTsNCg0K
SSBkb24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QuDQoNCklmIHRoZXJlIGFyZSBzb21lIHZj
cHVzIGluIHRoZSB1bml0IHlvdSB3aWxsIGxvb3NlIHRoZW0gKGkuZS4gbWFrZSB0aGVtIG5v
DQpsb25nZXIgYmUgYWJsZSB0byBiZSBzY2hlZHVsZWQpLCByaWdodD8NCg0KRm9yIGEgZHlp
bmcgZG9tYWluIHRoaXMgbWlnaHQgYmUgb2theSwgYnV0IG5vdCBmb3Igb25lIHN0aWxsIGFj
dGl2ZS4gU28gSSB0aGluaw0KeW91IHNob3VsZCBhdCBsZWFzdCB2ZXJpZnkgdGhlIGRvbWFp
biBpcyBkeWluZywgb3RoZXJ3aXNlIHNjaGVkX21vdmVfZG9tYWluKCkNCnNob3VsZCBqdXN0
IGZhaWwuDQoNCkFuIGFsdGVybmF0aXZlIG1pZ2h0IGJlIHRvIGZpeCB0aGUgTlVMTCBkZXJl
ZmVyZW5jaW5nIHdoZXJlIG5lZWRlZCwgYnV0IHRoaXMNCmNvdWxkIGJlY29tZSB0ZWRpb3Vz
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------q5lpfLmyCi7F2MqenCajxyNi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------q5lpfLmyCi7F2MqenCajxyNi--

--------------7hedWnIs9IyQlpaeDdjENRpr--

--------------gooG7Y2TfRwRFUlti7DQtiGN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqEBY0FAwAAAAAACgkQsN6d1ii/Ey+R
NAf/bNDLqq7iLu3A8eVMZ7XZJM9PZY89Q5Wxrb+MdBOQQZdpzQb6yLI5SyrMFyid2qaZzgDe/nx2
2TGG80waFKJ0+UWCeyME31Xwvzkh/QiF4jK3GBIEo7wWv4O4q+s/qvgcDxnJZL+Q55ugSNeZMvJ9
YEZVvTW+RiRmiEOrEwGoGkJ5291N/4EImjnWUjneg8ZXHic9WAghr2VHJyCZ3l6lvRttwbv9t+9I
5uXkyQYmSZvbap/dO9d18VhbChBQtjKmbPC23Feq9CYcgNTw3E/kguKyuvqWf5xjj9CPsR46KEGs
JBZOGSmFDnCVSLGS/AJuIlR2dOIekERcVUwxeX/YqA==
=Qzbl
-----END PGP SIGNATURE-----

--------------gooG7Y2TfRwRFUlti7DQtiGN--

