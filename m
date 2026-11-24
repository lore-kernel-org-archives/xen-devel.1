Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F060A2609
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T+3vKTAr
Received: from list by lists.xenproject.org with outflank-mailman.1501091.1697160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrAw-0007KQ-I3; Tue, 24 Nov 2026 14:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501091.1697160; Tue, 24 Nov 2026 14:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrAw-0007KJ-EN; Tue, 24 Nov 2026 14:07:14 +0000
Received: by outflank-mailman (input) for mailman id 1501091;
 Tue, 24 Nov 2026 14:07:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xVrAu-0007HE-PI
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:07:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVrAu-00GebH-5O
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:07:12 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b059a10-e002-0a2a0a5209dd-0a2a4504e746-0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:07:12 +0100
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b059a0f-b57f-0a2a45040019-d155da2db0f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:07:11 +0100
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c4d2b741ed9so740776666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:07:11 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afe01a0sm525452066b.68.2026.11.24.06.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 06:07:11 -0800 (PST)
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
        d=suse.com; s=google; t=1795529231; x=1796134031; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sgZu57YxOTl0zoXlXzQ5APmfEtF1ApqgxM4s40GuVlo=;
        b=T+3vKTArLo0oeYAgyx/k8ak8GtuoOPYseE7EBICJFY3+XdId9OrMUrHBkQW3vyxJQz
         ptmyWKsBqJ/QymljMwIn9cUIEBpwk8AO668gN7CD5M66McPNhugOdlKaitZT4aS2QRZ4
         vmS19BivvenvWvXl6GNX7NIg93wlIlnoBCC9wWZldpXP8ItnyoHjgcTPsZwFEsq5VHGv
         di93GX0k9t7CEhZ81RBtGne7Ur1aIxQAhYQZyA59r+t2IPO1zyshKxllhZLAw3vddmq8
         rJBDwwnNOGxfApXmIfAMScHzqhli/ReqQUK5YBqnzYxlVZnl29esfrvKVdtkvGYKGZtw
         /I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529231; x=1796134031;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgZu57YxOTl0zoXlXzQ5APmfEtF1ApqgxM4s40GuVlo=;
        b=JfrUMsS5gUDXDoUXNvWxDgBfxzECaLx0/YArknoKOFanV9Puoz8FaiFjKs2DccGtxu
         1pRQxNsPTrjCOieWeJa505CkqjoJ7bAYRd28UvbhYKlDweBX4e6iUd5MIVb9qJ6YjsUy
         sdRDLIlXlOYpH2HxMSz6GURlivRz3P1ThyG9ukSfgsQ8Cqzqeenx+JTqkLGE4dOPnUZM
         W2PUt61eK99z2aJZHgXnN6xX0C8ijFSZXIp+NhnvhPKD0irvcQOCgmbPdCMVYRQ8tNhf
         7xhA8unWIkH4rjffWGLo0SEwIcoVcAMKVaM1yWB88mu+DLAW9aVXrMdMMzsGyeXr0wxw
         y8eA==
X-Forwarded-Encrypted: i=1; AL+hErGwe99B8ydwGEqXPiFwNUxEfCv9I6mdmNfE1Fyvh676kWvqezKCarksf2LqsueX54/1V4K43pkjh6M=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+8uKxtDBqWrkSlyiOMFtlOHNzb9/d4CR3OyMeHaG78lkIg1R5E
	YGgFI1NeQ5PTg9BBpML7ApuBQP+dpWBriSQIkT5SRoKoMObY2XbTgKwXfnOS6EQfe1Q=
X-Gm-Gg: AZFdTZfITrtstBBf/1vMB0H1bY1f65gkJBC3kxlBB2i79/tcprygPnPyZjqE3Cz00ts
	/HTvB1Uqbb+mjw6LsglqLUaosOIX2zKt68emrBGb7Te2BK4Sr18d7Tacb/zLVIQsnY/SKt5oyNX
	e5a9yoEjba50LqtUgsx06+hzbLDNyKapGf2IUkKHIcjrRdNtvY9TZ4FCrQlVu24SOFeSYa/MgBH
	Md5jbUObAYaVBlB1Q35dkLivDTQUAYHKLHZ9bWRk99qL6XbrioGPk5gzBXTPTlzP4i14hrx36EY
	gmQL2yglyfwTeefl5gX/Lm4lqg9FP0p+F5qY0TyBtGNXdq3U4YiFCPiRlURNQCQ/ba46dhOZjLu
	lThKhe1fsA7EULjTBWDmeoxqH42RVJNYm6EhzR10nOZBDXBEOAmOBHcS5VTUxcA0XOE7BndUa7H
	pNfX/aA0IAC/JEImNcwHTdB6Lock3fPZgffsT7NIIicetO9TjN74/CRykqUkr+NmbbfVmQWDbSi
	4e4ce6Q+WeQGQy8FeIunuNa35kF8bCB5h36gCYYUmLCAFWM7BzzlT56vXOe2y9YXsrzcqVNyrS0
	w8BJXpUAY2yaJoSLdulr8LBD8CHiReR3XRRds5Udgu+kpjxTlHdk7kPOTzadSyj+3nISkB+vMm2
	h5LEwnEQWWFZaPBs+oRr1JtXT81BIdj+19mwmdxWb0zk1JqmgvmA=
X-Received: by 2002:a17:906:6bc9:b0:c46:ca3a:10d5 with SMTP id a640c23a62f3a-c513aad1846mr814527366b.45.1795529231350;
        Tue, 24 Nov 2026 06:07:11 -0800 (PST)
Message-ID: <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
Date: Tue, 24 Nov 2026 15:07:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
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
In-Reply-To: <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s9Pg0fOCNhqZZPqNGeiABuAR"
X-purgate-ID: tlsNG-ebf023/1795529232-528C9B50-106216F8/35/110847
X-purgate-type: clean
X-purgate-size: 7583
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s9Pg0fOCNhqZZPqNGeiABuAR
Content-Type: multipart/mixed; boundary="------------AL3ZZyzUWinTkqjCriLd7J50";
 protected-headers="v1"; hp="clear"
Message-ID: <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
Date: Tue, 24 Nov 2026 15:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
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
In-Reply-To: <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>

--------------AL3ZZyzUWinTkqjCriLd7J50
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI2
IDEzOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSWYgYSBkeWluZyBkb21haW4gaGFz
IG5vdCBhbGwgb2YgaXRzIHZjcHVzIGZpbGxlZCBhbmQgaXQgaXMgbW92ZWQgZnJvbQ0KPj4g
YSBjcHVwb29sIHdpdGggZ3Jhbj1zb2NrZXQgdG8gb25lIHdpdGggZ3Jhbj1jb3JlLA0KPiAN
Cj4gV2h5IHdvdWxkIGEgZHlpbmcgZG9tYWluIG5lZWQgbW92aW5nIGluIHRoaXMgd2F5IGlu
IHRoZSBmaXJzdCBwbGFjZT8NCg0KVGhpcyBpcyBmb3IgYXZvaWRpbmcgYSB6b21iaWUgZG9t
YWluIGJsb2NraW5nIHJlbW92YWwgb2YgYSBjcHVwb29sLg0KDQo+IFBvc3NpYmx5IGNvbm5l
Y3RlZCB0byB0aGlzLCAuLi4NCj4gDQo+PiBpdCBtaWdodCBoYXBwZW4gdGhhdA0KPj4gZHVy
aW5nIGFzc2lnbm1lbnQgb2YgdGhlIG5ldyB1bml0cyB0byB0aGUgdmNwdXMgYSBOVUxMIHBv
aW50ZXIgaXMNCj4+IGJlaW5nIGRlcmVmZXJlbmNlZDoNCj4+DQo+PiAtIHN5c3RlbSBoYXMg
MiBzb2NrZXRzIHdpdGggMiBjb3JlcyBlYWNoLCBlYWNoIGNvcmUgaGFzIDIgdGhyZWFkcw0K
Pj4gLSBQb29sLTAgaGFzIGdyYW49Y29yZSwgb3RoZXIgY3B1cG9vbCBoYXMgZ3Jhbj1zb2Nr
ZXQNCj4+IC0gZG9tYWluIHdpdGggbWF4X3ZjcHVzPTQgaGFzIG9ubHkgMyB2Y3B1cyBhbmQg
aXMgaW4gY3B1cG9vbCB3aXRoDQo+PiAgICBncmFuPXNvY2tldA0KPj4gLSBkb21haW4gaXMg
ZHlpbmcgYW5kIGlzIG1vdmVkIHRvIFBvb2wtMA0KPj4gLSBpbiBzY2hlZF9tb3ZlX2RvbWFp
bigpIHRoaXMgcmVzdWx0cyBpbiB2Y3B1X2ZhaWxlZCBiZWluZyBzZXQgdG8NCj4+ICAgIHRy
dWUgZm9yIHRoZSBsYXN0IHVuaXQgb2YgdGhlIGRvbWFpbiwgcmVzdWx0aW5nIGluIHRoZSB1
bml0IG5vdA0KPj4gICAgYmVpbmcgYWxsb2NhdGVkICgiY29udGludWUiIHN0YXRlbWVudCBp
cyBiZWluZyBoaXQpDQo+PiAtIGluIHRoZSBmb3JfZWFjaF92Y3B1KCkgbG9vcCBvZiBzY2hl
ZF9tb3ZlX2RvbWFpbigpIGZvciB2Y3B1IDINCj4+ICAgIHRoZSB1bml0IHBvaW50ZXIgd2ls
bCBiZSBzZXQgdG8gTlVMTCwgYXMgdW5pdC0+bmV4dF9pbl9saXN0IGlzIG5vdA0KPj4gICAg
cG9wdWxhdGVkIGR1ZSB0byBhYm92ZSAiY29udGludWUiDQo+Pg0KPj4gRml4ZXM6IDQ4MzVj
MDc4ZTVjZiAoInhlbi9zY2hlZDogY29yZTogc2tpcCBtaXNzaW5nIHZjcHUgc2xvdHMgaW4g
c2NoZWRfbW92ZV9kb21haW4oKSIpDQo+PiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMgfCAxMSArKysrKysrLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBpbmRleCAxMGI2ZWVj
Y2NkLi5lZTcwNzdiODcwIDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtODMwLDEwICs4
MzAsMTMgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBjcHVwb29sICpjKQ0KPj4gICAgICAgICAgIGlmICggdW5pdC0+dW5pdF9pZCArIGdyYW4g
PT0gdi0+dmNwdV9pZCApDQo+PiAgICAgICAgICAgICAgIHVuaXQgPSB1bml0LT5uZXh0X2lu
X2xpc3Q7DQo+PiAgIA0KPj4gLSAgICAgICAgdW5pdC0+c3RhdGVfZW50cnlfdGltZSA9IG9s
ZF91bml0LT5zdGF0ZV9lbnRyeV90aW1lOw0KPj4gLSAgICAgICAgdW5pdC0+cnVuc3RhdGVf
Y250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOw0KPj4gLSAgICAgICAgLyogVGVtcG9yYXJpbHkg
dXNlIG9sZCByZXNvdXJjZSBhc3NpZ25tZW50ICovDQo+PiAtICAgICAgICB1bml0LT5yZXMg
PSBnZXRfc2NoZWRfcmVzKG5ld19jcHUpOw0KPj4gKyAgICAgICAgaWYgKCB1bml0ICkNCj4+
ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB1bml0LT5zdGF0ZV9lbnRyeV90aW1lID0g
b2xkX3VuaXQtPnN0YXRlX2VudHJ5X3RpbWU7DQo+PiArICAgICAgICAgICAgdW5pdC0+cnVu
c3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOw0KPj4gKyAgICAgICAgICAgIC8qIFRl
bXBvcmFyaWx5IHVzZSBvbGQgcmVzb3VyY2UgYXNzaWdubWVudCAqLw0KPj4gKyAgICAgICAg
ICAgIHVuaXQtPnJlcyA9IGdldF9zY2hlZF9yZXMobmV3X2NwdSk7DQo+PiArICAgICAgICB9
DQo+PiAgIA0KPj4gICAgICAgICAgIHYtPnNjaGVkX3VuaXQgPSB1bml0Ow0KPiANCj4gLi4u
IGlzIHRoaXMgZmllbGQgYmVjb21pbmcgTlVMTCByZWFsbHkgb2theT8gUGVyaGFwcyBqdXN0
IGZvciBkeWluZyBkb21haW5zDQo+IGl0IGlzLCBidXQgdGhlbiB0aGUgb3JpZ2luYWwgcXVl
c3Rpb24gcmVtYWlucyB3aHkgdGhleSB3b3VsZCBuZWVkIG1vdmluZyBpbg0KPiB0aGUgZmly
c3QgcGxhY2UuDQoNCk5vdCBzZXR0aW5nIGl0IHdvdWxkIGxlYXZlIGEgcG90ZW50aWFsIFVB
RiwgYXMgdGhlIG9sZCB1bml0IHdpbGwgYmUgZnJlZWQuDQoNCj4gRnVydGhlciwgaWYgdGhp
cyBpcyB0byBjb3ZlciBkeWluZyBkb21haW5zLCBtaWdodCB0aGUgaWYoKSBub3QgYmV0dGVy
IGNoZWNrDQo+IGV4YWN0bHkgdGhhdCwgd2l0aCAobWF5YmUpIGFuIEFTU0VSVCh1bml0KSBp
biBpdHMgYm9keT8NCg0KSG1tLCBub3Qgc3VyZS4gVGhlIEFTU0VSVCgpIGlzIG5vdCBuZWVk
ZWQgSU1ITywgYXMgaXQganVzdCBjaGFuZ2VzIHRoZQ0KcmVhc29uIG9mIHRoZSBjcmFzaC4N
Cg0KDQpKdWVyZ2VuDQoNCg==

--------------AL3ZZyzUWinTkqjCriLd7J50--

--------------s9Pg0fOCNhqZZPqNGeiABuAR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFmg4FAwAAAAAACgkQsN6d1ii/Ey/P
hgf/YnVUPCOJ6BTk7ps7LtuCi9raGKc6W8PY8/iZpkXxdecwjzFUXYQY0gkfNzLbhzODkaBgYMTH
Qc9bDusJQmGkEUcCLaQyxEImPDvvv1mz/sN/CjBWgxbkPnI4dJiWhutDYagE0dDa+P6S5Iz5NSnf
ju+cnz/jE2wWaynG0emQ/jS7vSITe85boVChTUMD9IbpN078n6TXZzYPkVdcCQyooEEF8yohFaAw
BAJN6ipKXSfjvzYD3EgwcCMGdg4Xo70/7gcn3uWkY2D0RL28uFw9ICUuSWmQoTfb12+Om1Wxa1Up
Ulsw+JwPutfNDk4J1ot0dT1can40sSSExJgsNlYlqw==
=UmOM
-----END PGP SIGNATURE-----

--------------s9Pg0fOCNhqZZPqNGeiABuAR--

