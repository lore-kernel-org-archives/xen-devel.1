Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93392606A320
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aEnAR0la
Received: from list by lists.xenproject.org with outflank-mailman.1483166.1686716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR3Bk-0005bm-2A; Wed, 11 Nov 2026 07:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483166.1686716; Wed, 11 Nov 2026 07:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR3Bj-0005bf-Ve; Wed, 11 Nov 2026 07:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1483166;
 Wed, 11 Nov 2026 07:56:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xR3Bi-0005bZ-LC
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 07:56:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR3Bi-002kQf-1d
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 08:56:10 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af41f71-2eae-0a2a0a5409dd-0a2a4509ed02-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 08:56:09 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af41f99-be1a-0a2a45090019-d1558032d4ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 08:56:09 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so26299125e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 23:56:09 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0203a6b0sm132759125e9.5.2026.11.10.23.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 23:56:08 -0800 (PST)
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
        d=suse.com; s=google; t=1794383769; x=1794988569; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0Vaf0OWgV65b40bb86pOZzRhH7cFTFGJOK7iQMFsxQ=;
        b=aEnAR0laXvK2H66AQZFOZwfRbtmsyXBDG0OjwrAsHztyN6adMBw987DICqTBro0GnQ
         78YlrbR30rkNxpo6gal9EJoB+bXi0w/FYj0mJfmuGP927qSHVvUydVGh/zkMBrsaJpaw
         atPRm5GeejBw82n8XO/S00sQVD/2bpLSgK5tzbD9I2nMcvDN+r/+mgnZMdYeA+teCzRZ
         yDlhMxs28iws/un3SpIbMf7Omx+8d6wCeD1hB5Ky+fzZjEXYlgmE5GsCRxR8I0Z90ksZ
         DxQsoy3wTSyepxq/wCfa+8TWzlJdqs4GNuwrsO0opcFvwKKgk0UaxmlOsUMDPkjP/gCG
         mTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383769; x=1794988569;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0Vaf0OWgV65b40bb86pOZzRhH7cFTFGJOK7iQMFsxQ=;
        b=uw4B7AkMoZVDjerFr4A1xFFs3VNgtctmgBBrOMg3zmmHtcxO/xtfp4BakqA1tmXa2G
         XiG684NP/1nWKWU8sVLztWJK2UjkUfESQoGU3YM5dCYuSNKEoXq8jiTjahdvhcqehS+E
         eLeC3h6sOtvD2gnGpR8Q80SqFOCR6I3fCifgijmhZy7n5uqSBbNtPUkmXuBpec/7S1Y8
         mmC33n+zZ2p3ZvwF8eWN4aV0zj+d0Fi5VJTTl4iaH4szgezmd5jn2J+StxeHAUiT9IC5
         wWkSaDSWhRheSvsbA9V58ipJ6O3hd7SGmT16QIg4D3Hb/w+g5z9ltb9jWHUmZdmLKli0
         twDA==
X-Gm-Message-State: APuU4Z9oIqWAt3YO2FXroKUfuV4dN9a25uWfEC2JS5vxvb3A+hd4VcYV
	kuwMRo9q9xKYZTDFSguOXyoA2hiZ4L3yu0E1hptFjBC+SvyLu0WbJjBvKS9prARHCVk=
X-Gm-Gg: AYBFou3gPNJs/85B9bR1J29NpgZ4hi8puetS82MHfQuSSbG2ghGbpcecr3IQOk7nfvM
	6SjGFu824JX/wnZOQu50f8T1m0I+RHeo16J/wo4CQWj/r/uhd7CRxGffn2cjvLlZpobWy3g6ce9
	4YIV9wIgLPqSWjwYVpmAQEqYmDaaNHo4SpVpeUDzoeAJWkb183vISTqhvq7QjH5tZTmCEUxJJ5j
	cVhSlWg4uJU1KySfX5s0T+qC16jpLckNXAmzbh74Vk9rI79MzDQdPCe13GPbv1CtiVt9Cj0bzHD
	PpPTeFikqEUaroRk+lL5OLrTA58F1jvg1E99fKZvF/I9mABgoKKuHex5/bxqnn7z+nhJ1ghZO2z
	CDsDuj4+Rmp5i29fQtcHG+pyZPEwckoPfqeSdgdYt/KuN0J1Mje03QRdXyTLXfwVQGY0tS3J9Ko
	LfCH3PKcKelns+8NSLPU2dyvgCezOaY45KtY6fNOJyWOMp7IkxVQa6xSBJyu7bYNLIxFuaZEBA3
	qimRz4Nam99J+1yaWZCPUcMpEFKTllVAyHnSkb/Do78UuQw8nMu+PTRhTiV30bSE4y4mgLgdNaq
	trFRxx7q1HiSSg5x/4JTXcc52eNuNMfsMEHKQeYX1aCT8790/joL/RMBkVshYhDFaVBEZbAqK/v
	uZbdSClCF27KWqID1Ej+MiiGGSgwHnZ3Z/WA6wmo42ax+FNtPFLg=
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr30425115e9.29.1794383769213;
        Tue, 10 Nov 2026 23:56:09 -0800 (PST)
Message-ID: <e42561ed-cd58-4ad8-a5a6-26f9f0b65f0c@suse.com>
Date: Wed, 11 Nov 2026 08:56:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix lazy MMU pause count wrap-around
To: "M. Vefa Bicakci" <m.v.b@runbox.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261102-xen-lazy-mmu-v1-1-d99a3050b76d@runbox.com>
 <36064075-fbf0-40ac-8448-60bd36ad2a28@suse.com>
 <d2577859-1468-4892-af5b-7912aabd402a@runbox.com>
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
In-Reply-To: <d2577859-1468-4892-af5b-7912aabd402a@runbox.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EMnSocGpP04TlxlB09ymaZJw"
X-purgate-ID: tlsNG-bad1c0/1794383769-3AAD8034-9B7F639E/35/110847
X-purgate-type: clean
X-purgate-size: 14167
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EMnSocGpP04TlxlB09ymaZJw
Content-Type: multipart/mixed; boundary="------------I6Qouo7kO2ONsbd0kI55lGMT";
 protected-headers="v1"; hp="clear"
Message-ID: <e42561ed-cd58-4ad8-a5a6-26f9f0b65f0c@suse.com>
Date: Wed, 11 Nov 2026 08:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix lazy MMU pause count wrap-around
To: "M. Vefa Bicakci" <m.v.b@runbox.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261102-xen-lazy-mmu-v1-1-d99a3050b76d@runbox.com>
 <36064075-fbf0-40ac-8448-60bd36ad2a28@suse.com>
 <d2577859-1468-4892-af5b-7912aabd402a@runbox.com>
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
In-Reply-To: <d2577859-1468-4892-af5b-7912aabd402a@runbox.com>

--------------I6Qouo7kO2ONsbd0kI55lGMT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTEuMjYgMTk6NDIsIE0uIFZlZmEgQmljYWtjaSB3cm90ZToNCj4gT24gMjAyNi0x
MS0wOSAwMTo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gDQo+PiBPbiAwMi4xMS4yNiAx
NjozMSwgTS4gVmVmYSBCaWNha2NpIHdyb3RlOg0KPj4+IENvbW1pdCBiZWM2ZjQxYTZmZTUg
KCJ4ODYveGVuOiBHZXQgcmlkIG9mIGxhc3QgWEVOX0xBWllfTU1VIHVzZXMiKQ0KPj4+IHVu
aW50ZW50aW9uYWxseSBwcmV2ZW50cyB0aGUgYWN0aXZhdGlvbiBvZiBsYXp5IE1NVSBtb2Rl
IGZvciBtb3N0IHRhc2tzDQo+Pj4gcnVubmluZyBvbiBYZW4gUFYgVk1zIChpbmNsdWRpbmcg
ZG9tMCkuDQo+Pj4NCj4+PiBUaGF0IGNvbW1pdCBtYWRlIHhlbl9lbmRfY29udGV4dF9zd2l0
Y2goKSBjYWxsDQo+Pj4gX190YXNrX2xhenlfbW11X21vZGVfcmVzdW1lKCkgd2l0aCB0aGUg
dGFzayBiZWluZyBzd2l0Y2hlZCB0by4gSG93ZXZlciwNCj4+PiB0aGUgbGF0dGVyIGZ1bmN0
aW9uIGRlY3JlbWVudHMgdGhlIHBhdXNlX2NvdW50IGZpZWxkIG9mIHRoZSB0YXNrIHdpdGhv
dXQNCj4+PiBjaGVja2luZyB3aGV0aGVyIHRoYXQgdGFzaydzIGxhenkgTU1VIG1vZGUgd2Fz
IHBhdXNlZCBvciBub3QuIEEgdGFzaw0KPj4+IGJlaW5nIHN3aXRjaGVkIHRvIGZvciB0aGUg
Zmlyc3QgdGltZSBoYXMgbmV2ZXIgYmVlbiBzd2l0Y2hlZCBmcm9tLCBzbw0KPj4+IGF0dGVt
cHRpbmcgdG8gcmVzdW1lIGxhenkgTU1VIG1vZGUgY2FuIHdyYXAtYXJvdW5kICh1bmRlcmZs
b3cpIHRoZQ0KPj4+IHBhdXNlX2NvdW50IGZyb20gMCB0byAyNTUgKFU4X01BWCkuDQo+Pj4N
Cj4+PiBGdXJ0aGVybW9yZSwgdGhlIG5vbi16ZXJvIHBhdXNlX2NvdW50IGlzIGNvcGllZCB0
byBjaGlsZCB0YXNrcyBhdCBmb3JrLA0KPj4+IHNvIGFsbCBkZXNjZW5kYW50cyAoaW5jbHVk
aW5nIHRoZSBpZGxlIHRhc2tzIG9mIHRoZSBub24tYm9vdCBDUFVzKQ0KPj4+IGluaGVyaXQg
dGhlIG5vbi16ZXJvIHBhdXNlX2NvdW50LiBUaGlzIHByZXZlbnRzIGVuYWJsaW5nIGxhenkg
TU1VIG1vZGUNCj4+PiBmb3IgdGhlbSwgYmVjYXVzZSBsYXp5X21tdV9tb2RlX2VuYWJsZSgp
IGRvZXMgbm90IGRvIGFueXRoaW5nIHdoZW4NCj4+PiBwYXVzZV9jb3VudCBpcyBub24temVy
by4NCj4+Pg0KPj4+IEhlbmNlLCBjYWxsIF9fdGFza19sYXp5X21tdV9tb2RlX3Jlc3VtZSgp
IGZyb20geGVuX2VuZF9jb250ZXh0X3N3aXRjaCgpDQo+Pj4gb25seSBpZiBsYXp5IE1NVSBt
b2RlIHdhcyBwYXVzZWQuDQo+Pj4NCj4+PiBUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIHdp
dGggQ09ORklHX0RFQlVHX1ZNPXksIHdoaWNoIGVuYWJsZXMNCj4+PiBwYXVzZV9jb3VudCB1
bmRlcmZsb3cgYW5kIG92ZXJmbG93IHdhcm5pbmdzLiBJbiB0aGUgZXhhbXBsZXMgcXVvdGVk
DQo+Pj4gYmVsb3csIHRoZSBmaXJzdCB3YXJuaW5nIHNob3dzIHRoZSB1bmRlcmZsb3cgd2l0
aCBQSUQgMS4gVGhlIHNlY29uZA0KPj4+IHdhcm5pbmcgc2hvd3MgdGhlIG92ZXJmbG93IGZy
b20gMjU1IChVOF9NQVgpIHRvIDAsIGFsc28gZm9yIFBJRCAxLCBhcw0KPj4+IGluZGljYXRl
ZCBieSB0aGUgc2FtZSBSREkgcmVnaXN0ZXIgdmFsdWUuDQo+Pj4NCj4+PiBFeGFtcGxlIHBh
dXNlX2NvdW50IHVuZGVyZmxvdyB3YXJuaW5nOg0KPj4+DQo+Pj4gICAgIFdBUk5JTkc6IGlu
Y2x1ZGUvbGludXgvcGd0YWJsZS5oOjM2MiBhdCB4ZW5fZW5kX2NvbnRleHRfc3dpdGNoKzB4
NGUvMHg2MCwgQ1BVIzA6IHN3YXBwZXIvMC8wDQo+Pj4gICAgIENQVTogMCBVSUQ6IDAgUElE
OiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA3LjIuNC0xICMyIFBSRUVNUFQoZnVs
bCkNCj4+PiAgICAgUklQOiBlMDMwOnhlbl9lbmRfY29udGV4dF9zd2l0Y2grMHg0ZS8weDYw
DQo+Pj4gICAgIC4uLg0KPj4+ICAgICBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAw
MDAwMDAwMDAwMDAwIFJESTogZmZmZjg4ODAwNDkzMDAwMA0KPj4+DQo+Pj4gTm90ZTogVGhl
IFBJRCBpcyBzaG93biBhcyAwIGFib3ZlLCBiZWNhdXNlIGN1cnJlbnRfdGFzayBpcyB1cGRh
dGVkIGluDQo+Pj4gX19zd2l0Y2hfdG8oKSBhZnRlciBhcmNoX2VuZF9jb250ZXh0X3N3aXRj
aCgpLiBhcmNoX2VuZF9jb250ZXh0X3N3aXRjaCgpDQo+Pj4gY2FsbHMgeGVuX2VuZF9jb250
ZXh0X3N3aXRjaCgpIGluZGlyZWN0bHkuDQo+Pj4NCj4+PiBFeGFtcGxlIHBhdXNlX2NvdW50
IG92ZXJmbG93IHdhcm5pbmc6DQo+Pj4NCj4+PiAgICAgV0FSTklORzogaW5jbHVkZS9saW51
eC9wZ3RhYmxlLmg6MzE5IGF0IHhlbl9zdGFydF9jb250ZXh0X3N3aXRjaCsweDY0LzB4NzAs
IENQVSMwOiBzd2FwcGVyLzAvMQ0KPj4+ICAgICBDUFU6IDAgVUlEOiAwIFBJRDogMSBDb21t
OiBzd2FwcGVyLzAgVGFpbnRlZDogRyAgICAgICAgVyAgNy4yLjQtMSAjMiBQUkVFTVBUKGZ1
bGwpDQo+Pj4gICAgIC4uLg0KPj4+ICAgICBSSVA6IGUwMzA6eGVuX3N0YXJ0X2NvbnRleHRf
c3dpdGNoKzB4NjQvMHg3MA0KPj4+ICAgICAuLi4NCj4+PiAgICAgUkRYOiAwMDAwMDAwMDAw
MDAwMDAwIFJTSTogMDAwMDAwMDAxM2Y3ODk0ZCBSREk6IGZmZmY4ODgwMDQ5MzAwMDANCj4+
PiAgICAgLi4uDQo+Pj4gICAgIENhbGwgVHJhY2U6DQo+Pj4gICAgICA8VEFTSz4NCj4+PiAg
ICAgIF9fc2NoZWR1bGUrMHgzNmEvMHgxYTkwDQo+Pj4gICAgICBzY2hlZHVsZSsweDI3LzB4
YTANCj4+PiAgICAgIHNjaGVkdWxlX3RpbWVvdXQrMHhiZC8weDEwMA0KPj4+ICAgICAgX193
YWl0X2Zvcl9jb21tb24rMHg5Ny8weDFiMA0KPj4+ICAgICAgd2FpdF9mb3JfY29tcGxldGlv
bl9raWxsYWJsZSsweDI0LzB4NDANCj4+PiAgICAgIF9fa3RocmVhZF9jcmVhdGVfb25fbm9k
ZSsweDEzZS8weDI0MA0KPj4+ICAgICAga3RocmVhZF9jcmVhdGVfd29ya2VyX29uX25vZGUr
MHhlZS8weDFjMA0KPj4+ICAgICAgd29ya3F1ZXVlX2luaXQrMHgyNi8weDQyMA0KPj4+ICAg
ICAga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMDEvMHgzNjANCj4+PiAgICAgIGtlcm5lbF9p
bml0KzB4MWEvMHgxMzANCj4+PiAgICAgIHJldF9mcm9tX2ZvcmsrMHgyYjAvMHgzNDANCj4+
PiAgICAgIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWEvMHgzMA0KPj4+ICAgICAgPC9UQVNLPg0K
Pj4+DQo+Pj4gRml4ZXM6IGJlYzZmNDFhNmZlNSAoIng4Ni94ZW46IEdldCByaWQgb2YgbGFz
dCBYRU5fTEFaWV9NTVUgdXNlcyIpDQo+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcg
IyA3LjIueA0KPj4+IFNpZ25lZC1vZmYtYnk6IE0uIFZlZmEgQmljYWtjaSA8bS52LmJAcnVu
Ym94LmNvbT4NCj4+PiAtLS0NCj4+PiA9PT0gVGVzdGluZyBub3RlcyA9PT0NCj4+PiBUaGlz
IGNvbW1pdCB3YXMgdGVzdGVkIHdpdGgga2VybmVsIHY3LjMtMTY3NTUtZ2QxMzVhYjQ1M2E3
NCBhbmQgdjcuNC1yYzENCj4+PiB3aXRoIGEgZG9tVSBQViBWTSwgYW5kIHZlcnNpb25zIGZy
b20gdjcuMi40IHRvIHY3LjIuMTQgd2l0aCBkb20wIGFuZA0KPj4+IGRvbVUgUFYgVk1zIHJ1
bm5pbmcgb24gWGVuIHY0LjE5LjUuIENPTkZJR19ERUJVR19WTT15IHdhcyBzZXQgZm9yIGFs
bA0KPj4+IHRlc3RzLCBhbmQgbm8gd2FybmluZ3Mgd2VyZSBvYnNlcnZlZC4NCj4+Pg0KPj4+
ID09PSBEZWJ1Z2dpbmcgbm90ZXMgPT09DQo+Pj4gRm9yIGRlYnVnZ2luZywgSSBpbnN0cnVt
ZW50ZWQgeGVuX3N0YXJ0X2NvbnRleHRfc3dpdGNoKCksDQo+Pj4geGVuX2VuZF9jb250ZXh0
X3N3aXRjaCgpIGFuZCBjb3B5X3Byb2Nlc3MoKSwgYW5kIEkgY29uZmlybWVkIHRoYXQgdGhl
DQo+Pj4gaW5oZXJpdGVkIHBhdXNlX2NvdW50IHZhbHVlIGlzIGRlY3JlbWVudGVkIGZvciBl
YWNoIGxldmVsIG9mIHRoZSBwcm9jZXNzDQo+Pj4gdHJlZSwgc3RhcnRpbmcgZnJvbSAyNTUu
DQo+Pj4NCj4+PiA9PT0gQ3JlZGl0cyA9PT0NCj4+PiBUaGUgcGF0Y2ggd2FzIGhhbmQtd3Jp
dHRlbiwgYnV0IHRoZSBjb21taXQgbWVzc2FnZSB3YXMgcG9saXNoZWQgd2l0aCBhDQo+Pj4g
ZmV3IHJvdW5kcyBvZiBMTE0gcmV2aWV3Lg0KPj4+IC0tLQ0KPj4+ICAgIGFyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5fcHYuYyB8IDEwICsrKysrKysrKy0NCj4+PiAgICBpbmNsdWRlL2xpbnV4
L3NjaGVkLmggICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jDQo+Pj4gaW5kZXggYzUxMTdhNzczMGQ2Li42OGY4YTk3Nzk5OWIg
MTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jDQo+Pj4gKysr
IGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jDQo+Pj4gQEAgLTQzMSw3ICs0MzEsMTUg
QEAgc3RhdGljIHZvaWQgeGVuX2VuZF9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKm5leHQpDQo+Pj4gICAgICAgICAgeGVuX21jX2ZsdXNoKCk7DQo+Pj4gICAgICAgIHRo
aXNfY3B1X3dyaXRlKHhlbl9jcHVfbGF6eV9tb2RlLCBmYWxzZSk7DQo+Pj4gLSAgICBfX3Rh
c2tfbGF6eV9tbXVfbW9kZV9yZXN1bWUobmV4dCk7DQo+Pj4gKw0KPj4+ICsgICAgLyoNCj4+
PiArICAgICAqIEEgbmV3bHkgY3JlYXRlZCB0YXNrIGNhbiBiZSBzd2l0Y2hlZCB0byB3aXRo
b3V0IGV2ZXIgaGF2aW5nIGJlZW4NCj4+PiArICAgICAqIHN3aXRjaGVkIGZyb20sIHNvIGl0
IHdpbGwgbm90IGhhdmUgYSBwcmlvciBsYXp5IE1NVSBwYXVzZSB0byB1bmRvDQo+Pj4gKyAg
ICAgKiBmcm9tIHhlbl9zdGFydF9jb250ZXh0X3N3aXRjaCgpLiBIZW5jZSwgcmVzdW1lIGxh
enkgTU1VIG9ubHkgaWYgaXQNCj4+PiArICAgICAqIHdhcyBwYXVzZWQuDQo+Pj4gKyAgICAg
Ki8NCj4+PiArICAgIGlmIChfX3Rhc2tfbGF6eV9tbXVfbW9kZV9wYXVzZWQobmV4dCkpDQo+
Pj4gKyAgICAgICAgX190YXNrX2xhenlfbW11X21vZGVfcmVzdW1lKG5leHQpOw0KPj4+ICAg
IH0NCj4+PiAgICAgIHN0YXRpYyB1bnNpZ25lZCBsb25nIHhlbl9zdG9yZV90cih2b2lkKQ0K
Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NjaGVkLmggYi9pbmNsdWRlL2xpbnV4
L3NjaGVkLmgNCj4+PiBpbmRleCAxYzkzZGE3NTIyNmUuLjNmOTM0MWYxZjgyNyAxMDA2NDQN
Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NjaGVkLmgNCj4+PiArKysgYi9pbmNsdWRlL2xp
bnV4L3NjaGVkLmgNCj4+PiBAQCAtMTc5MSw2ICsxNzkxLDI1IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBpc19sYXp5X21tdV9tb2RlX2FjdGl2ZSh2b2lkKQ0KPj4+ICAgICAgICAgIHJldHVy
biBfX3Rhc2tfbGF6eV9tbXVfbW9kZV9hY3RpdmUoY3VycmVudCk7DQo+Pj4gICAgfQ0KPj4+
ICsNCj4+PiArLyoqDQo+Pj4gKyAqIF9fdGFza19sYXp5X21tdV9tb2RlX3BhdXNlZCgpIC0g
UmV0dXJuIGEgdGFzaydzIGxhenkgTU1VIG1vZGUgcGF1c2Ugc3RhdGUNCj4+PiArICogQHRz
azogVGhlIHRhc2sgdG8gY2hlY2suDQo+Pj4gKyAqDQo+Pj4gKyAqIFRlc3Qgd2hldGhlciBA
dHNrIGhhcyBpdHMgbGF6eSBNTVUgbW9kZSBzdGF0ZSBzZXQgdG8gcGF1c2VkDQo+Pj4gKyAq
IChpLmUuLCBwYXVzZV9jb3VudCA+IDApLg0KPj4+ICsgKg0KPj4+ICsgKiBUaGlzIGZ1bmN0
aW9uIGlzIGludGVuZGVkIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgaW1wbGVtZW50IHRoZSBs
YXp5IE1NVQ0KPj4+ICsgKiBtb2RlOyBpdCBtdXN0IG5vdCBiZSBjYWxsZWQgZnJvbSBnZW5l
cmljIGNvZGUuDQo+Pj4gKyAqDQo+Pj4gKyAqIFJldHVybjogV2hldGhlciB0YXNrIEB0c2sg
aGFzIHBhdXNlZCBsYXp5IE1NVSBtb2RlLg0KPj4+ICsgKi8NCj4+PiArc3RhdGljIGlubGlu
ZSBib29sIF9fdGFza19sYXp5X21tdV9tb2RlX3BhdXNlZChzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaykNCj4+PiArew0KPj4+ICsgICAgc3RydWN0IGxhenlfbW11X3N0YXRlICpzdGF0ZSA9
ICZ0c2stPmxhenlfbW11X3N0YXRlOw0KPj4+ICsNCj4+PiArICAgIHJldHVybiBzdGF0ZS0+
cGF1c2VfY291bnQgPiAwOw0KPj4+ICt9DQo+Pj4gICAgI2VuZGlmDQo+Pj4gICAgICBleHRl
cm4gc3RydWN0IHBpZCBfX3JjdSAqY2FkX3BpZDsNCj4+IFRoYW5rcyBmb3IgZmluZGluZyB0
aGlzIGlzc3VlLg0KPiANCj4gVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3
IGFuZCBwcm92aWRlIGZlZWRiYWNrIQ0KPiANCj4+IFdoaWxlIHlvdXIgcGF0Y2ggaXMgZml4
aW5nIHRoZSBwcm9ibGVtLCBJJ2QgcHJlZmVyIGZpeGluZyB0aGUgcm9vdCBjYXVzZToNCj4+
IFdoZW4gc2V0dGluZyB1cCBhIG5ldyBzdHJ1Y3QgdGFza19zdHJ1Y3QsIHRoZSBpbml0aWFs
IGxhenlfbW11X3N0YXRlIHN0YXRlDQo+PiBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgYWNjb3Jk
aW5nbHkuIFRoaXMgd291bGQgcmVxdWlyZSBhbm90aGVyIGxhenlfbW11X3N0YXRlDQo+PiBo
b29rIGZvciBpbml0aWFsaXppbmcgaXQsIHByb2JhYmx5IHZpYSBhIHNpbXBsZSBzdGF0aWNf
Y2FsbCgpLiBYZW4gY291bGQgdXNlDQo+PiB0aGF0IGZvciBzZXR0aW5nIHRoZSBwYXVzZSBj
b3VudCB0byAxLg0KPj4NCj4+IEF0IHRoZSBzYW1lIHRpbWUgX190YXNrX2xhenlfbW11X21v
ZGVfcmVzdW1lKCkgc2hvdWxkIHByb2JhYmx5IFdBUk4oKSBpZg0KPj4gdGhlIHBhdXNlIGNv
dW50IGlzIDAgYWxyZWFkeSBhbmQgTk9UIGRlY3JlbWVudCB0aGUgcGF1c2UgY291bnQuDQo+
Pg0KPj4gVGhvdWdodHM/DQo+IA0KPiBJIGFncmVlIHRoYXQgeW91ciBwcm9wb3NlZCBhcHBy
b2FjaCBpcyBpbmRlZWQgbW9yZSBlbGVnYW50Lg0KPiANCj4gVG8gY29uZmlybSBteSB1bmRl
cnN0YW5kaW5nOiBTZXR0aW5nIGV2ZXJ5IG5ldyB0YXNrJ3MgcGF1c2UgY291bnQgdG8gMQ0K
PiB3aWxsIGVuc3VyZSB0aGF0IHRoZSBmaXJzdCBjb250ZXh0IHN3aXRjaCBpbnRvIHRoYXQg
dGFzayB3aWxsIG5vdCB1bmRlcmZsb3cNCj4gdGhlIHBhdXNlIGNvdW50LiBBbHNvLCBtYWtp
bmcgX190YXNrX2xhenlfbW11X21vZGVfcmVzdW1lKCkgcmV0dXJuIGVhcmx5DQo+IHdpdGgg
YSB3YXJuaW5nIGlmIHRoZSBwYXVzZV9jb3VudCBpcyBhbHJlYWR5IHplcm8gd291bGQgZ3Vh
cmQgYWdhaW5zdA0KPiBlbmNvdW50ZXJpbmcgdGhlIHNhbWUgaXNzdWUgYWdhaW4uDQo+IA0K
PiBEbyB5b3UgaW50ZW5kIHRvIHRha2UgdGhpcyBvbiwgb3Igd291bGQgeW91IGxpa2UgbWUg
dG8gdGFrZSBhIHN0YWIgYXQgdGhpcz8NCkknbGwgdGFrZSBpdCwgdGhhbmtzIGZvciB0aGUg
b2ZmZXJpbmcuDQoNCg0KSnVlcmdlbg0K

--------------I6Qouo7kO2ONsbd0kI55lGMT--

--------------EMnSocGpP04TlxlB09ymaZJw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr0H5gFAwAAAAAACgkQsN6d1ii/Ey+a
Iwf/RF6YnGDPAE6evaEsN26G1EHwFk7MA0YlAhv4OjL8J4+hSJeHwgrysIgebpXPdEvExRASeQ/b
ofF5nhoIs9Zw0xYT8MUUluHXqI7MDXbWt1btOyMhto7GRtpNmenM3Y/79r3nUzqy/VPAQcHNKRQz
XLOntQFTuEId+YRRPYuh5CTjqrHinqLlRGxNnDc07EWUy7Bm5L8anRtaD0mQMI99GHY0My4QxMzJ
3+majMTI21iftMHLpN36+a246VmfJT1xocfoI0E0vZmmHMdfPpNdUGbsdgs5Wm6dq/mWOt6dnsYy
y2SRvRbR8F0bLVTFsWlz0pvxYbTfZhscZxoqUj4W/g==
=5hhi
-----END PGP SIGNATURE-----

--------------EMnSocGpP04TlxlB09ymaZJw--

