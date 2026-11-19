Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A434606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Hi+ec9Dq
Received: from list by lists.xenproject.org with outflank-mailman.1495732.1694512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvAz-00031u-2j; Thu, 19 Nov 2026 05:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495732.1694512; Thu, 19 Nov 2026 05:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvAy-00031n-VP; Thu, 19 Nov 2026 05:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1495732;
 Thu, 19 Nov 2026 05:59:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xTvAx-00031h-V8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 05:59:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTvAx-006p2b-BO
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 06:59:15 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6afe902a-e002-0a2a0a5209dd-0a2a4508917e-10
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 06:59:15 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6afe9032-f659-0a2a45080019-d155dd33c423-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 06:59:15 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so941964f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 21:59:15 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656c11f1csm9214991f8f.53.2026.11.18.21.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 21:59:14 -0800 (PST)
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
        d=suse.com; s=google; t=1795067954; x=1795672754; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JXGZAzH5Q6BDWaB8lmmtrGajWsCwEXdO5JvWO2ccqEg=;
        b=Hi+ec9DqC+fZnVWyANBbUr1d9wVx6YrWFJL5GyAGP3ZytIyw4IwN64OpRI9Ea5eMFy
         nB/mnhHL6HmDMUyfkI6y29mf3JysenuAcJ9tWrtNiAlD3FduAQFtzCoesptonjFPDZuz
         htKx3HFfSDyPjZmTXYMqV4ZHfrCzfc785p2ihbwHWyF4tBtvkm5wvb8y9BjLMtYKS+TI
         X2aJQVmPx91BC4P6hMz4eD19sfLkOvvneZBI1s71O+6uim8n0XFnRazVZ926RDdB0Bdp
         us5bEmNFNqbo5+wvrJYFCHkyGojobkgnwUkm907NeaQyP5UsCCzJRmkJyoLUwXmcOeXW
         QDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067954; x=1795672754;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXGZAzH5Q6BDWaB8lmmtrGajWsCwEXdO5JvWO2ccqEg=;
        b=gzvkNvwqirGvMYB5cxx6QbzTROn/c6bpYNIfdUxoiTXy+EhXoL5zNanaTebWBQLNiQ
         UuaaQ9MMC7cLLKFGp4juivs9FNwVOvdCdlbHSzAUX2Hhux7EuF0oUr77zTbpEIEio/gu
         iTrTO+SmxLiUd05ZPrhtvMWqqm8UwXyj7+UIAg7XlvFc3zaZHd+hO6jIgSVgsocnBbRt
         yduZk99YT+7d8qOlEQcQKjLxiVYmAoOVojTf33VVC8A7c4AMyyMRxuPbfVrGanoZztX6
         HttQVxDdMOIJn7ZPB6VprcRXTl8lzlQ74Dtga55O6xFHsr0geF4kdABn/Z85B16/E/tJ
         jA9Q==
X-Forwarded-Encrypted: i=1; AL+hErEZOJwPqIdHao077BMcPmKBKWatA4z3Xi/ZXUtjGLow6pfM55fq+bHbPv7q9A6PqVZV5NvfiYctHiE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9hocSZvKWE8v2Hd/PVfcjtje+kwVkhDhG8+A471Uw7tgxmykp4
	TUS4hcheMIP/Oa25Mi/TA9xeiLUc1LboVPJMmy1dvuYJn43YlJXTi/xtI26+TVYY+p0=
X-Gm-Gg: AZFdTZd6Q91fSakFvaR6Q9UEpIdAM8gPkeHw3XhY12t+O/ePwj+YN4Ba68cfrUVKI1U
	pxmvzQ66CcWlQLUSwqURxFA525yR5Ll9/gWOJVNw3AbL7cQhJA1Kt9iAexvIZhhPnkdGu/Nmf2F
	xmSb9MD3LufVTzdrVupBrHyxglj3IHLYFhFYqBnT/CvpS7Sp0+sazD6bJxz83Sg+lxj4LVZiClp
	0dbOzLcf3SOd4+OJcGEQNYHhkBlpHvpZky2HYOKF6YfFQADvEyi0QVq8zkBLN2A/QCBYlxttjip
	hT+6hcWq4nboINzrIExWNRc4eEdQg5JnUrwNAxI8K49lp0A5LhDy9LBUnU6uFRsFzNWmvtIRPe5
	K9L7BX+Dvy+twTjnnVsNz/ogym8d+dUq77YEH13IZVdRp1Oqk6yi1n4eNv5tH4eKssuyJ1FwQ9x
	lDoarM46MGyuO84wyzAwYBXzny4SYIx1ey7Pr9PmQlPHdq7yxS5y8hvTrBPdGhQ+t/NZs9uww83
	s6BiBhSSPTbqUhn0PNCyZFoidBG0HGKwPcCfuAtBcHcoQRma+ee7llwP5IHMbBtrQxdTbwhWNVB
	ZcnFVQSot5ChRCYi74ciB66OGI56BdoVrYyFkuu3QlY3acQ6fzPXJ8jD+Vfisa9qtdsWtlt3E3t
	VQUWmgrczJ009QqdouJmAQwC5mVjMGxVkDPv7rLASQmzwyTS43AM=
X-Received: by 2002:a05:6000:41cd:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-4a63eac9ebemr10067708f8f.45.1795067954538;
        Wed, 18 Nov 2026 21:59:14 -0800 (PST)
Message-ID: <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
Date: Thu, 19 Nov 2026 06:59:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in
 range_straddles_page_boundary()
To: Lin Liu <lin.liu01@citrix.com>, ross.lagerwall@citrix.com
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>
 <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
 <20261119043504.2013850-1-lin.liu01@citrix.com>
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
In-Reply-To: <20261119043504.2013850-1-lin.liu01@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0WTVrEmB4Otjz5cYuy30BLV"
X-purgate-ID: tlsNG-c1860d/1795067955-CF35D87B-FA4F949B/35/110847
X-purgate-type: clean
X-purgate-size: 6663
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0WTVrEmB4Otjz5cYuy30BLV
Content-Type: multipart/mixed; boundary="------------npmCfGmSUuxvj35nuWE2jBLJ";
 protected-headers="v1"; hp="clear"
Message-ID: <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
Date: Thu, 19 Nov 2026 06:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in
 range_straddles_page_boundary()
To: Lin Liu <lin.liu01@citrix.com>, ross.lagerwall@citrix.com
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com>
 <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com>
 <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
 <20261119043504.2013850-1-lin.liu01@citrix.com>
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
In-Reply-To: <20261119043504.2013850-1-lin.liu01@citrix.com>

--------------npmCfGmSUuxvj35nuWE2jBLJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMDU6MzUsIExpbiBMaXUgd3JvdGU6DQo+IE9uIDE4LzExLzIwMjYgMTI6
MjQsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxOC4xMS4yNiAxMjoyNSwgUm9zcyBM
YWdlcndhbGwgd3JvdGU6DQo+Pj4gSXMgdGhlIGNoYW5nZSBhY3R1YWxseSBuZWVkZWQgZm9y
IGFsbG9jX2NvaGVyZW50IC8gZnJlZV9jb2hlcmVudD8NCj4+PiBUaGUgYWxsb2NhdGlvbiBm
cm9tIF9fZ2V0X2ZyZWVfcGFnZXMoKSBpcyBuYXR1cmFsbHkgYWxpZ25lZCBhbmQNCj4+PiBy
YW5nZV9yZXF1aXJlc19hbGlnbm1lbnQoKSByZXF1aXJlcyBpdCBoYXMgdGhlIHNhbWUgYWxp
Z25tZW50IHNvIGl0IGlzDQo+Pj4gbmF0dXJhbGx5IGFsaWduZWQgaW4gYnVzIHNwYWNlLiBJ
IGRvbid0IHRoaW5rIHRoYXQgaXQgY2FuIGNyb3NzIGENCj4+PiBzZWdtZW50IGJvdW5kYXJ5
IHRoZW4uDQo+Pg0KPj4gSG1tLCBhZ3JlZWQuDQo+IA0KPiBUaGFua3MgYm90aC4gIEFncmVl
ZCwgdGhlIGNoZWNrIGlzIHVubmVjZXNzYXJ5IGZvciB0aGUgY29oZXJlbnQgcGF0aHMuDQo+
IEkgaGFkIG5vdGVkIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlICgiY29oZXJlbnQgYWxs
b2NhdGlvbnMgYXJlIGFscmVhZHkNCj4gbmF0dXJhbGx5IGFsaWduZWQgdmlhIHJhbmdlX3Jl
cXVpcmVzX2FsaWdubWVudCgpIiksIGJ1dCB0aGUgY29kZSBzdGlsbA0KPiBjaGFuZ2VkIHRo
ZW0uDQo+IA0KPiBGb3IgdjIgSSBwbGFuIHRvIGxlYXZlIHJhbmdlX3N0cmFkZGxlc19wYWdl
X2JvdW5kYXJ5KCkgYW5kIHRoZSBjb2hlcmVudA0KPiBwYXRocyB1bnRvdWNoZWQsIGFuZCBj
aGVjayBvbmx5IHN0cmVhbWluZyBtYXBwaW5ncywgd2l0aCBhIHNtYWxsIGhlbHBlcg0KPiBu
ZXh0IHRvIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KCk6DQo+IA0KPiAvKiBCdXMt
Y29udGlndW91cywgYnV0IG1heSBzdGlsbCBjcm9zcyB0aGUgZGV2aWNlJ3Mgc2VnbWVudCBi
b3VuZGFyeSAqLw0KPiBzdGF0aWMgaW5saW5lIGJvb2wgcmFuZ2VfY3Jvc3Nlc19zZWdfYm91
bmRhcnkoc3RydWN0IGRldmljZSAqZGV2LA0KPiAJCQkJCSAgICAgIGRtYV9hZGRyX3QgZG1h
LCBzaXplX3Qgc2l6ZSkNCj4gew0KPiAJdW5zaWduZWQgbG9uZyBtYXNrID0gZG1hX2dldF9z
ZWdfYm91bmRhcnkoZGV2KTsNCj4gDQo+IAlyZXR1cm4gc2l6ZSAmJiAoKGRtYSBeIChkbWEg
KyBzaXplIC0gMSkpICYgfm1hc2spOw0KPiB9DQo+IA0KPiB1c2VkIGluIHhlbl9zd2lvdGxi
X21hcF9waHlzKCk6DQo+IA0KPiAJaWYgKGRtYV9jYXBhYmxlKGRldiwgZGV2X2FkZHIsIHNp
emUsIHRydWUsIGF0dHJzKSAmJg0KPiAJICAgICFkbWFfa21hbGxvY19uZWVkc19ib3VuY2Uo
ZGV2LCBzaXplLCBkaXIpICYmDQo+IAkgICAgIXJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5k
YXJ5KHBoeXMsIHNpemUpICYmDQo+IAkgICAgIXJhbmdlX2Nyb3NzZXNfc2VnX2JvdW5kYXJ5
KGRldiwgZGV2X2FkZHIsIHNpemUpICYmDQo+IAkJIXhlbl9hcmNoX25lZWRfc3dpb3RsYihk
ZXYsIHBoeXMsIGRldl9hZGRyKSAmJg0KPiAJCSFpc19zd2lvdGxiX2ZvcmNlX2JvdW5jZShk
ZXYpKQ0KPiAJCWdvdG8gZG9uZTsNCj4gDQo+IEEgbWFwcGluZyBsYXJnZXIgdGhhbiB0aGUg
Ym91bmRhcnkgd2luZG93IGFsc28gdGFrZXMgdGhlIGJvdW5jZSBwYXRoOg0KPiBzd2lvdGxi
IGNhbm5vdCBmaW5kIHNsb3RzIHRoYXQgZG8gbm90IHNwYW4gdGhlIGJvdW5kYXJ5LCBzbyB0
aGUgbWFwcGluZw0KPiBmYWlscyBpbnN0ZWFkIG9mIHRoZSBkZXZpY2UgYmVpbmcgaGFuZGVk
IGEgY3Jvc3NpbmcgcmFuZ2UuDQo+IA0KPiBUaGlzIGlzIHRoZSBzaGFwZSBvZiB0aGUgdmVy
c2lvbiBKw7xyZ2VuIGZpcnN0IGxvb2tlZCBhdCwgYmVmb3JlIHRoZSBjaGVjaw0KPiB3YXMg
bW92ZWQgaW50byB0aGUgaGVscGVyLg0KPiANCj4gSSdsbCBzZW5kIHYyIGlmIHlvdSBhcmUg
Ym90aCBoYXBweSB3aXRoIHRoYXQuDQpDb3VsZCB5b3UgcGxlYXNlIGFkZCBhIGNvbW1lbnQg
dG8gdGhlIGFsbG9jX2NvaGVyZW50IHBhdGggdGhhdCB0aGUgY2hlY2sNCmlzbid0IG5lZWRl
ZCB0aGVyZSBkdWUgdG8gdGhlIGFsaWdubWVudCBndWFyYW50ZWVkIGJ5IF9fZ2V0X2ZyZWVf
cGFnZXMoKT8NCg0KDQpKdWVyZ2VuDQo=

--------------npmCfGmSUuxvj35nuWE2jBLJ--

--------------L0WTVrEmB4Otjz5cYuy30BLV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr+kDEFAwAAAAAACgkQsN6d1ii/Ey9F
eAf7BdZsUW9h4xEFfkcJiLydnpOUWfxRLDQsqpi2SEbCoQ9LxVD2XpeUw0jPdj8Vn+7mugy4MJqd
WwJkVR/g8BMCRyQorHTQaiwqyWFLgSzQQ1y3dhnm5WzRsDfT7x2svxAAAq7kEvnTulGZ5oR0Jlyl
3FUW5nP6hyCrSrGGa64DBMJaMv0IGCR5nnd6zRw4G1Xhx+Qi3ZRXnRXUpd3z5zXjhGgOcYS5zzQQ
hOU39gE4Zj0OYNlDEG1YTaIgS4S2Sr1gs6gqV1G5RId5Qc6FfM0uu2bLNXg4AAuiJuPTvggsUooY
Hu9dlt/JqYC/x+ZHPEEIINT665IinNQWr4mr1GG2ZA==
=c3iy
-----END PGP SIGNATURE-----

--------------L0WTVrEmB4Otjz5cYuy30BLV--

