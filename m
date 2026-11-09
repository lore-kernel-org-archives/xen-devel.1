Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE31D606A332
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HuMRaeag;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HuMRaeag
Received: from list by lists.xenproject.org with outflank-mailman.1480141.1684106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPuf-0007yX-Kf; Mon, 09 Nov 2026 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480141.1684106; Mon, 09 Nov 2026 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPuf-0007yQ-HP; Mon, 09 Nov 2026 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1480141;
 Mon, 09 Nov 2026 13:59:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQPue-0007yE-6q
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPud-00AzO1-Jp
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:59:55 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af1d1cb-2eae-0a2a0a5409dd-0a2a4501d4e0-40
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:59:55 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af1d1db-5984-0a2a45010019-c387df83b1d2-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:59:55 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 010C81F7B4;
 Mon,  9 Nov 2026 13:59:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FB5313319;
 Mon,  9 Nov 2026 13:59:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zW2CHdrR8WpjSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 09 Nov 2026 13:59:54 +0000
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
	t=1794232795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=46LqWRC6n8IeQOh9l5R4G3PrE/IS98MbYrGH+Aw/mjA=;
	b=HuMRaeag313BJFLrZsVyclG0iamtQDRRWCZnw5jPbklZNsxhj9eTd0h5ACSsUKOzbuQkm5
	xraYwwqT5+FalHiMwqsdafBb79DoHYD1Cf7/8MPKWm4Rt3hqZVlt/pK8I5K1OKWkjuYjvm
	S1dFhzWPxrwMpNyqLcXWSj7cddEzH0s=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794232795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=46LqWRC6n8IeQOh9l5R4G3PrE/IS98MbYrGH+Aw/mjA=;
	b=HuMRaeag313BJFLrZsVyclG0iamtQDRRWCZnw5jPbklZNsxhj9eTd0h5ACSsUKOzbuQkm5
	xraYwwqT5+FalHiMwqsdafBb79DoHYD1Cf7/8MPKWm4Rt3hqZVlt/pK8I5K1OKWkjuYjvm
	S1dFhzWPxrwMpNyqLcXWSj7cddEzH0s=
Message-ID: <bf23dd76-e8e5-44a7-a30d-4a5a8fd30c34@suse.com>
Date: Mon, 9 Nov 2026 14:59:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntdev: fix deadlock between map ioctl and mmap
To: Andrey Misiurov <andrey.misyrov@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Wentao Liang <vulab@iscas.ac.cn>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013170745.583279-1-andrey.misyrov@gmail.com>
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
In-Reply-To: <20261013170745.583279-1-andrey.misyrov@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QNmPN2tRh9ZvgFftFCKcLcWs"
X-Spam-Level: 
X-Spamd-Result: default: False [-8.34 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.45)[0.985];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
X-Spam-Score: -8.34
X-purgate-ID: tlsNG-d62444/1794232795-1F063757-DB0DFDC2/35/110847
X-purgate-type: clean
X-purgate-size: 6168
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QNmPN2tRh9ZvgFftFCKcLcWs
Content-Type: multipart/mixed; boundary="------------S7MRI164uabaQAZq0HufeLHW";
 protected-headers="v1"; hp="clear"
Message-ID: <bf23dd76-e8e5-44a7-a30d-4a5a8fd30c34@suse.com>
Date: Mon, 9 Nov 2026 14:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntdev: fix deadlock between map ioctl and mmap
To: Andrey Misiurov <andrey.misyrov@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Wentao Liang <vulab@iscas.ac.cn>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013170745.583279-1-andrey.misyrov@gmail.com>
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
In-Reply-To: <20261013170745.583279-1-andrey.misyrov@gmail.com>

--------------S7MRI164uabaQAZq0HufeLHW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjYgMTk6MDcsIEFuZHJleSBNaXNpdXJvdiB3cm90ZToNCj4gQ29tbWl0IDQ1
Y2ExYWZlMmZkMSAoInhlbi9nbnRkZXY6IGZpeCBlcnJvciBoYW5kbGluZyBpbiBpb2N0bCIp
IG1vdmVkDQo+IGNvcHlfdG9fdXNlcigpIGluIGdudGRldl9pb2N0bF9tYXBfZ3JhbnRfcmVm
KCkgdW5kZXIgcHJpdi0+bG9jay4gQQ0KPiBmYXVsdCBpbiBjb3B5X3RvX3VzZXIoKSB0YWtl
cyBtbWFwX2xvY2ssIHdoaWxlIGdudGRldl9tbWFwKCkgaXMgY2FsbGVkDQo+IHdpdGggbW1h
cF9sb2NrIGhlbGQgYW5kIHRha2VzIHByaXYtPmxvY2s6DQo+IA0KPiAgICBpb2N0bCB0aHJl
YWQgICAgICAgICAgICAgICAgICAgICAgICBtbWFwIHRocmVhZA0KPiAgICBtdXRleF9sb2Nr
KCZwcml2LT5sb2NrKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtbWFwX3dyaXRlX2xvY2sobW0pDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdudGRldl9tbWFwKCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtdXRleF9sb2NrKCZwcml2LT5sb2NrKQ0KPiAgICBjb3B5X3RvX3Vz
ZXIoKSBmYXVsdHMNCj4gICAgICBtbWFwX3JlYWRfbG9jayhtbSkNCj4gDQo+IFJlcHJvZHVj
ZWQgb24gRGViaWFuIDYuMTIuMTExIGluIGEgWGVuIGd1ZXN0LCB3aXRoIHRoZSBpb2N0bCBh
cmd1bWVudA0KPiBvbiBhIE1BUF9QUklWQVRFIGZpbGUgcGFnZSB0aGF0IGhhcyBub3QgYmVl
biB3cml0dGVuIHlldC4gc3lzcnEtdzoNCj4gDQo+ICAgIHRhc2s6cmVwcm8gc3RhdGU6RCBz
dGFjazowIHBpZDo0NDc5IHRnaWQ6NDQ3NyBwcGlkOjEgZmxhZ3M6MHgwMDAwMDAwMA0KPiAg
ICAgcndzZW1fZG93bl9yZWFkX3Nsb3dwYXRoKzB4MjVjLzB4NDgwDQo+ICAgICBkb3duX3Jl
YWRfa2lsbGFibGUrMHg0OC8weGMwDQo+ICAgICBsb2NrX21tX2FuZF9maW5kX3ZtYSsweDk2
LzB4MjUwDQo+ICAgICBkb191c2VyX2FkZHJfZmF1bHQrMHgxMmQvMHg2MjANCj4gICAgIGV4
Y19wYWdlX2ZhdWx0KzB4N2UvMHgxODANCj4gICAgIGFzbV9leGNfcGFnZV9mYXVsdCsweDI2
LzB4MzANCj4gICAgIF9jb3B5X3RvX3VzZXIrMHgzNi8weDUwDQo+ICAgICBnbnRkZXZfaW9j
dGwrMHgzYjkvMHhhMDAgW3hlbl9nbnRkZXZdDQo+ICAgICBfX3g2NF9zeXNfaW9jdGwrMHg5
Ny8weGMwDQo+ICAgIHRhc2s6cmVwcm8gc3RhdGU6RCBzdGFjazowIHBpZDo0NDgwIHRnaWQ6
NDQ3NyBwcGlkOjEgZmxhZ3M6MHgwMDAwMDAwMA0KPiAgICAgX19tdXRleF9sb2NrLmNvbnN0
cHJvcC4wKzB4NDFiLzB4NzIwDQo+ICAgICBnbnRkZXZfbW1hcCsweDRkLzB4MzMwIFt4ZW5f
Z250ZGV2XQ0KPiAgICAgX19tbWFwX3JlZ2lvbisweDY5Ny8weGIxMA0KPiAgICAgbW1hcF9y
ZWdpb24rMHg3OC8weGEwDQo+ICAgICBkb19tbWFwKzB4NDVkLzB4NjMwDQo+ICAgICB2bV9t
bWFwX3Bnb2ZmKzB4ZjgvMHgxYzANCj4gDQo+IERyb3AgcHJpdi0+bG9jayBiZWZvcmUgY29w
eV90b191c2VyKCkgYWdhaW4uIE9uIGZhaWx1cmUsIHJlLXRha2UgaXQNCj4gYW5kIHJlbW92
ZSB0aGUgbWFwIGJ5IGluZGV4LCBhcyBJT0NUTF9HTlRERVZfVU5NQVBfR1JBTlRfUkVGIGRv
ZXMsDQo+IHNpbmNlIGFub3RoZXIgdGhyZWFkIG1heSBoYXZlIHVubWFwcGVkIGl0IG1lYW53
aGlsZS4NCj4gDQo+IEZpeGVzOiA0NWNhMWFmZTJmZDEgKCJ4ZW4vZ250ZGV2OiBmaXggZXJy
b3IgaGFuZGxpbmcgaW4gaW9jdGwiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgTWlzaXVyb3YgPGFuZHJleS5taXN5cm92QGdtYWls
LmNvbT4NClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K

--------------S7MRI164uabaQAZq0HufeLHW--

--------------QNmPN2tRh9ZvgFftFCKcLcWs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrx0doFAwAAAAAACgkQsN6d1ii/Ey9P
tgf+LyqAgIvGovFfy0uFymW+Y4EyTAn3/+7DFLJVtyioaavNnU9b0fvurc1f+XTcXp5g2QiFaU2Y
DVIbaOU9CsZG8BW468Htscljm7yzyhfNxniJqxVKmsgNRZKZMpnpSPABbCSZT6MkHRIiKEwJCUyd
fkIl9G4KdW3f+OKlpqnT/kXEAE2B5kf+JggZHkDnixGp6Fql2pqrA7vDrwA6CKz5P0Ctg9zOg9OB
mZWHHrI4UWhPhFNj+y3zdKjoUNQZOdZS5ybB1FmtwbI+PMhngA/jwWtvsSlsO4BNqd7bqIZP4gSB
RRtjVIKTMiubirk1cyhjHxyPigHfabtkovoI8yUnMg==
=pRR8
-----END PGP SIGNATURE-----

--------------QNmPN2tRh9ZvgFftFCKcLcWs--

