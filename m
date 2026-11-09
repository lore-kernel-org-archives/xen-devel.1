Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49D606A323
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IAlJXG+Y;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=D0bPGbSq
Received: from list by lists.xenproject.org with outflank-mailman.1479564.1683488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJ6S-0005CX-FB; Mon, 09 Nov 2026 06:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479564.1683488; Mon, 09 Nov 2026 06:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJ6S-0005CQ-CR; Mon, 09 Nov 2026 06:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1479564;
 Mon, 09 Nov 2026 06:43:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQJ6Q-0005CJ-4c
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 06:43:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJ6P-001bbX-CA
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:43:37 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af16b88-bab6-0a2a0a5309dd-0a2a4504c764-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:43:37 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af16b98-b57f-0a2a45040019-c387df82d7e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:43:36 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4201821FCC;
 Mon,  9 Nov 2026 06:43:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF51813302;
 Mon,  9 Nov 2026 06:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 35IaMZZr8WoFfQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 06:43:34 +0000
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
	t=1794206616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0HTdmYC+X67JSj881KWJKrpVsjlneY1xA389X3Rl9fo=;
	b=IAlJXG+YY4+zzs0veCBuYf1beeb4Wqi5xDzzRvoIPB8dLlwTXNXipNEihe24By8LiruHBM
	/zZ8zz7RUKvpRjRv0iAXHPSBDC5yYiRCS13fw0Hg8lJXhLlvbX3F0m/Va2zQczW4lZiOXX
	09kLSw38oengtOUjCflqj9SbTEbKY2k=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794206615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0HTdmYC+X67JSj881KWJKrpVsjlneY1xA389X3Rl9fo=;
	b=D0bPGbSqMKMnSvSwYNoHJfMfd+XNYHdp20bG/BZUOkkvFXMtI0frOMNfJ9/FMFyvBhydLO
	W3PmiHR925uXXDScXrrwDlejfiObMIhXxNRjx2+6NfvL89VL7L1DO2STYY5xabv0GH2xsF
	wO7UE+0YrjCNPXz+8b0/y6KZZSxu9zs=
Message-ID: <39c335a6-6924-4356-a2b2-37b0b3291f7b@suse.com>
Date: Mon, 9 Nov 2026 07:43:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/credit: Uncount units dropped by csched_schedule()
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bengang Yuan <bengang.yuan@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <01484673691f2ac609c09d2e57d8981910e87aa9.1793612017.git.lin.liu01@citrix.com>
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
In-Reply-To: <01484673691f2ac609c09d2e57d8981910e87aa9.1793612017.git.lin.liu01@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DAR6BfAL9xhql4pivEZM4eU0"
X-Spamd-Result: default: False [-9.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,citrix.com:email];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -9.79
X-Spam-Level: 
X-purgate-ID: tlsNG-ebf023/1794206617-C20D5B50-8DA26A51/35/110847
X-purgate-type: clean
X-purgate-size: 5203
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DAR6BfAL9xhql4pivEZM4eU0
Content-Type: multipart/mixed; boundary="------------izmnvRUU9Gb1AS4iBX09qb0X";
 protected-headers="v1"; hp="clear"
Message-ID: <39c335a6-6924-4356-a2b2-37b0b3291f7b@suse.com>
Date: Mon, 9 Nov 2026 07:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/credit: Uncount units dropped by csched_schedule()
To: Lin Liu <lin.liu01@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bengang Yuan <bengang.yuan@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <01484673691f2ac609c09d2e57d8981910e87aa9.1793612017.git.lin.liu01@citrix.com>
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
In-Reply-To: <01484673691f2ac609c09d2e57d8981910e87aa9.1793612017.git.lin.liu01@citrix.com>

--------------izmnvRUU9Gb1AS4iBX09qb0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjYgMTE6MDksIExpbiBMaXUgd3JvdGU6DQo+IGNzY2hlZF9zY2hlZHVsZSgp
IHRha2VzIHNuZXh0IG9mZiB0aGUgcnVucSB3aXRob3V0IGRlY3JlbWVudGluZw0KPiBucl9y
dW5uYWJsZSwgYXMgaXQgaXMgYWJvdXQgdG8gcnVuLiAgQSB1bml0IHRoYXQgc3RvcHMgYmVp
bmcgcnVubmFibGUNCj4gaXMgbm9ybWFsbHkgcmVtb3ZlZCBhbmQgdW5jb3VudGVkIGJ5IGNz
Y2hlZF91bml0X3NsZWVwKCksIGJ1dCBpZiB0aGUNCj4gcGljayBsb29wIGRyb3BzIGl0IGZp
cnN0LCB0aGUgc2xlZXAgZmluZHMgbm90aGluZyB0byBkbyBhbmQgdGhlIHVuaXQNCj4gc3Rh
eXMgY291bnRlZDoNCj4gDQo+ICAgICAgQ1BVIEEgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQ1BVIEINCj4gICAgICBkb21haW5fcGF1c2UoKSAgICAgICAgICAgICAgICAgICBjc2No
ZWRfc2NoZWR1bGUoKSwgbG9jayBoZWxkDQo+ICAgICAgICBhdG9taWNfaW5jKCZkLT5wYXVz
ZV9jb3VudCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
cnVucV9yZW1vdmUoc25leHQpDQo+ICAgICAgICB2Y3B1X3NsZWVwX3N5bmMoKSAgICAgICAg
ICAgICAgICAhdW5pdF9ydW5uYWJsZV9zdGF0ZSgpOiBkcm9wDQo+ICAgICAgICAgIHdhaXRz
IGZvciBsb2NrICAgICAgICAgICAgICAgICB1bmxvY2sNCj4gICAgICAgICAgY3NjaGVkX3Vu
aXRfc2xlZXAoKQ0KPiAgICAgICAgICAgIG5vdCBydW5uaW5nLCBub3QgcXVldWVkOg0KPiAg
ICAgICAgICAgIG5vdGhpbmcgdG8gZG8NCj4gICAgICBkb21haW5fdW5wYXVzZSgpDQo+ICAg
ICAgICB2Y3B1X3dha2UoKQ0KPiAgICAgICAgICBydW5xX2luc2VydCgpICAgICAgICAgICAg
ICAgIG5yX3J1bm5hYmxlICsxIGFnYWluDQo+IA0KPiBEZWNyZW1lbnQgbnJfcnVubmFibGUg
d2hlbiBkcm9wcGluZyB0aGUgdW5pdC4NCj4gDQo+IEZpeGVzOiA3YzdiNDA3ZTc3NzIgKCJ4
ZW4vc2NoZWQ6IGludHJvZHVjZSB1bml0X3J1bm5hYmxlX3N0YXRlKCkiKQ0KPiBSZXBvcnRl
ZC1ieTogQmVuZ2FuZyBZdWFuIDxiZW5nYW5nLnl1YW5AY2l0cml4LmNvbT4NCj4gQXNzaXN0
ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01LTUNCj4gU2lnbmVkLW9mZi1ieTogTGluIExp
dSA8bGluLmxpdTAxQGNpdHJpeC5jb20+DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------izmnvRUU9Gb1AS4iBX09qb0X--

--------------DAR6BfAL9xhql4pivEZM4eU0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrxa5YFAwAAAAAACgkQsN6d1ii/Ey/X
Wgf9EsFxUCYPhC3zZ18WA4uqmLDi4ESO+QOPpetSexVqH5e115Gps1XFGuCQLC71ToZKPfm+nTzv
BZu/WqOQMMh/uLxn+AFkKUQz23Ub9o2jS04rU9V9Td8cKtyCGwbq5k+cp4LTQFMqK0YiiW0nxKPN
thqLYNpQkID8mBK5wbAn3Es+f5z098y/OhDtoCqUWKu3ZVqw4X8z8yKh3vA9LCfqKYkf/73enJ5B
i0BlmoqFUdQcPU/YXX7N1GveQIzQiDJAhZmUk2h2hHZAJNbuk6hhHXv9TcUmQhTISK7lh6f2HE0x
qosre0lROvQpZyq0wdylNqxF4imkzMY8C85GOMKfkQ==
=S4Ii
-----END PGP SIGNATURE-----

--------------DAR6BfAL9xhql4pivEZM4eU0--

