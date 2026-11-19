Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4236606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ymx3PoKT
Received: from list by lists.xenproject.org with outflank-mailman.1496258.1694900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0xH-0002s6-P2; Thu, 19 Nov 2026 12:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496258.1694900; Thu, 19 Nov 2026 12:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0xH-0002rz-LZ; Thu, 19 Nov 2026 12:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1496258;
 Thu, 19 Nov 2026 12:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xU0xG-0002rt-Ak
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0xF-00BbJy-9P
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:09:29 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6afee6ef-2eae-0a2a0a5409dd-0a2a4503de08-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:09:29 +0100
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6afee6f8-fae8-0a2a45030019-d155da35f135-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:09:28 +0100
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c511cdd5a82so210208566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:09:28 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5123420ed4sm99692966b.44.2026.11.19.04.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 04:09:27 -0800 (PST)
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
        d=suse.com; s=google; t=1795090168; x=1795694968; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkaq8WbLIO1Ar3lUNzd1NppKuUYHgaRigxUBoBe/biY=;
        b=Ymx3PoKTArf/ta47xHaAX+kmyKQ04EnuJxOpteyI7XsrcWfnnHHitYVUZAqsRnd+7T
         qFAgXKIre90rJKG3+0BPG2c+sI7dCsRoRvWO1f2Z8q0Sa508k9FUt+S6lge6bJO/PVXS
         H6jHMxhTObmBlbWX5XNiNE0haWSMv2dHKTgTTXR3upQRb19Or6BBuycixSdkhc13hOBq
         jErE+bz9MJ7PgmOliz/JfUl3rVfqp3AoVJMyjv2PIJ2XzEyx73cD39y1CRclSMGjcf/9
         rDBY6bYWunZtt+37c8sG2nmZ/Fn+ae0NljQxskOmzC3e1ufUsWtp9+BTbwJpMrlpr39q
         JajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090168; x=1795694968;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkaq8WbLIO1Ar3lUNzd1NppKuUYHgaRigxUBoBe/biY=;
        b=V+crvxf88DPplaAwiXEp5AVuLTqayNYrQe9p2tinJA9UwTjgwIbnrXyv8oixbFg+RQ
         lWqJUSUCyxsMqHx5TI/jSoFWs29mjME8l4DXqTlt3ofnKbwFsjV/zQc2vYuupcyWHA76
         YHnFHqYkf3ZeGcrX+mdn79nZkfVnDfWZC2MvG4OTfHjpjIG4DUGO2rZWFOWAEYhn+9u4
         taR00sgu7+1Wms82WG5dDxShT9PQcVok1EHZ4ae/c72JLAjxpKtkQYaZTb6w9sNdGrTr
         FXP0R4foDRHZBEn0M8i4tOhPMCa9yk1muue3/imFXdGF/Rhm8bArv2ZO9E5vRoEOlTv4
         kONw==
X-Forwarded-Encrypted: i=1; AL+hErFh6SYLR6FssgqSL8GuIQ51nn4T9LWrdZQnrkr99fCkE54Cg2xjLGeq/eSmtNt1gSeVia47RcGw0mE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8zPWT3S0C+RuvX3SbqPQcgLP5xiNm77q30zOsOcHiYlyvGwJnG
	s+wgLc06WTV1n0ABYW+enVhczJf9iIcPbQtnBUX02975DncNYU36NC28EC77i060tW4=
X-Gm-Gg: AYBFou34dCsB3RN+VFTQhcj9GoxglLxmLJ5K7kJvHtzlaZHdRL1g8sc48eGGOZ3qmZn
	7uLhXLdl00o3kxQF9oJkDqEMaxZ3K7Vg/doopKxBbnADAUr3hQ49fE2SrFX/s6AgpBc0MiseWFy
	NHtkCzWhbfzM+pS9+rKT7TrA8pzne2m7IOAhkGchFquGVuBjEYHBT5+BZrUKsZXwRDpxHYcn++c
	JJH6zQQ377XvgUmeZy2CXl5a+md0LdlnFhCkHDS3PCc/d1KLD+fuaKTDBRtRm5ApAq64tcQ6QP2
	HR9ALXn4W0aJzsLsq3HS6/gFmetO0b0ETikP2I4Y7kBQkoql9k0Ok4USfokoCfHLtGNuY0YDhjE
	sPAEzJT2pH4fVgGAkOaGFd7yLv40LIKRXec9M643BC7mn2qTxLHgrEUIaneVTn+FCtL5kENtXNm
	WQmqrrLA15vRm5CLUqn6Y1Nc7RDuU9rMJyjlGpxvbSYTIRyEDd8FU3EYi1t5IRIn7S4akAxbWGs
	VScCmsgCejshDMuMGEPRYpKtA7/YQkEVtL6+DZhtlztkppWTaf1bQ1dm7JymVvFyztwbHx0jZeN
	0IYJlyY3uAKbRlRTM461Fb2RwdS6F+sXecSMJPMGcQB5EEpD9UvvYHDCKuRGANZ1OGYEFNkV3Ao
	wCku4HHngXfNgsNDp2TM1H3xvRIb+afHU86+G/e1OYq7fWFrdky/DbrVpbShdPeu83n9XCa0b
X-Received: by 2002:a17:907:948e:b0:c4c:eb17:3da with SMTP id a640c23a62f3a-c510e32c1aamr520821766b.22.1795090168209;
        Thu, 19 Nov 2026 04:09:28 -0800 (PST)
Message-ID: <518d2467-c459-4b17-8ab8-314372d5417b@suse.com>
Date: Thu, 19 Nov 2026 13:09:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykola Kvach <Mykola_Kvach@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com> <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
 <CAGeoDV_RtFiEYueRggVe0h-_0V2jXr_WSCYBoUm9a8oFv5TurA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_RtFiEYueRggVe0h-_0V2jXr_WSCYBoUm9a8oFv5TurA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LBhac3Ly0O3sZKEhBPJHJc1P"
X-purgate-ID: tlsNG-33051d/1795090168-6CADC4E9-A7BB92EE/35/110847
X-purgate-type: clean
X-purgate-size: 6152
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LBhac3Ly0O3sZKEhBPJHJc1P
Content-Type: multipart/mixed; boundary="------------5bFwWujIjPDwijYpYJR7E6Wj";
 protected-headers="v1"; hp="clear"
Message-ID: <518d2467-c459-4b17-8ab8-314372d5417b@suse.com>
Date: Thu, 19 Nov 2026 13:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykola Kvach <Mykola_Kvach@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com> <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
 <CAGeoDV_RtFiEYueRggVe0h-_0V2jXr_WSCYBoUm9a8oFv5TurA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_RtFiEYueRggVe0h-_0V2jXr_WSCYBoUm9a8oFv5TurA@mail.gmail.com>

--------------5bFwWujIjPDwijYpYJR7E6Wj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMTI6NTksIE15a29sYSBLdmFjaCB3cm90ZToNCj4gSGkgSsO8cmdlbiwN
Cj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIFRodSwgTm92IDE5
LCAyMDI2IGF0IDE6MzLigK9QTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOg0KPj4NCj4+IE9uIDE4LjExLjI2IDAyOjUxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IENDJ2VkIEp1ZXJnZW4sIGJlY2F1c2UgSSBoYXZlIGEg
cXVlc3Rpb24gYWJvdXQgY3B1cG9vbHMuDQo+Pj4NCj4+PiBNeWtvbGEgS3ZhY2ggPE15a29s
YV9LdmFjaEBlcGFtLmNvbT4gd3JpdGVzOg0KPj4+DQo+Pj4+IFdoZW4gYSBDUFUgZmFpbHMg
dG8gY29tZSBiYWNrIGR1cmluZyBzeXN0ZW0gcmVzdW1lLCBjcHVfdXAoKSBzZW5kcw0KPj4+
PiBDUFVfVVBfQ0FOQ0VMRUQuIEFmdGVyIHRyeWluZyB0aGUgb3RoZXIgQ1BVcywgZW5hYmxl
X25vbmJvb3RfY3B1cygpDQo+Pj4+IHNlbmRzIENQVV9SRVNVTUVfRkFJTEVEIGZvciB0aGUg
c2FtZSBDUFUuDQo+Pj4+DQo+Pj4+IE9uIGFyY2hpdGVjdHVyZXMgd2hpY2ggZG8gbm90IHBh
cmsgb2ZmbGluZSBDUFVzLCBib3RoIG5vdGlmaWNhdGlvbnMNCj4+Pj4gcXVldWUgZnJlZV9w
ZXJjcHVfYXJlYSgpLiBUaGUgcmVsZWFzZSBtZXRhZGF0YSwgaW5jbHVkaW5nIHRoZSByY3Vf
aGVhZCwNCj4+Pj4gaXMgc3RvcmVkIGluIHRoYXQgQ1BVJ3MgcGVyLUNQVSBhcmVhLiBUaGUg
Zmlyc3QgY2FsbGJhY2sgbWF5IGFscmVhZHkNCj4+Pj4gaGF2ZSBmcmVlZCB0aGUgYXJlYSB3
aGVuIHRoZSBzZWNvbmQgbm90aWZpY2F0aW9uIGFycml2ZXMsIG9yIHRoZSBzYW1lDQo+Pj4+
IHJjdV9oZWFkIG1heSBiZSBxdWV1ZWQgdHdpY2UuIFRoZSBDUFVfUkVTVU1FX0ZBSUxFRCBj
YWxsYmFja3MgYWxzbyBuZWVkDQo+Pj4+IHRoZSBhcmVhIHRvIGNsZWFuIHVwIHRpbWVycyBh
bmQgQ1BVLXBvb2wgc3RhdGUuDQo+Pg0KPj4gSSBkb24ndCBzZWUgd2h5IENQVV9SRVNVTUVf
RkFJTEVEIHdvdWxkIGZyZWUgcGVyY3B1IGRhdGEgdHdpY2UuDQo+PiBFdmVuIENQVV9VUF9D
QU5DRUxFRCBkdXJpbmcgcmVzdW1pbmcgc2hvdWxkbid0IGNhdXNlIGEgZnJlZSBvZiBwZXJj
cHUNCj4+IGRhdGEuDQo+Pg0KPj4gV2hlbiBDUFVfUkVTVU1FX0ZBSUxFRCBpcyBzaWduYWxl
ZCwgc3lzdGVtX3N0YXRlIHNob3VsZCBzdGlsbCBiZQ0KPj4gU1lTX1NUQVRFX3N1c3BlbmQu
IE9yIGFtIEkgb3Zlcmxvb2tpbmcgc29tZXRoaW5nIGhlcmU/DQo+IA0KPiBCeSB0aGUgdGlt
ZSBlbmFibGVfbm9uYm9vdF9jcHVzKCkgcnVucywgc3lzdGVtX3N0YXRlIGlzIGFscmVhZHkN
Cj4gU1lTX1NUQVRFX3Jlc3VtZS4gQm90aCBlbnRlcl9zdGF0ZSgpIG9uIHg4NiBhbmQgc3lz
dGVtX3N1c3BlbmQoKSBpbg0KPiBBcm0gcGF0Y2ggMTUvMTUgc2V0IGl0IGJlZm9yZSB0aGF0
IGNhbGwuDQoNCkFoLCB5ZXMsIF90aGF0XyBJIHdhcyBvdmVybG9va2luZy4NCg0KDQpKdWVy
Z2VuDQo=

--------------5bFwWujIjPDwijYpYJR7E6Wj--

--------------LBhac3Ly0O3sZKEhBPJHJc1P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr+5vcFAwAAAAAACgkQsN6d1ii/Ey/e
hwf/f9fe0sETp87N7ViWJ1WXbDMjEoA4DHIR7epU576trNT62Yo88mHvxaDtPLK0v91vdfG47WdS
p4jyXZfOxpBUa/15WLfJKK0fQcPwhPvMDVeWqZUub2R2RDpy8I/jrHKBxzsAj7u6/kleUPwGeBb8
Qm1llhGAbKYD81Bye3CCgUA9PnQMdrGLf3mCdojxxAzKAOxXo4HVEAAYC/tMS4KUdI2pyem8Dene
1wYe57Xhm905lrvVLjvKhq4sXioQia0C3lUa8PIrfMTDi7ABbifJ4EZ6eHA4ZJ5CgPzM27NEtRfs
Cj+8zXyrXZ687xo9QFmtNlobvwBpTpYnLTrZK9D8QA==
=rQGA
-----END PGP SIGNATURE-----

--------------LBhac3Ly0O3sZKEhBPJHJc1P--

