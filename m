Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42F606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SMGWVYs4
Received: from list by lists.xenproject.org with outflank-mailman.1485183.1688466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROp6-0001Cv-6W; Thu, 12 Nov 2026 07:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485183.1688466; Thu, 12 Nov 2026 07:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROp6-0001Cm-2m; Thu, 12 Nov 2026 07:02:16 +0000
Received: by outflank-mailman (input) for mailman id 1485183;
 Thu, 12 Nov 2026 07:02:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xROp5-0001Cg-3E
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:02:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xROp3-001whk-RB
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 08:02:13 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af56467-e002-0a2a0a5209dd-0a2a45048984-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 08:02:13 +0100
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af56475-b57f-0a2a45040019-d155d030c033-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 08:02:13 +0100
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6a642495d81so761109a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 23:02:13 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7ada54c88sm112091a12.2.2026.11.11.23.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 23:01:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794466933; x=1795071733; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/4MtBLSGAeSlREMeMpXOJglcbVkwCt0++4H9V4EMMVM=;
        b=SMGWVYs41nk+h2sO+zDZfePFGPNLva2t8REs1364VMBg/eN5ITVYdofK3f1zYyS6Ei
         W1wDhgxBWeF+8NBf465cpPD+kiz8tXYN+5zVuxMuMNtLHT5UaZLg4GVyBRRQnvo/pqNu
         CHBhSUk3Z1TDzB5CHhfHvlc4v6qzRjcWibfM+CM+cEADIi67QDTJeHgvDe7poIm17rjq
         uWdlcqA0A5DSjmR/XMuhAVUzfsuftLybZmhPaidCADvaVg0EPGAsX3t/faUolQUDZOxP
         m0uAyQfqvZc9LHIxyu8VcNkQ3wVl+2CtmnnCwn8otPqmb8BwcPoV8BYts5umP6Z6O7QY
         B22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466933; x=1795071733;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4MtBLSGAeSlREMeMpXOJglcbVkwCt0++4H9V4EMMVM=;
        b=AIbiZE0ReDFP0NQBxAjYF5IJci70ncqP2JqIPluc2TQcPW1X/s5ps4Sb5BenTekfhj
         huVmLnOdqD9wOulPQwaaAJLoAU2ACXbE/Pq0lYoNQvpeSxvkPrLNz+2iGjiNmxzlfpzL
         gXmHVBUEfTcJXRwYcjSZh/UgWwvj+J1X9kiNSpONPCzKzPENuw32POLo707GFZ/m2vWW
         jkuzIhA0r8PvP5M2hMFGzTp+s9xe+lMV+haSA5H0IL8Duf5qsS5lwt9p5WlzPLUSi2ZT
         tvNT88AXAi8nK9U49Gejd9GdZWBDy/cVGjVB0vAeMtRjc8mRMjwx+WSnRqVf6lz7gUkg
         YwbA==
X-Forwarded-Encrypted: i=1; AL+hErEVo9ekoB9e9FzKQFx2TM/UtiGNgVdUfIiar/jb3Km5fbxrWA+NEEKvAAjqqmMcC0PXyo/Q06E47kA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z//mQwANWSmRdSJcODiM+yQikXhygH1NJCX76ENjYpxhzbA8CyT
	xNW1L3I9HHOGFzsbkyaqoxVXUwjo85EV6tOgFA6P2FbQhCIGkHvZW0Q3bxoF1Mq3dDg=
X-Gm-Gg: AYBFou3gAxxTm+7Tw2Hbn/nSKciXjpbcHZ7/ujGssqaQlHmK03Ny9RELHC0FF6ndNnM
	0pfdPq2lQAc1OlvEP09IbkKKFMTS0dEQfk6+X6yuhOzvt+81jqP5cQeh9wJKHirO8pV6ft86HQS
	T6ogyCwfCv+jbLhlc2Kd9GYoA1L8eqvwMFzs4eqLrFomkjGodmoiDjDNBGLHiB1ssnDQs16hUTL
	03+p3YdBXHVj/pDv377tbjdIAzVC4VnlqyJSQYsb6pDyd7jESTQdCtTuQ9D8DpI7KH+xwvtRTxI
	BLkxIwNQXvJzTNP5zosKlT+JB1mjfMJG9jjaHQa3FSU4tmbpkUd0PcsRMATKJ+EXOeer/h0WW7L
	66vWh0ox1uHrN7jpUcNXACYME7zunStusWewDCwEOIZTHyogE3QN1zkCQe1wk2ongGgLUaUxux1
	5dasLP1LbtgnvcDOS1+qgxGnxk3CFwCKuXrJBdhjP9MGPbkE6izP3QC4cFFrBgVfe8LO8k5p1Aj
	eS5etcZLGegI98xPU/E8nddlTIrHB7oL+rqBvQiI2aCb3tRjluTSPhqfn2Bygm4xzHq2598p1nD
	BB1ww7G1+mOhY0jjTfjZ9/UfORNogzwzXzn7SQ8n2GU+odRzmu73FJe6fqE7EyBfyfHiJFQMdYa
	6f8/r1JQv0SqtTrV8uyNZCJnqI78eJK0V7MUalUoQC+PWt4a73Ghsi6LL0/QbRtZnOBeLcgNC
X-Received: by 2002:a05:6402:1e94:b0:6b5:61fe:982a with SMTP id 4fb4d7f45d1cf-6b777824953mr3292179a12.45.1794466916038;
        Wed, 11 Nov 2026 23:01:56 -0800 (PST)
Message-ID: <3a052d2c-8d14-4cb1-b6fd-277a6b0c8196@suse.com>
Date: Thu, 12 Nov 2026 08:01:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
 <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
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
In-Reply-To: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XnKNkkfJknfgjGY9Ag00BvNt"
X-purgate-ID: tlsNG-ebf023/1794466933-C24CBB50-60ED8673/35/110847
X-purgate-type: clean
X-purgate-size: 4439
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XnKNkkfJknfgjGY9Ag00BvNt
Content-Type: multipart/mixed; boundary="------------znQNYWv2cH6gyTbCeqXfd0fm";
 protected-headers="v1"; hp="clear"
Message-ID: <3a052d2c-8d14-4cb1-b6fd-277a6b0c8196@suse.com>
Date: Thu, 12 Nov 2026 08:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
 <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
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
In-Reply-To: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>

--------------znQNYWv2cH6gyTbCeqXfd0fm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTEuMjYgMDc6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMS4yMDI2
IDE3OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gU29tZSByZXdvcmsgb2YgdGhlIGJs
a2JhY2sgc3RhdGljcyBkYXRhIGhhbmRsaW5nLg0KPj4NCj4+IEp1ZXJnZW4gR3Jvc3MgKDMp
Og0KPj4gICAgeGVuLWJsa2JhY2s6IFJlbW92ZSBzdGF0aXN0aWNzIGxvZ2dpbmcgb24gY29u
c29sZQ0KPj4gICAgeGVuLWJsa2JhY2s6IG1vdmUgc3RhdGlzdGljcyBkYXRhIGludG8gc3Vi
LXN0cnVjdHVyZQ0KPj4gICAgeGVuLWJsa2JhY2s6IG1ha2Ugc3RhdGlzdGljcyBkYXRhIHBl
cnNpc3RlbnQgYWNyb3NzIGRpc2Nvbm5lY3QvY29ubmVjdA0KPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4gSW4gdGhlIGxh
c3QgcGF0Y2ggYSBicmllZiBjb21tZW50IG9uIHRoZSBnbG9iYWwgc3RhdHMgaW5zdGFuY2Ug
bWF5IGJlDQo+IHdvcnRoLCB0byBpbmRpY2F0ZSBpdCdzIGd1YXJkZWQgYnkgdGhlIHJpbmdz
IGxvY2suDQo+IA0KPiBBbHNvLCBkbyBJIG1heWJlIGdldCBhIFJlcG9ydGVkLWJ5OiBvbiB0
aGUgbGFzdCBwYXRjaD8NClllcyB0byBib3RoLiA6LSkNCg0KDQpKdWVyZ2VuDQo=

--------------znQNYWv2cH6gyTbCeqXfd0fm--

--------------XnKNkkfJknfgjGY9Ag00BvNt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr1ZGEFAwAAAAAACgkQsN6d1ii/Ey+j
5Qf/VkOKnOQT0F4EOFuBzac7B3dirk00TyTViv89zfyTCzNWvQ1NhWRd612k2Xgs3lS/oMFgAlZt
8xcOpUaNnM+ubudMuiHRsf94cKCdh2EubF04ANK9kn012eDseJjkCweKmxjVDDoPM/A1BVSwq5yQ
aTE8k+xGcOzKNYrGHwaFiC1C/jsIcw4DN+CCV/vPDL0iIkhFP0qWbOE8d7kQ0czpFzwJBXAI6LBQ
r/PKwaH/JwSwwW28ipAGIYNwTdlJWfsu18dP/C3j/A4UOiFGDFTWlFq31EaSvZkKmMSl+tQ2LHse
EX30z7qV/A7ZAEiQet8JXCQ9qtLsznVIwO+Q8Zn1JQ==
=hvYA
-----END PGP SIGNATURE-----

--------------XnKNkkfJknfgjGY9Ag00BvNt--

