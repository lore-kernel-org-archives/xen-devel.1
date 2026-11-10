Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C6606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y/xYB/VQ
Received: from list by lists.xenproject.org with outflank-mailman.1481454.1685338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQilW-0000D7-96; Tue, 10 Nov 2026 10:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481454.1685338; Tue, 10 Nov 2026 10:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQilW-0000D0-6I; Tue, 10 Nov 2026 10:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1481454;
 Tue, 10 Nov 2026 10:07:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQilV-0000Ba-7A
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:07:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQilU-00ACFL-Gl
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:07:44 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ece9-2eae-0a2a0a5409dd-0a2a450a9340-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:07:44 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ecf0-f2d2-0a2a450a0019-d1558029e1e1-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:07:44 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so24812645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:07:44 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0203a6b0sm58365255e9.5.2026.11.10.02.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 02:07:43 -0800 (PST)
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
        d=suse.com; s=google; t=1794305264; x=1794910064; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGsK3yBvD3dY+fIGOvU+/f6W2zSWjZOAbooLra3Z8sU=;
        b=Y/xYB/VQ59u7eMSfWSRit7w28vz3P6Rvd8SyTbmesVa6QLgZ3wbbqCJsPdKEn22iCu
         XEEvJyopSqfKSX2tBnuQYwHAdYCq4VlRsxQSqtB/ZhZ81BTw6MJgUDK64mu4Wx6pukdC
         4X/+8+LjDrTs8Iv/+wcIK41ZIs8k8rRTIW5ZJu8HUi/sXN8LCj4ZpalB0E8FbRlNzyjj
         H9N8w9jLG0678OJhi1cS8i1E2dab1V3zYtdmrHTY0ZuUNem9Od3VxbAtFJZu3OZ+btN5
         r15ZvatrYwoEyoPW8HBDpMQ8a8St3tJbKsKjDrXIwPV0nkIJ9RgMoGM53WKjwjAftlnC
         WEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305264; x=1794910064;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGsK3yBvD3dY+fIGOvU+/f6W2zSWjZOAbooLra3Z8sU=;
        b=QubRcOd6+peOCqNUY1Fsgm3ZK8RxLHH67dt2cBFHbHk2LN3/5kbbj3oWBXI2gAg9ei
         ifvGvDEQEXdmQyZ9ojGXQ6JQAowzbiCcOMkZXhrI3n8L4974WhgFdD4lQ4Ljk69/WSL/
         FldP0RewpG5I1hTuacQycP54/2AhKFpnVTY+K+gcIq03S7AHdUeEH6RMpo7oPDjsy872
         5FTXqEaXZoMrOXXriVzHmB0fbhkSJSpFm+zU3P5zsiOQ2RqEBmEfLJMmpl4TJ1N9NBHq
         VpXuZTDZL7er1/2OYUBRnH/bfCX4mqy/zCUou/8fJz80aDwh0a+L8nbQOchZa+X/5HB2
         XERw==
X-Forwarded-Encrypted: i=1; AL+hErFLuEUi5aggeAA92lCpAaHGPqG2f7Q+w0hFwLYnph8cFvXrQbyVDhBZMdHJP5Q5CaZZ5r6QUmEsr90=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/yA5MQSq9B86gG+ygBRcTVRIPelIrhYF8x3n4pssM/UWeXooqv
	dtJImHMng4ItxhAeUv1P6gd5ddehC9j/Vv+3IGPYE4YzJIYc4sGH7zfzLNp+qh3fRoc=
X-Gm-Gg: AYBFou0BO2iY9RN2eyP0wcVR/MgcpSdjn+3xYt3oxEmTdFdiOHnY7ONmt6NQL67Dgth
	nxXXCxhJyMGTcPF5hFNYxZbfTlAriZ5YK8E2mSQ+EUeZutBe7EdVhKUwC0nLRaUAEZZ2aWNI6XB
	SiwMgoQrCW2KMip0xhszD9KafZ2WqHl3OHVbzVmTMeL9dZ6ZJ2LVltOoMZaf41NimzZb45KbwNP
	hTWB1ruw2oODmlIT42kGeDxL+YGYumJtTj0VdyV+XtoKpQIg9hHxySy44dJe3mcnFr4nEGz25We
	S/sV6VTII6jGO8tRJqhkvsI+x4B++jrkaaptFWs6GC9FUm9GfNq6h6ZaclPatJKbQY3fvu++LAJ
	ChMOyP3ffkunv9b5HIlcHrdwgsTwQloeYw4/SJTVsSVlttj8iqbZBkcRNUEb1ye3L9fm4hehOga
	nnQ1OQljx1qo6cJDMuu/CQt3Q1HxkXRJ+Agcv40uPuYUHQacbwWsTB1TRhOJzemZoSjaRaa83Ve
	c4hZ5qdT+8ZinJkf2u3qyw9EkmZTi185XWDrg8a0kDYfcDZhiMKvC8VN85/FvW51I93P+GtdPc0
	OMFixze8XqWdbA0uTuaGAyUop0Kh7b7KsJ6exLFRGMrCe2MuqEndwqcLGToKCwm3/8BJmBJcTSz
	fV5kMdWjQnQnZJNkrAo1s6G6HKPHmzQneQtQ6smvvlv8q3k1C0BKm1h07hraGM8CpIAO2dd42
X-Received: by 2002:a05:600c:3e15:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ba02307c34mr31970825e9.4.1794305263593;
        Tue, 10 Nov 2026 02:07:43 -0800 (PST)
Message-ID: <26ba4ecc-0a97-45a5-b39a-d7f1fb9b33a5@suse.com>
Date: Tue, 10 Nov 2026 11:07:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages()
 in PV guest
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20261110095605.369848-1-jgross@suse.com>
 <20261110095605.369848-2-jgross@suse.com>
 <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
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
In-Reply-To: <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TtuF7cHMmXscsrdnH1gYPpJ2"
X-purgate-ID: tlsNG-4011c0/1794305264-538D5CFC-7FA47BB8/35/110847
X-purgate-type: clean
X-purgate-size: 5351
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TtuF7cHMmXscsrdnH1gYPpJ2
Content-Type: multipart/mixed; boundary="------------qgsximp9r0ts5B0VjZR4a75R";
 protected-headers="v1"; hp="clear"
Message-ID: <26ba4ecc-0a97-45a5-b39a-d7f1fb9b33a5@suse.com>
Date: Tue, 10 Nov 2026 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages()
 in PV guest
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20261110095605.369848-1-jgross@suse.com>
 <20261110095605.369848-2-jgross@suse.com>
 <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
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
In-Reply-To: <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>

--------------qgsximp9r0ts5B0VjZR4a75R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjYgMTA6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEwLzExLzIw
MjYgOTo1NiBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFRvZGF5IGdudHRhYl9kbWFf
YWxsb2NfcGFnZXMoKSBvciBnbnR0YWJfZG1hX2ZyZWVfcGFnZXMgYXJlIG5ldmVyDQo+PiBj
YWxsZWQgd2hlbiBydW5uaW5nIGFzIGEgUFYgZ3Vlc3QsIGJ1dCB0aGlzIGhvbGRzIGZvciBp
bi10cmVlIGNhbGxlcnMNCj4+IG9ubHkuDQo+Pg0KPj4gQmFpbCBvdXQgZWFybHkgd2hlbiBi
ZWluZyBjYWxsZWQgaW4gUFYgbW9kZSBpbiBvcmRlciB0byBlbnN1cmUgbm8gb3V0DQo+PiBv
ZiB0cmVlIG1vZHVsZSBvciBmdXR1cmUgdXNlIGNhc2VzIGFyZSB2aW9sYXRpbmcgdGhpcyBh
c3N1bXB0aW9uLg0KPj4NCj4+IFRoaXMgZW5hYmxlcyB0byBzYWZlbHkgcmVtb3ZlIFBWLW9u
bHkgY29kZSBmcm9tIGJvdGggZnVuY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3hl
bi9ncmFudC10YWJsZS5jIHwgMTEgKysrKysrLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyBiL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMN
Cj4+IGluZGV4IDYwNGM0ZWVhNTkzMC4uNTZhNDk3OTg3OTQyIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYw0KPj4gKysrIGIvZHJpdmVycy94ZW4vZ3JhbnQt
dGFibGUuYw0KPj4gQEAgLTEwNjMsNiArMTA2Myw5IEBAIGludCBnbnR0YWJfZG1hX2FsbG9j
X3BhZ2VzKHN0cnVjdCBnbnR0YWJfZG1hX2FsbG9jX2FyZ3MgKmFyZ3MpDQo+PiAgIAlzaXpl
X3Qgc2l6ZTsNCj4+ICAgCWludCBpLCByZXQ7DQo+PiAgIA0KPj4gKwlpZiAoV0FSTl9PTih4
ZW5fcHZfZG9tYWluKCkpKQ0KPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBUaGlzIHdp
bGwgZ2V0IHZlcnkgc3BhbW15IGlmIGhpdC7CoCBXQVJOX09OX09OQ0UoKSA/DQpJJ2QgcmF0
aGVyIGhhdmUgaXQgc3BhbW15IHRoYW4gYnVyaWVkIHNvbWV3aGVyZSBpbiB0aGUgbG9ncy4N
Cg0KQWRkaXRpb25hbGx5IEkgZXhwZWN0IGFueSBpbGxlZ2FsIHVzZXIgZ2l2aW5nIHVwIHF1
aXRlIGZhc3QgaWYgbm8gYWxsb2NhdGlvbg0KYXQgYWxsIGZvciBETUEgaXMgd29ya2luZy4g
Oi0pDQoNCg0KSnVlcmdlbg0K

--------------qgsximp9r0ts5B0VjZR4a75R--

--------------TtuF7cHMmXscsrdnH1gYPpJ2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmry7O4FAwAAAAAACgkQsN6d1ii/Ey/T
Cwf/Tb+AVxXrbuvFoZ0LYX4wsA3Zp7tmM72RVwUDR+7DnfAt9KWN7r0YaiD7SN8dlzZzFDQHnexJ
C/Ah4ryCfnlmtmcoCtTfTZKaEvbimlVMzmn/M+iEmjv152ygYU3Nzw/tXfeTlY+KALnG7PVCNShe
vOicu3gwkfRBWMPDhOSI/vj3FwaBQCEHrpBHY0+LzbXgdC6ArqPuw5IRUrN71HxlWY/vrcZfi0E0
iqDQmIEgj/flGZUquXjqw8pC/ROC4oq+QQblPVhBq7wMwndPZsMGUUhECM5SJc+xeFrkexKL85q+
JK2yTy119TuUrfl3cBZGtRUAgPtwRPyhek26+HH3qw==
=tx1f
-----END PGP SIGNATURE-----

--------------TtuF7cHMmXscsrdnH1gYPpJ2--

