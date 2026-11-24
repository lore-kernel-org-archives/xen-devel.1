Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15949606A327
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bJIRagfd
Received: from list by lists.xenproject.org with outflank-mailman.1501146.1697189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrlr-000879-P8; Tue, 24 Nov 2026 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501146.1697189; Tue, 24 Nov 2026 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVrlr-000872-MQ; Tue, 24 Nov 2026 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1501146;
 Tue, 24 Nov 2026 14:45:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xVrlp-00086v-Q6
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:45:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVrlo-004c6h-Hh
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:45:20 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b05a2eb-bab6-0a2a0a5309dd-0a2a4506cfbe-40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:45:20 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b05a300-195a-0a2a45060019-d155da33d815-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:45:20 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c5188e17487so263812066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 06:45:20 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae9dc7asm535499466b.41.2026.11.24.06.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 06:45:19 -0800 (PST)
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
        d=suse.com; s=google; t=1795531520; x=1796136320; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/BhoEuD/AhyBn5K0/bycB4lTl0KoTJF8z3rrE5BXGgI=;
        b=bJIRagfdTuUFPxcdCLRScAXARerOJC/0TpOuckIDXgU6TDvfKkS0rjiGnIXYPFreMW
         nWXoopKYTul7ryOq+3oS/Zl6XLgepLB6zQNpHFxnm/T4oUiauB4aZael3/hSsPXFkNIY
         3S/K21I5OPO5f/Mb5WkpQJfoRYsxapqUG1uYRlljjoWWAg7n5jREbJjaI6gt6PkgJSTF
         QZovnGYJoERQ1BxsB80dMeG+76xcv2BAHx/iEt/UomnTAvLnSru21KvoCHP/mTaNq9Mm
         8skDBWIPBn6qWwkPk1W+VYSaSqXVRFPDWoBwk4Sh6hWK2Wmx2nkws4KNKd+oKQ3SoZ5R
         os+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531520; x=1796136320;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BhoEuD/AhyBn5K0/bycB4lTl0KoTJF8z3rrE5BXGgI=;
        b=hXrQ5Ati5ib18qgm+PTpSbS14EBRVZEJMQjppkJL7mEiF4oWktL0jb2HnGVxv/Zm0y
         T4+ZIwVGs6WQRmsMwwHf5An/U5+1SSBQi2WsSTzIagmYQLPNu1BBMx5dU8/JCKkzPWJj
         fLhDzEG1O7LYydjrWxnpWMWAEkQDm5ZRQMUWMIonw/1bNvPNG5Z/ZZuGfP7iOpJ/waz/
         hnWrwqCDcSR1jgphbq/a1+095RkA5rsQ6wZb61d7k9b/ztBAR2AVb3s8jjBSOHOLu9JN
         UHxfRXR4MLBSMXERAST5Jhbg0UdPF9alDLXVKaEIXuWdbgoZe0AwYhH5IIAaJ9JRMibV
         hsDA==
X-Forwarded-Encrypted: i=1; AL+hErHu8EzMdkqg7V/psBgrECY4RBD9bwD31Qs2bJi8cQ0NTPhSphNc+J5gvuUcyitYNlf87DBmAA+lIEQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/uh6MW/ns1eY7+c7bmlDIDetxqdljHcBQrIp4xtmmsE5WxrCbw
	Sn0mXr4eAugHvXQ6Mz32fIpSnERDttHXE6fdKDwX0+s0rudsrGoa2G8IH4eDJCdwYdUryKD6oY1
	9W698Qfs=
X-Gm-Gg: AZFdTZcRa33hff0+aXK2LLxku7XTrmPF902Fm4O9gTHwhcmXLx7t3qFKRyAJHqd2UeL
	MaLn0/eafyoKogf6wXJpc3rpaQMuf12Z0yBSWNQBDMgta7g65l6AtpXTbMY6s4MMeMvDmzoru2R
	ObKMAmOl5I6Iz/lHtoRYugFFfPPe82Se00+l9387MyfsNK6Dsdlm0cjZ2mWPN59yyIM5pqgHhAQ
	jHI47OM92HFcRBNJkuI6gSiN4Hwl7qeSQtXNq4rOFOl0dXN0TgcEhWDqlAFivFSJA8tNQJ8WUsp
	CLy1OSuSZLeXQ019ANO2CrRUYUg9iQvKF2yq2JgdS5yFaZKCnePB6n4Yt6LfZ0bLnsw8hVQCUIG
	ng0bSRqLV+0nU/3jn7pP6zpfVbKzu77JJLvxGtvu2AibslVa9i8W6oHnrpEe0lZxfCkdiMt3xin
	Aq4PmbLGBItqffFt3USwNUbTQQd7PxzYwh7MaAbTPJCSil06samMfTR2tPImnqpZ41hRRaKhhvk
	2VDXAMOGmJS4XKuggs+tDBAzwJT+LS5ytlo/9a0UcRIon2KoO9DbfbU1BnZCFyDdb4kexRaWz2H
	TJnDme5Ac5exFBUWknkbXjfoUwnv/QoyqDjiGucnTYYRpUhSr8o/KZSPejoEmzX/to5yWzAKjXa
	vdlZM9uHWKe0WwJv2pSBD0Agg3atFzZzGZKkpxVyLTPqflv5RYtQ=
X-Received: by 2002:a17:906:7d7:b0:c46:8913:d89d with SMTP id a640c23a62f3a-c513a9997c4mr976835066b.14.1795531519684;
        Tue, 24 Nov 2026 06:45:19 -0800 (PST)
Message-ID: <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
Date: Tue, 24 Nov 2026 15:45:18 +0100
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
In-Reply-To: <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c3niGeJ0Q4cjnzl4pxUlZ9D9"
X-purgate-ID: tlsNG-16d1c6/1795531520-F520877B-D9843221/35/110847
X-purgate-type: clean
X-purgate-size: 8245
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c3niGeJ0Q4cjnzl4pxUlZ9D9
Content-Type: multipart/mixed; boundary="------------tbopRDKmwrFAJbEltt4W2D8C";
 protected-headers="v1"; hp="clear"
Message-ID: <507dd641-dde2-4eca-91e1-9c3dfbc2dfc6@suse.com>
Date: Tue, 24 Nov 2026 15:45:18 +0100
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
In-Reply-To: <baddd6ac-5aa7-468f-947a-65dcc24963e0@suse.com>

--------------tbopRDKmwrFAJbEltt4W2D8C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTU6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI2
IDE1OjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjQuMTEuMjYgMTQ6NTcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjExLjIwMjYgMTM6MjAsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IElmIGEgZHlpbmcgZG9tYWluIGhhcyBub3QgYWxsIG9mIGl0cyB2
Y3B1cyBmaWxsZWQgYW5kIGl0IGlzIG1vdmVkIGZyb20NCj4+Pj4gYSBjcHVwb29sIHdpdGgg
Z3Jhbj1zb2NrZXQgdG8gb25lIHdpdGggZ3Jhbj1jb3JlLA0KPj4+DQo+Pj4gV2h5IHdvdWxk
IGEgZHlpbmcgZG9tYWluIG5lZWQgbW92aW5nIGluIHRoaXMgd2F5IGluIHRoZSBmaXJzdCBw
bGFjZT8NCj4+DQo+PiBUaGlzIGlzIGZvciBhdm9pZGluZyBhIHpvbWJpZSBkb21haW4gYmxv
Y2tpbmcgcmVtb3ZhbCBvZiBhIGNwdXBvb2wuDQo+IA0KPiBBaCwgSSBzZWUuIE1heWJlIHNh
eSAiem9tYmllIiB0aGVuIGluIHBsYWNlIG9mIGp1c3QgImR5aW5nIj8NCg0KQnV0IHRoZSBt
b3ZpbmcgaXMgZG9uZSBmb3IgYWxsIGR5aW5nIGRvbWFpbnMgYXMgcGFydCBvZiB0aGUgZG9t
YWluJ3MgZGVzdHJveQ0KcHJvY2Vzcy4NCg0KPiANCj4+PiBQb3NzaWJseSBjb25uZWN0ZWQg
dG8gdGhpcywgLi4uDQo+Pj4NCj4+Pj4gaXQgbWlnaHQgaGFwcGVuIHRoYXQNCj4+Pj4gZHVy
aW5nIGFzc2lnbm1lbnQgb2YgdGhlIG5ldyB1bml0cyB0byB0aGUgdmNwdXMgYSBOVUxMIHBv
aW50ZXIgaXMNCj4+Pj4gYmVpbmcgZGVyZWZlcmVuY2VkOg0KPj4+Pg0KPj4+PiAtIHN5c3Rl
bSBoYXMgMiBzb2NrZXRzIHdpdGggMiBjb3JlcyBlYWNoLCBlYWNoIGNvcmUgaGFzIDIgdGhy
ZWFkcw0KPj4+PiAtIFBvb2wtMCBoYXMgZ3Jhbj1jb3JlLCBvdGhlciBjcHVwb29sIGhhcyBn
cmFuPXNvY2tldA0KPj4+PiAtIGRvbWFpbiB3aXRoIG1heF92Y3B1cz00IGhhcyBvbmx5IDMg
dmNwdXMgYW5kIGlzIGluIGNwdXBvb2wgd2l0aA0KPj4+PiAgICAgZ3Jhbj1zb2NrZXQNCj4+
Pj4gLSBkb21haW4gaXMgZHlpbmcgYW5kIGlzIG1vdmVkIHRvIFBvb2wtMA0KPj4+PiAtIGlu
IHNjaGVkX21vdmVfZG9tYWluKCkgdGhpcyByZXN1bHRzIGluIHZjcHVfZmFpbGVkIGJlaW5n
IHNldCB0bw0KPj4+PiAgICAgdHJ1ZSBmb3IgdGhlIGxhc3QgdW5pdCBvZiB0aGUgZG9tYWlu
LCByZXN1bHRpbmcgaW4gdGhlIHVuaXQgbm90DQo+Pj4+ICAgICBiZWluZyBhbGxvY2F0ZWQg
KCJjb250aW51ZSIgc3RhdGVtZW50IGlzIGJlaW5nIGhpdCkNCj4+Pj4gLSBpbiB0aGUgZm9y
X2VhY2hfdmNwdSgpIGxvb3Agb2Ygc2NoZWRfbW92ZV9kb21haW4oKSBmb3IgdmNwdSAyDQo+
Pj4+ICAgICB0aGUgdW5pdCBwb2ludGVyIHdpbGwgYmUgc2V0IHRvIE5VTEwsIGFzIHVuaXQt
Pm5leHRfaW5fbGlzdCBpcyBub3QNCj4+Pj4gICAgIHBvcHVsYXRlZCBkdWUgdG8gYWJvdmUg
ImNvbnRpbnVlIg0KPj4+Pg0KPj4+PiBGaXhlczogNDgzNWMwNzhlNWNmICgieGVuL3NjaGVk
OiBjb3JlOiBza2lwIG1pc3NpbmcgdmNwdSBzbG90cyBpbiBzY2hlZF9tb3ZlX2RvbWFpbigp
IikNCj4+Pj4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBhbWQu
Y29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+Pj4+IC0tLQ0KPj4+PiAgICB4ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyB8IDExICsr
KysrKystLS0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
L2NvcmUuYyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IGluZGV4IDEwYjZlZWNj
Y2QuLmVlNzA3N2I4NzAgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY29y
ZS5jDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+Pj4+IEBAIC04MzAs
MTAgKzgzMCwxMyBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IGNwdXBvb2wgKmMpDQo+Pj4+ICAgICAgICAgICAgaWYgKCB1bml0LT51bml0X2lk
ICsgZ3JhbiA9PSB2LT52Y3B1X2lkICkNCj4+Pj4gICAgICAgICAgICAgICAgdW5pdCA9IHVu
aXQtPm5leHRfaW5fbGlzdDsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAgIHVuaXQtPnN0YXRl
X2VudHJ5X3RpbWUgPSBvbGRfdW5pdC0+c3RhdGVfZW50cnlfdGltZTsNCj4+Pj4gLSAgICAg
ICAgdW5pdC0+cnVuc3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOw0KPj4+PiAtICAg
ICAgICAvKiBUZW1wb3JhcmlseSB1c2Ugb2xkIHJlc291cmNlIGFzc2lnbm1lbnQgKi8NCj4+
Pj4gLSAgICAgICAgdW5pdC0+cmVzID0gZ2V0X3NjaGVkX3JlcyhuZXdfY3B1KTsNCj4+Pj4g
KyAgICAgICAgaWYgKCB1bml0ICkNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAg
ICAgdW5pdC0+c3RhdGVfZW50cnlfdGltZSA9IG9sZF91bml0LT5zdGF0ZV9lbnRyeV90aW1l
Ow0KPj4+PiArICAgICAgICAgICAgdW5pdC0+cnVuc3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0
YXRlXSsrOw0KPj4+PiArICAgICAgICAgICAgLyogVGVtcG9yYXJpbHkgdXNlIG9sZCByZXNv
dXJjZSBhc3NpZ25tZW50ICovDQo+Pj4+ICsgICAgICAgICAgICB1bml0LT5yZXMgPSBnZXRf
c2NoZWRfcmVzKG5ld19jcHUpOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+PiAg
ICAgICAgICAgIHYtPnNjaGVkX3VuaXQgPSB1bml0Ow0KPj4+DQo+Pj4gLi4uIGlzIHRoaXMg
ZmllbGQgYmVjb21pbmcgTlVMTCByZWFsbHkgb2theT8gUGVyaGFwcyBqdXN0IGZvciBkeWlu
ZyBkb21haW5zDQo+Pj4gaXQgaXMsIGJ1dCB0aGVuIHRoZSBvcmlnaW5hbCBxdWVzdGlvbiBy
ZW1haW5zIHdoeSB0aGV5IHdvdWxkIG5lZWQgbW92aW5nIGluDQo+Pj4gdGhlIGZpcnN0IHBs
YWNlLg0KPj4NCj4+IE5vdCBzZXR0aW5nIGl0IHdvdWxkIGxlYXZlIGEgcG90ZW50aWFsIFVB
RiwgYXMgdGhlIG9sZCB1bml0IHdpbGwgYmUgZnJlZWQuDQo+IA0KPiBTdXJlLCBpdCBuZWVk
cyBzZXR0aW5nLCBidXQgc2V0dGluZyB0byBOVUxMIHdoZW4gTlVMTCBtYXkgbm90IHdvcmsg
ZXZlcnl3aGVyZQ0KPiB3b3VsZG4ndCBiZSBtdWNoIGJldHRlciB0aGFuIGxlYXZpbmcgYSBk
YW5nbGluZyBwb2ludGVyLg0KDQpJZiB0aGUgZG9tYWluIGlzIG5vdCBkeWluZywgdGhlIGZ1
bmN0aW9uIHdpbGwgcmV0dXJuIHdpdGggYSBuZWdhdGl2ZSByZXR1cm4NCnZhbHVlIGFzIHNv
b24gYXMgdGhlIG1pc3NpbmcgdmNwdSBpcyBkZXRlY3RlZC4NCg0KDQpKdWVyZ2VuDQo=

--------------tbopRDKmwrFAJbEltt4W2D8C--

--------------c3niGeJ0Q4cjnzl4pxUlZ9D9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFov4FAwAAAAAACgkQsN6d1ii/Ey8r
RQf/TxrmAUC8WyMC8MEceNSLazkNCckbyjnxYgvgGiwHajUPzFH7jPO7xGTLk5F/da3B6dXGW/oj
aUgIcc88XwFOoWl3SG3zZlOPCoVFY+m1LVrONwN122tqi1VOJDNx41hhaB4zc65NI0FMFrijxs8i
ePuQnZkJ3R6f0e1u13Br7X0Ylx6WHaiFl59MMVn+ZIO7LYAogUoxr8tc3g0J9YpJEUEbSLjduEKa
kc/P6yoELZIKsmyslg0iT+nZOr1SzSzw9Qq3LU2qT3Oq+lckbkyG4rFLV0YrFoGTH7siWc7InEJo
vEh2k5VuyuOeh3nx4E/UdhaSawOnc8CGGX41mqUv/Q==
=ZYTv
-----END PGP SIGNATURE-----

--------------c3niGeJ0Q4cjnzl4pxUlZ9D9--

