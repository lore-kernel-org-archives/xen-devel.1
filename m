Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC14C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 12:46:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401999.1637431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzvy1-0001IN-FT; Fri, 28 Aug 2026 12:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401999.1637431; Fri, 28 Aug 2026 12:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzvy1-0001IG-Bv; Fri, 28 Aug 2026 12:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1401999;
 Fri, 28 Aug 2026 12:45:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wzvxz-0001H5-Je
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 12:45:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzvxy-00CURd-NS
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 14:45:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a9182eb-8faa-0a2a0a5109dd-0a2a4509dac2-46
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 14:45:54 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a918302-be1a-0a2a45090019-c387df8399d6-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 14:45:54 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59ED51FE7D;
 Fri, 28 Aug 2026 12:45:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 112BF13515;
 Fri, 28 Aug 2026 12:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kAvUAvSCkWoIQwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 28 Aug 2026 12:45:40 +0000
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
	t=1787921144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y0NhCw6np7quVyS+gVMMtYEVUwNDso7OKTq4DlmC3R4=;
	b=dv5Luscpe++rus5mF4MWpg5KECGJZoaPyu6OWKm/L+fIuGSVgNq12HTDzPb+Ga3FgZh2sV
	/hAVscJivPHOVzJv/Kb5tc0nqdLzymgOi71g527A6yM6EPKpm8teVLJzNt6z4AS7oaGpBp
	2Ns+7oCAm0OlSf/Jd25PkDMuBtXdHt0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="C/Zla2mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787921140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y0NhCw6np7quVyS+gVMMtYEVUwNDso7OKTq4DlmC3R4=;
	b=C/Zla2mvNOrB8lNyE72cZEkX0aCN4ayWHver6Gc1Ytg50oFf/u1uVQVH3vzIJi8LmJ4m+5
	vgHzyO8maVR4L516EghP5dAYnObMbVuyF8t+m9IN9z7u1IdxwnLQoZNhif20Z5cIkvlHZc
	tlrolmGa3pIFFU8T5FrNUxCX4C37ZRo=
Message-ID: <0c4e9bb8-f2f1-4a33-8050-1ebc311f46dc@suse.com>
Date: Fri, 28 Aug 2026 14:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260819051532.9197-2-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GQliKWGOTNcjML0o29NTqMFk"
X-Rspamd-Queue-Id: 59ED51FE7D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-purgate-ID: tlsNG-bad1c0/1787921154-FD668034-D84554D0/0/0
X-purgate-type: clean
X-purgate-size: 11019

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GQliKWGOTNcjML0o29NTqMFk
Content-Type: multipart/mixed; boundary="------------9lfENoGpuQ4900kHH8gLgJeU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
Message-ID: <0c4e9bb8-f2f1-4a33-8050-1ebc311f46dc@suse.com>
Subject: Re: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
 <20260819051532.9197-2-frn1furkan10@gmail.com>
In-Reply-To: <20260819051532.9197-2-frn1furkan10@gmail.com>
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

--------------9lfENoGpuQ4900kHH8gLgJeU
Content-Type: multipart/mixed; boundary="------------4c8rhPho3rtxE5Q5Iyn5Gydy"

--------------4c8rhPho3rtxE5Q5Iyn5Gydy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDguMjYgMDc6MTUsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gc2NoZWRfbW92
ZV9kb21haW4oKSBkZXJpdmVzIHRoZSBudW1iZXIgb2YgdW5pdHMgdG8gcmVidWlsZCBmcm9t
DQo+IGQtPm1heF92Y3B1cywgd2hpY2ggaXMgZml4ZWQgYXQgZG9tYWluIGNyZWF0aW9uIGFu
ZCBuZXZlciByb2xsZWQNCj4gYmFjayBpZiB2Y3B1X2NyZWF0ZSgpIGZhaWxzIHBhcnR3YXkg
dGhyb3VnaCBidWlsZGluZyBhIGRvbWFpbi4gU28NCj4gZC0+dmNwdVtpXSBjYW4gYmUgTlVM
TCBmb3Igc29tZSBpIGV2ZW4gdGhvdWdoIG1heF92Y3B1cyBzdGlsbA0KPiBjb3VudHMgaXQg
LSB0aGlzIGhhcHBlbnMgaWYgc2NoZWRfYWxsb2NfdWRhdGEoKSByZXR1cm5zIE5VTEwuDQo+
IA0KPiBUaGUgcGVyLXVuaXQgbG9vcCBkb2Vzbid0IGNoZWNrIGZvciB0aGlzOiBpdCBzZXRz
DQo+IHVuaXQtPnZjcHVfbGlzdCA9IGQtPnZjcHVbdW5pdF9pZF0gKE5VTEwpIGFuZCBoYW5k
cyB0aGF0IGJyb2tlbg0KPiB1bml0IHN0cmFpZ2h0IHRvIHRoZSBkZXN0aW5hdGlvbiBzY2hl
ZHVsZXIncyBhbGxvY191ZGF0YSgpLA0KPiB3aGljaCBhc3N1bWVzIHZjcHVfbGlzdCBpcyBh
bHdheXMgdmFsaWQgYW5kIGNyYXNoZXMgWGVuIHdoZW4NCj4gaXQgaXMgbm90Lg0KPiANCj4g
UmVwcm9kdWNlZCBieSBidWlsZGluZyBhIGRvbWFpbiBpbiBhIG5vbi1kZWZhdWx0IGNwdXBv
b2wgd2hlcmUNCj4gdmNwdSBjcmVhdGlvbiBmYWlscyBwYXJ0d2F5IHRocm91Z2gsIHRoZW4g
ZGVzdHJveWluZyBpdC4NCj4gZG9tYWluX2tpbGwoKSBtb3ZlcyB0aGUgZG9tYWluIGJhY2sg
dG8gdGhlIGRlZmF1bHQgY3B1cG9vbCB2aWENCj4gc2NoZWRfbW92ZV9kb21haW4oKSBiZWZv
cmUgYWN0dWFsbHkgZGVzdHJveWluZyBpdCwgY3Jhc2hpbmcNCj4gaW5zaWRlIHRoZSBkZXN0
aW5hdGlvbiBzY2hlZHVsZXIncyBhbGxvY191ZGF0YSgpIChzZWVuIGluDQo+IENyZWRpdDIn
cyBjc2NoZWQyX2FsbG9jX3VkYXRhKCkgLT4gaXNfaWRsZV91bml0KCkgLT4gTlVMTCBkZXJl
ZikuDQo+IA0KPiBCZWZvcmUgYnVpbGRpbmcgYSB1bml0IGluIHNjaGVkX21vdmVfZG9tYWlu
KCksIGNoZWNrIHdoZXRoZXIgYWxsDQo+IHZwY3Ugc2xvdHMgYmVsb25naW5nIHRvIHRoYXQg
dW5pdCBhcmUgcG9wdWxhdGVkLiBJZiBhbnkgb2YgaXRzDQo+IHZwY3VzIGlzIG1pc3Npbmc6
DQo+ICAgLSBGb3IgYSBkeWluZyBkb21haW4sIHNraXAgdGhlIHVuaXQgYWxsb2NhdGlvbi4N
Cj4gICAtIEZvciBhbiBhY3RpdmUgZG9tYWluLCBhYm9ydCB0aGUgbW92ZSBhbmQgcmV0dXJu
IC1FSU5WQUwgdG8NCj4gICAgIHByZXZlbnQgcnVubmluZyB3aXRoIGRyb3BwZWQgdkNQVXMu
DQo+IA0KPiBGaXhlczogNzBmYWRjNDE2MzViICgieGVuL2NwdXBvb2w6IHN1cHBvcnQgbW92
aW5nIGRvbWFpbiBiZXR3ZWVuIGNwdXBvb2xzIHdpdGggZGlmZmVyZW50IGdyYW51bGFyaXR5
IikNCj4gU2lnbmVkLW9mZi1ieTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21h
aWwuY29tPg0KDQpTb3JyeSBmb3IgcmVhbGl6aW5nIHRoaXMgb25seSBub3csIGJ1dCBJIHRo
aW5rIHRoaXMgcHJvYmxlbSBzaG91bGQgYmUNCnNvbHZlZCBjb21wbGV0ZWx5IGRpZmZlcmVu
dGx5Lg0KDQpUb2RheSB0aGVyZSBhcmUgbXVsdGlwbGUgcGxhY2VzIGluIHRoZSBoeXBlcnZp
c29yIHdoZXJlIHZjcHVzIGFyZSBiZWluZw0Kc2V0dXAgdmlhIHZjcHVfY3JlYXRlKCkuIEZv
ciB2Y3B1LWlkcyBvdGhlciB0aGFuIDAgdGhpcyBpcyBhbHdheXMgZG9uZQ0KaW4gYSBsb29w
IHdpdGggYXNjZW5kaW5nIGlkcywgdXAgdG8gZC0+bWF4X3ZjcHVzLiBXaGVuZXZlciB2Y3B1
X2NyZWF0ZSgpDQppcyBmYWlsaW5nLCB0aGUgbG9vcCBpcyB0ZXJtaW5hdGVkLiBUaGUgb25s
eSBzcGVjaWFsIGNhc2UgaXMgdGhlIGlkbGUtZG9tYWluLA0Kd2hpY2ggd2lsbCBuZXZlciBo
YXZlIHlvdXIgcHJvYmxlbS4NCg0KU28gdGhlIGVhc3kgZml4IHdvdWxkIGJlIHRvOg0KDQot
IGhhdmUgb25seSBvbmUgZnVuY3Rpb24gdmNwdXNfY3JlYXRlKCkgY3JlYXRpbmcgYWxsIHRo
ZSB2Y3B1cyBmb3IgYSBkb21haW4NCiAgIGFuZCB1c2UgdGhpcyBmdW5jdGlvbiBldmVyeXdo
ZXJlIGluc3RlYWQgb2Ygc2FpZCBsb29wDQoNCi0gaW4gY2FzZSBhIHNpbmdsZSB2Y3B1IGNh
bid0IGJlIGNyZWF0ZWQgYnkgdmNwdXNfY3JlYXRlKCksIGQtPm1heF92Y3B1cw0KICAgc2hv
dWxkIGJlIHJlc2V0IHRvIHRoZSBpZCBvZiB0aGUgdmNwdSB3aGljaCBjb3VsZG4ndCBiZSBj
cmVhdGVkDQoNClRoaXMgd2lsbCBhdm9pZCBhbnkgcG90ZW50aWFsIE5VTEwgZGVyZWZzIGVs
c2V3aGVyZSwgYXMgdmNwdSBsb29wcyB3aWxsDQpqdXN0IGJlIGVuZGluZyBiZWZvcmUgaGl0
dGluZyBhIE5VTEwgcG9pbnRlci4NCg0KSW4gY2FzZSB5b3UgYXJlIG5vdCBmZWVsaW5nIGNv
bWZvcnRhYmxlIHdyaXRpbmcgdGhpcyBwYXRjaCwganVzdCBzcGVhayB1cA0KYW5kIEkgd2ls
bCBkbyBpdC4NCg0KDQpKdWVyZ2VuDQo=
--------------4c8rhPho3rtxE5Q5Iyn5Gydy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4c8rhPho3rtxE5Q5Iyn5Gydy--

--------------9lfENoGpuQ4900kHH8gLgJeU--

--------------GQliKWGOTNcjML0o29NTqMFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqRgvMFAwAAAAAACgkQsN6d1ii/Ey8X
FQf/U0/ussTD7PYg8BxOlEksaV1+Z/CgRRog6ItVu8Rw5/FTYEInbtLpOZZ9FMQVZ4G15MYG7gvF
I9X4OARBPIPw81zSO7tAUnthS7plxGsy+mnE+7EA8yOPVJ0DNHG/XgoRlgsXBNHM6JoQQfINXCP8
txM9GbHlKtBuBM8TqIFOvqUyDp/MNhWfAeE0qqVNuttYvSBC1DUprwhk3nDB4pkZQ5gmAX089HBb
kdYQoCkfyVU2i02FTQcf0pU9OYrRUwafVmSmPsLW9hxp6FyunSoeAaePMElX+hTw4zLBEHFXKoqH
SlOhI1utiseuPxgOkKnZItMnuBzDFfiK48tEKf7iAg==
=upuY
-----END PGP SIGNATURE-----

--------------GQliKWGOTNcjML0o29NTqMFk--

