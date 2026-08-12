Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03557C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:17:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388869.1629840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu497-0007il-VT; Wed, 12 Aug 2026 08:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388869.1629840; Wed, 12 Aug 2026 08:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu497-0007ie-R6; Wed, 12 Aug 2026 08:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1388869;
 Wed, 12 Aug 2026 08:17:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wu496-0007iY-8a
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:17:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu495-002Vwf-KN
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:17:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7c2bfa-2eae-0a2a0a5409dd-0a2a450c80aa-32
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:17:07 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7c2c03-f479-0a2a450c0019-c387df839b7c-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:17:07 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEB2E3E5A;
 Wed, 12 Aug 2026 08:16:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85C0E779B1;
 Wed, 12 Aug 2026 08:16:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w3uIH/orfGpQNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 12 Aug 2026 08:16:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786522622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+UjNEb0Wfjfq0TULQLgzkeXjL7nqgRcSI5XYS1L2kWk=;
	b=FI29BnNUeI02wxWMO560SdRrB+pUA1+/iVnhyFOdd3Yql4j/PL8yRrpxgf4L0cP9A6dlRH
	ezjP18JZGHzbVVFPRxcA+QARAtiEHNEDnPGONtLqH+H8CWe/dh25W6+T3ZQmy1i/eopH9n
	BAY4slmDyJwX2GUFDPlYoP8/2P45iBU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=HGy8Jhwb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786522618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+UjNEb0Wfjfq0TULQLgzkeXjL7nqgRcSI5XYS1L2kWk=;
	b=HGy8JhwbuhI6Iih89b+31QHuTFuTqlCU5cxIJHqpqCANw7IeTzDpYInjW8zBaups23/WMH
	oacmPRMmmAueso7TIE4i4IYT+QpajUz0iSe6+g2ry45WEJnfOIu8P/FjMELPE+YTHxFx+N
	LXL5L7DEqE9duCzmYqC7hCXcKpTuoYo=
Message-ID: <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com>
Date: Wed, 12 Aug 2026 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260720081833.4122182-1-jgross@suse.com>
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
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------azPQUim8JMMg4gsb7rXqLEBm"
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Queue-Id: BEB2E3E5A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-d25034/1786522627-016C6A5B-C43B2E88/0/0
X-purgate-type: clean
X-purgate-size: 14574

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------azPQUim8JMMg4gsb7rXqLEBm
Content-Type: multipart/mixed; boundary="------------AeOjWSiT0qOlEfDcFYrUoUu0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <f8481120-00c5-411e-ad66-38ff550bdd47@suse.com>
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
References: <20260720081833.4122182-1-jgross@suse.com>
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
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

--------------AeOjWSiT0qOlEfDcFYrUoUu0
Content-Type: multipart/mixed; boundary="------------CRoskvIA0U2r1ykjecVSz6UA"

--------------CRoskvIA0U2r1ykjecVSz6UA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW55IGZlZWRiYWNrPw0KDQpPbiAyMC4wNy4yNiAxMDoxOCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4gVGhlIGdydWItcHYgc3R1YmRvbXMgKDMyLSBhbmQgNjQtYml0KSBhcmUgZGlzYWJs
ZWQgYnkgZGVmYXVsdCBzaW5jZQ0KPiBzZXZlcmFsIHllYXJzIG5vdy4NCj4gDQo+IFJlbW92
ZSB0aGVtIGluIG9yZGVyIHRvIGVuYWJsZSByZW1vdmluZyBxdWl0ZSBzb21lIG1vcmUgY29k
ZSBmcm9tIFhlbi4NCj4gSW4gY2FzZSBzb21lb25lIGlzIHJlYWxseSBkZXBlbmRpbmcgb24g
Z3J1Yi1wdiwgdGhleSBjYW4gZWFzaWx5IHRha2UgaXQNCj4gZnJvbSBhbiBvbGRlciBYZW4g
YnVpbGQsIGFzIHRoZXJlIGlzIG5vIFhlbiB2ZXJzaW9uIGRlcGVuZGVuY3kgaW4NCj4gZ3J1
Yi1wdiAoYSB2ZXJzaW9uIGJ1aWx0IDMgeWVhcnMgYWdvIGhhcyBiZWVuIHRlc3RlZCB0byBz
dGlsbCB3b3JrDQo+IHdpdGggY3VycmVudCA0LjIzIHN0YWdpbmcgWGVuKS4NCj4gDQo+IE5v
dGUgdGhhdCBhZnRlciB0aGlzIHNlcmllcyBoYXMgYmVlbiBjb21taXR0ZWQsIHNvbWUgYWRk
aXRpb25hbA0KPiBjbGVhbnVwIGlzIHBvc3NpYmxlIGJ5IHJlbW92aW5nIHN0dWJkb20gbGli
cGNpIGFuZCB6bGliIHN1cHBvcnQsIGJ1dA0KPiB0aGlzIHdpbGwgcmVxdWlyZSBhIG1vZGlm
aWNhdGlvbiBvZiBNaW5pLU9TIGRlcGVuZGluZyBvbiB0aGVzZSBwYXRjaGVzLg0KPiANCj4g
Q2hhbmdlcyBpbiBWMjoNCj4gLSBtb3ZlZCBvbmUgaHVuayBmcm9tIHBhdGNoIDIgdG8gcGF0
Y2ggMQ0KPiANCj4gSnVlcmdlbiBHcm9zcyAoNSk6DQo+ICAgIHN0dWJkb206IHJlbW92ZSBz
dXBwb3J0IGZvciBncnViLXB2DQo+ICAgIHN0dWJkb206IHJlbW92ZSBzdXBwb3J0IGZvciBi
dWlsZGluZyBpbiAzMi1iaXQgbW9kZQ0KPiAgICBzdHViZG9tOiByZW1vdmUgYnVpbGRpbmcg
b2YgbGlieGVuZ3Vlc3QgYW5kIGxpYnhlbmN0cmwNCj4gICAgZG9jczogcmVtb3ZlIHN0YWxl
IHN0dWJkb20gZW50cmllcyBmcm9tIHN0dWJkb20udHh0DQo+ICAgIHRvb2xzL2xpYnhlbmd1
ZXN0OiByZW1vdmUgTWluaS1PUyBzcGVjaWZpYyBwYXJ0cw0KPiANCj4gICBNYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA2IC0NCj4gICBjb25m
aWcvU3R1YmRvbS5tay5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzIC0NCj4g
ICBkb2NzL21pc2Mvc3R1YmRvbS50eHQgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDY5
IC0NCj4gICBzdHViZG9tLy5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAxIC0NCj4gICBzdHViZG9tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDY5ICstDQo+ICAgc3R1YmRvbS9jb25maWd1cmUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA2NSAtDQo+ICAgc3R1YmRvbS9jb25maWd1cmUuYWMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMiAtDQo+ICAgc3R1YmRvbS9ncnViLnBhdGNoZXMv
MDBjdnMgICAgICAgICAgICAgICAgICAgIHwgMTAyMiAtLS0tLQ0KPiAgIHN0dWJkb20vZ3J1
Yi5wYXRjaGVzLzEwZ3JhcGhpY3MuZGlmZiAgICAgICAgICB8IDIyOTcgLS0tLS0tLS0tLS0N
Cj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy8xMWdyYXBoaWNzLWtleWJvYXJkLmRpZmYgfCAg
IDEzIC0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy8yMHByaW50X2Z1bmMuZGlmZiAgICAg
ICAgfCAgIDUyIC0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy8zMHNhdmVkZWZhdWx0LmRp
ZmYgICAgICAgfCAgMTg2IC0NCj4gICAuLi4vZ3J1Yi5wYXRjaGVzLzQwZXh0M18yNTZieXRl
X2lub2RlLmRpZmYgICAgfCAgMTE0IC0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy81MGZz
X2Z1bGxkaXNrLmRpZmYgICAgICAgfCAgIDcyIC0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hl
cy82MGV4dDQuZGlmZiAgICAgICAgICAgICAgfCAgNDc0IC0tLQ0KPiAgIHN0dWJkb20vZ3J1
Yi5wYXRjaGVzLzYxYnRyZnMuZGlmZiAgICAgICAgICAgICB8IDM0OTkgLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy83MGNvbXBpbGVyX3dhcm5pbmdzLmRp
ZmYgfCAgIDQ1IC0NCj4gICBzdHViZG9tL2dydWIucGF0Y2hlcy85OW1pbmlvcyAgICAgICAg
ICAgICAgICAgfCAxNTcwIC0tLS0tLS0tDQo+ICAgc3R1YmRvbS9ncnViL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA4OCAtDQo+ICAgc3R1YmRvbS9ncnViL2Jvb3Qt
eDg2XzMyLlMgICAgICAgICAgICAgICAgICAgIHwgIDExMiAtDQo+ICAgc3R1YmRvbS9ncnVi
L2Jvb3QteDg2XzY0LlMgICAgICAgICAgICAgICAgICAgIHwgIDEwOCAtDQo+ICAgc3R1YmRv
bS9ncnViL2NvbmZpZy5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMiAtDQo+ICAg
c3R1YmRvbS9ncnViL2tleGVjLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQzNCAt
LQ0KPiAgIHN0dWJkb20vZ3J1Yi9taW5pLW9zLmMgICAgICAgICAgICAgICAgICAgICAgICB8
ICA3NzEgLS0tLQ0KPiAgIHN0dWJkb20vZ3J1Yi9taW5pLW9zLmggICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDcgLQ0KPiAgIHN0dWJkb20vZ3J1Yi9taW5pb3MuY2ZnICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDQgLQ0KPiAgIHN0dWJkb20vZ3J1Yi9vc2RlcC5oICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMzAgLQ0KPiAgIHRvb2xzL2xpYnMvZ3Vlc3QvTWFr
ZWZpbGUuY29tbW9uICAgICAgICAgICAgICB8ICAgMTUgLQ0KPiAgIHRvb2xzL2xpYnMvZ3Vl
c3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlLmMgICB8ICAgNDggLQ0KPiAgIHRvb2xzL2xp
YnMvZ3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlLmggICB8ICAgMjggLQ0KPiAgIC4u
Li9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfYnppcDIuYyAgICB8ICAgMTQgLQ0K
PiAgIC4uLi9saWJzL2d1ZXN0L3hnX2RvbV9kZWNvbXByZXNzX3Vuc2FmZV9sejQuYyB8ICAg
MzkgLQ0KPiAgIC4uLi9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfbHptYS5jICAg
ICB8ICAgMTQgLQ0KPiAgIC4uLi9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfbHpv
MXguYyAgICB8ICAgNDQgLQ0KPiAgIC4uLi9saWJzL2d1ZXN0L3hnX2RvbV9kZWNvbXByZXNz
X3Vuc2FmZV94ei5jICB8ICAgNDYgLQ0KPiAgIC4uLi9ndWVzdC94Z19kb21fZGVjb21wcmVz
c191bnNhZmVfenN0ZC5jICAgICB8ICAgNDQgLQ0KPiAgIDM2IGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxMTQxNiBkZWxldGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2
NDQgc3R1YmRvbS9ncnViLnBhdGNoZXMvMDBjdnMNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQg
c3R1YmRvbS9ncnViLnBhdGNoZXMvMTBncmFwaGljcy5kaWZmDQo+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHN0dWJkb20vZ3J1Yi5wYXRjaGVzLzExZ3JhcGhpY3Mta2V5Ym9hcmQuZGlmZg0K
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL2dydWIucGF0Y2hlcy8yMHByaW50X2Z1
bmMuZGlmZg0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL2dydWIucGF0Y2hlcy8z
MHNhdmVkZWZhdWx0LmRpZmYNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnVi
LnBhdGNoZXMvNDBleHQzXzI1NmJ5dGVfaW5vZGUuZGlmZg0KPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBzdHViZG9tL2dydWIucGF0Y2hlcy81MGZzX2Z1bGxkaXNrLmRpZmYNCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnViLnBhdGNoZXMvNjBleHQ0LmRpZmYNCj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnViLnBhdGNoZXMvNjFidHJmcy5kaWZmDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHN0dWJkb20vZ3J1Yi5wYXRjaGVzLzcwY29tcGlsZXJf
d2FybmluZ3MuZGlmZg0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL2dydWIucGF0
Y2hlcy85OW1pbmlvcw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL2dydWIvTWFr
ZWZpbGUNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnViL2Jvb3QteDg2XzMy
LlMNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnViL2Jvb3QteDg2XzY0LlMN
Cj4gICBkZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9ncnViL2NvbmZpZy5oDQo+ICAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IHN0dWJkb20vZ3J1Yi9rZXhlYy5jDQo+ICAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHN0dWJkb20vZ3J1Yi9taW5pLW9zLmMNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQg
c3R1YmRvbS9ncnViL21pbmktb3MuaA0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9t
L2dydWIvbWluaW9zLmNmZw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL2dydWIv
b3NkZXAuaA0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2d1ZXN0L3hnX2Rv
bV9kZWNvbXByZXNzX3Vuc2FmZS5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xp
YnMvZ3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlLmgNCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgdG9vbHMvbGlicy9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfYnppcDIu
Yw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2d1ZXN0L3hnX2RvbV9kZWNv
bXByZXNzX3Vuc2FmZV9sejQuYw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJz
L2d1ZXN0L3hnX2RvbV9kZWNvbXByZXNzX3Vuc2FmZV9sem1hLmMNCj4gICBkZWxldGUgbW9k
ZSAxMDA2NDQgdG9vbHMvbGlicy9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfbHpv
MXguYw0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2d1ZXN0L3hnX2RvbV9k
ZWNvbXByZXNzX3Vuc2FmZV94ei5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xp
YnMvZ3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlX3pzdGQuYw0KPiANCg0K
--------------CRoskvIA0U2r1ykjecVSz6UA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CRoskvIA0U2r1ykjecVSz6UA--

--------------AeOjWSiT0qOlEfDcFYrUoUu0--

--------------azPQUim8JMMg4gsb7rXqLEBm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmp8K/oFAwAAAAAACgkQsN6d1ii/Ey9f
awf8D8TO6kxEcF4Ar69AsZ0hsAYl7PT5h0YXLvbF8aB1U0q3xFk/xjZbS37doDYLymDSHBP6JKxg
fmeJe3aXULSSR+mw8r/TyFb89Wv4FS5ucCjrd/MA2ZYaQuTlCmG/4jzdYAd+eC+IYCv33whT5Bqs
PRNjLnOvWioF3dsR7OxYYCAJEnOYuLPlFEvexLZg8VPPlgeXzYsRu0a1CxSm4/0YJptpbQTEQqGw
TYB9T5S4ncb4Usq81exUxqre3KPIWAoT3Y31vYDzXNePgwSPo6rmv97twtDI8zbKf70rCeQDm7hD
TyZg4zaRPKQjkLLJ+IQoVH66vh8WhLTcn+exNSp+xw==
=iw9k
-----END PGP SIGNATURE-----

--------------azPQUim8JMMg4gsb7rXqLEBm--

