Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1571CC88E6A
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:22:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420591.1646851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62t7-0003ew-1f; Mon, 14 Sep 2026 09:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420591.1646851; Mon, 14 Sep 2026 09:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62t6-0003ep-Uz; Mon, 14 Sep 2026 09:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1420591;
 Mon, 14 Sep 2026 09:22:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x62t5-0003b4-92
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:22:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x62t4-00Ch0A-LX
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:22:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7bcb1-8faa-0a2a0a5109dd-0a2a450ba4e2-42
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:22:06 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7bb91-b7e8-0a2a450b0019-c387df839b2a-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:17:05 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 381CA1F7C0;
 Mon, 14 Sep 2026 09:16:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C246C1368C;
 Mon, 14 Sep 2026 09:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7er1CYa7p2pmSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 14 Sep 2026 09:16:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Autocrypt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789377421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v1RrV7t0jDaBEHvthMlJoTa5jLAg1QwWf/8HMUAMS5M=;
	b=C2ngAX+kqzwjyWUcmDQ97lLsOvJK81one/91ISlnlCpwYLTucqodBmT16L3RkW06KP/F42
	l5IiAoHS+Yt5Ub/leaIMfv3M5vWm8YWTkVTbDLL9tgmS9VReeK1nj3Pl9WXzdlcOReli8t
	M08mh9rh0s5L9f7+JYfk6kLJXAu5/BU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=WXP1Ff81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789377417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v1RrV7t0jDaBEHvthMlJoTa5jLAg1QwWf/8HMUAMS5M=;
	b=WXP1Ff81820aoQinhSwZSmdMSWwX3uEWa2DLt5n3JcCMf1tj66j0dmFtSZW1Gk0jP1oWJa
	BJkKyubZL16T3F21y/Vc3p7VOQTHInG6FgsRmMkSV9yiFjyE9JM8/BQOLqdpcGLmEMq2ZW
	JUvRm5CQ5oqIe8ruwgvRv5t3hMcOWLw=
Message-ID: <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Date: Mon, 14 Sep 2026 11:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260826045720.5779-3-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3KyECH0prxl7JcdHsdJELaLT"
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 381CA1F7C0
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-purgate-ID: tlsNG-42698a/1789377426-A9AC09EA-3DBA0283/0/0
X-purgate-type: clean
X-purgate-size: 12601

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3KyECH0prxl7JcdHsdJELaLT
Content-Type: multipart/mixed; boundary="------------sOm8GJl0l7gE0HMoNg1Nh0eW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
Message-ID: <e64415b8-f117-43d8-a977-8994650050c2@suse.com>
Subject: Re: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-3-frn1furkan10@gmail.com>
In-Reply-To: <20260826045720.5779-3-frn1furkan10@gmail.com>
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

--------------sOm8GJl0l7gE0HMoNg1Nh0eW
Content-Type: multipart/mixed; boundary="------------gjsrgHf5698EAt0Wf0HjYQnv"

--------------gjsrgHf5698EAt0Wf0HjYQnv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjYgMDY6NTcsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gTm93IHRoYXQg
d2UgaGF2ZSBpbnRyb2R1Y2VkIGFkbWlzc2lvbiBjb250cm9sIGZvciBuZXcgYW5kDQo+IHJl
bW92ZWQgdW5pdHMuIEV4dGVuZCBpdCB0byBYRU5fRE9NQ1RMX1NDSEVET1BfcHV0aW5mbyBh
bmQNCj4gcHV0dmNwdWluZm8sIHNvIGdyb3dpbmcgYW4gZXhpc3RpbmcgcmVzZXJ2YXRpb24g
dmlhDQo+IHhsIHNjaGVkLXJ0ZHMgaXMgY2hlY2tlZCB0b28uDQo+IA0KPiBwdXRpbmZvIHNl
dHMgdGhlIHNhbWUgKHBlcmlvZCwgYnVkZ2V0KSBmb3IgZXZlcnkgdW5pdCBvZiBhDQo+IGRv
bWFpbiBhdCBvbmNlLCBzbyBpdCB0ZXN0cyB0aGUgd2hvbGUgZG9tYWluJ3MgdXRpbGl6YXRp
b24NCj4gZGVsdGEgYXRvbWljYWxseSwgcmF0aGVyIHRoYW4gdW5pdC1ieS11bml0LCB3aGlj
aCBjb3VsZA0KPiBzcHVyaW91c2x5IHJlamVjdCBhbiBvdmVyYWxsLWFjY2VwdGFibGUgY2hh
bmdlIGRlcGVuZGluZyBvbg0KPiBpdGVyYXRpb24gb3JkZXIuDQo+IA0KPiBwdXR2Y3B1aW5m
byBjaGFuZ2VzIG9uZSB1bml0IGF0IGEgdGltZSwgc28gaXQganVzdCBjYWxscw0KPiBydF9h
ZG1pc3Npb25fdGVzdCgpIGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnVya2Fu
IENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KPiAtLS0NCj4gICB4ZW4vY29t
bW9uL3NjaGVkL3J0LmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvcnQuYyBiL3hlbi9jb21tb24vc2NoZWQv
cnQuYw0KPiBpbmRleCA5MTI2MzIwODAxLi45NjQzYTI3N2ZlIDEwMDY0NA0KPiAtLS0gYS94
ZW4vY29tbW9uL3NjaGVkL3J0LmMNCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+
IEBAIC0xNTI3LDExICsxNTI3LDQzIEBAIHJ0X2RvbV9jbnRsKA0KPiAgICAgICAgICAgb3At
PnUucnRkcy5idWRnZXQgPSBSVERTX0RFRkFVTFRfQlVER0VUIC8gTUlDUk9TRUNTKDEpOw0K
PiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGNhc2UgWEVOX0RPTUNUTF9TQ0hFRE9QX3B1
dGluZm86DQo+ICsgICAgew0KPiArICAgICAgICB1aW50NjRfdCBkb21fb2xkX3V0aWwgPSAw
LCBuZXdfdXRpbCwgbmV3X3RvdGFsOw0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgbnJfdW5p
dHMgPSAwOw0KPiArDQo+ICAgICAgICAgICByYyA9IHJ0X3ZhbGlkYXRlX3BhcmFtcygmb3At
PnUucnRkcywgJnBlcmlvZCwgJmJ1ZGdldCk7DQo+ICAgICAgICAgICBpZiAoIHJjICkNCj4g
ICAgICAgICAgICAgICBicmVhazsNCj4gICANCj4gKyAgICAgICAgbmV3X3V0aWwgPSBydF91
bml0X3V0aWxpemF0aW9uKHBlcmlvZCwgYnVkZ2V0KTsNCj4gKw0KPiAgICAgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJnBydi0+bG9jaywgZmxhZ3MpOw0KPiArDQo+ICsgICAgICAgIC8q
DQo+ICsgICAgICAgICAqIFNhbWUgKHBlcmlvZCwgYnVkZ2V0KSBmb3IgZXZlcnkgdW5pdCBv
ZiBkOiB0ZXN0IGFuZCBjb21taXQNCj4gKyAgICAgICAgICogdGhlIGRvbWFpbidzIHdob2xl
IHV0aWxpemF0aW9uIGRlbHRhIGF0b21pY2FsbHksIHJhdGhlcg0KPiArICAgICAgICAgKiB0
aGFuIHVuaXQtYnktdW5pdCwgd2hpY2ggY291bGQgc3B1cmlvdXNseSByZWplY3QgYW4NCj4g
KyAgICAgICAgICogb3ZlcmFsbC1hY2NlcHRhYmxlIGNoYW5nZSBkZXBlbmRpbmcgb24gaXRl
cmF0aW9uIG9yZGVyLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgZm9yX2VhY2hfc2No
ZWRfdW5pdCAoIGQsIHVuaXQgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBzdmMg
PSBydF91bml0KHVuaXQpOw0KPiArICAgICAgICAgICAgZG9tX29sZF91dGlsICs9IHJ0X3Vu
aXRfdXRpbGl6YXRpb24oc3ZjLT5wZXJpb2QsIHN2Yy0+YnVkZ2V0KTsNCj4gKyAgICAgICAg
ICAgIG5yX3VuaXRzKys7DQo+ICsgICAgICAgIH0NCj4gKw0KPiArICAgICAgICBuZXdfdG90
YWwgPSBwcnYtPnV0aWxpemF0aW9uIC0gZG9tX29sZF91dGlsICsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgKHVpbnQ2NF90KW5yX3VuaXRzICogbmV3X3V0aWw7DQo+ICsNCj4gKyAgICAg
ICAgaWYgKCBuZXdfdG90YWwgPiBwcnYtPnV0aWxpemF0aW9uICYmIG5ld190b3RhbCA+IHJ0
X3V0aWxpemF0aW9uX2NhcChkKSApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHJj
ID0gLUVJTlZBTDsNCg0KSXMgRUlOVkFMIGEgZ29vZCBjaG9pY2UgaGVyZT8gSSB0aGluayBh
IGRpZmZlcmVudCBlcnJvciBjb2RlIG1pZ2h0IGJlIHdhbnRlZC4NCg0KPiArICAgICAgICAg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJ2LT5sb2NrLCBmbGFncyk7DQo+ICsgICAg
ICAgICAgICBicmVhazsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIHBydi0+dXRp
bGl6YXRpb24gPSBuZXdfdG90YWw7DQo+ICsNCj4gICAgICAgICAgIGZvcl9lYWNoX3NjaGVk
X3VuaXQgKCBkLCB1bml0ICkNCj4gICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICBzdmMg
PSBydF91bml0KHVuaXQpOw0KPiBAQCAtMTU0MCw2ICsxNTcyLDcgQEAgcnRfZG9tX2NudGwo
DQo+ICAgICAgICAgICB9DQo+ICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZw
cnYtPmxvY2ssIGZsYWdzKTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiArICAgIH0NCj4gICAg
ICAgY2FzZSBYRU5fRE9NQ1RMX1NDSEVET1BfZ2V0dmNwdWluZm86DQo+ICAgICAgIGNhc2Ug
WEVOX0RPTUNUTF9TQ0hFRE9QX3B1dHZjcHVpbmZvOg0KPiAgICAgICAgICAgd2hpbGUgKCBp
bmRleCA8IG9wLT51LnYubnJfdmNwdXMgKQ0KPiBAQCAtMTU4NCw2ICsxNjE3LDE1IEBAIHJ0
X2RvbV9jbnRsKA0KPiAgIA0KPiAgICAgICAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmcHJ2LT5sb2NrLCBmbGFncyk7DQo+ICAgICAgICAgICAgICAgICAgIHN2YyA9IHJ0X3Vu
aXQoZC0+dmNwdVtsb2NhbF9zY2hlZC52Y3B1aWRdLT5zY2hlZF91bml0KTsNCj4gKw0KPiAr
ICAgICAgICAgICAgICAgIHJjID0gcnRfYWRtaXNzaW9uX3Rlc3QocHJ2LCBkLCBzdmMtPnBl
cmlvZCwgc3ZjLT5idWRnZXQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGVyaW9kLCBidWRnZXQpOw0KPiArICAgICAgICAgICAgICAgIGlmICggcmMg
KQ0KPiArICAgICAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmcHJ2LT5sb2NrLCBmbGFncyk7DQo+ICsgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgICAgIH0NCj4gKw0KPiAgICAgICAgICAg
ICAgICAgICBzdmMtPnBlcmlvZCA9IHBlcmlvZDsNCj4gICAgICAgICAgICAgICAgICAgc3Zj
LT5idWRnZXQgPSBidWRnZXQ7DQo+ICAgICAgICAgICAgICAgICAgIGlmICggbG9jYWxfc2No
ZWQudS5ydGRzLmZsYWdzICYgWEVOX0RPTUNUTF9TQ0hFRFJUX2V4dHJhICkNCg0KDQpKdWVy
Z2VuDQo=
--------------gjsrgHf5698EAt0Wf0HjYQnv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gjsrgHf5698EAt0Wf0HjYQnv--

--------------sOm8GJl0l7gE0HMoNg1Nh0eW--

--------------3KyECH0prxl7JcdHsdJELaLT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqnu30FAwAAAAAACgkQsN6d1ii/Ey92
vwf+NQWRm/D9nj52v/bcPjNoiBePbJaURCvvfcJd4BtCqfSgPlB9JAv+qYc5j8qZRoHEp6/Kp3E3
aGKZeqS/M0h/z3fTmN1OG9YxBdU/EjmL6zaxl3TQAcMFq2FOjFT/SkXNlA5KKH/DsyRJMpn7zP8q
yJIN80BI2CJEALA31IyNAm665i/qlZL+Pg1OqMF2WSRUeeE4kiFmwG5KlzGrjkyFKu5wmGiN6cyD
3hv7nN17+nkYTcXmMUrUQyBWcRiT98NSt+ZhZB/KZ+ZkN+b1aoE8ru1+LxYtE9C0pgVSSayL4H7k
EmZN/KbsAvcrvQbg8+sKaUhIev8YrrZRE2MTQIjKIQ==
=9Fim
-----END PGP SIGNATURE-----

--------------3KyECH0prxl7JcdHsdJELaLT--

