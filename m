Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA7606A333
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HqesC+TR
Received: from list by lists.xenproject.org with outflank-mailman.1481461.1685347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQinu-0002WA-Mj; Tue, 10 Nov 2026 10:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481461.1685347; Tue, 10 Nov 2026 10:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQinu-0002W3-K7; Tue, 10 Nov 2026 10:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1481461;
 Tue, 10 Nov 2026 10:10:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQinu-0002Vx-1y
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:10:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQint-006lpJ-Ae
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:10:13 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ed5c-2eae-0a2a0a5409dd-0a2a450bdf26-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:10:13 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ed85-b7e8-0a2a450b0019-d1558029a483-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:10:13 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so16753205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:10:13 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe64bcsm53465405e9.8.2026.11.10.02.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 02:10:12 -0800 (PST)
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
        d=suse.com; s=google; t=1794305413; x=1794910213; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WipjgfeMiIueZB0p+TWDP/jq3ps5T9aq0EBea4EgoT4=;
        b=HqesC+TRONAngpzhnIjm7FWGzdG0VVl2bxyfUE/Xz8pRIrUGFZ/MEFLUczSW2tegQF
         YMOj//R1vqjUNp4wrWFNDpME3uGdQYOk/C9EyKtDgiGknI3Y9EWTDlr2ymTILdnq0N3w
         j3cWHGOeocSaVE7g97qYM55OnxNmyfBGJbzGGJ0TlIG12Rfj0CqFtSxgsklMiqdjuh0q
         xYmjL/6JgNjQGf388107nPHBU5tLqckj/PAiUq+VtNzY4V1dgmP2ZeVuLLJRt4FRUzU/
         aDiLIVf1DtA2iyjGRjnenTRzvTmEs9t/RndWWEXkB6opSbinf3p76G3IyhXul2fkceCQ
         +H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305413; x=1794910213;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WipjgfeMiIueZB0p+TWDP/jq3ps5T9aq0EBea4EgoT4=;
        b=1Xh11uFFXnx17v5IAnrraYjPUpxJEHN/Lc9bjBRxPlF56usIU3M7egPVa7TMFh3RxX
         jZ8+XX0JXe2XJn9XCOZb485SMY9rkayJcO4Bw9C2tW1NF551edjjk0xQOPS+mvB0muGj
         SKXq0WjGD7Bj2DIpmsJzuL0WZQ8LNQkYI+BicPNDibinOATIWFuvUxsyFMLl4floU2UR
         qx+R9Pwl1CpxsXibty/rwnxGjELv5BUBaWfTeP7A4YvWs0BIie+piQnEBtKaYWlCS+XK
         J5hdVACb/34NKMQNlYfMo7Pd9LNzaTQs4eM8RVc/jtyN1XnXRzQuwLmg2toNu9SY8hxh
         8QeQ==
X-Forwarded-Encrypted: i=1; AL+hErEeTr8EbkukVTZyZnPHjUEDHPex1jJOk+iyCvk55sihDpwTqv3mBjQmUpP/upvISfYgGZK+qixW/0w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+kn9NGqH7de5AdqSrVCCnNSHKKdeGmbIebPPS1JYlbrLTeJgDj
	Q5CaCc5GEB8k70GlaCABLLoKENZbLb8Sm3JMYeffxysm5IMhFolksSIRSSvEeNtlNXM=
X-Gm-Gg: AYBFou0q7PlzwpOj4KKtvqOIrK+TEz0VhOJgehk+FL2eptEQGYWDAl4ODyqVOdAGbbN
	FebaTMmGTPiilbDHjNpsTOG5H2o2TZhQ3EKZ8glYeO7ZfFukzTMlIofeCnCtbJm5cfaVbeRmvxg
	+uKN1Qkpt6ezpmWYl/WhGnFNkUA2l5lkpjotpfPNCIkTwzuyz+b8Xn2Xdnr/1OW2o/1/f6mgvu/
	IGh1rDWYnlv+e9mg8/nl8jkL3qzZ92PTaHQWv7pnq9pSanSupvmn2ukg2cnMYJVPHTBvdfOLBTX
	uUr81e9i5T1gcQmZDDzxI7J7k/blEuej4hxOcKvLFqE5JyJ1LJ95PkZ7YNud7rMFK8pdHHTSEU5
	y28xxN9x97Q6+20lZMp/36so1Vg6vL1hBWUMxbDAXmBrt7X6KKMtiE4g0Pij/xRplAITaWZ6Pgg
	qK+5+/PeFMar+9U/Io0IdlD7Cv0XXXIO2GFDkgZGjZueKdFi4zjARvOj3CrznL85VmFtWb5/5O5
	jAJ15L6ZPuz7xS6dVKOSw0dHuQgM/CbFpZN5ADHqVkYyOa5D9oZN8odUZ0FIzGAkC5kaKUKcNyb
	FUjQ82b/EF2T8xAHTl3WEAibxelgXJnNgNbSnX/E8aCYM4nzvO6VPoZBwdOg+q6z/yhOgzYkeu3
	NF7VXSCZlLJWtpkrhwnUzNdWPM/bn1A2/S3LJMQqe8DoAci/9+mNvRdXAXAdf3Hf5J+9pHVUB
X-Received: by 2002:a05:600c:5249:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ba0234d88amr35787325e9.13.1794305412642;
        Tue, 10 Nov 2026 02:10:12 -0800 (PST)
Message-ID: <50ffa195-81ae-430e-a9a9-2825d0f18fea@suse.com>
Date: Tue, 10 Nov 2026 11:10:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: resolve MISRA R18.3 pointer comparison
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <696c419c0f41bab22a02cff418eb78ce55ec5667.1794303077.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <696c419c0f41bab22a02cff418eb78ce55ec5667.1794303077.git.dmytro_prokopchuk1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AemDSuladfroBgiScJ21AL2U"
X-purgate-ID: tlsNG-42698a/1794305413-188C99EA-9F31CEBA/35/110847
X-purgate-type: clean
X-purgate-size: 4825
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AemDSuladfroBgiScJ21AL2U
Content-Type: multipart/mixed; boundary="------------Ch9fcE859NCC0l0bpXlkzL0r";
 protected-headers="v1"; hp="clear"
Message-ID: <50ffa195-81ae-430e-a9a9-2825d0f18fea@suse.com>
Date: Tue, 10 Nov 2026 11:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: resolve MISRA R18.3 pointer comparison
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <696c419c0f41bab22a02cff418eb78ce55ec5667.1794303077.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <696c419c0f41bab22a02cff418eb78ce55ec5667.1794303077.git.dmytro_prokopchuk1@epam.com>

--------------Ch9fcE859NCC0l0bpXlkzL0r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjYgMTA6NTksIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gTUlTUkEg
QyBSdWxlIDE4LjMgc3RhdGVzOiAiVGhlIHJlbGF0aW9uYWwgb3BlcmF0b3JzID4sID49LCA8
IGFuZCA8PQ0KPiBzaGFsbCBub3QgYmUgYXBwbGllZCB0byBvYmplY3RzIG9mIHBvaW50ZXIg
dHlwZSBleGNlcHQgd2hlcmUgdGhleQ0KPiBwb2ludCBpbnRvIHRoZSBzYW1lIG9iamVjdCIu
DQo+IA0KPiBzY2hlZF9zcGluX2xvY2tfZG91YmxlKCkgdGFrZXMgdGhlIGxvY2sgYXQgdGhl
IGxvd2VyIGFkZHJlc3MgZmlyc3QuDQo+IFRoZSB0d28gc3BpbmxvY2tfdCBwb2ludGVycyBh
cmUgbm90IHJlcXVpcmVkIHRvIHBvaW50IGludG8gdGhlIHNhbWUNCj4gb2JqZWN0LCBzbyBj
b21wYXJlIHRoZSBhZGRyZXNzZXMgYXMgaW50ZWdlcnMuDQo+IA0KPiB1bnNpZ25lZCBsb25n
IGlzIHRoZSByaWdodCBpbnRlZ2VyIHR5cGUgaGVyZS4gSXQgaXMgcG9pbnRlci1zaXplZCBv
bg0KPiBldmVyeSBhcmNoaXRlY3R1cmUgWGVuIHN1cHBvcnRzLCBzbyB0aGUgY2FzdCBrZWVw
cyB0aGUgZnVsbCBhZGRyZXNzLA0KPiBhbmQgYW4gdW5zaWduZWQgY29tcGFyaXNvbiBzdGls
bCBtZWFucyAibG93ZXIgYWRkcmVzcyBmaXJzdCIuIEEgc2lnbmVkDQo+IGxvbmcgd291bGQg
aW50ZXJwcmV0IGFuIGFkZHJlc3Mgd2l0aCB0aGUgaGlnaCBiaXQgc2V0IGFzIG5lZ2F0aXZl
LCBzbw0KPiB0aGUgb3JkZXIgd291bGQgbm8gbG9uZ2VyIGZvbGxvdyB0aGF0IHJ1bGUuDQo+
IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERteXRy
byBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------Ch9fcE859NCC0l0bpXlkzL0r--

--------------AemDSuladfroBgiScJ21AL2U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmry7YMFAwAAAAAACgkQsN6d1ii/Ey+9
aAgAi04fV2rIyhlS7w8WCJWCJ5avhzHJMe8Nv3bXlip3V0PmEVKlPNDo8q0t3TJ/OkOi3LJYUMbE
AFoTqoGpCIzHLOOeZS7F902TQQz0iqtbsofckx03WnWmwX438oNhXHkvy4O5I9gPlt1BRyQ2CITp
c36vJQtgmDlkQfaosm0ZkT0OEJunfXbQ+2BxBXf35JEt8FnX+Wt2Ys30EI9jTzK4jhIFsVy/1STC
eLiQBOsd3nH4JBWi2zVfVPesMA4BpEVl3XbhFxE1vh7tKmoISf9IdRQYJYo94VnHpsDIJ0xcWFvd
an8HDAXt8gryLRXrylqoeR9HoW558wwcvYRm8kwj3g==
=n6Sc
-----END PGP SIGNATURE-----

--------------AemDSuladfroBgiScJ21AL2U--

