Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB19260A2611
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 06:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJEY+viM
Received: from list by lists.xenproject.org with outflank-mailman.1495810.1694537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvtB-0004RW-Ls; Thu, 19 Nov 2026 06:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495810.1694537; Thu, 19 Nov 2026 06:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvtB-0004RP-Iv; Thu, 19 Nov 2026 06:44:57 +0000
Received: by outflank-mailman (input) for mailman id 1495810;
 Thu, 19 Nov 2026 06:44:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xTvtA-0004RJ-MV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 06:44:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTvt9-00AVok-VL
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:44:55 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6afe9acd-bab6-0a2a0a5309dd-0a2a4508c0c2-48
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:44:55 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6afe9ae7-f659-0a2a45080019-d155dd31b548-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:44:55 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso1410772f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 22:44:55 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656c11f1csm9437350f8f.53.2026.11.18.22.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 22:44:55 -0800 (PST)
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
        d=suse.com; s=google; t=1795070695; x=1795675495; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gx3IKd3H/J7FeV0UbqNeO9FYoO/jP2uhAsiBT/hJXZs=;
        b=CJEY+viMOmb6HlOu0I6MX32G+FsF27CBPxA0GCHod3KT+HvBtOlzeriVmV7lpqSlAj
         88BJJW9ccHnvMsHPsNsfDiFvPnl37mqG0I4xLvlgcnEbfruNv2epNtHMNEkXC85/3ocB
         xGX6cJ8xHPZaGp+aHxnuSOlfj3w/Wzquumff4N5nQI4CgZcLXnzawAgd3Wr6cnXzKdxU
         VaLH7sZcSsL/9aukvO67vY4GEZ6GSRPzThUgmjt7Jc90w6o44gJwBKCmYyBc4joTf60Z
         RSGOZb8WULC4E32SIlLtpNjizU4gpdVJh8Kjjs4aaLw984l5BhWJyffJ16mc364R36Y5
         djiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070695; x=1795675495;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx3IKd3H/J7FeV0UbqNeO9FYoO/jP2uhAsiBT/hJXZs=;
        b=I6Qk12ClosSRy4W7ROx8fz3wxJlPtUSlKW1ExonuAH/1nWv8gyIYIIZfsIWaD6HuBz
         du1GNla2HvBsIQ+F37TK9+lUPGP5GQJ5OUCBsJJPaaOyJTQuQy8UVEVsL/TfFaTnz9WX
         v01tyjwCddobchy5oc8NDNZawWHBism1jr5yK7ZcWGREogKaqzkT+5Si7cCyE0Zf2o5n
         RM1581jOhXK/lmxCoWBD7OPfkm3GAfykcUIqB+YGn9VoCmH9VMZ7wpcy4RfhTUebJAe2
         OZXjMeiagmuG/y2W8qHiCiXGrkjeusGiBLadTzOH3Ii7M5QDL59UTCXXWBlqn06tLItq
         UwSg==
X-Forwarded-Encrypted: i=1; AL+hErELtMOLb/G0/rDQJftTiCL4wK5xW2GQ61sYR9akQj3TEHvjcjAtPfC9Lc3dgJx68CnQoewUQLSQd2w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+Z9iCUmSOojMpiDMZB0//TGpf5Saa9hYISnYRqleq4IXBxPc9k
	LwOOUXP/M2YBLTmk1ZxolbOk0dJD3Qqb3rZ9cBzIPILv/9iSR8QrP2HkkC1neO3JIUk=
X-Gm-Gg: AZFdTZepZeBtbOYm8CUXFRkCe1xsRYuO1amUUYG+bEawHHu2fPxROegPUP/55DBbpq/
	N4YmRfIYlhTloiNpawgb+L0r5r5pj56Ikm71l/bFv+rHQ4F73kCBRvKodK3Up8H9Y8LtXk3/8tx
	D1zsZOTFqN+7RYDabG81tVbEV7vzjE1XTnpOKThBQaFg1PW9Kx8nRYYHchQtDydLMPLqlWiZFbn
	gDfgfzz8TA8Q9Dl15n2E5+hprcAH22NOh/byobBs2d+nvmNA+LuEydhe0euyjH26NbhBErUOzNF
	Diq+RUvYVdTvRueOtEVsgw6QqmYBf6bYV57KEYTz/apJ+Bhmhz/vyyKrhg284S2l/83RNzomQWB
	kQg8zgHV7oH5JTAswSifIyEFXzqyLDapsaronnrTcWD9Yfm7VA7cYVfR7B89q+QpNo3pqXA1xWX
	k2r8itNBAOaxY9WY5YqYYBQ8i9P2rm+ISmZBxtH7gkDCzbMml/1WYcbO4oHLnKXZetN554us8AX
	zXYyLynXbIaM8EOmmgSlUEIX35JoBHPhGsynLfkOfkuwCdn2Cg4AmmJrjpZ5V7nhufB380wc1Kz
	DRhNSGMW+07pKHoK6RMowZ6PjJKBnr4k35mjThxEk9JXvia3OoDQFpbie5ugi8ClbmDA7blafUf
	scv0dLyL9P4Zk4HbLF63ka28bfga/yJC3nJKEBZfvkiev8tByUOV+
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4a63d6a459fmr9772581f8f.53.1795070695314;
        Wed, 18 Nov 2026 22:44:55 -0800 (PST)
Message-ID: <c906fcbd-8671-4257-8250-9c09d38f6b53@suse.com>
Date: Thu, 19 Nov 2026 07:44:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment
 boundary
To: Lin Liu <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
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
In-Reply-To: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LIGiRNSFugMGqSq0b2MFddW7"
X-purgate-ID: tlsNG-c1860d/1795070695-D654487B-2EE458A3/35/110847
X-purgate-type: clean
X-purgate-size: 4754
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LIGiRNSFugMGqSq0b2MFddW7
Content-Type: multipart/mixed; boundary="------------Xemoc0Pv264QPqL109RvJbGz";
 protected-headers="v1"; hp="clear"
Message-ID: <c906fcbd-8671-4257-8250-9c09d38f6b53@suse.com>
Date: Thu, 19 Nov 2026 07:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/swiotlb: Bounce mappings that cross the segment
 boundary
To: Lin Liu <lin.liu01@citrix.com>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, andrew.cooper3@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>
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
In-Reply-To: <4a2d59f8d5a2b1399fc8bdf6e49202c9c2f394a7.1795069501.git.lin.liu01@citrix.com>

--------------Xemoc0Pv264QPqL109RvJbGz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMDc6MzgsIExpbiBMaXUgd3JvdGU6DQo+IFRoZSBibG9jayBsYXllciBh
cHBsaWVzIGEgZGV2aWNlJ3MgRE1BIHNlZ21lbnQgYm91bmRhcnkgdG8NCj4gcHNldWRvLXBo
eXNpY2FsIGFkZHJlc3NlcywgYnV0IGluIGEgWGVuIFBWIGRvbWFpbiB0aGUgYnVzIGFkZHJl
c3MgaXMgdGhlDQo+IG1hY2hpbmUgYWRkcmVzcy4gIEEgc2VnbWVudCB0aGF0IGlzIGNvbnRp
Z3VvdXMgaW4gYm90aCBzcGFjZXMgY2FuIHN0aWxsDQo+IGNyb3NzIHRoZSBib3VuZGFyeSBp
biBtYWNoaW5lIHNwYWNlIGFuZCByZWFjaCB0aGUgZGV2aWNlLiAgQUhDSSBkZWNsYXJlcw0K
PiBhIDQgR2lCIGJvdW5kYXJ5LCBhbmQgY29udHJvbGxlcnMgdGhhdCBkbyBub3QgY2Fycnkg
YWNyb3NzIGl0IChlLmcuDQo+IE1hcnZlbGwgODhTRTkyMzApIHRoZW4gRE1BIHRoZSB0YWls
IG9mIHRoZSB0cmFuc2ZlciA0IEdpQiB0b28gbG93Lg0KPiANCj4gQm91bmNlIHN1Y2ggc3Ry
ZWFtaW5nIG1hcHBpbmdzLiAgQ29oZXJlbnQgYWxsb2NhdGlvbnMgbmVlZCBubyBjaGVjazoN
Cj4gdGhleSBhcmUgbmF0dXJhbGx5IGFsaWduZWQgaW4gYnVzIHNwYWNlIChyYW5nZV9yZXF1
aXJlc19hbGlnbm1lbnQoKSksIHNvDQo+IHRoZXkgY2Fubm90IGNyb3NzIGEgYm91bmRhcnkg
dGhleSBmaXQgaW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaW4gTGl1IDxsaW4ubGl1MDFA
Y2l0cml4LmNvbT4NClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQoNCg0KSnVlcmdlbg0K

--------------Xemoc0Pv264QPqL109RvJbGz--

--------------LIGiRNSFugMGqSq0b2MFddW7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr+muYFAwAAAAAACgkQsN6d1ii/Ey9L
HAf/X0Pm4J7+wBBKEjrIufQWB6suG5g7l9JkTCLi7GWNeLxMhwGj/TklDgnzrB+Ob2euHI5rLASO
g//lwldmRx37r1spQYDFdcgdYmWwvCmEbiBCFaffMZln2/u1G0rkEX/aNTagnomlkblqnQRYZADJ
9UwPjzh+DvvOEP6epdxoUK9n9YHQEMeRO67SBL8bhStv1HTfzdknZGC87RVxxcPkt2maPCi+oDcB
fsRMJaTF0SR+Ng71IdBN5Emke0k39vp7R+W2Na8bDmLnY642R5OCVvZ7cw1JT/JL+l2F1WG/dIUd
ncfCfbUfFbuxu9W69Rn945V8vvcVVj2UOWNqa8WyHQ==
=+1hD
-----END PGP SIGNATURE-----

--------------LIGiRNSFugMGqSq0b2MFddW7--

