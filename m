Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8788D606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ThWEZ0GL;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ThWEZ0GL
Received: from list by lists.xenproject.org with outflank-mailman.1487279.1689726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp85-0000Ik-8T; Fri, 13 Nov 2026 11:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487279.1689726; Fri, 13 Nov 2026 11:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRp85-0000IP-5e; Fri, 13 Nov 2026 11:07:37 +0000
Received: by outflank-mailman (input) for mailman id 1487279;
 Fri, 13 Nov 2026 11:07:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRp84-0000IH-4l
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:07:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRp83-00Fn0p-HR
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:07:35 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af6ef6b-8faa-0a2a0a5109dd-0a2a450188a6-24
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:07:35 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af6ef77-5984-0a2a45010019-c387df829124-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:07:35 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D9A221F2C;
 Fri, 13 Nov 2026 11:07:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D3B3134C3;
 Fri, 13 Nov 2026 11:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id asp9F3bv9mrqKQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Nov 2026 11:07:34 +0000
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
	t=1794568055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fuJLgv3neErX9bqIT5nV3BmhjdxgUOBknh7JNjqd7C8=;
	b=ThWEZ0GLlsVkeA3Dt7QhKJN5l//7Uy1GbRGmTnG2pU/3++95cxlpMn07Kvo8Sh8zr+qUqt
	W+gJf+MsvlH6r1XM0R3bOKOWJmAddBG6K0GQkp05H4WUD1wI1ir/pi+HZ7DzGOo9mfaIXq
	K7HfPN+inlkKITFLz+MOWyC/iHxzQks=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794568055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fuJLgv3neErX9bqIT5nV3BmhjdxgUOBknh7JNjqd7C8=;
	b=ThWEZ0GLlsVkeA3Dt7QhKJN5l//7Uy1GbRGmTnG2pU/3++95cxlpMn07Kvo8Sh8zr+qUqt
	W+gJf+MsvlH6r1XM0R3bOKOWJmAddBG6K0GQkp05H4WUD1wI1ir/pi+HZ7DzGOo9mfaIXq
	K7HfPN+inlkKITFLz+MOWyC/iHxzQks=
Message-ID: <3a570f50-4a26-4faf-bd98-5e8ff1bf2d08@suse.com>
Date: Fri, 13 Nov 2026 12:07:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
 <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
 <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>
Content-Language: en-US
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
In-Reply-To: <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cuwm9OggRG4QezIaeHSHtFRA"
X-Spam-Level: 
X-Spamd-Result: default: False [-9.98 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_LONG(2.81)[0.804];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,xenproject.org,vates.tech,kernel.org,xen.org,epam.com,arm.com,gmail.com,raptorengineering.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -9.98
X-purgate-ID: tlsNG-d62444/1794568055-1E465757-0F3CB5F7/35/110847
X-purgate-type: clean
X-purgate-size: 6195
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cuwm9OggRG4QezIaeHSHtFRA
Content-Type: multipart/mixed; boundary="------------mSAD8nFtG71eaUxEm8CCrQey";
 protected-headers="v1"; hp="clear"
Message-ID: <3a570f50-4a26-4faf-bd98-5e8ff1bf2d08@suse.com>
Date: Fri, 13 Nov 2026 12:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
 <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
 <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>
Content-Language: en-US
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
In-Reply-To: <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>

--------------mSAD8nFtG71eaUxEm8CCrQey
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjYgMTE6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDEzLjExLjI2
IDEwOjQ3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMTMvMTEvMjAyNiA3OjMxIGFt
LCBPcnplbCwgTWljaGFsIHdyb3RlOg0KPj4+DQo+Pj4gT24gMTItTm92LTI2IDE5OjM2LCBB
bmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+PiBUaGlzIGlzIGEgbGlzdCBvZiBwb2ludGVycyB3
aGljaCBpcyBvbmx5IGV2ZXIgcmVhZC4NCj4+PiBJIHRoaW5rIHRoYXQncyBub3QgdHJ1ZS4g
U2VlIHNjaGVkX3Rlc3RfZnVuYygpIG1hY3JvIGluIHNjaGVkdWxlcl9pbml0KCkgdGhhdA0K
Pj4+IGFzc2lnbnMgTlVMTCBpbiBjYXNlIHRoZSBzY2hlZHVsZXIgZG9lcyBub3QgaW1wbGVt
ZW50IHRoZSByZXF1aXJlZCBob29rLg0KPj4NCj4+IExvdmVseSwgc29ycnkgSSBtaXNyZWFk
IHRoZSBjb25zdCBvbiB0aGUgbmFtZSB0aGVyZS4NCj4+DQo+PiBzY2hlZF90ZXN0X2Z1bmMo
KSBvbiB0aGUgb3RoZXIgaGFuZCBjYW4gYmUgZGVsZXRlLsKgIFdlIGNhbiBmb3JjZSB0aG9z
ZQ0KPj4gY2hlY2tzIGF0IGNvbXBpbGV0aW1lLg0KPj4NCj4+IEJ1dCwgdGhlcmUncyB0aGUg
Z2xvYmFsIGluaXQgY2FzZS7CoCBOb25lIG9mIHRoZSBjdXJyZW50IGdsb2JhbCBpbml0DQo+
PiBob29rcyBkbyBhbnl0aGluZyBleGNlcHQgcmV0dXJuIDAsIGJ1dCBJIHN1cHBvc2UgaW4g
cHJpbmNpcGxlIHRoYXQgbWF5DQo+PiB3YW50IHRvIHN0YXkuDQo+IA0KPiBUaGlzIGNhbiBl
YXNpbHkgYmUgaGFuZGxlZCBwZXItc2NoZWR1bGVyOg0KPiANCj4gLSBtYWtlIC5nbG9iYWxf
aW5pdCByZXR1cm4gdm9pZA0KPiAtIGluIGNhc2UgYSBnbG9iYWxfaW5pdCBob29rIGZhaWxz
LCBsZXQgaXQgc2V0IGEgc3RhdGljIHZhcmlhYmxlIGluIHRoZQ0KPiAgwqAgc2NoZWR1bGVy
LCByZXN1bHRpbmcgaW4gYW55IC5pbml0KCkgY2FsbCBmb3IgdGhhdCBzY2hlZHVsZXIgdG8g
ZmFpbA0KPiANCj4gVGhpcyB3aWxsIGF2b2lkIGFueSBuZWVkIHRvIE5VTEwgYSBzY2hlZHVs
ZXIgaW4gdGhlIGFycmF5IChhc3N1bWluZw0KPiBzY2hlZF90ZXN0X2Z1bmMoKSBoYXMgYmVl
biByZW1vdmVkLCB0b28pLg0KVGhpbmtpbmcgbW9yZSBhYm91dCBpdDogdGhpcyBzY2hlbWUg
d291bGQgZXZlbiBhbGxvdyB0byBkcm9wIHRoZSAuZ2xvYmFsX2luaXQNCmhvb2sgY29tcGxl
dGVseS4gSWYgYSBzY2hlZHVsZXIgbmVlZHMgdGhhdCwgY2FsbCBpdCBmcm9tIHRoZSAuaW5p
dCBob29rIHRoZQ0KZmlyc3QgdGltZSB0aGF0IGlzIGJlaW5nIGNhbGxlZC4gQXMgdGhlcmUg
YXJlIG5ldmVyIGNvbmN1cnJlbnQgY2FsbHMgb2YgLmluaXQNCihvbmx5IGNhbGxlZCBlaXRo
ZXIgYXQgYm9vdCBmb3IgdGhlIGRlZmF1bHQgc2NoZWR1bGVyLCBvciB1bmRlciBjcHVwb29s
X2xvY2spLA0KdGhlcmUgaXMgbm8gbmVlZCBmb3IgbW9yZSB0aGFuIGEgc2ltcGxlIHBlci1z
Y2hlZHVsZXIgdmFyaWFibGUgdGVsbGluZyB0aGF0DQp0aGUgZ2xvYmFsIGluaXQgZnVuY3Rp
b24gaGFzIGJlZW4gY2FsbGVkIGFuZCBpbmRpY2F0aW5nIGEgcG9zc2libGUgZmFpbHVyZSBv
Zg0KaXQuDQoNCg0KSnVlcmdlbg0K

--------------mSAD8nFtG71eaUxEm8CCrQey--

--------------cuwm9OggRG4QezIaeHSHtFRA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr273YFAwAAAAAACgkQsN6d1ii/Ey8q
2Af8DK4ikAtebNey278ETI5RYv/pAuFP+gPTjNBZJr84eVjOOY9zllZhY+9+htA9YhZduw4nWBCg
6cpCPjikV7PMoMdqjUD0p7LxPaZW8tRwQsisSSDQBTW4J3+WZthoT1Fy3lozSdbSXrZaU6s6rgt/
3XPNoMcZkO2oZtbZgO/3KyJv18QXaylPS6aovGQU8nfqeCrgR2YehD4q/QfZJKu/ZqM75zQ4vPo+
tff/I4ewhww6XDk8MRiNxsHwpJfnPtTeKjewnVeUykA9EEQPB+jM4sPgI2uRD5xj333hXceKmQJe
hJHB3srRbHLhxpolujW4ijZjL0PIPVjkCF6dBVGA7Q==
=f5u6
-----END PGP SIGNATURE-----

--------------cuwm9OggRG4QezIaeHSHtFRA--

