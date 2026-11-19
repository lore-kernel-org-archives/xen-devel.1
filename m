Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB68606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IZYn0Ftl
Received: from list by lists.xenproject.org with outflank-mailman.1496690.1695111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU53P-0006YU-K2; Thu, 19 Nov 2026 16:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496690.1695111; Thu, 19 Nov 2026 16:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU53P-0006YN-Gt; Thu, 19 Nov 2026 16:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1496690;
 Thu, 19 Nov 2026 16:32:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xU53O-0006YD-Gm
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:32:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU53N-002eaV-TL
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:32:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aff247a-8faa-0a2a0a5109dd-0a2a450b8a8c-40
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:32:05 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aff2485-b7e8-0a2a450b0019-d155d032b9a0-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:32:05 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6b876afbb86so3321124a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 08:32:05 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc42easm14164466b.60.2026.11.19.08.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 08:32:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795105925; x=1795710725; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sPfYIUokIobAVOy+Kt3MNId0nKysTKl6bqq2JLMUxOQ=;
        b=IZYn0FtlO/QCELz/dLb91LjtR9LszI4jcfNLIFz0V+9KxfArHPq/1wHcVcEq1oMQcL
         AsvJWKuV7NYfq/fxNafj3zdskEvRD4WUMzlRoR9N8dwuSRoXofJs7EfI/1/B9bNbMnwd
         A1GxnIXUvhN1+pYsa798uCeLT+oBgi3vYbPCqGJJ3pr9BnwmJsL2nvNekSjpeD4Z7mFx
         EOm0Uhc1S7w/wIlMeTitArsTU5l8i79GD9nw692g1glu1lfLysB13TWaaOCNHEQdxSVU
         jK6MVDXlayKE2yKIqmBPlgZYr7+rTSTjGygps1K/k7QcQDCxUHG1iCXjQu72PmGLH/ca
         tArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105925; x=1795710725;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPfYIUokIobAVOy+Kt3MNId0nKysTKl6bqq2JLMUxOQ=;
        b=om6JV2nrBtztybKYADfhTL2YWFEs7vqdPLkoy1KBNRSvnYuHYRVL+P0cd7xLpUt+Mp
         x/Z60kLqz+UiYTsKw0zs+RuHx3gfQjoM0eYiiQjcZxcW6Qapuh/ioUqfO2W6Maa9p+3u
         /qMnyDGXTmEg8MM/l5vcbJ3/hCyaxBy4VHF4a3Tx3v8yeqGoILhYn57sHwgCvC0d4HnG
         f5RdIXC0h7jHbnQuK8g584V8aw90rOXzkikE1vDMVTZwVgXwPQbeGdmGdO8kkyeQKwS/
         TAc3hal1jlkCy6BHn7P09GiF+46aBHxQLEqyjQ6UP3T0UNuCPJ0evihJW08jWkBF2jDG
         cxoQ==
X-Forwarded-Encrypted: i=1; AL+hErFg2gxH0lq10DCk3QdBh++G5W78HmzZKGiA0ENOrMldo2yaHQ9c5f9MPpaLJxSMAQ6/2Mf4MTu4Vk4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8i3/XopGZrhSbFNtvu2EQCeXO08jSXqR5wyi74pqETLzBFpVGd
	Hck59tqdU78OUX75GZgq6T3PfSZns6ZHb9nFwfXUFnT9Lil1wskY+c6oRiCBI1sSA9g=
X-Gm-Gg: AYBFou1lboZPBSSPxmdiMZAT2o+2tNerye6YCBtWIQvsKOnCMgLUl6xXcU+ATa+1exu
	WQAh8ruANAPeH3rBZ5d2z4V5qWYkoxur2cOsiZpw3deV7VzKdPI5HAqXhkmyEbXcX/f+rNU5RRv
	dBccQC/CgF63qRD+TDqanNJyVCba0gHZWCMs+AAtmmA5endCaMsLfQVc/0z1aMFUMpZ2gQctS7c
	TLBYoxzQK46DKgQPtX9+ScmBRIG0aA1RquhkHAxM3SbjoG/aDviKyqYICKZGgOMZZgvh4RCABF0
	uLmLPBl17ZMyEqKHfNBVymprlXkDRO3BUJOVglzuQqZMI6s+VB16wyGIKSCCGwcZfAfchA4a5gI
	gh4KYimaeYaqgIIfqLtdrrGHMOECHHasQiObw+g6D8XG2yNP0/2Plq6lFHhKuKuVS2WHeUXRD/7
	RWFUHVLs5bLbkN2MjThZAxq+rWTrccLNqxiOKDlf/bVdp/fdCAmPatHgIceXFHamZj6xkmJJoHU
	TnmS1V92PkcI9VP19D//PgO1Xz1ybDSppKSw/SZeumxit/l1y0Nwg1sHtmBfQ/X2FqH0ikSS8Ln
	Mr5D+pICyjoDv1ewIL2hsqgN/9nO17lHxRdyLSO7qm0PuEH46vxo34PbKbzkd+GC8ZJx87nHY62
	NKYUHob9qDfLuanypyfqPsQ3MyqBO5MR1nEnjXFSI0dZU6Z3VR/o=
X-Received: by 2002:a17:907:da02:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c513a8493eemr50358366b.27.1795105924717;
        Thu, 19 Nov 2026 08:32:04 -0800 (PST)
Message-ID: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
Date: Thu, 19 Nov 2026 17:32:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: shyckless@gmail.com, jgg@ziepe.ca, linux-kernel@vger.kernel.org,
 sstabellini@kernel.org, linux-integrity@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org>
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
In-Reply-To: <av8kIqYC04D5QdXf@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rS9qJzvGq5TEYjY8RSxuDc5I"
X-purgate-ID: tlsNG-42698a/1795105925-A9EC69EA-79ED9F94/35/110847
X-purgate-type: clean
X-purgate-size: 7525
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rS9qJzvGq5TEYjY8RSxuDc5I
Content-Type: multipart/mixed; boundary="------------9iDCYuhIjWzTJQZqas7jrhKH";
 protected-headers="v1"; hp="clear"
Message-ID: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
Date: Thu, 19 Nov 2026 17:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: shyckless@gmail.com, jgg@ziepe.ca, linux-kernel@vger.kernel.org,
 sstabellini@kernel.org, linux-integrity@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org>
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
In-Reply-To: <av8kIqYC04D5QdXf@kernel.org>

--------------9iDCYuhIjWzTJQZqas7jrhKH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMTc6MzAsIEphcmtrbyBTYWtraW5lbiB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMTksIDIwMjYgYXQgMDQ6MzU6MDJQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToN
Cj4+IE9uIDE5LjExLjI2IDE2OjIwLCBKYXJra28gU2Fra2luZW4gd3JvdGU6DQo+Pj4gT24g
VGh1LCBOb3YgMTksIDIwMjYgYXQgMTE6MjA6MzNBTSArMDAwMCwgU3V5dWFuIFdhbmcgdmlh
IEI0IFJlbGF5IHdyb3RlOg0KPj4+PiBGcm9tOiBTdXl1YW4gV2FuZyA8c3RldmV3b25nQGh1
c3QuZWR1LmNuPg0KPj4+Pg0KPj4+PiBXaGVuIHRoZSBiYWNrZW5kIG1vdmVzIHRvIENsb3Np
bmcgb3IgQ2xvc2VkLCBiYWNrZW5kX2NoYW5nZWQoKQ0KPj4+PiB1bnJlZ2lzdGVycyB0aGUg
ZGV2aWNlIGFuZCB0aGVuIGtlZXBzIHVzaW5nIGl0Og0KPj4+Pg0KPj4+PiAJZGV2aWNlX3Vu
cmVnaXN0ZXIoJmRldi0+ZGV2KTsNCj4+Pj4gCXhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2
KTsNCj4+Pj4NCj4+Pj4gVGhlIHhlbmJ1cyB3YXRjaCBjYWxsYmFjayB0aGF0IGNhbGxzIGJh
Y2tlbmRfY2hhbmdlZCgpIGRvZXMgbm90IGhvbGQgYQ0KPj4+PiByZWZlcmVuY2UgdG8gdGhl
IGRldmljZS4gVGhlIHRwbV9jaGlwIHJlZ2lzdGVyZWQgYnkgeGVuLXRwbWZyb250IGhhcyBk
ZXYNCj4+Pj4gYXMgaXRzIHBhcmVudCBhbmQgaG9sZHMgYSByZWZlcmVuY2UgdG8gaXQsIGJ1
dCB0cG1mcm9udF9yZW1vdmUoKSBkcm9wcw0KPj4+PiB0aGF0IHJlZmVyZW5jZSB3aGVuIGl0
IHVucmVnaXN0ZXJzIHRoZSBjaGlwLiBTbyBkZXZpY2VfdW5yZWdpc3RlcigpIGNhbg0KPj4+
PiByZWxlYXNlIHRoZSBsYXN0IHJlZmVyZW5jZSBhbmQgZnJlZSB0aGUgeGVuYnVzX2Rldmlj
ZSwgYW5kDQo+Pj4+IHhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2KSB0aGVuIGFjY2Vzc2Vz
IGZyZWVkIG1lbW9yeS4NCj4+Pj4NCj4+Pj4gVGFrZSBhIHRlbXBvcmFyeSByZWZlcmVuY2Ug
YmVmb3JlIHVucmVnaXN0ZXJpbmcgYW5kIGRyb3AgaXQgYWZ0ZXINCj4+Pj4geGVuYnVzX2Zy
b250ZW5kX2Nsb3NlZCgpLiBUaGlzIGtlZXBzIGRldiBhbGl2ZSBmb3IgdGhlIGxhc3QgYWNj
ZXNzIGFuZA0KPj4+PiBrZWVwcyB0aGUgZXhpc3Rpbmcgb3JkZXIsIGluIHdoaWNoIFRQTSBv
cGVyYXRpb25zIGFyZSBzdG9wcGVkIGJlZm9yZQ0KPj4+PiB0aGUgZnJvbnRlbmQgaXMgbWFy
a2VkIENsb3NlZC4NCj4+Pj4NCj4+Pj4gRm91bmQgd2l0aCBhIHN0YXRpYyBhbmFseXNpcyB0
b29sIGFuZCBjaGVja2VkIGJ5IGhhbmQuDQo+Pj4+DQo+Pj4+IEZpeGVzOiBlMjY4Mzk1N2Zi
MjYgKCJkcml2ZXJzL3RwbTogYWRkIHhlbiB0cG1mcm9udCBpbnRlcmZhY2UiKQ0KPj4+PiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4+PiBDby1kZXZlbG9wZWQtYnk6IEthaXh1
YW4gTGkgPGthaXh1YW4ubGlAbnR1LmVkdS5zZz4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogS2Fp
eHVhbiBMaSA8a2FpeHVhbi5saUBudHUuZWR1LnNnPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBT
dXl1YW4gV2FuZyA8c3RldmV3b25nQGh1c3QuZWR1LmNuPg0KPj4+PiAtLS0NCj4+Pj4gQ29t
cGlsZSB0ZXN0ZWQgb24geDg2XzY0IChXPTEsIG5vIG5ldyB3YXJuaW5ncykuIE5vdCBydW4g
d2l0aCBhIFhlbiB2VFBNDQo+Pj4+IGJhY2tlbmQuDQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2
ZXJzL2NoYXIvdHBtL3hlbi10cG1mcm9udC5jIHwgMyArKysNCj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQuYyBiL2RyaXZlcnMvY2hhci90cG0veGVuLXRwbWZy
b250LmMNCj4+Pj4gaW5kZXggM2MwY2NlNTdjNGFlLi4xYmU5MjVjY2E1MzUgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2RyaXZlcnMvY2hhci90cG0veGVuLXRwbWZyb250LmMNCj4+Pj4gKysrIGIv
ZHJpdmVycy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQuYw0KPj4+PiBAQCAtMzk3LDggKzM5Nywx
MSBAQCBzdGF0aWMgdm9pZCBiYWNrZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZpY2Ug
KmRldiwNCj4+Pj4gICAgCWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOg0KPj4+PiAgICAJY2Fz
ZSBYZW5idXNTdGF0ZUNsb3NlZDoNCj4+Pj4gKwkJLyogZGV2aWNlX3VucmVnaXN0ZXIoKSBj
YW4gZHJvcCB0aGUgbGFzdCByZWZlcmVuY2UgdG8gZGV2ICovDQo+Pj4+ICsJCWdldF9kZXZp
Y2UoJmRldi0+ZGV2KTsNCj4+Pj4gICAgCQlkZXZpY2VfdW5yZWdpc3RlcigmZGV2LT5kZXYp
Ow0KPj4+PiAgICAJCXhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2KTsNCj4+Pj4gKwkJcHV0
X2RldmljZSgmZGV2LT5kZXYpOw0KPj4+DQo+Pj4gTm90IGEgTkFLIGJ1dCBtYWtlcyBtZSB3
b25kZXIgd2h5IHRoaXMgaGFzIG5vdCBoaXQgdGhlIHdhbGwgZXZlci4NCj4+Pg0KPj4+IEku
ZS4gImZlZWxpbmcgY29uZnVzZWQiLg0KPj4gSXMgdGhlcmUgYW55IHZ0cG0gYmFja2VuZCBv
dGhlciB0aGFuIHRoZSBzdHViZG9tIGJhc2VkIG9uZT8NCj4+DQo+PiBJZiBub3QsIHRoZW4g
aXQgaXMgcXVpdGUgZWFzeTogdGhpcyBiYWNrZW5kIG5ldmVyIHN3aXRjaGVzIHN0YXRlIHRv
DQo+PiBYZW5idXNTdGF0ZUNsb3Npbmcgb3IgWGVuYnVzU3RhdGVDbG9zZWQuDQo+Pg0KPj4N
Cj4+IEp1ZXJnZW4NCj4gDQo+IFNob3VsZCBpdCBiZSByZW1vdmVkIHVzZSB0aGUgZGVmYXVs
dC1mYWxsYmFjaz8NCkkgZG9uJ3QgdGhpbmsgc28uDQoNClRoZXJlIG1pZ2h0IGJlIG90aGVy
IGJhY2tlbmRzIGluIGZ1dHVyZSwgc28gZm9sbG93aW5nIHRoZSBub3JtYWwgWGVuIFBWLWRl
dmljZQ0Kc3RhdGUgbWFjaGluZSBzaG91bGQgYmUga2VwdC4NCg0KDQpKdWVyZ2VuDQo=

--------------9iDCYuhIjWzTJQZqas7jrhKH--

--------------rS9qJzvGq5TEYjY8RSxuDc5I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr/JIMFAwAAAAAACgkQsN6d1ii/Ey9N
2gf+Pao/6gxwMq53WtLQZGg0rt7LxQlMzgUrZUfCvGwBnRWijzoAdOuCktBwjdhIa/kDFtI+0UD1
zJC4DVDWOGZJ34dbA4adOwTpBx1BagvWrbZpOtxjJMAGug1OF+Bl5CtpD278hS4Da9vkVjvUTo+D
xdfJydn03dgIJqA8C5jERa0WvRfhFqeQi6fgXWWcV80qGa/fY8De0A+2eUEVly/S++3gtYbJ0vFk
DCUis3njGMqm2Ls7y2Xi9wm7As7lA2FCDvzK+G7xNgew1gYqL+R1g+Zp19YckJyAo5WNTOGE3LMg
C6iyQ06fJF71R/Afgc1XzaLmlZrOBWyv3i1NNAzKLw==
=97I1
-----END PGP SIGNATURE-----

--------------rS9qJzvGq5TEYjY8RSxuDc5I--

