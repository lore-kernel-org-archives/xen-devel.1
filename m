Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE4606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=dxe4qq04;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Nd6yRxPC
Received: from list by lists.xenproject.org with outflank-mailman.1479653.1683564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQKMK-0007gr-0p; Mon, 09 Nov 2026 08:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479653.1683564; Mon, 09 Nov 2026 08:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQKMJ-0007gk-U7; Mon, 09 Nov 2026 08:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1479653;
 Mon, 09 Nov 2026 08:04:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQKMI-0007ge-OW
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:04:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQKMH-006Vc5-Mv
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:04:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af17e6a-8faa-0a2a0a5109dd-0a2a450ba3f0-40
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:04:05 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af17e75-b7e8-0a2a450b0019-c387df82c662-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:04:05 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD09F2216E;
 Mon,  9 Nov 2026 08:04:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90FEA13319;
 Mon,  9 Nov 2026 08:04:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mfFlGXR+8Wo+UwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 08:04:04 +0000
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
	t=1794211445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/0DCJ9TIbg4Ba4YdRMOHYGguv0/PQu8IdtSAAM8yQa0=;
	b=dxe4qq04rYAbFeFKeVQXe5SVwHyacdTOa6KUKAyxqiKyjgOnvGsyULWLKPEk6AopYVlBIz
	VeohKuLoDt+QgErBnDwsAizcHAGbVP0WrJoJftvWUGqJGT3AamU8N9S9D5Xd2k5XQyFNy3
	g23S1TZzPRqd/YLIy0MoY1WIcqJ6ra0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794211444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/0DCJ9TIbg4Ba4YdRMOHYGguv0/PQu8IdtSAAM8yQa0=;
	b=Nd6yRxPCzFbsGMm45nWPnU43gMxJqKBeyi5NSxaBUA6Sx4UQB0RLlq0dr8WiNKvkc6JMO/
	5ikQeCPi37rzu7oNV0RLO6nRU5iVzndSoDNyyWTA6MAq4PG64cfaX86Di0UycRVlACVObP
	PFXZgVqzONdo4Z5LwTFSLcOwFF39gpI=
Message-ID: <7b3fe96c-15f2-4ab8-a818-16974df306ae@suse.com>
Date: Mon, 9 Nov 2026 09:04:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/grant-table: annotate on-stack work in
 gnttab_unmap_refs_sync()
To: Kavitha Daula <kavithadaula@Kavithas-MacBook-Pro.local>,
 sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Kavitha Daula <kavi@edera.dev>
References: <20261105000137.82224-1-kavithadaula@Kavithas-MacBook-Pro.local>
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
In-Reply-To: <20261105000137.82224-1-kavithadaula@Kavithas-MacBook-Pro.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------49yTbD0VzFZXGbqXOrEIWG8R"
X-Spam-Level: 
X-Spamd-Result: default: False [-9.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.50)[0.999];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -9.79
X-purgate-ID: tlsNG-42698a/1794211445-19EC69EA-87C981CE/35/110847
X-purgate-type: clean
X-purgate-size: 6085
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------49yTbD0VzFZXGbqXOrEIWG8R
Content-Type: multipart/mixed; boundary="------------LE9d22iRjTqSgijwBVCFkL5n";
 protected-headers="v1"; hp="clear"
Message-ID: <7b3fe96c-15f2-4ab8-a818-16974df306ae@suse.com>
Date: Mon, 9 Nov 2026 09:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/grant-table: annotate on-stack work in
 gnttab_unmap_refs_sync()
To: Kavitha Daula <kavithadaula@Kavithas-MacBook-Pro.local>,
 sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Kavitha Daula <kavi@edera.dev>
References: <20261105000137.82224-1-kavithadaula@Kavithas-MacBook-Pro.local>
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
In-Reply-To: <20261105000137.82224-1-kavithadaula@Kavithas-MacBook-Pro.local>

--------------LE9d22iRjTqSgijwBVCFkL5n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjYgMDE6MDEsIEthdml0aGEgRGF1bGEgd3JvdGU6DQo+IEZyb206IEthdml0
aGEgRGF1bGEgPGthdmlAZWRlcmEuZGV2Pg0KPiANCj4gQm90aCBjYWxsZXJzIG9mIGdudHRh
Yl91bm1hcF9yZWZzX3N5bmMoKSwgZnJlZV9wZXJzaXN0ZW50X2dudHMoKSBhbmQNCj4geGVu
X2Jsa2JrX3VubWFwX3B1cmdlZF9ncmFudHMoKSBpbiBibGtiYWNrLCBrZWVwIHRoZWlyIHN0
cnVjdA0KPiBnbnRhYl91bm1hcF9xdWV1ZV9kYXRhIG9uIHRoZSBzdGFjay4gZ250dGFiX3Vu
bWFwX3JlZnNfYXN5bmMoKSBzZXRzIHVwDQo+IHRoZSBkZWxheWVkIHdvcmsgaW5zaWRlIGl0
IHdpdGggSU5JVF9ERUxBWUVEX1dPUksoKSwgc28gd2l0aA0KPiBDT05GSUdfREVCVUdfT0JK
RUNUU19XT1JLIGFuZCBDT05GSUdfREVCVUdfT0JKRUNUU19USU1FUlMgZXZlcnkNCj4gcGVy
c2lzdGVudCBncmFudCB0ZWFyZG93biB3YXJucyB0d2ljZSwgb25jZSBmb3IgdGhlIHdvcmsg
YW5kIG9uY2UgZm9yDQo+IGl0cyB0aW1lcjoNCj4gDQo+ICAgIFsgIDEwNC4zNjYwODVdIE9E
RUJVRzogb2JqZWN0IGZmZmZjOTAwNDAyMGZhZDggaXMgb24gc3RhY2sgZmZmZmM5MDA0MDIw
YzAwMCwgYnV0IE5PVCBhbm5vdGF0ZWQuDQo+ICAgIFsgIDEwNC4zNzE1NTFdIFdBUk5JTkc6
IENQVTogMSBQSUQ6IDQ4IGF0IGxpYi9kZWJ1Z29iamVjdHMuYzo2NzIgbG9va3VwX29iamVj
dF9vcl9hbGxvYy5wYXJ0LjArMHgxMmIvMHgxZjANCj4gICAgQ2FsbCBUcmFjZToNCj4gICAg
IDxUQVNLPg0KPiAgICAgX19kZWJ1Z19vYmplY3RfaW5pdCsweGZlLzB4MWEwDQo+ICAgICBk
ZWJ1Z19vYmplY3RfaW5pdCsweDM4LzB4NTANCj4gICAgIF9faW5pdF93b3JrKzB4MjgvMHgz
MA0KPiAgICAgZ250dGFiX3VubWFwX3JlZnNfYXN5bmMrMHgxOC8weGEwDQo+ICAgICBnbnR0
YWJfdW5tYXBfcmVmc19zeW5jKzB4NjEvMHg5MA0KPiAgICAgZnJlZV9wZXJzaXN0ZW50X2du
dHMrMHgxNzkvMHgyODANCj4gICAgIHhlbl9ibGtia19mcmVlX2NhY2hlcysweDE2LzB4MzAN
Cj4gICAgIHhlbl9ibGtpZl9kaXNjb25uZWN0KzB4ZmEvMHgyZDANCj4gICAgIGZyb250ZW5k
X2NoYW5nZWQrMHg5MC8weDY4MA0KPiAgICAgeGVuYnVzX290aGVyZW5kX2NoYW5nZWQrMHg4
MC8weGIwDQo+ICAgICBmcm9udGVuZF9jaGFuZ2VkKzB4MTQvMHgyMA0KPiAgICAgeGVud2F0
Y2hfdGhyZWFkKzB4OTYvMHgxYTANCj4gICAgIGt0aHJlYWQrMHgxMWQvMHgyNTANCj4gICAg
IHJldF9mcm9tX2ZvcmsrMHgyOWYvMHgyZDANCj4gICAgIHJldF9mcm9tX2ZvcmtfYXNtKzB4
MWEvMHgzMA0KPiAgICAgPC9UQVNLPg0KPiANCj4gZ250dGFiX3VubWFwX3JlZnNfc3luYygp
IHdhaXRzIGZvciB0aGUgdW5tYXAgdG8gY29tcGxldGUgYmVmb3JlIGl0DQo+IHJldHVybnMs
IHNvIHRoZSB3b3JrIG5ldmVyIG91dGxpdmVzIHRoZSBjYWxsZXIncyBmcmFtZS4gSW5pdGlh
bGlzZSBpdA0KPiB3aXRoIElOSVRfREVMQVlFRF9XT1JLX09OU1RBQ0soKSB3aGVuIHRoZSBp
dGVtIGlzIG9uIHRoZSBzdGFjayBhbmQNCj4gZGVzdHJveSBpdCBiZWZvcmUgcmV0dXJuaW5n
LiBUaGUgZnVuY3Rpb24gaXMgZXhwb3J0ZWQsIHNvIGFuIGl0ZW0gdGhhdA0KPiBpcyBub3Qg
b24gdGhlIHN0YWNrIGtlZXBzIElOSVRfREVMQVlFRF9XT1JLKCkuDQo+IA0KPiBGaXhlczog
YjQ0MTY2Y2Q0NmUyICgieGVuL2dyYW50OiBpbnRyb2R1Y2UgZnVuYyBnbnR0YWJfdW5tYXBf
cmVmc19zeW5jKCkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBLYXZpdGhhIERhdWxhIDxrYXZpQGVk
ZXJhLmRldj4NClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQoNCg0KSnVlcmdlbg0K

--------------LE9d22iRjTqSgijwBVCFkL5n--

--------------49yTbD0VzFZXGbqXOrEIWG8R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrxfnQFAwAAAAAACgkQsN6d1ii/Ey9x
Dwf+OBLbmkPg8zzcuWWkBdJ+LhT3wV5euMZTFiMDVvFbWK5huYo26ODDxMOfvyqhVaN0N1WhuyEs
9lpoGuLMZT+YLFCwHg8Sgsi0CzeY74MDfVtmLkpsHlrMfOs4nHWaK1pkwI7XbKRzFS/WWXlm2wUU
dDjBzx5FkiYgfMldQupt2haZqr+YfCFiqxqQUaj4HMGY3ScFAnvTHuSiBoFgebdHONvVmjTR0LgR
sUyQKHz3ll8YQ/DzhXTve1Zl4XWVajFw/FZ1pRjfKzq9SNYqdUbWcfkxSkU/L5T1fEPp1uDr5zrt
syyN8+8EfwJyDAoTyUA0B4zEX4wS+0LCNGjsriQoCw==
=6zzw
-----END PGP SIGNATURE-----

--------------49yTbD0VzFZXGbqXOrEIWG8R--

