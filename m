Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762D606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SRfDLZVd
Received: from list by lists.xenproject.org with outflank-mailman.1480721.1684486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQgF2-0001l6-KX; Tue, 10 Nov 2026 07:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480721.1684486; Tue, 10 Nov 2026 07:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQgF2-0001kz-Hu; Tue, 10 Nov 2026 07:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1480721;
 Tue, 10 Nov 2026 07:26:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQgF0-0001kt-KZ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:26:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQgEz-006DeM-IR
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:26:01 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2c701-bab6-0a2a0a5309dd-0a2a45039eca-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:26:01 +0100
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2c709-fae8-0a2a45030019-d155da2ecd3b-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:26:01 +0100
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c468bd799ecso239012666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 23:26:01 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a593b5esm76107766b.34.2026.11.09.23.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 23:26:00 -0800 (PST)
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
        d=suse.com; s=google; t=1794295561; x=1794900361; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVur5LhTJoFv66K/FHeEGJ1JCwZsBRUToYym0WGroXg=;
        b=SRfDLZVdf+/pBi2xIfzcytV1NsOxmYnulDgQItgfw27pGqvvqy230yld6MftK/llp3
         CWgrHoDi7oZ1APSrMJQNdYKzjsyeoHr1diWRrd1FS9oCr+FxPYVXUDS0tTvyV/saOEtz
         Cr+OCv7AW0rVNtDNT67VJ2Af1CH6ys8c+LtLi+ByXdw6y38R3lP8rh6QwCutd2o+jD5T
         088xOV9uxWlErD4d66rhjfAIp5VyD6U6PccHmPB6yjDDVIKPcP/dZFTt5Uy3k+z1N6UU
         3IliCUxlafNXJQbcwIzE3Hc0lDr9TLIQpbwaugJyA15DxmbQyRryYj1xhT2uw9Yq6lmc
         WqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794295561; x=1794900361;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVur5LhTJoFv66K/FHeEGJ1JCwZsBRUToYym0WGroXg=;
        b=Hj1lP7pAX3FWdVeFlxWbwBD1Oq+bxXcmHNcg4K8SSzyaAkWsRd2pCWQ/pXZmWrDZB7
         vxMIEc9GEyUebIE8TL5Z7EVcUrId9qPqTSk6UH0Z0b8Zb20nbl5p0YzT5zcH/MGWbpYA
         auYGVxb0YQKKY2u8Y3HwNIciPEq/ph7EglgsSqf2wB628PxXx5TSJuT4eB6Kt62ZIpRz
         0+QxfRT7Jkgj8UVBqXtVWf37ksd0zhs6JAxZ+rLlXpZsc3/UhB5eILCHZVjZNFzTM7RT
         bxyMWM4VMT8t1dpNAGr6vbjQBkI9eaiAUuBzojGp/n7BvqNChj3TiKBMGKW2wv49ZnmW
         oWEA==
X-Forwarded-Encrypted: i=1; AL+hErFs63dl528rJGCVzTSSklhxceq8NSCx+inMF7DlZMvOZrWnv3a8P0Gtf/S/34pPCnLbOGBrrQzLtVs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/FaCYU+nOLGpU0EZfXNCCby1M1wj9NMB+uPp939YPDYtqwk159
	SdlOHVM6Roo22Prgz3dBrSUwe77onYVAJ7IiDdD2d1qEVUghBeCFs2lv8pOXfXZzA3I=
X-Gm-Gg: AYBFou2P/MOVtgRFaG3tGIpweGY5zRsnmYu31MVcOqXvHActtuJDwlbCMWWKq2U+z+t
	viSQpR0pZPJCFAIOvIYOK9vLhdiEv5mY400jxn/6qkI2X0BpMQEVd9rIHzASJ7Np6IautNmMMku
	vSJRMy821UugYnxF6juLNkecGuz7TDNiwbwgczwf1CQ/EWRqPDcV8ApFd6var/jsQfNnSUqbASn
	fOcTrvZmid9sbKP6dPnfMvaZijBHgMBxnC4+Zqn/m7kzge3vo5Ei9ptFNKxCFjOKxnrsmIvv/oz
	rBUI/gbLJg/g21Gw8t3k9UJZrIQRzAT0DMbyGGlVCNfvmUbvY9YfOIRKWa32d5/Oa4HmyFDajZf
	HpNBFDtPxITbsdHDD9W6yCaqyuRJ8hHSGTnxf/+eEoaHjSsW0pW7RpjI/wMi5KzBDlpcmejyu1T
	S0EZWqVFSBfzKFGaVDcXuoHuOxWKKhZUY2pBSmGCl4P+oKDoLmxycHXlUQ9/tj9akp+3czPKbNv
	ia6nAH+Vab4COvH7kqLnNB6MwIbV7sxD7Tmlb/k2pEGpHTfFTyaC24QNvedaoLxuKEGu6KmSogW
	P1jO0Q7omxc9vW3Ue1sZe/wV2nLIUG0TSPTFBwRMyP+bUzRWsRtCTN5em/1HaAdphmX1e4ngiu2
	+iU63NLEfD7n29JzcvYnB1cSduJTqkWh3OAzB+k9wImoFt5oZdJfrxyURUq9phz73GGgG9Gz/
X-Received: by 2002:a17:906:eecb:b0:c40:4965:72bd with SMTP id a640c23a62f3a-c50494e70c5mr127676966b.19.1794295560623;
        Mon, 09 Nov 2026 23:26:00 -0800 (PST)
Message-ID: <b67abdc3-f234-49ce-b463-1e06e87eccf8@suse.com>
Date: Tue, 10 Nov 2026 08:25:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
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
In-Reply-To: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EM4uW1evflvUIpHMy0e9UjZp"
X-purgate-ID: tlsNG-33051d/1794295561-6E6CE4E9-1FE3FAC2/35/110847
X-purgate-type: clean
X-purgate-size: 5538
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EM4uW1evflvUIpHMy0e9UjZp
Content-Type: multipart/mixed; boundary="------------Yi2633bQOqoh05egSSnPXUpZ";
 protected-headers="v1"; hp="clear"
Message-ID: <b67abdc3-f234-49ce-b463-1e06e87eccf8@suse.com>
Date: Tue, 10 Nov 2026 08:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
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
In-Reply-To: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>

--------------Yi2633bQOqoh05egSSnPXUpZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjYgMDg6MTQsIE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgd3JvdGU6DQo+
IHNldF9ldnRjaG5fdG9faXJxKCkgYWxsb2NhdGVzIGEgcGFnZSBmb3IgdGhlIGV2ZW50IGNo
YW5uZWwgdG8gSVJRDQo+IG51bWJlciBzb2Z0d2FyZSBsb29rdXAgdGFibGUgYW5kIHhlbl9p
bml0X0lSUSgpIGFsbG9jYXRlcyB0aGUgUElSUSBFT0kNCj4gYml0bWFwIHRoYXQgaXMgcmVn
aXN0ZXJlZCB3aXRoIHRoZSBoeXBlcnZpc29yIGluIFBWIGRvbWFpbnMuDQo+IA0KPiBUaGVz
ZSBidWZmZXJzIGNhbiBiZSBhbGxvY2F0ZWQgd2l0aCBrbWFsbG9jKCkgYXMgdGhlcmUncyBu
b3RoaW5nIHNwZWNpYWwNCj4gYWJvdXQgdGhlbSB0byBnbyBkaXJlY3RseSB0byB0aGUgcGFn
ZSBhbGxvY2F0b3IuIFRoZSBQSVJRIEVPSSBiaXRtYXAgaXMNCj4gcGFzc2VkIHRvIHRoZSBo
eXBlcnZpc29yIGJ5IGl0cyBmcmFtZSBudW1iZXIgYW5kIG11c3Qgb2NjdXB5IGEgd2hvbGUN
Cj4gcGFnZSwgd2hpY2ggaXMgZ3VhcmFudGVlZCBmb3IgYSBQQUdFX1NJWkUga21hbGxvYygp
IGFsbG9jYXRpb24gYXMgaXQgaXMNCj4gbmF0dXJhbGx5IGFsaWduZWQuDQo+IA0KPiBrbWFs
bG9jKCkgcHJvdmlkZXMgYSBiZXR0ZXIgQVBJIHRoYXQgZG9lcyBub3QgcmVxdWlyZSB1Z2x5
IGNhc3RzIGFuZA0KPiBrZnJlZSgpIGRvZXMgbm90IG5lZWQgdG8ga25vdyB0aGUgc2l6ZSBv
ZiB0aGUgZnJlZWQgb2JqZWN0Lg0KPiANCj4gUGVyZm9ybWFuY2UgZGlmZmVyZW5jZSBiZXR3
ZWVuIGttYWxsb2MoKSBhbmQgX19nZXRfZnJlZV9wYWdlcygpIGlzIG5vdA0KPiBtZWFzdXJh
YmxlIGFzIGJvdGggYWxsb2NhdG9ycyB0YWtlIGFuIG9iamVjdC9wYWdlIGZyb20gYSBwZXIt
Q1BVIGxpc3QgZm9yDQo+IGZhc3QgcGF0aCBhbGxvY2F0aW9ucy4NCj4gDQo+IEZvciB0aGUg
c2xvdyBwYXRoIHRoZSBwZXJmb3JtYW5jZSBpcyBhbnl3YXkgZGV0ZXJtaW5lZCBieSB0aGUg
YW1vdW50IG9mDQo+IHJlY2xhaW0gaW52b2x2ZWQgcmF0aGVyIHRoYW4gYnkgd2hhdCBhbGxv
Y2F0b3IgaXMgdXNlZC4NCj4gDQo+IFJlcGxhY2UgdXNlIG9mIF9fZ2V0X2ZyZWVfcGFnZXMo
KSB3aXRoIGttYWxsb2MoKSwgX19nZXRfZnJlZV9wYWdlKCkgd2l0aA0KPiBfX0dGUF9aRVJP
IHdpdGgga3phbGxvYygpIGFuZCBmcmVlX3BhZ2Vbc10oKSB3aXRoIGtmcmVlKCkuDQo+IA0K
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjM1NDA1ZTQtOTQyMy00YTI1
LWE2ZTctZTAzYzhlYTBiY2JlQHJlZGhhdC5jb20NCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBS
YXBvcG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------Yi2633bQOqoh05egSSnPXUpZ--

--------------EM4uW1evflvUIpHMy0e9UjZp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmryxwcFAwAAAAAACgkQsN6d1ii/Ey+K
AAf8C1MTN/9OTck7FwQ3t4PikfL6XxlBCTguh5pnn+XNtKkgbFvaAl26KbqsNDq4Egql3ZmgZZWC
paO5EYc8G75rASCelZYAQfSQKB3nTpgwiayf5hMeng2ctPr5OIgyyyio+dv/1CxtW/LHXR9KLfVw
5R+HkZRUjZ1yHvS5+lVN15yGXa93Ieul1NfGzmjSPBKfNobHPKLiUo3QIu8s+KTPcSDmaktt99lr
iH738+5hCNflKljXbvBlxRByHIlTSQ6UgINKd3G8zwt1cRPf+4wMgtJ0d2riY2wAq7K9pg23xMsp
1BbUY9oLWgVcH0jorlzfwPHe7TUbICLgc3iQLsAopg==
=dDBY
-----END PGP SIGNATURE-----

--------------EM4uW1evflvUIpHMy0e9UjZp--

