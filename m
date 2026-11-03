Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E96606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OeKYgg5/
Received: from list by lists.xenproject.org with outflank-mailman.1469241.1678132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7zO-0000Mx-6u; Tue, 03 Nov 2026 06:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469241.1678132; Tue, 03 Nov 2026 06:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7zO-0000Mq-3q; Tue, 03 Nov 2026 06:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1469241;
 Tue, 03 Nov 2026 06:27:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xO7zN-0000LS-6i
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 06:27:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO7zM-005tQb-C3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 07:27:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ae97ebc-2eae-0a2a0a5409dd-0a2a4503bfa2-32
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:27:20 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ae97ec6-fae8-0a2a45030019-d155802ccdcc-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:27:19 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso42163765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 22:27:19 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2aaa4b91esm31435585e9.11.2026.11.02.22.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 22:27:18 -0800 (PST)
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
        d=suse.com; s=google; t=1793687238; x=1794292038; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qm7RBlZCRUghi/5BcbUocOcltZQXhCKJ5nr6Yg83jes=;
        b=OeKYgg5/Tnn+z4/nwxlTvF8nQP/KszDtlGaTuLOXJd8lj7Ak6afAKsrp42knXrmuAb
         qTmNfYZQc6ojuF/gkr4YXL+tpTyw21Q63FCgI9kyIv01wN4/BpC65ojQYtsYRQ08iDsS
         +v//IjUdbDmL9a5TCP0J0nF+vhGORZwEM3wYFO52lq8h/fOPgTlFzdKoCIdwN1v3nBgB
         V2I9I9fdwafLy/HoskQ/UTs0yqZfzn6Lkc+YWGjQDZ/cX/bEDyfO/wcT4nunyKToZ0Uq
         Ek1SELR+Vs31qsQyVdl7QA3mUH1P+QUZpeudGm3ST/yETmn+e/0+CAa27VnjTVxbPG89
         AkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687238; x=1794292038;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm7RBlZCRUghi/5BcbUocOcltZQXhCKJ5nr6Yg83jes=;
        b=IdSaDI8aZOLcqulflkxYSgwCb2Jrw2jopMyAoD8BYIfJlcOGsnYf31o94g3Qymaw9C
         wrqS4aqX2hPJxbL7RR8OXY2BYHxkRncoKJc4w8vTZqnqE3VFMeBR1CTrQPlrSkBbmMdO
         7zUGGM+ESf6b9We2tQdkiws30k2cnXi/d664O0atXk9AZ3DXg+bTsGLosZyih7bdCskH
         MHwAtq7lLKlANAQxoZdV2nwnTN6SRE5wwrUJHsOGdY1qqcrbZW2n8H2SeBCiF4FXFnMg
         1c8+EzC0GYx2K5wRHVr8pU1w26k/MjRt1Z3UvKDitUhgErqq/egXhPNiX3NAcVI4hJnZ
         5l1w==
X-Forwarded-Encrypted: i=1; AKwUvBzRpsCoAp407jeJsgsvkOylYMB89wzm9tskMjC9PbwkFBkMKUOjsOvAjuIKxjUCo4EfVOf8fL6dTRk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+aXve+aOGG8Do0N522KLjj1dPlu76YduWrrbGWBwgnCQ/yVfJa
	XQadXGWLCQ/sucfqxpPX3lLwpbCp/oKcPMGqIw+HU7+CtDS0Ft5H++i/WmqM9DmRQ4o=
X-Gm-Gg: AYBFou3a3NdJ8vaZhyW5GqSZSANtOa0xgVoiwzJQwYGZxSFi9bm/XPgvfvMsWEt17fj
	bKPBnLxwLO2ZFhk14Ah+wx0mo68RldVuqLEzuJo7LQm8HtNcpvmQxhD5XXIG9jl6zGOEraUMpZl
	Ht6DI+UXh/uUuYzVHq/uEIl7RR0jXLQt+ded5uzKvZqmMwy7sjKPOLpEb9sUx/JFcj+KegxyrZh
	Yp+yhh7lYT/2mj3cHUeAINjHRTJJ5yOzBIprN02PKeSiFPZ273TpK18s0gmd3wCAxU58kFnpqS6
	wadrEJK9itkDErn0X5MwPIpRud/3a2pJf0nq85t+N4Y1IDtZiEQzmzm7o34vkTm6/2+FRTUjZq7
	2Kp9xpkQtXtX3oyUAlEMck4zAAON5uoTOQscXwuEd5kF1bTlg/hvHzDqHI3hM7CW9AEE6pNA22+
	Eh/vI980eUFSavNafG1CuVTp1wa7VUjBLlH8TjcjXY96RW05GO+UjSNnDc1Eo6JMnIaScA+3BYW
	kxVgkEu0uYxlUSM6YNyhJLVRodXBzjytedM9KY7Ek/fyZ1u3hzcxyWBf20PqDRkTXcOwmg/Dx2G
	TsqthGuloeSoym7Hao13xIBMVJdY8OxFAipZJlOPLNVbAKxFNwe5UJ4TA/IGyhkfX/Z2j6VPRH8
	aCegeYrDGjOfY7LJWzlUFVu1zjpncrff8AllIGNXp45g5wf4K7XplqA==
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr262901645e9.15.1793687238545;
        Mon, 02 Nov 2026 22:27:18 -0800 (PST)
Message-ID: <f1e18482-775d-4e1e-a0ac-434117ccdbe5@suse.com>
Date: Tue, 3 Nov 2026 07:27:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-13-54ad0ab57614@toxicpanda.com>
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
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-13-54ad0ab57614@toxicpanda.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UeMRSVPXLO3rcUL0x2eyyOgz"
X-purgate-ID: tlsNG-33051d/1793687239-6F6C64E9-B321FC3A/35/110847
X-purgate-type: clean
X-purgate-size: 7228
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UeMRSVPXLO3rcUL0x2eyyOgz
Content-Type: multipart/mixed; boundary="------------Z9TguYYJlyfG8Pe4RfnPxIJQ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <f1e18482-775d-4e1e-a0ac-434117ccdbe5@suse.com>
Subject: Re: [PATCH net-next v3 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-13-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-13-54ad0ab57614@toxicpanda.com>

--------------Z9TguYYJlyfG8Pe4RfnPxIJQ
Content-Type: multipart/mixed; boundary="------------JK0D029qSPZ1FSajkanwEGAL"

--------------JK0D029qSPZ1FSajkanwEGAL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjYgMDM6MjgsIEpvc2VmIEJhY2lrIHdyb3RlOg0KPiBib3VuY2Vfc2tiKCkg
aXMgYW4gb3Blbi1jb2RlZCBza2JfY29weSgpIGludG8gYSBwYWdlLWFsaWduZWQgYnVmZmVy
LCBhbmQNCj4gaXQgaGFzIHRoZSBzYW1lIEJVR19PTihza2JfY29weV9iaXRzKCkpLiAgc2ti
X2NvcHlfYml0cygpIGZhaWxzIHdoZW4gdGhlDQo+IHNrYidzIGxlbmd0aHMgZG9uJ3QgYWRk
IHVwIG9yIGl0cyBmcmFncyBhcmUgdW5yZWFkYWJsZS4NCj4gDQo+IGJvdW5jZV9za2IoKSBh
bHJlYWR5IGZyZWVzIHRoZSBuZXcgc2tiIGFuZCByZXR1cm5zIE5VTEwgd2hlbiB0aGUNCj4g
YWxsb2NhdGlvbiBjb21lcyBiYWNrIG1pc2FsaWduZWQsIGFuZCB4ZW5uZXRfc3RhcnRfeG1p
dCgpIGRyb3BzIHRoZQ0KPiBwYWNrZXQgaW4gdGhhdCBjYXNlLiAgVGFrZSB0aGUgc2FtZSBw
YXRoLCB3aXRoIGENCj4gREVCVUdfTkVUX1dBUk5fT05fT05DRSgpIGZvciBkZWJ1ZyBrZXJu
ZWxzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFu
ZGEuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KDQoNCkp1ZXJnZW4NCg==
--------------JK0D029qSPZ1FSajkanwEGAL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JK0D029qSPZ1FSajkanwEGAL--

--------------Z9TguYYJlyfG8Pe4RfnPxIJQ--

--------------UeMRSVPXLO3rcUL0x2eyyOgz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrpfsUFAwAAAAAACgkQsN6d1ii/Ey9G
Hwf9FJEDlIAKlrN0LReV4G5SBlmTdNQmOcImldWQvj7jxPTvL2bSDelDyahNVKGQ9VEQrYH/eCuR
LPbz/2R1sNpgzLTWs6glst3C0lUEAgHkPYa0PkZ4PKKhsHaB2WJ0CmqCl8XNcoWtnJA7TQo7JZbG
gnKud05ZQ3jGVjaiMtmhlUqkVsAspm/pEexy03JqEnYoKYKMw4JW99Oxdd3efl3VoCp4O3GKIJoS
jMdKiK4VnGtgnYp2i/JwtNUhB6MuDhssXb7+JUcrtvmK+pnWtqrxFb0ole11CSuYLoG9OsUi4X/S
iDzPWulUKXJWD6zpkxiHoXEI2voR3tagcqqd7EcJ7w==
=kqT7
-----END PGP SIGNATURE-----

--------------UeMRSVPXLO3rcUL0x2eyyOgz--

