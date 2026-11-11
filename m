Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE2606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IXjVRuuB;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=dYJyPjXk
Received: from list by lists.xenproject.org with outflank-mailman.1483154.1686708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR30R-0003ZV-6u; Wed, 11 Nov 2026 07:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483154.1686708; Wed, 11 Nov 2026 07:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR30R-0003ZN-0s; Wed, 11 Nov 2026 07:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1483154;
 Wed, 11 Nov 2026 07:44:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xR30Q-0003ZH-IO
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 07:44:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR30P-002JFv-Uq
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 08:44:29 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af41cc3-8faa-0a2a0a5109dd-0a2a4505bae2-34
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 08:44:29 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af41cdd-4cb1-0a2a45050019-c387df82a2f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 08:44:29 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF4E421E5D;
 Wed, 11 Nov 2026 07:44:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 916121339F;
 Wed, 11 Nov 2026 07:44:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HQMUGtwc9GoHaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 07:44:28 +0000
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
	t=1794383069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=klHc2M4Mu3N5p1sH5wuDiJb5BAB+jfAPqLbOt8xW+N4=;
	b=IXjVRuuBL5J5pSFLt/4dydbxJo1uOB12RUiFeyvXIiS8BopwpPhpfxYDMvZ0fR36lK0m98
	fVqdSHwPleZZ3IxAHqtX3wZWSQSVNa2fEQMimlZ7kMahSs0BdSsLgNrRhuSkII1tJK59zd
	vbXP2WwEfGshl57kKWvQHub81ssU7qk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794383068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=klHc2M4Mu3N5p1sH5wuDiJb5BAB+jfAPqLbOt8xW+N4=;
	b=dYJyPjXkGsCIXvSIhoE1riAFKvQ+P7CHkdzCkm1r3xSoxwkCgqd3Fql0S9+/FpiPcZXwdI
	E4nhWmBnOp8t7dA9JbvrHgtaBQfA5YvwfS0EGOsXPAE67kiXDNDu5TUxW55rQcE6a/y7xI
	rs9jHMrWoWZ//2lyOHCJWdkRKzZEwBk=
Message-ID: <d9a1834b-dba0-45c1-b91c-8f6078c23670@suse.com>
Date: Wed, 11 Nov 2026 08:44:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
 <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
 <1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425@vates.tech>
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
In-Reply-To: <1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jw4mqmHHTvKbMx0dus4E9lMg"
X-Spam-Level: 
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.49)[0.998];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -10.80
X-purgate-ID: tlsNG-c201ff/1794383069-72CB02A1-4DD58DFD/35/110847
X-purgate-type: clean
X-purgate-size: 5432
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jw4mqmHHTvKbMx0dus4E9lMg
Content-Type: multipart/mixed; boundary="------------K0AH3ZpmXzHaTSaWSIrkSIau";
 protected-headers="v1"; hp="clear"
Message-ID: <d9a1834b-dba0-45c1-b91c-8f6078c23670@suse.com>
Date: Wed, 11 Nov 2026 08:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
 <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
 <1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425@vates.tech>
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
In-Reply-To: <1792401654.8631fc262581453bbf619ec5b2062170.1a15376c42b0008425@vates.tech>

--------------K0AH3ZpmXzHaTSaWSIrkSIau
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTAuMjYgMTE6MjAsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBMZSAxNi8xMC8yMDI2
IMOgIDE5OjM0LCBBbmRyZXcgQ29vcGVyIGEgw6ljcml0wqA6DQo+PiBPbiAxNi8xMC8yMDI2
IDY6MDYgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+IFRoaXMgaXMgbm8gbG9uZ2VyIHJl
cXVpcmVkIHNpbmNlIFsxXS4NCj4+Pg0KPj4+IEF0IHRoaXMgbW9tZW50IG9mIGJvb3QsIHBl
cl9jcHUgYXJlYXMgYXJlIG5vdCBpbml0aWFsaXplZCwgd2hpY2ggcHJldmVudHMNCj4+PiB1
c2luZyBWQ1BVT1BfcmVnaXN0ZXJfcnVuc3RhdGVfcGh5c19hcmVhIGFzIHBlcl9jcHVfcHRy
X3RvX3BoeXMoKSB3b3VsZA0KPj4+IG1pc2JlaGF2ZSBpbiB0aGlzIGNhc2UuDQo+Pg0KPj4g
VGhpcyBpc24ndCByZWFsbHkgY29ycmVjdC4NCj4+DQo+PiBUaGUgcGVyLWNwdSBhcmVhIGZv
ciB0aGUgQlNQIGlzIHdpdGhpbiB0aGUgbWFpbiBpbWFnZSwgd2hpY2ggaXMgd2h5IHRoZQ0K
Pj4gbG9naWMgZnVuY3Rpb25zIHRvZGF5LsKgIFdoYXQncyBtaXNzaW5nIGlzIHRoZSBjYWxs
IHRvDQo+PiBwY3B1X3NldHVwX2ZpcnN0X2NodW5rKCkgd2hpY2ggdGVsbHMgcGVyX2NwdV9w
dHJfdG9fcGh5cygpIGFib3V0IHdoZXJlDQo+PiB0aGUgQlNQIGRhdGEgaXMuDQo+Pg0KPj4g
SSB0aGluayB5b3Ugd2FudCB0byBzYXk6DQo+Pg0KPj4gIkEgZnV0dXJlIGNoYW5nZSB3YW50
cyB0byB1c2UgcGVyX2NwdV9wdHJfdG9fcGh5cygpIGluDQo+PiB4ZW5fc2V0dXBfcnVuc3Rh
dGVfaW5mbygpLCBidXQgdGhpcyBjYWxsIGlzIHRvbyBlYXJseS7CoCBJdCB0dXJucyBvdXQg
dG8NCj4+IGJlIG5vIGxvbmdlciByZXF1aXJlZCBzaW5jZSAuLi4iDQo+Pg0KPiANCj4gUmln
aHQsIEkgd2FzIHRoaW5raW5nIHRoYXQgdGhlIHVzZSBvZiB0aGUgcGVyX2NwdSB3YXMgaW5j
b3JyZWN0IGF0IHRoaXMgcG9pbnQuIA0KPiBCdXQgdGhhdCdzIG5vdCBleGFjdGx5IHRoZSBp
c3N1ZSBoZXJlLg0KPiANCj4gV2lsbCBhZGp1c3QgZm9yIHRoZSB2My4NCldpdGggdGhlIHN1
Z2dlc3RlZCB3b3JkaW5nIGFib3ZlOg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------K0AH3ZpmXzHaTSaWSIrkSIau--

--------------jw4mqmHHTvKbMx0dus4E9lMg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr0HNwFAwAAAAAACgkQsN6d1ii/Ey99
Kwf/c4aZPZ3KT7rSb+haKnezShsImGhkGVqUub2a0u/sOGFA0UI5VyBwr+5of0kZ6So7bkvoh2Kc
VYoYbftYgO1kyPe7RBh8khdFA7Xy97w1lEUj6vC8BvW4UXtT6rETSK17nU5DeDbYhaYEaaKOjbCd
Y2hZ6+bNNAT3ava1KJTRAlwCU1rr5teTQZOD3tSZd+0+tcvHdDBfGgD8FV8vR7tehLr4KYCR0Y6V
PhoQ13h6WH52CnI7QI+UvGj4KssacsISXCJv/LXvlsPQs0axjoM1VcNW13IhbGwFBF/5ug3To0vD
DEXTRgpGWJ0zOabeLflv5wmK4re4f98HUWJMD60eEQ==
=psUV
-----END PGP SIGNATURE-----

--------------jw4mqmHHTvKbMx0dus4E9lMg--

