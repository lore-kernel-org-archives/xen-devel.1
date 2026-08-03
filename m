Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C7C55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:12:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381508.1625059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtOi-0007ti-R8; Mon, 03 Aug 2026 14:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381508.1625059; Mon, 03 Aug 2026 14:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtOi-0007tb-OH; Mon, 03 Aug 2026 14:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1381508;
 Mon, 03 Aug 2026 14:12:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqtOh-0007tR-Kt
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:12:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqtOh-00F6UV-1Z
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:12:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a1ab-e002-0a2a0a5209dd-0a2a450a9fe8-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:12:06 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a1b6-f2d2-0a2a450a0019-d155da30b5e3-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:12:06 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c15f020a223so518366366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:12:06 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd44542d2sm589170266b.35.2026.08.03.07.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:12:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1785766326; x=1786371126; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MS/I3nwa6tPsNEN+LIrocgCk6NLiF+ItW1O5FQY1Gfw=;
        b=NBugHU9fLau0W+HlgVet7pRCEz4Tu5GN9MTbCGc6wGuMBzkFZyRMWawVlep5QAUdLG
         fDx9/HqlZ4rJiaU1JodrPqx3FlBsH/tbGJVEjw8EBKdBCgC8/qE0dcf/ub1HAdDxPprD
         gv74BaXEMXmK0nTkO3y79aybqW/3vaHdkfFD7Kn0422h6z8yon19RL+ZlWE07GDpXEOS
         HDHM9mTDUOwR1jxsOaWS3mkD7n99Awo1oDKYnHHFjvs+sEGQUG4k9EW7aBO7VlNz6JvQ
         /la2xKc63a0VUBggGhP2DZ2EHYkUuNkGuIMEp84/ETfJZTqlwJEPyfNJp0+zjA3n26C1
         L84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766326; x=1786371126;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MS/I3nwa6tPsNEN+LIrocgCk6NLiF+ItW1O5FQY1Gfw=;
        b=S/dwACj/YuvSW18qZ2bMku2GPZ9FoA5jMRw/Gmv9TaO6Y7wa2gv2MzuAqCDEKGty9v
         MgSHUxnG6lAURNd4uU15kcL3jKuWW5nARrrBkY0FjlHN8B+lP1gQyMXxLuh1cvoaiHxZ
         cMJDz+dHZl842TAyxr4EksqDCoWwDUWx4HFJkckmW+NiPw3mfi/jpEMSq6/GedGyOzot
         XPGfMANUG4hUbGRY5XNB5E/XJPsveqr+DwbJsQnSzXuf5yoBrDk1Lijn08hxzRiFOJFG
         sKGOD860L5GY91nZWTlvNW0zVvZdFiJc4qeF0qt91I8glVoVj+WW6ORniZ8vquMqsFLc
         ec/A==
X-Forwarded-Encrypted: i=1; AHgh+RqAWSgD8mbrZkaeVtiZkApcvosTw4Ux1fbnq9lvDYD8hlUy1ssoMGMXk4ycIZ7XrnS4bxFSBZV2j9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy56miseFDdeuxcqoppfMmJm5ztb3AZ7lSU5jDzuo3pW0JUKCDV
	cOTT1O96wdWb2iLIsf5s5BSB8foKS3JCBxvs3Tmvlc6M8sA8pSDdvzUVhjrUT/olYqQ=
X-Gm-Gg: AR+sD13y7LVrDBIUs293mVr0um3WFrJdle4Qap+Iss+EoeO9zKjLWtEi6xgVdgJhytf
	jYzDpJBkqEZ3NJGKdqLLVJItUJDzZPTEUZxsNdYzgddNcvlINlWjrJZyGFk/fkWIJp12wy43mGI
	x68yXdEmKQbtXaoLzJfmrLN6kctsLsJCgp6ia+5DDx2kBXeTg27lhbnh7ebcDEJZXdAaFKU1LRw
	sWopoJIk60qlV0+23n+/rhIHg9IZXn13VF/7Px0K5ijfjNt1nciGU2e+kYTbBaJiGWPTxckBfWV
	Rxj/vQDbSd/x8cpx4wulqHXIN+tD1XqivZ20wTiY7pUaDLmNZJUgCrF/dvZS847N1Wx46HktCLh
	smhz4kLYsxrzt9IcJzVkWwWAKqB3zVGx/6A5zYso7sjPepSe9n43RnFH7A9/6wLdqa6/Q/mfM8H
	lI1Q/0cr6BORIeB+J7EARukMKX3wbpOCS6iPUNdC5NRCYWKuLQEy9oj9og/kgrZ0PGGnsZVUp3Q
	+2tcrgGU3KiykiSqGhZ2wEE4XnVycvTHuQwUcEr1ca8lmRrQCTO1Ej29fIRcKXSrzPt/Xj2fsHU
	zzkGTn3b6Wv2bzE=
X-Received: by 2002:a17:907:d28:b0:c20:1bc5:7002 with SMTP id a640c23a62f3a-c201bc577a6mr147988666b.3.1785766325454;
        Mon, 03 Aug 2026 07:12:05 -0700 (PDT)
Message-ID: <2d4b7ec8-7900-433a-a3b4-a5b043e55ca8@suse.com>
Date: Mon, 3 Aug 2026 16:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix init of balloon stats for PV guests with
 memory != maxmem
To: Roger Pau Monne <roger@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Yannick Martin <yannick.martin@okazoo.eu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260730143548.39320-1-roger@xenproject.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <20260730143548.39320-1-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------102FQPugHI0qaeHSeczrm1XT"
X-purgate-ID: tlsNG-4011c0/1785766326-518C5CFC-65CB5895/0/0
X-purgate-type: clean
X-purgate-size: 7035

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------102FQPugHI0qaeHSeczrm1XT
Content-Type: multipart/mixed; boundary="------------JqWSU2jrs0iCl3o7E0OAmZf5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Yannick Martin <yannick.martin@okazoo.eu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <2d4b7ec8-7900-433a-a3b4-a5b043e55ca8@suse.com>
Subject: Re: [PATCH] x86/xen: fix init of balloon stats for PV guests with
 memory != maxmem
References: <20260730143548.39320-1-roger@xenproject.org>
In-Reply-To: <20260730143548.39320-1-roger@xenproject.org>

--------------JqWSU2jrs0iCl3o7E0OAmZf5
Content-Type: multipart/mixed; boundary="------------wDZ9xUzZMQeFCoQUHq4De83r"

--------------wDZ9xUzZMQeFCoQUHq4De83r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjYgMTY6MzUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGhhbmRs
aW5nIG9mIGV4dHJhIG1lbW9yeSByZWdpb25zIGRvbmUgaW4gYmFsbG9vbl9hZGRfcmVnaW9u
cygpIGlzIG5vdA0KPiBjb3JyZWN0IGZvciBQViBndWVzdHMsIHNpbmNlIHRoZSBpbml0aWFs
IHRhcmdldCBpcyBzZXQgdG8gcmVmbGVjdCB0aGUgcmVhbA0KPiBtZW1vcnkgdGhlIHN5c3Rl
bSBoYXMsIG5vdCB3aGF0J3MgZGVzY3JpYmVkIG9uIHRoZSBtZW1vcnkgbWFwLCB3aGljaCBj
YW4gYmUNCj4gaGlnaGVyIGlmIG1lbW9yeSAhPSBtYXhtZW0uDQo+IA0KPiBJbnRyb2R1Y2Ug
c2VwYXJhdGUgbG9naWMgZm9yIFBWIHZzIEhWTSBpbiBiYWxsb29uX2FkZF9yZWdpb25zKCkg
YW5kIGhhbmRsZQ0KPiB0aGUgZXh0cmEgcmVnaW9uIGNvcnJlY3RseSBieSBhZGRpbmcgdGhl
bSB0byB0aGUgdG90YWwgYW1vdW50IG9mIHBhZ2VzLA0KPiBpbnN0ZWFkIG9mIHN1YnRyYWN0
aW5nIGZyb20gdGhlIGN1cnJlbnQgYW5kIHRhcmdldCBwYWdlcyBhbW91bnRzLg0KPiANCj4g
Rml4ZXM6IDg3YWY2MzM2ODljZSAoIng4Ni94ZW46IGZpeCBiYWxsb29uIHRhcmdldCBpbml0
aWFsaXphdGlvbiBmb3IgUFZIIGRvbTAiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------wDZ9xUzZMQeFCoQUHq4De83r
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wDZ9xUzZMQeFCoQUHq4De83r--

--------------JqWSU2jrs0iCl3o7E0OAmZf5--

--------------102FQPugHI0qaeHSeczrm1XT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpwobQFAwAAAAAACgkQsN6d1ii/Ey9J
Bgf9HymnFMUKn+2bsmwaBf5rACLUjwPLhafp6AAAf7Qw6kTOJcJpM6xq0xqTcvHevmuXlXsGC09c
3/RvrZQD4dLA1yzEx5sueDYxhhcRl7H4cm2R+jVw+QJzmtc+5Nu+KlK4bhcBED/+wuYxiuGofABq
s9zCbpVKlh0lhd1jPE8bTts7AXJ2y3gVyURfJud7xHe0OiI+Cz19TypkzEoIr/0FkgJtOABVFmQ8
oLBLsVFijdd2EW4vLC97sXkffzv6VXsTfGZKonC5dlcI378QvCbjRyMyikTzd5eZJDHhBmLYVruh
O3KAw+pZ8dbAET5Q0hqCMFePMYSQJSfowAYAIBO8Yw==
=HiJW
-----END PGP SIGNATURE-----

--------------102FQPugHI0qaeHSeczrm1XT--

