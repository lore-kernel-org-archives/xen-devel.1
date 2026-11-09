Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD0606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=k+Pct609;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=k+Pct609
Received: from list by lists.xenproject.org with outflank-mailman.1480181.1684143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQRy-00005C-TF; Mon, 09 Nov 2026 14:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480181.1684143; Mon, 09 Nov 2026 14:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQRy-000050-PU; Mon, 09 Nov 2026 14:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1480181;
 Mon, 09 Nov 2026 14:34:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQQRw-00004u-S2
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQRw-007wdD-8c
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:34:20 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af1d9e5-e002-0a2a0a5209dd-0a2a4509e4a6-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:34:20 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af1d9eb-be1a-0a2a45090019-c387df83b35e-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:34:20 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A23FF1F7D3;
 Mon,  9 Nov 2026 14:34:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51F6B13302;
 Mon,  9 Nov 2026 14:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yZQpCuvZ8WpVbwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 14:34:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794234859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sbQeRA9CyuaW6m9In+TZM2sSG7ONA1E5yT6bD+DtiWs=;
	b=k+Pct609C3thKWd/TrGv4fpsQaihxAd1Cij5SQgzB7EEs73bvNTuCSXFQub6S/mYLNIaRS
	xm9NkjKcjgvmYCHIMdbL+wSh5X6mNBXdQf03IC303CPD+VaoyXQ14+zn5uCFvJkb1nJd4i
	d+blGkSZ8VeV01T0P6iFKhtLLxrYcF8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794234859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sbQeRA9CyuaW6m9In+TZM2sSG7ONA1E5yT6bD+DtiWs=;
	b=k+Pct609C3thKWd/TrGv4fpsQaihxAd1Cij5SQgzB7EEs73bvNTuCSXFQub6S/mYLNIaRS
	xm9NkjKcjgvmYCHIMdbL+wSh5X6mNBXdQf03IC303CPD+VaoyXQ14+zn5uCFvJkb1nJd4i
	d+blGkSZ8VeV01T0P6iFKhtLLxrYcF8=
Message-ID: <70378f23-69f3-4bb0-885e-54c29daa6ddf@suse.com>
Date: Mon, 9 Nov 2026 15:34:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/privcmd: fix double free when an irqfd is shut down
 twice
To: Qihang <q.h.hack.winter@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261101163251.55099-1-q.h.hack.winter@gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <20261101163251.55099-1-q.h.hack.winter@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------irHP4tZJaDGSfvWack0JzJWj"
X-Spamd-Result: default: False [-8.33 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.46)[0.989];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -8.33
X-Spam-Level: 
X-purgate-ID: tlsNG-bad1c0/1794234860-BDEC6034-7568A9BD/35/110847
X-purgate-type: clean
X-purgate-size: 7756
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------irHP4tZJaDGSfvWack0JzJWj
Content-Type: multipart/mixed; boundary="------------LJdOSRNSFiDYYnLxyVj8lk7L";
 protected-headers="v1"; hp="clear"
Message-ID: <70378f23-69f3-4bb0-885e-54c29daa6ddf@suse.com>
Date: Mon, 9 Nov 2026 15:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/privcmd: fix double free when an irqfd is shut down
 twice
To: Qihang <q.h.hack.winter@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261101163251.55099-1-q.h.hack.winter@gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <20261101163251.55099-1-q.h.hack.winter@gmail.com>

--------------LJdOSRNSFiDYYnLxyVj8lk7L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjYgMTc6MzIsIFFpaGFuZyB3cm90ZToNCj4gaXJxZmRfZGVhY3RpdmF0ZSgp
IHRha2VzIHRoZSBpcnFmZCBvZmYgaXJxZmRzX2xpc3QgYW5kIHF1ZXVlcw0KPiBpcnFmZF9z
aHV0ZG93bigpLiAgcXVldWVfd29yaygpIGlzIG5vdCBhIG9uY2Utb25seSBnYXRlOiBpdCBy
ZWZ1c2VzIHRvDQo+IGVucXVldWUgYSB3b3JrIGl0ZW0gb25seSB3aGlsZSBXT1JLX1NUUlVD
VF9QRU5ESU5HIGlzIHNldCwgYW5kDQo+IHByb2Nlc3Nfb25lX3dvcmsoKSBjbGVhcnMgdGhh
dCBiaXQgYmVmb3JlIGl0IGNhbGxzIHRoZSB3b3JrIGZ1bmN0aW9uLiAgU28NCj4gbm90aGlu
ZyByZWNvcmRzIHRoYXQgdGhlIHNodXRkb3duIHdvcmsgaGFzIGFscmVhZHkgYmVlbiBxdWV1
ZWQsIGFuZA0KPiBub3RoaW5nIHByb3RlY3RzIHRoZSB3aW5kb3cgYmV0d2VlbiB0aGUgc3Rh
cnQgb2YgaXJxZmRfc2h1dGRvd24oKSBhbmQgdGhlDQo+IGtmcmVlKCkgYXQgaXRzIGVuZC4N
Cj4gDQo+IFR3byBwYXRocyBjYWxsIGlycWZkX2RlYWN0aXZhdGUoKSBmb3IgdGhlIHNhbWUg
aXJxZmQ6DQo+IA0KPiAgICAtIHByaXZjbWRfaXJxZmRfZGVhc3NpZ24oKSwgZnJvbSB0aGUg
UFJJVkNNRF9JUlFGRF9GTEFHX0RFQVNTSUdOIGlvY3RsOw0KPiANCj4gICAgLSBpcnFmZF93
YWtldXAoKSwgd2l0aCBFUE9MTEhVUCBzZXQsIHdoZW4gdGhlIGxhc3QgcmVmZXJlbmNlIHRv
IHRoZQ0KPiAgICAgIGV2ZW50ZmQgZmlsZSBnb2VzIGF3YXksIHdoaWNoIHJ1bnMgd2FrZV91
cF9wb2xsKCZjdHgtPndxaCwgRVBPTExIVVApDQo+ICAgICAgZnJvbSBldmVudGZkX3JlbGVh
c2UoKS4NCj4gDQo+IGlycWZkc19sb2NrIHNlcmlhbGlzZXMgdGhlIHR3byBjYWxscywgYnV0
IGl0IGRvZXMgbm90IG1ha2UgdGhlIHNlY29uZCBvbmUNCj4gYSBuby1vcCwgYW5kIGV2ZW50
ZmRfY3R4X2ZkZ2V0KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIGV2ZW50ZmRfY3R4LA0K
PiBub3QgdG8gdGhlIHN0cnVjdCBmaWxlLCBzbyB0aGUgbGFzdCBmZCBjYW4gc3RpbGwgYmUg
Y2xvc2VkIHdoaWxlIHRoZQ0KPiBpb2N0bCBpcyBydW5uaW5nOg0KPiANCj4gICAgQ1BVMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTENCj4gDQo+ICAgIGV2ZW50ZmRf
Y3R4X2ZkZ2V0KCkNCj4gICAgc3Bpbl9sb2NrKGlycWZkc19sb2NrKQ0KPiAgICBsaXN0X2Rl
bF9pbml0KCZraXJxZmQtPmxpc3QpDQo+ICAgIHF1ZXVlX3dvcmsoJmtpcnFmZC0+c2h1dGRv
d24pICAgICAgICBjbG9zZShmZCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZXZlbnRmZF9yZWxlYXNlKCkNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB3YWtlX3VwX3BvbGwoRVBPTExIVVApDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlycWZkX3dha2V1cCgpDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fbG9jayhp
cnFmZHNfbG9jaykNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaXJxZmRfZGVhY3RpdmF0ZSgpIGFnYWluDQo+IA0KPiBJZiB0aGUgd29yayBpdGVtIGhh
cyBhbHJlYWR5IHN0YXJ0ZWQgYnkgdGhlbiwgaXRzIHBlbmRpbmcgYml0IGhhcyBiZWVuDQo+
IGNsZWFyZWQgYW5kIHRoZSBzZWNvbmQgcXVldWVfd29yaygpIHN1Y2NlZWRzLiAgaXJxZmRf
c2h1dGRvd24oKSB0aGVuIHJ1bnMNCj4gdHdpY2UsIHNvIGV2ZW50ZmRfY3R4X3JlbW92ZV93
YWl0X3F1ZXVlKCksIGV2ZW50ZmRfY3R4X3B1dCgpIGFuZCBrZnJlZSgpDQo+IGVhY2ggaGl0
IHRoZSBzYW1lIG9iamVjdCBhIHNlY29uZCB0aW1lOyBhbmQgd2hlbiB0aGUgc2Vjb25kIHF1
ZXVlX3dvcmsoKQ0KPiBsYW5kcyBhZnRlciB0aGUgaXJxZmQgaGFzIGJlZW4gZnJlZWQsIHRo
ZSB3b3JrcXVldWUgbGlzdCBvcGVyYXRpb25zIHdyaXRlDQo+IHRvIGZyZWVkIG1lbW9yeS4N
Cj4gDQo+IHZpcnQva3ZtL2V2ZW50ZmQuYyBoYXMgdGhlIHNhbWUgdHdvIGNhbGxlcnMgYW5k
IGhhcyBoYWQgdGhpcyBndWFyZCBzaW5jZQ0KPiB0aGUgb3JpZ2luYWwgaXJxZmQgc3VwcG9y
dCAoNzIxZWVjYmY0ZmU5OSk6IGlycWZkX3dha2V1cCgpIGNhbGxzDQo+IGlycWZkX2RlYWN0
aXZhdGUoKSBvbmx5IGlmIGlycWZkX2lzX2FjdGl2ZSgpLiAgVGhlIGNvbW1lbnQgdGhlcmUg
ZXhwbGFpbnMNCj4gd2h5IHRoYXQgaXMgZW5vdWdoOiB0aGUgb3RoZXIgc2lkZSBkZWFjdGl2
YXRlcyB0aGUgaXJxZmQgYmVmb3JlIGl0IHRha2VzDQo+IGl0IG9mZiB0aGUgd2FpdHF1ZXVl
LCBhbmQgaXJxZmRfc2h1dGRvd24oKSBuZWVkcyB0aGUgd2FpdHF1ZXVlIGxvY2ssDQo+IHdo
aWNoIHRoaXMgY2FsbGJhY2sgaG9sZHMsIHNvIHRoZSBpcnFmZCBjYW5ub3QgYmUgZnJlZWQg
dW5kZXIgaXQuDQo+IA0KPiBEbyB0aGUgc2FtZSBoZXJlLiAgbGlzdF9kZWxfaW5pdCgpIGxl
YXZlcyB0aGUgbGlzdCBoZWFkIGVtcHR5IGFuZCB0aGUNCj4gaXJxZmQgc3RheXMgb2ZmIHRo
ZSBsaXN0IHVudGlsIGtmcmVlKCksIHNvIGl0IHNlcnZlcyBhcyBhIG9uZS13YXkNCj4gImFj
dGl2ZSIgZmxhZy4gIFRoZSB0ZXN0IGlzIGluIGlycWZkX2RlYWN0aXZhdGUoKSByYXRoZXIg
dGhhbiBpbg0KPiBpcnFmZF93YWtldXAoKSBiZWNhdXNlIHByaXZjbWRfaXJxZmRfZGVhc3Np
Z24oKSB3YWxrcyBpcnFmZHNfbGlzdCBhbmQgY2FuDQo+IHRoZXJlZm9yZSBuZXZlciByZWFj
aCBhbiBpbmFjdGl2ZSBpcnFmZDsgb25seSB0aGUgd2FrZXVwIHBhdGggY2FuLCBhbmQgYQ0K
PiBzaW5nbGUgdGVzdCBjb3ZlcnMgYm90aCBjYWxsZXJzLg0KPiANCj4gRml4ZXM6IGY4OTQx
ZTZjNGM3MTIgKCJ4ZW46IHByaXZjbWQ6IEFkZCBzdXBwb3J0IGZvciBpcnFmZCIpDQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IFFpaGFuZyA8cS5o
LmhhY2sud2ludGVyQGdtYWlsLmNvbT4NClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K

--------------LJdOSRNSFiDYYnLxyVj8lk7L--

--------------irHP4tZJaDGSfvWack0JzJWj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrx2eoFAwAAAAAACgkQsN6d1ii/Ey9l
Owf9FQNftOSZW39cuV9bYiEP5AmoSV//5Nkl6+r6jVT3XLCjqeoWLU156ftxZf/byLZ14sw3Spvc
n/wFPPXrVNoJ/a/W/Mr5X7POz7T51t4hbVQkeoXNwuYVO7Gz0s58WMpMvTUadhl5lDMEX+8ZaWst
icXUYy/yVUNwpJbwdT42c3Wxfli2S3NDT2XwJMTTxPoaBxh/7C0cLt691QohbzHwYMsu2HEhJdWa
oLoyb13btCEoORLJLaZNK4ZP/4YwIaYZ+Ede4eAquCGzPELJiBfMCUJSA27loSwS+3AWL+huF2O3
PEEmw47nxrfvYrsRG43UVEoXoaPMKxwllJcMrVv6Kw==
=mh3Z
-----END PGP SIGNATURE-----

--------------irHP4tZJaDGSfvWack0JzJWj--

