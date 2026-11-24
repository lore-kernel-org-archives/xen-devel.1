Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CECF606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=czLOETgu
Received: from list by lists.xenproject.org with outflank-mailman.1501172.1697209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVs5K-000488-Km; Tue, 24 Nov 2026 15:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501172.1697209; Tue, 24 Nov 2026 15:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVs5K-000481-HM; Tue, 24 Nov 2026 15:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1501172;
 Tue, 24 Nov 2026 15:05:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xVs5J-00047v-Ms
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:05:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVs5I-002FX9-Bx
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:05:28 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b05a7ae-e002-0a2a0a5209dd-0a2a4508ed26-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 16:05:28 +0100
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b05a7b8-f659-0a2a45080019-d155da29e5ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 16:05:28 +0100
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c4395d31228so788435966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:05:28 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae6780esm540838566b.17.2026.11.24.07.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 07:05:27 -0800 (PST)
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
        d=suse.com; s=google; t=1795532728; x=1796137528; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0Sni2BtzqzEoU6YNfpUsUo9KZJ+mUuKuT6qv7Ad49A=;
        b=czLOETguFWz94nSchMfKgQBEWUw4d6jko5tgt7v0V0xfk28r1AfAymFX6Wc4s3tKiH
         qhaPJLoazHH+73d6RQSZck/XhWITsY136c5gq9Y5ltd2rf8t/bfCFovsrTThA1VLj65o
         8/IdhqugQxOOwXZg8JW9BsWLqBwGSpm0XWZUzTwUU+v3zhK7mGq+7PP8Vtt3f8MbfnWY
         B4HBnru/l8OkZ86UeG3HZh2STd581uRsHvV9xX1XoYBGx6DHi4u3JsfX2QeBO1ktNlXN
         T/ILfTuDj6BgYxkl6U4nAmBbAVBhnNxnGLPjDFbIiiHPUN1ViU3EwzgTQ2OBlC/bsa35
         OJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532728; x=1796137528;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0Sni2BtzqzEoU6YNfpUsUo9KZJ+mUuKuT6qv7Ad49A=;
        b=cTSEo7jhbcEtCeDTKpV4P4qsX+GiuJqJYtzKmWnrliW4ZcVnxtp+ltsMMrG6Jzvw59
         ++NCy1Sm9KfNMZELlgpFSQ6lj9KBSGiRr6OcrV2ACZwZeMM5Asn/5ufHkh36wkf4jQCQ
         82lPNvcN31Uk+/DrpYKZj2XKneXJJ5AxBowdw74M4xpXkkPKhPh8q2E+7HKbA1i6pWAC
         c1g+FxikLFtJ8DdL7eh7mVLfczSM1YNLkDZ9WBIdi3R09MBD2wdHgPRsj3rURk4PYQE8
         s+Rf7LI+L5J+t0KbZ632RlDsPiLOA1YntDLFK0S90ne+zUZ0TJCUIz/my2zIFLrbuNXf
         JetQ==
X-Forwarded-Encrypted: i=1; AL+hErHTojFMfS0DI5ukVjfm1yFkXZkAHdoFtxeCG/UrEE0O1S7Uq1/+NtnPNcyZ+4v4fROHul1g8NFwY5s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9qsDZiBHGCiuMPJ4/KDCfR8Kcy2zs+j8hGALry/DRt4nSNy+nZ
	ebWET2LDwQyaF6n2WnGj3+z0hN4bFaN6R5YyHEMaHuVfrlAydMqRtS/qxhwukB1S550=
X-Gm-Gg: AZFdTZdvFD5obEEddnlqIhPaDOlzrs12L3lehYYBRAr58Wl8tiQ/1CC2PkdG/esj1f1
	6I/cPyne9Mq4+nGXpGBZrMMJbuWkgVXGWyvqVWCTLZuVgnaxJlXxol25ZZB1IiydAVSB34wAZU+
	y6w2JRZhMwdUp0QOayLNhrqFMPwxaRF7EUkuWFuwYh/g7sijyOpZLJZyVZ2pr4TFzJj/m6DckXN
	9/Ecry8h/wMJ9ji6EDDL7otGytQAO9IRA6j7sApHBW80Ru45r8B7yZMQMUerhjiVlvppxTbp9lr
	gzwZI86XVWpzROjk40vRhb7kVwdo/ciSo7tdTiLrBWT/GPiyYiEgo7Hm0MCy/W+6U9P7nfKN04p
	uBOcqnODazLlUBpxzb5bL5FmUYPHeNdmjrwfjLj116L4S5ENYg9y2ZhiPTvkperC5SWuuO8jY1j
	x+DaTeZZSOpUn3jUtsgJQ1yxZyT+RssJndFGY2Jg5UX74To/Pi2K3WPXoZfanx2ihvHpRdZgPl2
	QP6yUsF9HV4AbMSWpqPUqX7ni/RqDF2Z7a+56dTPZJIutoFsBdZxLFmLQmbqVgNtspDuZTlZd2W
	HmAG/TIj2450KOIiLi2lOsb/Jjk/IGFnbID+vmMVAe1wdGnLkE/ijnnIErnMWtQ1b81FjSdIHyY
	2jwWHBoA3fZOUN+Hv5khrvans9UmYyjCgeehGXjz+7ahT5m/Pjyh8tfEWeo74vrLE37e7FprR
X-Received: by 2002:a17:906:a408:b0:c50:ac4e:3770 with SMTP id a640c23a62f3a-c513a99eb83mr1015207766b.34.1795532727599;
        Tue, 24 Nov 2026 07:05:27 -0800 (PST)
Message-ID: <9ce473fa-8e79-4fae-8e2e-7db09304401f@suse.com>
Date: Tue, 24 Nov 2026 16:05:26 +0100
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
 <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
 <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>
 <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
 <fdb46c25-f30b-4c4d-8d34-794b3249be7a@suse.com>
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
In-Reply-To: <fdb46c25-f30b-4c4d-8d34-794b3249be7a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lRyfXZX0NIqS4DtrSC2R8Ajk"
X-purgate-ID: tlsNG-c1860d/1795532728-D534D87B-107340F1/35/110847
X-purgate-type: clean
X-purgate-size: 7733
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lRyfXZX0NIqS4DtrSC2R8Ajk
Content-Type: multipart/mixed; boundary="------------UyaKPFb7kBGH80WdAxP0uXNh";
 protected-headers="v1"; hp="clear"
Message-ID: <9ce473fa-8e79-4fae-8e2e-7db09304401f@suse.com>
Date: Tue, 24 Nov 2026 16:05:26 +0100
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
 <01f14efb-5c70-40a3-b362-66c99d2c699d@suse.com>
 <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>
 <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
 <fdb46c25-f30b-4c4d-8d34-794b3249be7a@suse.com>
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
In-Reply-To: <fdb46c25-f30b-4c4d-8d34-794b3249be7a@suse.com>

--------------UyaKPFb7kBGH80WdAxP0uXNh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTU6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI2
IDE1OjQ1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjQuMTEuMjYgMTU6MzcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjExLjIwMjYgMTU6MDcsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDI0LjExLjI2IDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDI0LjExLjIwMjYgMTM6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gSWYgYSBkeWluZyBkb21haW4gaGFzIG5vdCBhbGwgb2YgaXRzIHZjcHVzIGZpbGxlZCBh
bmQgaXQgaXMgbW92ZWQgZnJvbQ0KPj4+Pj4+IGEgY3B1cG9vbCB3aXRoIGdyYW49c29ja2V0
IHRvIG9uZSB3aXRoIGdyYW49Y29yZSwNCj4+Pj4+DQo+Pj4+PiBXaHkgd291bGQgYSBkeWlu
ZyBkb21haW4gbmVlZCBtb3ZpbmcgaW4gdGhpcyB3YXkgaW4gdGhlIGZpcnN0IHBsYWNlPw0K
Pj4+Pg0KPj4+PiBUaGlzIGlzIGZvciBhdm9pZGluZyBhIHpvbWJpZSBkb21haW4gYmxvY2tp
bmcgcmVtb3ZhbCBvZiBhIGNwdXBvb2wuDQo+Pj4NCj4+PiBBaCwgSSBzZWUuIE1heWJlIHNh
eSAiem9tYmllIiB0aGVuIGluIHBsYWNlIG9mIGp1c3QgImR5aW5nIj8NCj4+DQo+PiBCdXQg
dGhlIG1vdmluZyBpcyBkb25lIGZvciBhbGwgZHlpbmcgZG9tYWlucyBhcyBwYXJ0IG9mIHRo
ZSBkb21haW4ncyBkZXN0cm95DQo+PiBwcm9jZXNzLg0KPiANCj4gVGhlbiBJIGd1ZXNzIEkn
bSBsb3N0LiBJdCdzIGhhcmQgdG8gc2VlIHdoeSBmb3Igc29tZXRoaW5nIHdoaWNoIGlzIHRv
IGdvDQo+IGF3YXkgYSBjb21wbGV4IG9wZXJhdGlvbiBuZWVkcyBkb2luZywgYWx3YXlzLg0K
PiANCj4+Pj4+IFBvc3NpYmx5IGNvbm5lY3RlZCB0byB0aGlzLCAuLi4NCj4+Pj4+DQo+Pj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+Pj4+PiArKysgYi94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYw0KPj4+Pj4+IEBAIC04MzAsMTAgKzgzMCwxMyBAQCBpbnQgc2No
ZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpDQo+
Pj4+Pj4gICAgICAgICAgICAgaWYgKCB1bml0LT51bml0X2lkICsgZ3JhbiA9PSB2LT52Y3B1
X2lkICkNCj4+Pj4+PiAgICAgICAgICAgICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlz
dDsNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gLSAgICAgICAgdW5pdC0+c3RhdGVfZW50cnlfdGlt
ZSA9IG9sZF91bml0LT5zdGF0ZV9lbnRyeV90aW1lOw0KPj4+Pj4+IC0gICAgICAgIHVuaXQt
PnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0rKzsNCj4+Pj4+PiAtICAgICAgICAv
KiBUZW1wb3JhcmlseSB1c2Ugb2xkIHJlc291cmNlIGFzc2lnbm1lbnQgKi8NCj4+Pj4+PiAt
ICAgICAgICB1bml0LT5yZXMgPSBnZXRfc2NoZWRfcmVzKG5ld19jcHUpOw0KPj4+Pj4+ICsg
ICAgICAgIGlmICggdW5pdCApDQo+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+ICsgICAgICAg
ICAgICB1bml0LT5zdGF0ZV9lbnRyeV90aW1lID0gb2xkX3VuaXQtPnN0YXRlX2VudHJ5X3Rp
bWU7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0
ZS5zdGF0ZV0rKzsNCj4+Pj4+PiArICAgICAgICAgICAgLyogVGVtcG9yYXJpbHkgdXNlIG9s
ZCByZXNvdXJjZSBhc3NpZ25tZW50ICovDQo+Pj4+Pj4gKyAgICAgICAgICAgIHVuaXQtPnJl
cyA9IGdldF9zY2hlZF9yZXMobmV3X2NwdSk7DQo+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+
ICAgICANCj4+Pj4+PiAgICAgICAgICAgICB2LT5zY2hlZF91bml0ID0gdW5pdDsNCj4+Pj4+
DQo+Pj4+PiAuLi4gaXMgdGhpcyBmaWVsZCBiZWNvbWluZyBOVUxMIHJlYWxseSBva2F5PyBQ
ZXJoYXBzIGp1c3QgZm9yIGR5aW5nIGRvbWFpbnMNCj4+Pj4+IGl0IGlzLCBidXQgdGhlbiB0
aGUgb3JpZ2luYWwgcXVlc3Rpb24gcmVtYWlucyB3aHkgdGhleSB3b3VsZCBuZWVkIG1vdmlu
ZyBpbg0KPj4+Pj4gdGhlIGZpcnN0IHBsYWNlLg0KPj4+Pg0KPj4+PiBOb3Qgc2V0dGluZyBp
dCB3b3VsZCBsZWF2ZSBhIHBvdGVudGlhbCBVQUYsIGFzIHRoZSBvbGQgdW5pdCB3aWxsIGJl
IGZyZWVkLg0KPj4+DQo+Pj4gU3VyZSwgaXQgbmVlZHMgc2V0dGluZywgYnV0IHNldHRpbmcg
dG8gTlVMTCB3aGVuIE5VTEwgbWF5IG5vdCB3b3JrIGV2ZXJ5d2hlcmUNCj4+PiB3b3VsZG4n
dCBiZSBtdWNoIGJldHRlciB0aGFuIGxlYXZpbmcgYSBkYW5nbGluZyBwb2ludGVyLg0KPj4N
Cj4+IElmIHRoZSBkb21haW4gaXMgbm90IGR5aW5nLCB0aGUgZnVuY3Rpb24gd2lsbCByZXR1
cm4gd2l0aCBhIG5lZ2F0aXZlIHJldHVybg0KPj4gdmFsdWUgYXMgc29vbiBhcyB0aGUgbWlz
c2luZyB2Y3B1IGlzIGRldGVjdGVkLg0KPiANCj4gQnV0IHRoZSB2Q1BVIC8gZG9tYWluIC8g
c3lzdGVtIGlzIGluIGEgYmFkIHN0YXRlIHRoZW4sIGlzbid0IGl0PyBXb24ndCB0aGlzDQo+
IGhpdCB1cyAoaGFyZCkgbGF0ZXI/DQpUaGlzIGlzIHRoZSByZWFzb24gd2h5IEkgd2FudCBh
IGRvbWFpbiB3aGljaCBjb3VsZCBub3QgY3JlYXRlIGFsbCB2Y3B1cyB0bw0KbmV2ZXIgZW50
ZXIgdGhlIHJ1bm5pbmcgc3RhdGUsIHNvIHRoZSBjYXNlIHlvdSBhcmUgbWVudGlvbmluZyB3
b3VsZCBuZXZlcg0KaGFwcGVuIChzYW1lIGdvZXMgZm9yIHRoZSBkeWluZyBkb21haW4gY2Fz
ZSwgb2YgY291cnNlKS4NCg0KSSBkb24ndCBzZWUgaG93IHdlIGNvdWxkIGVuZm9yY2UgdGhh
dCBvdGhlciB0aGFuIGNyZWF0aW5nIHRoZSB2Y3B1cyBkaXJlY3RseQ0KZnJvbSBkb21haW5f
Y3JlYXRlKCksIHRob3VnaC4gSSdtIHdvcmtpbmcgb24gYSBzZXJpZXMgZG9pbmcgdGhhdCwg
YnV0IGl0IGlzDQpub3QgdHJpdmlhbC4NCg0KSnVlcmdlbg0K

--------------UyaKPFb7kBGH80WdAxP0uXNh--

--------------lRyfXZX0NIqS4DtrSC2R8Ajk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFp7YFAwAAAAAACgkQsN6d1ii/Ey+Q
cgf/Z59Y5wMVtCaMIsbfveXIGopiU1yB/U6zZh5jSnO3BbAXHlvgsuDUJ142uoeT3L9X/Xz63kB6
S6JbjRJIa15inp/sQYIiEUUu1h9xV+G4MoICB5Q24R6amUQn7KBVw+x84FIFBa/NfhBviB9AjELe
N2HZoNEL/5x6RkUIqoRFD1P7Su9RzXOcF6jggQOk9fPsVMpryZOHlWNw8x8ErwatdrgvjkRW3HrR
zvBDVtiUqiCqxTzSXAz7eteGh5VY3gLe4TmlumHfNpQtWHPgM2xCKHMeMR6lJr93MDu4GzkOPy4e
s8Ww8J0tb13o+HB/lGA5y5cpe9m2Bk16AM/O6uDHgQ==
=r2ZF
-----END PGP SIGNATURE-----

--------------lRyfXZX0NIqS4DtrSC2R8Ajk--

