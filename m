Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C2C606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ESngmktZ
Received: from list by lists.xenproject.org with outflank-mailman.1461343.1672338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKYC-0002Al-9W; Mon, 26 Oct 2026 13:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461343.1672338; Mon, 26 Oct 2026 13:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKYC-0002Ad-4f; Mon, 26 Oct 2026 13:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1461343;
 Mon, 26 Oct 2026 13:15:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xLKYB-0002AV-D2
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:15:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKYA-0079fO-Pm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:15:42 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6adf5276-2eae-0a2a0a5409dd-0a2a4508d88a-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:15:42 +0100
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6adf527e-f659-0a2a45080019-d155d02fb495-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:15:42 +0100
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6af9a90e4bbso3188934a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 06:15:42 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66ca8asm323389166b.57.2026.10.26.06.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:15:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1793020542; x=1793625342; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9W11/s1CImm7wmuaKsIjWUPwVtLZDt22f8HicGbUAGc=;
        b=ESngmktZQk/GTxZ4EdwwXWfL92kdkkpnhiMmtn9QQP7Bo3dDxaX2YjVUzJrDiJzlPn
         d/RsCMcthVdHlyIKlZiEjGnmfaAb2aSuUzNqqUobC5Vzdpnhw1t/aZYck2xraYA291md
         m3HXsc24A6pGBBYIk38H+hhGjnG0eg3L8NJswKTKSdIpb6anpxDoyGtuCElgBnQyz9nx
         m3hb1PVCO6iF6b7hqwIcRUMqf/6Lk2N1O9Ug+9UMUQ68nTwKjhLaor8CDh/ALz5ANwmJ
         TJeqStFhEIN7pN4AhqdasH6TJQwy3g5lgVpf2jqLeB8j2o0sfMO1HX81qOQ9VBazfWkZ
         KVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020542; x=1793625342;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9W11/s1CImm7wmuaKsIjWUPwVtLZDt22f8HicGbUAGc=;
        b=nFwVCrcPON27KTVV8atd9jHjyS7dsBqauY/zOjeEjPrp/0YhVj54O/n18hy4ZnOdxB
         zUMGrCNQ4zvF0rJQ9uIpBz9QKdoaH08/JyxLa40qndVf/oWUc2BpuliDr+1x35L8AXgU
         mHgxFLBElimYyJvfNdg/IHLG1VRTGTHDZ2szLdgAmQZZfb6zSkUGZo5aWU7R4TXhGhDA
         5n4M+Z9reO5c+ZhVWszy1p6fALnksH8JMju6JJAMU2a27+nE2Aku4xm89Wue7HV6KhcK
         dCOmo0N6ASRR4HI+BC66w607U4ZfXv1XbFur79VjtAv89xQHqxRK1fqyDkCeqSPVS42O
         hMiA==
X-Forwarded-Encrypted: i=1; AKwUvBzMqQOxwSLDgbuJfgzwgkwCfyy+eCd8tRun5o4LQT50HerRf5R4IMFacrZjCSYPki3zuy0/JGaVQ+4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKd1PcyRLbTblFkO5KK4DbqkKbLBuj9wj3kp79ZFDBP9yKdf7yJ
	VF8BMZRVVzS9tyWSLa/2zsijPC66lzuaTRBRkM8QBYBX0RYHU9bVPU7ww1/JGarrwdM=
X-Gm-Gg: AYBFou0s4/4kjFMk8nT7mQq7CHPSnfqwoS2SmpirYayYS9TRTveMBnC7Tds4x2iO/9T
	kLkqUP3eGaYBH40s+XoyJAyMCZNPQ9CeakNyxsdqzrD3qQky2uHYGAkBFPB1tIrc71zxyjPuQ+g
	r5cpBLhiF9oTvrv+RYaIojxG8FfzvB3mzZPgRiBstLvkyzSGQhiTVTs1iVGU0gGJmHcpPs9T4QP
	+4Uv8DEsYUieGzhSMR46ZLnfHRuJkmFiwyn8fklSnw8dcSapYxWf9JkStkz4YS2tZ28R6AMpp2N
	wIqR7Vcv9BPXPpJk3dRe+iJU/cGXyukd6trjVtlCQptqllXxJGGulB/1JJc/0m5zgtMo4LQkzNo
	ig5LJZm8tdM5BlEeWxtT+x+iV0k/jYkA0iTIa+on6spfS+2D3ZE0O2KcnN6iKyHfxmPU9Z6VAsf
	qxzI565HV/vlfnWtn5chSpm/m3s2wGNbtVhvo9Ae4yjYrDsIqs/Dav6fHOiTNIviZ4lUH6q+iHs
	fauD6wGlUMFAoeVaMYhQ2XRUfQxZD/Ec2vyxmLzdbmkn5zYdI3qX0wQfMYV0N2fNO3ga71JsCdb
	jczfFn7wTtK7XiafG91KLoBkp81R/WqytbHH53Ri2GVgtFotU2J5L52AVu5uUxVGb/6VOeA9alt
	tSaVlOA==
X-Received: by 2002:a17:906:d54a:b0:c40:aa04:18d0 with SMTP id a640c23a62f3a-c46bdd971cemr762427766b.17.1793020542119;
        Mon, 26 Oct 2026 06:15:42 -0700 (PDT)
Message-ID: <e8c9afba-33b0-4894-812c-2de254106b5b@suse.com>
Date: Mon, 26 Oct 2026 14:15:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Fix the sorted insertion in
 sched_domain_insert_unit()
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, xen-devel@lists.xenproject.org
References: <20261020223534.3703199-1-stefano.stabellini@amd.com>
 <23ca037f-d7cd-4140-a991-ef51bc095d60@suse.com>
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
In-Reply-To: <23ca037f-d7cd-4140-a991-ef51bc095d60@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d8gZnwJpcRcwiQFyzTKdC0KR"
X-purgate-ID: tlsNG-c1860d/1793020542-CFCD387B-5DB7C2C9/35/110847
X-purgate-type: clean
X-purgate-size: 9790
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d8gZnwJpcRcwiQFyzTKdC0KR
Content-Type: multipart/mixed; boundary="------------TN007YJtl77CItgyr5IQc0wk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <e8c9afba-33b0-4894-812c-2de254106b5b@suse.com>
Subject: Re: [PATCH] xen/sched: Fix the sorted insertion in
 sched_domain_insert_unit()
References: <20261020223534.3703199-1-stefano.stabellini@amd.com>
 <23ca037f-d7cd-4140-a991-ef51bc095d60@suse.com>
In-Reply-To: <23ca037f-d7cd-4140-a991-ef51bc095d60@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------TN007YJtl77CItgyr5IQc0wk
Content-Type: multipart/mixed; boundary="------------SGxOss243zLeNP0DHZoa0zda"

--------------SGxOss243zLeNP0DHZoa0zda
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTAuMjYgMTM6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4xMC4yMDI2
IDAwOjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBUaGUgbG9vcCBsaW5rcyB0
aGUgbmV3IHVuaXQgaW4gZnJvbnQgb2YgdGhlIHVuaXQgd2hvc2Ugc3VjY2Vzc29yIGhhcyBh
DQo+PiBoaWdoZXIgdW5pdF9pZCwgcmF0aGVyIHRoYW4gYWZ0ZXIgaXQ6IGluc2VydGluZyAx
IGludG8gezAsIDJ9IGdpdmVzDQo+PiB7MSwgMCwgMn0uIFN0b3AgYXQgdGhlIGZpcnN0IHVu
aXQgd2l0aCBhIGhpZ2hlciB1bml0X2lkIGluc3RlYWQuDQo+Pg0KPj4gSSB0aGluayBpdCB1
c3VhbGx5IHdvcmtzIGJlY2F1c2UgZ3Vlc3QgdkNQVXMgYXJlIHR5cGljYWxseSBpbnNlcnRl
ZCBpbg0KPj4gb3JkZXIuDQo+IA0KPiBQbHVzIEkgY2FuJ3Qgc2VlbSB0byBiZSBhYmxlIHRv
IHNwb3QgYW55dGhpbmcgd2hpY2ggZGVwZW5kcyBvbiBhbnkNCj4gcGFydGljdWxhciBvcmRl
cmluZyAoZXhjZXB0IGZvciBzY2hlZF9kb21haW5faW5zZXJ0X3VuaXQoKSBpdHNlbGYpLg0K
DQpzY2hlZF9tb3ZlX2RvbWFpbigpIHJlbGllcyBvbiB0aGUgc2VxdWVuY2UgaW4gYSBzdWJ0
bGUgd2F5Og0KDQogICBpZiAoIHVuaXQtPnVuaXRfaWQgKyBncmFuID09IHYtPnZjcHVfaWQg
KQ0KICAgICAgIHVuaXQgPSB1bml0LT5uZXh0X2luX2xpc3Q7DQoNCj4gDQo+PiAtLS0gYS94
ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMNCj4+IEBAIC00ODksOCArNDg5LDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfZG9tYWluX2lu
c2VydF91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBzdHJ1Y3QgZG9tYWluICpkKQ0K
Pj4gICANCj4+ICAgICAgIGZvciAoIHByZXZfdW5pdCA9ICZkLT5zY2hlZF91bml0X2xpc3Q7
ICpwcmV2X3VuaXQ7DQo+PiAgICAgICAgICAgICBwcmV2X3VuaXQgPSAmKCpwcmV2X3VuaXQp
LT5uZXh0X2luX2xpc3QgKQ0KPj4gLSAgICAgICAgaWYgKCAoKnByZXZfdW5pdCktPm5leHRf
aW5fbGlzdCAmJg0KPj4gLSAgICAgICAgICAgICAoKnByZXZfdW5pdCktPm5leHRfaW5fbGlz
dC0+dW5pdF9pZCA+IHVuaXQtPnVuaXRfaWQgKQ0KPj4gKyAgICAgICAgaWYgKCAoKnByZXZf
dW5pdCktPnVuaXRfaWQgPiB1bml0LT51bml0X2lkICkNCj4+ICAgICAgICAgICAgICAgYnJl
YWs7DQo+PiAgIA0KPj4gICAgICAgdW5pdC0+bmV4dF9pbl9saXN0ID0gKnByZXZfdW5pdDsN
Cj4gDQo+IFBhcnQgb2YgdGhlIHByb2JsZW0gbWF5IGFsc28gYmUgdGhhdCAicHJldl91bml0
IiBkb2Vzbid0IGxvb2sgdG8NCj4gcHJvcGVybHkgZGVzY3JpYmUgdGhlIHB1cnBvc2Ugb2Yg
dGhlIHZhcmlhYmxlOiBXZSBpbnNlcnQgYmVmb3JlDQo+IHByZXZfdW5pdCwgd2hlbiB0aGUg
bmFtZSAodG8gbWUgYXQgbGVhc3QpIHN1Z2dlc3RzIHdlIG1lYW4gdG8NCj4gaW5zZXJ0IGFm
dGVyIGl0LiBJT1cgSSB0aGluayBhIHJlbmFtZSAodG9nZXRoZXIgd2l0aCB0aGUgY29ycmVj
dGlvbg0KPiBvZiB0aGUgY29uZGl0aW9uKSBtYXkgaGVscCBoZXJlLg0KDQpJIGFncmVlLiBN
YXliZSAibmV4dF91bml0Ij8NCg0KDQpKdWVyZ2VuDQo=
--------------SGxOss243zLeNP0DHZoa0zda
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SGxOss243zLeNP0DHZoa0zda--

--------------TN007YJtl77CItgyr5IQc0wk--

--------------d8gZnwJpcRcwiQFyzTKdC0KR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrfUn0FAwAAAAAACgkQsN6d1ii/Ey8Q
xgf+OTn/CxoqfvAJql02tJ3Il/kMeOySftZcuuEwWhzRr24jEyvTD9Jn7m9ALDD+CHS99j6HeppG
yDO+kbxVp3YiNwO2T5imRog67DSY5q5kJ1UvIB2++XK3bHZeTILPIppDM8eH/7jbG2jbBwZtt/Pe
06m52Ku7MODbUafH8qZizfVc1Zn9b5AOb/vbhnXbzw/l2yVeXgtNO/RxSagEA9YDCKzSLA1e2teV
djsozRm7+KlAPhSJeCr1scYm6JMkdcejlJZiqaKDnUjVPuoAqNauQ67HTqKaAMFKZ81P54Z4LGX4
K2ybd9AY4S0ogEdptfwS/xMnzhQSetCrCUukLWvMNA==
=2jEx
-----END PGP SIGNATURE-----

--------------d8gZnwJpcRcwiQFyzTKdC0KR--

