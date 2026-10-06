Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57FCCA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 08:12:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441273.1658837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0Hl-0005JI-NK; Tue, 06 Oct 2026 08:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441273.1658837; Tue, 06 Oct 2026 08:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0Hl-0005JA-K4; Tue, 06 Oct 2026 08:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1441273;
 Tue, 06 Oct 2026 08:12:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xE0Hk-0005J4-LG
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 08:12:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE0Hj-00FmWW-E5
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:12:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4ad6a-bab6-0a2a0a5309dd-0a2a450bcbb8-2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:12:27 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4ad6b-b7e8-0a2a450b0019-c387df82a55e-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:12:27 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DAED21D42;
 Tue,  6 Oct 2026 08:12:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C977136F5;
 Tue,  6 Oct 2026 08:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dbvkCGKtxGoTBQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 06 Oct 2026 08:12:18 +0000
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
	t=1791274342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1tgCwhLFPPglUXIkSM7MP92QdFqwJxiFVoFGuwCwMm8=;
	b=ZGGHGQKzaeKfsKxSWPYdaSM0HmnZQMS58Zh4e08o+HW2yCtElOtc4Yh/A9le5dYWSf246t
	zd3dY8jZwgvdZ7wPxqyu0Q4oUFffxSe0iWk3bKXvuRg3gYUFZQxFk7BYTSLKCSOeDK9Vak
	iydkYsQFJxPSxW+9JyaDLw84FdpiQn4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791274338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1tgCwhLFPPglUXIkSM7MP92QdFqwJxiFVoFGuwCwMm8=;
	b=LbLnWkDp+RUiU7C0Zkl8z6aaHydpFHZafJvSZqdsUebunrv/XL+QoKFxDAAl+SEm7WjAvQ
	Vm2OOBmXmbQ+ttx1w67IpoZKkTX8zNjpWBk5Ss1kFwL1NfOMwcS1m2yyQ+Un0xDktKmVy1
	ZW8WO4rI8e7Mz051ulcF+KHPvF6skbY=
Message-ID: <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
Date: Tue, 6 Oct 2026 10:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
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
In-Reply-To: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SNDHwEID9JsPSbkN03ONjbIy"
X-Spamd-Result: default: False [-3.64 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_SPAM_LONG(0.50)[0.143];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.14)[-0.707];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-purgate-ID: tlsNG-42698a/1791274347-182F49EA-AD413C76/35/110847
X-purgate-type: clean
X-purgate-size: 11090

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SNDHwEID9JsPSbkN03ONjbIy
Content-Type: multipart/mixed; boundary="------------2iZBOgmCxDwcjC0ICN5BTKoV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Message-ID: <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
Subject: Re: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
In-Reply-To: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
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

--------------2iZBOgmCxDwcjC0ICN5BTKoV
Content-Type: multipart/mixed; boundary="------------8wGmc1NztDxQwWIwKYK1bAZ6"

--------------8wGmc1NztDxQwWIwKYK1bAZ6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDIuMjYgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBCb3RoIGRlY3JlYXNl
LXJlc2VydmF0aW9uIGFuZCBwb3B1bGF0ZS1waHlzbWFwIGNhbiBzdWNjZWVkIHBhcnRpYWxs
eS4gRm9yDQo+IHRoZSBmb3JtZXIgdGhpcyBtYXkgYmUgcHJldHR5IHVubGlrZWx5LCBidXQg
Y2xlYXJseSB0aGUgbGF0dGVyIGNhbiBoaXQNCj4gYm90aCBvdXQtb2YtbWVtb3J5IGNvbmRp
dGlvbnMgaW4gdGhlIGh5cGVydmlzb3Igb3IgZGVuaWFsIGJlY2F1c2Ugb2YgdGhlDQo+IGFs
bG9jYXRpb24gZXhjZWVkaW5nIHRoZSBkb21haW4ncyBhbGxvd2FuY2UgKHRoZXJlJ3Mgbm8g
aW50ZXJhY3Rpb24gd2l0aA0KPiB0aGUgYmFsbG9vbiBkcml2ZXIgaGVyZSBlaXRoZXIpLg0K
PiANCj4gSW4gZ250dGFiX2RtYV9mcmVlX3BhZ2VzKCkgd2Ugc2ltcGx5IGNhbid0IGdpdmUg
YmFjayB0byB0aGUgc3lzdGVtIHdoYXQNCj4gaGFzbid0IGJlZW4gcmUtZmlsbGVkIHdpdGgg
YmFja2luZyBtZW1vcnkuIEZvciBnbnR0YWJfZG1hX2FsbG9jX3BhZ2VzKCkNCj4gYm90aCBw
YXJ0cyBvZiB0aGUgb3ZlcmFsbCByZWdpb24gbmVlZCBkZWFsaW5nIHdpdGggZGlmZmVyZW50
bHkuDQo+IA0KPiBXaGlsZSBubyBwcmVzZW50IGNhbGxlciBvZiBnbnR0YWJfZG1hX2ZyZWVf
cGFnZXMoKSBjaGVja3MgaXRzIHJldHVybg0KPiB2YWx1ZSwgYWxzbyBkb24ndCB1c2UgLUVG
QVVMVCB0aGVyZTogSXQgcmVhbGx5IGlzIGFuIG91dC1vZi1tZW1vcnkNCj4gY29uZGl0aW9u
LiAoSW4gZ250dGFiX2RtYV9hbGxvY19wYWdlcygpIC1FRkFVTFQgZG9lc24ndCBsb29rIHF1
aXRlIHJpZ2h0DQo+IGVpdGhlciwgYnV0IEkgY291bGRuJ3QgdGhpbmsgb2YgYSBjbGVhcmx5
IGJldHRlciBlcnJvciBjb2RlIHRoZXJlLikNCj4gDQo+IEZpeGVzOiA5YmRjNzMwNGY1MzYg
KCJ4ZW4vZ3JhbnQtdGFibGU6IEFsbG93IGFsbG9jYXRpbmcgYnVmZmVycyBzdWl0YWJsZSBm
b3IgRE1BIikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiAtLS0NCj4gSSdtIGxpa2VseSBzY3Jld2luZyB0aGluZ3MgdXAsIGFzIEkgY2Fu
J3QgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyBpbnRlbmRlZA0KPiB0byB3b3JrOiBhcmdzLT5k
ZXZfYnVzX2FkZHIgc2hvdWxkbid0IHJlYWxseSBiZSBpbiBwc2V1ZG8tcGh5c2ljYWwgYWRk
cmVzcw0KPiBzcGFjZSwgb3IgZWxzZSB0aGUgYWRkcmVzcyBpc24ndCBzdWl0YWJsZSBmb3Ig
aGFuZGluZyB0byBhIGRldmljZSBpbiBvcmRlcg0KPiB0byBETUEgdG8vZnJvbSBpdC4gSGVu
Y2UgdXNpbmcgX19waHlzX3RvX3BmbigpIG9uIGl0IHRvIHRoZW4gaGFuZCB0aGUNCj4gcmVz
dWx0IHRvIHBmbl90b19wYWdlKCkgZmVlbHMgYm9ndXMuIFdhcyBhbGwgb2YgdGhpcyBwZXJo
YXBzIG9ubHkgZXZlcg0KPiBpbnRlbmRlZCBmb3IgKHRlc3RlZCB3aXRoKSB0cmFuc2xhdGVk
IGRvbWFpbnM/IFdpdGggdGhlIHVzZXMgb2YNCj4geGVubWVtX3Jlc2VydmF0aW9uX3ZhX21h
cHBpbmdfKigpIG9ubHkgYmVpbmcgbWFzcXVlcmFkZT8NCg0KSSBmaW5hbGx5IGZvcmNlZCBt
eXNlbGYgdG8gbG9vayBpbnRvIHRoaXMgbWF6ZS4NCg0KZ250dGFiX2RtYV9hbGxvY19wYWdl
cygpIHdpbGwgb25seSBiZSBjYWxsZWQgdmlhDQpnbnRkZXZfaW9jdGxfZG1hYnVmX2V4cF9m
cm9tX3JlZnMoKSwgd2hpY2ggaGFzOg0KDQoJaWYgKHhlbl9wdl9kb21haW4oKSkgew0KCQlw
cl9kZWJ1ZygiQ2Fubm90IHByb3ZpZGUgZG1hLWJ1ZiBpbiBhIFBWIGRvbWFpblxuIik7DQoJ
CXJldHVybiAtRUlOVkFMOw0KCX0NCg0KYXQgaXRzIHRvcC4NCg0KSSdsbCBzZXR1cCBhIHBh
dGNoIG1ha2luZyB0aGlzIGNsZWFyLg0KDQpBcmUgeW91IGZpbmUgd2l0aCBtZSB0YWtpbmcg
eW91ciBwYXRjaCBhbmQgY2xlYW5pbmcgaXQgdXAgcmVnYXJkaW5nIHRoZQ0KdXNlIG9mIHhl
bm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3VwZGF0ZSgpPw0KDQo+IEZ1cnRoZXJtb3Jl
IHRoZSBhbGxvY2F0ZWQgYnVmZmVyIG91Z2h0IHRvIGhhdmUgYmVlbiBjb250aWd1b3VzIGlu
DQo+IG1hY2hpbmUgLyBETUEgc3BhY2UuIFlldCB0aGUgd2F5IGl0J3MgcmUtcG9wdWxhdGVk
IHVwb24gZnJlZWluZyBvZiB0aGUNCj4gYXJlYSBkb2Vzbid0IGd1YXJhbnRlZSB0aGF0IGF0
IGFsbC4NCj4gDQo+IEFsbCBvZiB3aGF0IGlzIGRvbmUgYXNzdW1lcyBkbWFfZnJlZV97Y29o
ZXJlbnQsd2MsYXR0cn0oKSBpcyBjYXBhYmxlIG9mDQo+IGZyZWVpbmcgcGllY2VtZWFsLiBJ
IG9ubHkgY2hlY2tlZCBkbWFfcmVsZWFzZV9mcm9tX2Rldl9jb2hlcmVudCgpIHRvDQo+IGZ1
bGZpbGwgdGhpcyByZXF1aXJlbWVudC4gSWYgdGhpcyBjYW4ndCBiZSByZWxpZWQgdXBvbiwg
cGxlYXNlIGNvbnNpZGVyDQo+IHRoaXMgc3VibWlzc2lvbiBhcyBtZXJlbHkgYSBidWcgcmVw
b3J0IChmb3Igc29tZW9uZSBlbHNlIHRvIGZpeCkuDQoNClNvbWV0aGluZyBJJ2xsIGxvb2sg
aW50byBhdCBzb21lIHRpbWUuLi4NCg0KDQpKdWVyZ2VuDQo=
--------------8wGmc1NztDxQwWIwKYK1bAZ6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8wGmc1NztDxQwWIwKYK1bAZ6--

--------------2iZBOgmCxDwcjC0ICN5BTKoV--

--------------SNDHwEID9JsPSbkN03ONjbIy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrErWEFAwAAAAAACgkQsN6d1ii/Ey9u
eggAhTzJk32FGHFlHLczBZFpoHodzt1p4e0BpvGmQbLpQWikFem0sRJvz3fcMjWfhzAdeSSqP5fG
c2CX9toEXMx0rJ9w1Wq9L8fepiFpCpb0OO6CyFo9u1ldy5ZWOaff8pXEyQE2MIrqj0OdxPoiw4z1
wHbQm1IJ/OuSz2ovTgKvT50ewguH7VF65l2NiKQ2dIMEDkw/hhYLIX5cgT4OzXqKicglLdcz3Im1
njA1K7We5RZ8nD2k55j3TV73kzqsF1NB1C2lQH5qySme1ilXSf8f1a9Wz1iBMOfbDC1sDxIFg8Xs
V9qGwVmbhdmdUFSJ8NEcDVYktnobSr0/MqqbCeX02w==
=IaKV
-----END PGP SIGNATURE-----

--------------SNDHwEID9JsPSbkN03ONjbIy--

