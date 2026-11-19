Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E3606A335
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L+iJBf4X
Received: from list by lists.xenproject.org with outflank-mailman.1496134.1694774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0Ml-0001tW-Pk; Thu, 19 Nov 2026 11:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496134.1694774; Thu, 19 Nov 2026 11:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0Ml-0001tP-My; Thu, 19 Nov 2026 11:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1496134;
 Thu, 19 Nov 2026 11:31:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xU0Mk-0001tJ-CP
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:31:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0Mj-001eBu-9o
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:31:45 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6afede17-bab6-0a2a0a5309dd-0a2a4502a2aa-34
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:31:45 +0100
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6afede20-4900-0a2a45020019-d155d0b1a5a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:31:45 +0100
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3adff684a52so10039951fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:31:44 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65100bf42sm9635693f8f.1.2026.11.19.03.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 03:31:43 -0800 (PST)
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
        d=suse.com; s=google; t=1795087904; x=1795692704; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AsZOqw+RjehPnat3HVu29yyYW1txbS+qRZmDAN5kaAs=;
        b=L+iJBf4X9AHJl3RqWt8vtPmEjtnnSd8Up9KY1OfbUnV+Hm2tIjwl9LRiB9fVokX6Kt
         pukstetUeuoH47KlElIRqlc+fnKBil1Rw2oEKIWbSY2lHpZVb9/RY3JL9DJgzf3Ut5fM
         eVUU5a6Qh8WA+tJmjTPlWrqPkWAxYJljf6o9538m2k6W12NesMwhZmzXn7HIorK/ztwV
         AYdAvL2KHivvw/PT4UDLJG/POS2AVEj0V+R5MyHLJIgeoq3wNimsaZoLyeDKvz4Nb7LN
         /CmkTIrU+zJEk4o+r3ADMK0fci8s2u4Zsf+shakWY2ZMPDiL0P96nGotxVYYMFS80ly8
         pe9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087904; x=1795692704;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsZOqw+RjehPnat3HVu29yyYW1txbS+qRZmDAN5kaAs=;
        b=q2SDjm5nOR4e2YzdNN+TAfDs5gsbu0OwiAM0gLndBZ/qAB9Zwo/AYeiMdbZzTUid8V
         bi0W4MJf7vuIFeowGU7K84XM1UiRJQgmAAMXETdxTmJq632XFgOuRBIggNtM5HVHJnvB
         zPmvmnwrXhzMtq9+KpYy+HDA5udR5CIIDys717F3ub83zT9A4PVVSTzURUp+qWbXr7qF
         8sWTejSPhBQa+3VizlTfrsa5Ox+7MVokSnJOlsvDVGpJJqSHwT0Rvjzb15/OlzJ7dfA2
         LAMJ1WSupKbEzbqALjVV0/TMoZeqpBnd4fzT0wxrJl1qI5bpO0FESrNS4cetZFAOdZvG
         ACsA==
X-Gm-Message-State: APuU4Z8U09ZiOsbonZ1kqLK7ChpHLqVA5ssrNgIA1NwCtTmN3cm5f7FV
	mKfBFjUnoOMRdxWr8be37ykA66MxZxEUApZWI/8G+NiAhLFG7A+7TX1Bvc2gVid0Tsg=
X-Gm-Gg: AYBFou1cest35gtPxxYM6yMkh3inQWqvUstRXhGMTsmIfgyI9idjht12n7J7CFrbDc0
	vfCeUeEYj5d+/YCTaLeXZsISsePPm3ljIpmyPiE9acIXinmjAPI5vSgGvUP7pR9/tVvGeV+KSZm
	fmAgBa/htaC1m1HDnanSJXxG/G0fG6VNC87LoR3tEJRLqoqy+0Pj8UfFOM93h7/HnMxEAExwWsH
	NgjPKy4+uQV2VvMNidf1PkkmHhX6UB9Ru7DsIllL/vP3uu4dH5o4Z5fjzA3Ax4ERcVUa4MJpdw5
	bQgRsI1amW3Ck6x1MaRJSNBbbhj4qS+0Px0PQiKimso8zZuWf8XFBNYh4iuk/S9kU+3NLhGtqqp
	P//l0t0Roa1MEYpsEnSrl2tt7y93BTloEDN2Un9LVxaiULUteP3tJthtt1yWPg03JMhdpm6rDKj
	OQoKIUKWLKOllbSfDOr/g/q+HxWl3ENcxM1jRzGEuB0KtWbebhZcP2W7aL7W7+HrAF9nnqPp2i1
	jer4QxXldNMe2XNdgV7kXN8BrrMG58DXroyLpFUHgaU8O3bf41PiUFazkQ8a/eHmOZiLgOy234+
	6kwcjhCL4Rr49pH9gJXciGV/OfAphWr0hrQ/gxMEDxA/hk8qL9We5jh65vQGJXOcdDWz0R8rmJI
	tuwKZImumimdm1MW0tiQEJhm8NyDr5d0m465myQ/9ocQAAdSP5ZxZRMDf0l7Po70Z9emqUqdp
X-Received: by 2002:a2e:9a10:0:b0:3ae:25db:8a0f with SMTP id 38308e7fff4ca-3ae7b7b7e94mr2899851fa.6.1795087904201;
        Thu, 19 Nov 2026 03:31:44 -0800 (PST)
Message-ID: <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
Date: Thu, 19 Nov 2026 12:31:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykola Kvach <Mykola_Kvach@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com>
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
In-Reply-To: <87cxs2oqjc.fsf@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zDCKj6ltjbKbGPyrXLLTVJmp"
X-purgate-ID: tlsNG-720697/1795087905-F379D6C6-953DCDEA/35/110847
X-purgate-type: clean
X-purgate-size: 6569
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zDCKj6ltjbKbGPyrXLLTVJmp
Content-Type: multipart/mixed; boundary="------------ie1OCEbZMCRMQ2hCl0KMbApy";
 protected-headers="v1"; hp="clear"
Message-ID: <b0a0df43-4402-4332-bc64-a89354c3bf91@suse.com>
Date: Thu, 19 Nov 2026 12:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykola Kvach <Mykola_Kvach@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1794873792.git.mykola_kvach@epam.com>
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com>
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
In-Reply-To: <87cxs2oqjc.fsf@epam.com>

--------------ie1OCEbZMCRMQ2hCl0KMbApy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTEuMjYgMDI6NTEsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiBIaSwNCj4g
DQo+IENDJ2VkIEp1ZXJnZW4sIGJlY2F1c2UgSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgY3B1
cG9vbHMuDQo+IA0KPiBNeWtvbGEgS3ZhY2ggPE15a29sYV9LdmFjaEBlcGFtLmNvbT4gd3Jp
dGVzOg0KPiANCj4+IFdoZW4gYSBDUFUgZmFpbHMgdG8gY29tZSBiYWNrIGR1cmluZyBzeXN0
ZW0gcmVzdW1lLCBjcHVfdXAoKSBzZW5kcw0KPj4gQ1BVX1VQX0NBTkNFTEVELiBBZnRlciB0
cnlpbmcgdGhlIG90aGVyIENQVXMsIGVuYWJsZV9ub25ib290X2NwdXMoKQ0KPj4gc2VuZHMg
Q1BVX1JFU1VNRV9GQUlMRUQgZm9yIHRoZSBzYW1lIENQVS4NCj4+DQo+PiBPbiBhcmNoaXRl
Y3R1cmVzIHdoaWNoIGRvIG5vdCBwYXJrIG9mZmxpbmUgQ1BVcywgYm90aCBub3RpZmljYXRp
b25zDQo+PiBxdWV1ZSBmcmVlX3BlcmNwdV9hcmVhKCkuIFRoZSByZWxlYXNlIG1ldGFkYXRh
LCBpbmNsdWRpbmcgdGhlIHJjdV9oZWFkLA0KPj4gaXMgc3RvcmVkIGluIHRoYXQgQ1BVJ3Mg
cGVyLUNQVSBhcmVhLiBUaGUgZmlyc3QgY2FsbGJhY2sgbWF5IGFscmVhZHkNCj4+IGhhdmUg
ZnJlZWQgdGhlIGFyZWEgd2hlbiB0aGUgc2Vjb25kIG5vdGlmaWNhdGlvbiBhcnJpdmVzLCBv
ciB0aGUgc2FtZQ0KPj4gcmN1X2hlYWQgbWF5IGJlIHF1ZXVlZCB0d2ljZS4gVGhlIENQVV9S
RVNVTUVfRkFJTEVEIGNhbGxiYWNrcyBhbHNvIG5lZWQNCj4+IHRoZSBhcmVhIHRvIGNsZWFu
IHVwIHRpbWVycyBhbmQgQ1BVLXBvb2wgc3RhdGUuDQoNCkkgZG9uJ3Qgc2VlIHdoeSBDUFVf
UkVTVU1FX0ZBSUxFRCB3b3VsZCBmcmVlIHBlcmNwdSBkYXRhIHR3aWNlLg0KRXZlbiBDUFVf
VVBfQ0FOQ0VMRUQgZHVyaW5nIHJlc3VtaW5nIHNob3VsZG4ndCBjYXVzZSBhIGZyZWUgb2Yg
cGVyY3B1DQpkYXRhLg0KDQpXaGVuIENQVV9SRVNVTUVfRkFJTEVEIGlzIHNpZ25hbGVkLCBz
eXN0ZW1fc3RhdGUgc2hvdWxkIHN0aWxsIGJlDQpTWVNfU1RBVEVfc3VzcGVuZC4gT3IgYW0g
SSBvdmVybG9va2luZyBzb21ldGhpbmcgaGVyZT8NCg0KPiANCj4gQSBiaXQgY29udm9sdXRl
ZC4gQXMgSSBzZWUsIHByb2JsZW0gaXMgY2F1c2VkIGJ5IHRoZSBmYWN0DQo+IENQVV9VUF9D
QU5DRUxFRCBpcyBhIHRlcm1pbmFsIHN0YXRlIGluIGEgInNpbXBsZSIgQ1BVIHVwIHNlcXVl
bmNlLCBidXQNCj4gaXMgYSB0cmFuc2llbnQgc3RhdGUgaW4gYSBzeXN0ZW0gcmVzdW1lIHNl
cXVlbmNlLiBBcyBzdWNoLCB0aGVvcmV0aWNhbGx5DQo+IG90aGVyIHBlcl9jcHUgY2FsbGJh
Y2tzIG1pZ2h0IGhhdmUgYSBzaW1pbGFyIGlzc3VlIHdoZW4gdGhleSBkb24ndA0KPiBleHBl
Y3Qgb25lIG1vcmUgIkNQVSBzdGF0ZSBpcyBiYWQiIGNhbGxiYWNrLiBJIGNhbiBzZWUgdGhh
dA0KPiBjb21tb24vdGltZXIuYyBhbHNvIHRyaWVzIHRvIGhhbmRsZSBib3RoIGNhbGxiYWNr
cyBhcyB0ZXJtaW5hbA0KPiBvbmVzLiBQcm9iYWJseSwgeW91IG5lZWQgYSBzaW1pbGFyIGZp
eCB0aGVyZSBhcyB3ZWxsLg0KPiANCj4gQWN0dWFsbHksIEkgYW0gbm90IHN1cmUgd2h5IGRv
IHdlIG5lZWQgQ1BVX1JFU1VNRV9GQUlMRUQgaW4gdGhlIGZpcnN0DQo+IHBsYWNlLiBBcyBJ
IGNhbiBzZWUsIG9ubHkgY3B1cG9vbCBoYW5kbGVzIGl0IGluIGEgc2Vuc2libGUgd2F5LiBX
aGljaA0KPiBiZWdzIGEgcXVlc3Rpb246IHdoeSBjcHVwb29sIGNhbid0IGNhbGwgY3B1cG9v
bF9jcHVfcmVtb3ZlX2ZvcmNlZCgpIG9uDQo+IENQVV9VUF9DQU5DRUxFRCBpbnN0ZWFkPw0K
VGhlIGRpZmZlcmVuY2UgaXMgZm9yIHRoZSBjYXNlIG9mIHBhcmtlZCBjcHVzOiBDUFVfVVBf
Q0FOQ0VMRUQgbWlnaHQgYmUNCmNhbGxlZCBmb3IgcGFya2VkIGNwdXMgbm90IGNvbWluZyB1
cCwgd2hpbGUgQ1BVX1JFU1VNRV9GQUlMRUQgd2lsbCBvbmx5DQpiZSB1c2VkIGZvciBub24t
cGFya2VkIGNwdXMuDQoNCg0KSnVlcmdlbg0K

--------------ie1OCEbZMCRMQ2hCl0KMbApy--

--------------zDCKj6ltjbKbGPyrXLLTVJmp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr+3h8FAwAAAAAACgkQsN6d1ii/Ey+o
mAf/QOYEuwQTYAlSexUKXLYluUMw7um83HtjjU7JyAxqGEjwIrXfSiViILwMtxRMtdpzn+WYJMMp
x7Y0lsNfBqoNLa35iqJTDZwFeK+0aNk53550p3JKmRm7jTrfmYN/Xhv8/c0F2N7PYh+5QdhD/QhE
nj31pydneZfY/wkXvWekhThUSd438anlus3p+JKLFLPg0Obf8AAeaFhB5b9pOP5KcdQMFYdPwXi7
57XWggiuzZmncx7zQMogCOwwtcQ3bLyGNYm4XPOEZTnLnRXIeZ8HCAFoEy9vlEUVWGyMMEowWjH3
i+hvpBRfvNXroNUK5d056ca0Hv1NeHR++l/PeYYFYw==
=nCP0
-----END PGP SIGNATURE-----

--------------zDCKj6ltjbKbGPyrXLLTVJmp--

