Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976A606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A3jwO9dq
Received: from list by lists.xenproject.org with outflank-mailman.1487550.1689911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqtk-0008Bq-JP; Fri, 13 Nov 2026 13:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487550.1689911; Fri, 13 Nov 2026 13:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqtk-0008Bj-Fo; Fri, 13 Nov 2026 13:00:56 +0000
Received: by outflank-mailman (input) for mailman id 1487550;
 Fri, 13 Nov 2026 13:00:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRqtj-0008Bd-5C
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqti-005CsQ-HY
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 14:00:54 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af709fe-e002-0a2a0a5209dd-0a2a4507df00-36
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 14:00:53 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af70a05-b4ea-0a2a45070019-d155da33e4e4-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 14:00:53 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c5083bc0e28so192028066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 05:00:53 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b79d19sm88583866b.71.2026.11.13.05.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 05:00:52 -0800 (PST)
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
        d=suse.com; s=google; t=1794574853; x=1795179653; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ipwpFSa7m7yaWodeTMDskfMt/6LVAJrRzY60Wqc7FJs=;
        b=A3jwO9dqYj5V/xbjK8kLo1TJcSsi/+BqnU4SSIZcc950IzTNPGkFxzaf1s+ECAwdny
         yNICum2u9XVg6tCCvmMnlPWIR62rGh1WcA6Tk0i2OF4E+glYWL8L4qQX18fv+B2bpGjT
         rdcQXXwY/SE5iVK3Gt5sNXLRMgp6zFuza7z5Q6oAhEBJc9qvkVGumlzyMbYpP9R5Jhbk
         vKV+e4WfRJCzmQxQHovbl4uImhgUOij1Gu2H8GW/pZdpVl1Xi267oDN9zKS3fyiy/8LQ
         /r8NwiAScitL6cviNz5xXiqnscJxmysABPXQZ+5tnc5GFcAlfeOHunZ6pGHkFqvG+AUA
         uPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574853; x=1795179653;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipwpFSa7m7yaWodeTMDskfMt/6LVAJrRzY60Wqc7FJs=;
        b=TbJGYmS5nxy49RQ+75lxuVbcC+7KrObX4lf2Hhj0ab/Hyq5FTqd6W1y6teHxE3K9Ge
         4koRQhjeg6IhXquXERQOC0xVe5OsL7qXikOo55pZ+ORyF8vsoY61yivr5E606sQmLtvZ
         jl4lkelE13mDqU4Bo+zICVXSY6eMbve4cloM80u4RAVsT49v7/yToxqfsQ6mAaYTgWQZ
         kXxoEGPFKsHOZDTr8py6eQCiUS1GBDHXTvp74VBFYUw7rG9RY30+Z0K5TeZe8F35hUU4
         GK5OzOW2+63xNiWyrSLewj0967iSlCvUVmVucHCgE4DoO2dzqu4Umk/z8+43OmGV0Ht+
         HiTA==
X-Forwarded-Encrypted: i=1; AL+hErExHhCYOj0O6/VbQo7nPiFnapRF4L+3eIX61uB6F/geflaXhZffVjK3Clc2dOdE5WWPRkC8BKvS6eI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/+ylnIw5d4MnmHBcJn6t/kTwq4X3J48SKmRpaR8Yej/uAOJi3Z
	NIQtdPcOLwfRfydkPrkBIFXDY09otWBMB++kpMOU/Jgyt5OmmFiMVIjSt9k3BbyQtl0Uzc3Lcjc
	Ir6UZFSo=
X-Gm-Gg: AYBFou377+yWoFHtgL7s91znlue5n3SW1NsbPHt4WtmMiOfm8Pbf80YdWT3cW9i5N1C
	WIfuLOpZyFLTI5reHq+z62XHIatPcolJgl7qIHIus9O08XTwdazak3eiTouQb6C5eSEbVBBOGVt
	v2qHvL9627tBZnwoPwKCaGXv5ePWX4q5jY9GMST4eDqPcSO0kNW94LChZj8IXoGNJB5OT45zR4O
	gIpM3Xp30qNFHm9rEUs1OHEwSGqQTj7YVwyr38lIalasjh8ah//h6yKb5hBzzvI8gKng28mKSmI
	THKqfpgosmGGImyjs/VDf+S59hEyiMz/w6N4apcF/v0S0VqZZoC/XAGTdE6i1+88HM6L2wKbjJX
	2fufsaN02hsJNvHPOfXWpeJY38SsvfJWQaWf8FZslEzGwuJ79SDKyTaoWFTaX2+y4fr9fY/F5hP
	AiOQpm/2ViooCXN34D5WIwr7bTT3xEZ74HWHm8S6U3Ogz0opVCR6Zasc8EWudvq3QY5g3Rb+CIM
	PaEDD0zdJsF0CXTi9vqkuR6wf8REWGPml1BS8FJh+ovR+ww2H1bOs414HK0DqUOyp7kI0irkuOD
	Qo2fwreMfUtzfREZYiRl+f7JJ2cSF/RfB/7jJkBUjgl8PuWFrXY1JhOch/XIU3ud3Ruvzh8YcvQ
	eXSMgFcCD/OM4do2WLfmE8GJlfyZMOiRnl2soDJ4tB3mCzkwJJntm
X-Received: by 2002:a17:906:dc8c:b0:c50:6bfa:3235 with SMTP id a640c23a62f3a-c50963c3a6fmr223153266b.45.1794574852710;
        Fri, 13 Nov 2026 05:00:52 -0800 (PST)
Message-ID: <d1f5f9e4-ebb0-4c73-b53c-4b566ff48c6f@suse.com>
Date: Fri, 13 Nov 2026 14:00:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Drop the *_UNIT_CHECK() macros
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20261113120504.3407364-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261113120504.3407364-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PqHKGF1Hte8pp1s2WxcA6s0I"
X-purgate-ID: tlsNG-ef75cf/1794574853-36EDEAE4-59C322B9/35/110847
X-purgate-type: clean
X-purgate-size: 3949
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PqHKGF1Hte8pp1s2WxcA6s0I
Content-Type: multipart/mixed; boundary="------------TjXzTOBKYnnVd9u3mhDXryey";
 protected-headers="v1"; hp="clear"
Message-ID: <d1f5f9e4-ebb0-4c73-b53c-4b566ff48c6f@suse.com>
Date: Fri, 13 Nov 2026 14:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Drop the *_UNIT_CHECK() macros
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20261113120504.3407364-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261113120504.3407364-1-andrew.cooper3@citrix.com>

--------------TjXzTOBKYnnVd9u3mhDXryey
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjYgMTM6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IEFsbCB0aGVzZSBk
byBpcyBjb25kaXRpb25hbGlzZSBjYWxsaW5nIHRoZSByZWxhdGVkIGNoZWNrIGZ1bmN0aW9u
LiAgQ29tcGlsZQ0KPiB0aGUgZnVuY3Rpb24gZ2VuZXJhbGx5LCBhbmQgdXNlIGFuIGVhcmx5
IGV4aXQgdG8gRENFIGl0IGluIHJlbGVhc2UgYnVpbGRzLg0KPiANCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------TjXzTOBKYnnVd9u3mhDXryey--

--------------PqHKGF1Hte8pp1s2WxcA6s0I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr3CgQFAwAAAAAACgkQsN6d1ii/Ey+x
rAf/bFlV9zT5Tn0OjzewATPVL54utOfFLCYS0EftvMsL5jdxZM4j9avdHCdjj8dwj49/pO6so1eW
B336W2EiA4yYdjjy/Ir84ySDcm/gHOt8HcEHaAYUjG3Oq+ZQbxQ7AF6VzOiXTb/F1VdFaO5wxI2D
JY8alEJXUnbZv2z507USSPF/HFWU+vmdB0+kscXAPCvWQ/pVJiKBslucRMZL2bpNx3yZK90wdQUP
VABd8MklitUqLM7efHxF0FY8b4gZYJoYdPclgi8/pxcrS8XulPzhKJTfZZbG3Ag4pkyeAnFD3OuM
PKydoHYmtHS8g+HkipzjWv2AgXza5IYVZlsDoUjs9Q==
=vDWB
-----END PGP SIGNATURE-----

--------------PqHKGF1Hte8pp1s2WxcA6s0I--

