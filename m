Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8883CC88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:10:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420568.1646824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62hl-0000zG-L1; Mon, 14 Sep 2026 09:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420568.1646824; Mon, 14 Sep 2026 09:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x62hl-0000z7-GG; Mon, 14 Sep 2026 09:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1420568;
 Mon, 14 Sep 2026 09:10:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x62hk-0000z1-N8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:10:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x62hj-00F8Kz-FU
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:10:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7b9f0-e002-0a2a0a5209dd-0a2a4503a522-34
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:10:23 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7b9fe-fae8-0a2a45030019-c387df82ea40-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:10:23 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 607CB21C09;
 Mon, 14 Sep 2026 09:10:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 412B613693;
 Mon, 14 Sep 2026 09:10:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 85wNDPW5p2qtQwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 14 Sep 2026 09:10:13 +0000
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
	t=1789377018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L0yEqga84Lai4g4C2HoxLMw5vN/Q+3iQH0yaLMApfE4=;
	b=ewc5NhYlzzaMVIWgBxvYdaD0Mopf/AKfIHgqX3ftbxgVLbNcDdmZdkAOjFweiVVKC9r3gU
	TsB1HgLxybVY/GsdbvkgdRn4W7SjPEGbQ5rdUEduAHGx/qcRB7oX+1NrVpwbqXvvuCG6rd
	iw//n5MTl/c66sARePLjuYzqK0TS/Jg=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=VdSnNMfT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789377014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L0yEqga84Lai4g4C2HoxLMw5vN/Q+3iQH0yaLMApfE4=;
	b=VdSnNMfTfuu2ZpVn7LRDCR/QrNntCCfLuLQMQqULcSbHeUo8EllgcUZ8CFuKEbb1Jn+LDS
	LA28ZPuX18IzvBNcq95lzumjuklaZ55cmWbgZpSIFsZEimkxLoT3QthCZ6tqVnA+4AWyUQ
	LO8JQuVsf6J5hCktyOAJ8vx/pttmpYc=
Message-ID: <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Date: Mon, 14 Sep 2026 11:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260826045720.5779-2-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M2rsuI2wpe2aMY4A8miBY270"
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 607CB21C09
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-purgate-ID: tlsNG-33051d/1789377023-6F2C84E9-473351AA/0/0
X-purgate-type: clean
X-purgate-size: 18391

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M2rsuI2wpe2aMY4A8miBY270
Content-Type: multipart/mixed; boundary="------------cHfNdzUgGgBZjB2FIuOf4NM3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
Message-ID: <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
In-Reply-To: <20260826045720.5779-2-frn1furkan10@gmail.com>
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

--------------cHfNdzUgGgBZjB2FIuOf4NM3
Content-Type: multipart/mixed; boundary="------------nPKCoo5UwUVjt6X2yrEIazsv"

--------------nPKCoo5UwUVjt6X2yrEIazsv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjYgMDY6NTcsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gUlREUyBoYXMg
bm8gYWRtaXNzaW9uIGNvbnRyb2w6IG5vdGhpbmcgc3RvcHMgdGhlIHN1bSBvZiBhbGwgYWRt
aXR0ZWQNCj4gdW5pdHMnIChidWRnZXQvcGVyaW9kKSByZXNlcnZhdGlvbnMgaW4gYSBjcHVw
b29sIGZyb20gZXhjZWVkaW5nDQo+IHdoYXQgaXRzIHBDUFVzIGNhbiBhY3R1YWxseSBwcm92
aWRlLiBPbmNlIHRoYXQgaGFwcGVucywgbm9uZSBvZiB0aGUNCj4gRURGIGRlYWRsaW5lIGd1
YXJhbnRlZXMgdGhpcyBzY2hlZHVsZXIgaXMgYnVpbHQgYXJvdW5kIHN0aWxsIGhvbGQNCj4g
Zm9yIHRoZSB1bml0cyBzaGFyaW5nIHRoYXQgcG9vbC4NCj4gDQo+IEludHJvZHVjZSBhZG1p
c3Npb24gY29udHJvbCB0byBwcmV2ZW50IHRoaXM6IHJlamVjdCBhIHJlc2VydmF0aW9uDQo+
IHdoZW5ldmVyIGFkbWl0dGluZyBpdCB3b3VsZCBwdXNoIGEgY3B1cG9vbCdzIHVuaXRzIG92
ZXIgaXRzIGNhcGFjaXR5Lg0KPiBUcmFjayBhIHJ1bm5pbmcgdXRpbGl6YXRpb24gdG90YWwg
cGVyIGNwdXBvb2wsIGFuZCBlbmZvcmNlIGl0IGluDQo+IHJ0X2FsbG9jX3VkYXRhKCkvcnRf
ZnJlZV91ZGF0YSgpLCB0aGUgcGFpcmVkIGxpZmVjeWNsZSBob29rcyBmb3IgYQ0KPiB1bml0
J3MgY3JlYXRpb24gYW5kIGRlc3RydWN0aW9uLiBUaGlzIGNhdGNoZXMgdGhlIGRlZmF1bHQN
Cj4gcGVyaW9kL2J1ZGdldCBldmVyeSBuZXcgdW5pdCBnZXRzLg0KPiANCj4gVXRpbGl6YXRp
b24gaXMgcmVwcmVzZW50ZWQgYXMgYSBmaXhlZC1wb2ludCB2YWx1ZTogYnVkZ2V0IGlzDQo+
IGxlZnQgc2hpZnRlZCBieSBSVERTX1VUSUxfU0hJRlQgKDIwIGJpdHMpIGFuZCBkaXZpZGVk
IGJ5IHBlcmlvZC4NCj4gQSBwbGFpbiAiKGJ1ZGdldCA8PCBSVERTX1VUSUxfU0hJRlQpIC8g
cGVyaW9kIiByaXNrcyBvdmVyZmxvd2luZw0KPiB0aGUgbXVsdGlwbHkgZm9yIGxhcmdlIGVu
b3VnaCBidWRnZXRzLiBSYXRoZXIgdGhhbiB3aWRlbiB0aGUNCj4gYXJpdGhtZXRpYyB0byB0
b2xlcmF0ZSBhbnkgaW5wdXQsIHRoZSBpbnB1dCBpdHNlbGYgaXMgYm91bmRlZDoNCj4gcnRf
dmFsaWRhdGVfcGFyYW1zKCkgcmVqZWN0cyBhbnkgYnVkZ2V0IGFib3ZlIFJURFNfTUFYX0JV
REdFVCwNCj4gY2hvc2VuIGFzIHRoZSBsYXJnZXN0IHZhbHVlIHRoYXQgY2FuIGJlIGxlZnQt
c2hpZnRlZCBieQ0KPiBSVERTX1VUSUxfU0hJRlQgd2l0aG91dCBvdmVyZmxvd2luZyA2NCBi
aXRzLCBzbyB0aGUgc2hpZnQgaW4NCj4gcnRfdW5pdF91dGlsaXphdGlvbigpIGNhbiBuZXZl
ciBvdmVyZmxvdy4NCj4gDQo+IEEgY3B1cG9vbCdzIGNhcGFjaXR5IHJ0X3V0aWxpemF0aW9u
X2NhcCgpIHNjYWxlcyB3aXRoIHRoZSBudW1iZXIgb2YNCj4gc2NoZWR1bGluZyByZXNvdXJj
ZXMgaW4gaXQuIEl0IGlzIGNhbGN1bGF0ZWQgYXM6DQo+IChudW1iZXIgb2Ygc2NoZWRfcmVz
b3VyY2VzICogUlREU19VVElMX1NDQUxFICogUlREU19VVElMX0NBUF9QQ1QgLyAxMDApLA0K
PiB3aGVyZSBSVERTX1VUSUxfQ0FQX1BDVCBjb250cm9scyBob3cgbXVjaCBvZiB0aGF0IGNh
cGFjaXR5IGNhbg0KPiBhY3R1YWxseSBiZSByZXNlcnZlZDsgYXQgMTAwJSAoaXRzIGN1cnJl
bnQgdmFsdWUpLCBhbGwgb2YgaXQgY2FuIGJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnVy
a2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KPiAtLS0NCj4gICB4ZW4v
Y29tbW9uL3NjaGVkL3J0LmMgfCAxMDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9ydC5j
IGIveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+IGluZGV4IDBlOWYwNGVhNzIuLjkxMjYzMjA4
MDEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvcnQuYw0KPiArKysgYi94ZW4v
Y29tbW9uL3NjaGVkL3J0LmMNCj4gQEAgLTExNCw2ICsxMTQsMjQgQEANCj4gICAgKi8NCj4g
ICAjZGVmaW5lIFJURFNfTUFYX1BSSU9SSVRZX0xFVkVMICh+MFUpDQo+ICAgDQo+ICsvKg0K
PiArICogRml4ZWQtcG9pbnQgc2NhbGUgZm9yIHV0aWxpemF0aW9uIChidWRnZXQvcGVyaW9k
KQ0KPiArICovDQo+ICsjZGVmaW5lIFJURFNfVVRJTF9TSElGVCAgICAgMjANCj4gKyNkZWZp
bmUgUlREU19VVElMX1NDQUxFICAgICAoMVVMTCA8PCBSVERTX1VUSUxfU0hJRlQpDQo+ICsN
Cj4gKy8qDQo+ICsgKiBMYXJnZXN0IGJ1ZGdldCBzYWZlIHRvIGxlZnQtc2hpZnQgYnkgUlRE
U19VVElMX1NISUZUIHdpdGhvdXQNCj4gKyAqIG92ZXJmbG93aW5nIDY0IGJpdHMuIEVuZm9y
Y2VkIGluIHJ0X3ZhbGlkYXRlX3BhcmFtcygpLg0KPiArICovDQo+ICsjZGVmaW5lIFJURFNf
TUFYX0JVREdFVF9CSVRTICAoNjQgLSBSVERTX1VUSUxfU0hJRlQpDQo+ICsjZGVmaW5lIFJU
RFNfTUFYX0JVREdFVCAgICAgICAoKDFVTEwgPDwgUlREU19NQVhfQlVER0VUX0JJVFMpIC0g
MSkNCj4gKw0KPiArLyoNCj4gKyAqICUgb2YgYSBjcHVwb29sJ3Mgc2NoZWRfcmVzb3VyY2Ug
Y2FwYWNpdHkgYWRtaXR0ZWQgdW5pdHMgbWF5IHN1bSB1cCB0by4NCj4gKyAqLw0KPiArI2Rl
ZmluZSBSVERTX1VUSUxfQ0FQX1BDVCAgIDEwMA0KPiArDQo+ICAgLyoNCj4gICAgKiBVUERB
VEVfTElNSVRfU0hJRlQ6IGEgY29uc3RhbnQgdXNlZCBpbiBydF91cGRhdGVfZGVhZGxpbmUo
KS4gV2hlbiBmaW5kaW5nDQo+ICAgICogdGhlIG5leHQgZGVhZGxpbmUsIHBlcmZvcm1pbmcg
YWRkaXRpb24gY291bGQgYmUgZmFzdGVyIGlmIHRoZSBkaWZmZXJlbmNlDQo+IEBAIC0xOTUs
NiArMjEzLDkgQEAgc3RydWN0IHJ0X3ByaXZhdGUgew0KPiAgICAgICBzdHJ1Y3QgbGlzdF9o
ZWFkIHJlcGxxOyAgICAgLyogb3JkZXJlZCBsaXN0IG9mIHVuaXRzIHRoYXQgbmVlZCByZXBs
ZW5pc2htZW50ICovDQo+ICAgDQo+ICAgICAgIGNwdW1hc2tfdCB0aWNrbGVkOyAgICAgICAg
ICAvKiBjcHVzIGJlZW4gdGlja2xlZCAqLw0KPiArDQo+ICsgICAgLyogU3VtIG9mIGFkbWl0
dGVkIHVuaXRzJyAoYnVkZ2V0L3BlcmlvZCksIHNjYWxlZCBieSBSVERTX1VUSUxfU0NBTEUg
Ki8NCj4gKyAgICB1aW50NjRfdCB1dGlsaXphdGlvbjsNCj4gICB9Ow0KPiAgIA0KPiAgIC8q
DQo+IEBAIC02MzUsNiArNjU2LDU0IEBAIHJlcGxxX3JlaW5zZXJ0KGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IHJ0X3VuaXQgKnN2YykNCj4gICAgICAgICAgIHNldF90
aW1lcigmcnRfcHJpdihvcHMpLT5yZXBsX3RpbWVyLCByZWFybV9zdmMtPmN1cl9kZWFkbGlu
ZSk7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIGJ1ZGdldCA8PCBSVERTX1VUSUxfU0hJ
RlQgY2FuJ3Qgb3ZlcmZsb3c6IHJ0X3ZhbGlkYXRlX3BhcmFtcygpDQo+ICsgKiBjYXBzIGJ1
ZGdldCBhdCBSVERTX01BWF9CVURHRVQuIHBlcmlvZCA9PSAwIG1lYW5zICJubw0KPiArICog
cmVzZXJ2YXRpb24iIChhIHVuaXQgYmVpbmcgcmVtb3ZlZCksIG5vdCBhbiBlcnJvci4NCj4g
KyAqLw0KPiArc3RhdGljIHVpbnQ2NF90DQo+ICtydF91bml0X3V0aWxpemF0aW9uKHNfdGlt
ZV90IHBlcmlvZCwgc190aW1lX3QgYnVkZ2V0KQ0KPiArew0KPiArICAgIGlmICggcGVyaW9k
IDw9IDAgKQ0KPiArICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiArICAgIHJldHVybiAoKHVp
bnQ2NF90KWJ1ZGdldCA8PCBSVERTX1VUSUxfU0hJRlQpIC8gKHVpbnQ2NF90KXBlcmlvZDsN
Cj4gK30NCj4gKw0KPiArLyoNCj4gKyAqIFV0aWxpemF0aW9uIGNhcGFjaXR5IG9mIHRoZSBj
cHVwb29sIGRvbWFpbiBkIHJlc2lkZXMgaW4uDQo+ICsgKi8NCj4gK3N0YXRpYyB1aW50NjRf
dA0KPiArcnRfdXRpbGl6YXRpb25fY2FwKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+ICt7
DQo+ICsgICAgdW5zaWduZWQgaW50IGNwdXMgPSBjcHVtYXNrX3dlaWdodChjcHVwb29sX2Rv
bWFpbl9tYXN0ZXJfY3B1bWFzayhkKSk7DQo+ICsNCj4gKyAgICByZXR1cm4gKHVpbnQ2NF90
KWNwdXMgKiBSVERTX1VUSUxfU0NBTEUgKiBSVERTX1VUSUxfQ0FQX1BDVCAvIDEwMDsNCj4g
K30NCj4gKw0KPiArLyoNCj4gKyAqIFJlcGxhY2VzIGEgdW5pdCdzIHJlc2VydmF0aW9uIGFu
ZCB1cGRhdGVzIHBydi0+dXRpbGl6YXRpb24NCj4gKyAqIHRvIG1hdGNoLiBHcm93dGggdGhh
dCB3b3VsZCBwdXNoIHV0aWxpemF0aW9uIG92ZXIgdGhlDQo+ICsgKiBjcHVwb29sJ3MgY2Fw
IGlzIHJlZnVzZWQuIFJlbW92aW5nIGEgdW5pdCBvciBzaHJpbmtpbmcNCj4gKyAqIGEgdW5p
dCdzIHJlc2VydmF0aW9uIGFsd2F5cyBzdWNjZWVkLg0KPiArICovDQo+ICtzdGF0aWMgaW50
DQo+ICtydF9hZG1pc3Npb25fdGVzdChzdHJ1Y3QgcnRfcHJpdmF0ZSAqcHJ2LCBjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLA0KPiArCQkgICBzX3RpbWVfdCBvbGRfcGVyaW9kLCBzX3RpbWVf
dCBvbGRfYnVkZ2V0LA0KPiArCQkgICBzX3RpbWVfdCBuZXdfcGVyaW9kLCBzX3RpbWVfdCBu
ZXdfYnVkZ2V0KQ0KDQpJIHRoaW5rIHRoZSBmdW5jdGlvbiBuYW1lIGlzbid0IGFwcHJvcHJp
YXRlLiBUaGUgZnVuY3Rpb24gZG9lc24ndCB0ZXN0IG9ubHksIGl0DQppcyBzZXR0aW5nIHRo
ZSB1dGlsaXphdGlvbiwgdG9vLg0KDQpXaGF0IGFib3V0IHJ0X3RyeV9zZXRfdXRpbGl6YXRp
b24oKSBpbnN0ZWFkPyBBbmQgbWFrZSB0aGUgcmV0dXJuIHR5cGUgYm9vbA0KKHRydWUgb24g
c3VjY2VzcykuDQoNCj4gK3sNCj4gKyAgICB1aW50NjRfdCBvbGRfdXRpbCA9IHJ0X3VuaXRf
dXRpbGl6YXRpb24ob2xkX3BlcmlvZCwgb2xkX2J1ZGdldCk7DQo+ICsgICAgdWludDY0X3Qg
bmV3X3V0aWwgPSBydF91bml0X3V0aWxpemF0aW9uKG5ld19wZXJpb2QsIG5ld19idWRnZXQp
Ow0KPiArICAgIHVpbnQ2NF90IHRvdGFsICAgID0gcHJ2LT51dGlsaXphdGlvbiAtIG9sZF91
dGlsICsgbmV3X3V0aWw7DQo+ICsNCj4gKyAgICBpZiAoIG5ld191dGlsID4gb2xkX3V0aWwg
JiYgdG90YWwgPiBydF91dGlsaXphdGlvbl9jYXAoZCkgKQ0KPiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gKw0KPiArICAgIHBydi0+dXRpbGl6YXRpb24gPSB0b3RhbDsNCj4gKw0K
PiArICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAgKiBQaWNrIGEgdmFs
aWQgcmVzb3VyY2UgZm9yIHRoZSB1bml0IHZjDQo+ICAgICogVmFsaWQgcmVzb3VyY2Ugb2Yg
YW4gdW5pdCBpcyBpbnRlc2VjdGlvbiBvZiB1bml0J3MgYWZmaW5pdHkNCj4gQEAgLTg2NCw2
ICs5MzMsNyBAQCBydF9mcmVlX2RvbWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LCB2b2lkICpkYXRhKQ0KPiAgIHN0YXRpYyB2b2lkICogY2ZfY2hlY2sNCj4gICBydF9hbGxv
Y191ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0
ICp1bml0LCB2b2lkICpkZCkNCj4gICB7DQo+ICsgICAgc3RydWN0IHJ0X3ByaXZhdGUgKnBy
diA9IHJ0X3ByaXYob3BzKTsNCj4gICAgICAgc3RydWN0IHJ0X3VuaXQgKnN2YzsNCj4gICAN
Cj4gICAgICAgLyogQWxsb2NhdGUgcGVyLVVOSVQgaW5mbyAqLw0KPiBAQCAtODgxLDkgKzk1
MSwzMCBAQCBydF9hbGxvY191ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0
cnVjdCBzY2hlZF91bml0ICp1bml0LCB2b2lkICpkZCkNCj4gICAgICAgX19zZXRfYml0KF9f
UlREU19leHRyYXRpbWUsICZzdmMtPmZsYWdzKTsNCj4gICAgICAgc3ZjLT5wcmlvcml0eV9s
ZXZlbCA9IDA7DQo+ICAgICAgIHN2Yy0+cGVyaW9kID0gUlREU19ERUZBVUxUX1BFUklPRDsN
Cj4gKw0KPiAgICAgICBpZiAoICFpc19pZGxlX3VuaXQodW5pdCkgKQ0KPiArICAgIHsNCj4g
KyAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKyAgICAgICAgaW50IHJjOw0KPiAr
DQo+ICAgICAgICAgICBzdmMtPmJ1ZGdldCA9IFJURFNfREVGQVVMVF9CVURHRVQ7DQo+ICAg
DQo+ICsgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZwcnYtPmxvY2ssIGZsYWdzKTsNCj4g
KyAgICAgICAgcmMgPSBydF9hZG1pc3Npb25fdGVzdChwcnYsIHVuaXQtPmRvbWFpbiwgMCwg
MCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3ZjLT5wZXJpb2QsIHN2
Yy0+YnVkZ2V0KTsNCj4gKyAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJ2LT5s
b2NrLCBmbGFncyk7DQo+ICsNCj4gKyAgICAgICAgaWYgKCByYyApDQo+ICsgICAgICAgIHsN
Cj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiArICAgICAgICAgICAg
ICAgICAgICJSVERTOiBBRE1JU1NJT04gQ09OVFJPTDogcmVmdXNpbmcgdW5pdCAldSBvZiBk
JWQsIg0KPiArICAgICAgICAgICAgICAgICAgICIgd291bGQgZXhjZWVkIHV0aWxpemF0aW9u
IGNhcGFjaXR5IG9mIHRoZSBjcHVwb29sXG4iLA0KPiArICAgICAgICAgICAgICAgICAgIHVu
aXQtPnVuaXRfaWQsIHVuaXQtPmRvbWFpbi0+ZG9tYWluX2lkKTsNCj4gKyAgICAgICAgICAg
IHhmcmVlKHN2Yyk7DQo+ICsgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gKyAgICAgICAg
fQ0KPiArICAgIH0NCj4gKw0KPiAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKHVuaXRfYWxsb2Mp
Ow0KPiAgIA0KPiAgICAgICByZXR1cm4gc3ZjOw0KPiBAQCAtODkyLDggKzk4MywxOSBAQCBy
dF9hbGxvY191ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0LCB2b2lkICpkZCkNCj4gICBzdGF0aWMgdm9pZCBjZl9jaGVjaw0KPiAg
IHJ0X2ZyZWVfdWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCB2b2lkICpwcml2
KQ0KPiAgIHsNCj4gKyAgICBzdHJ1Y3QgcnRfcHJpdmF0ZSAqcHJ2ID0gcnRfcHJpdihvcHMp
Ow0KPiAgICAgICBzdHJ1Y3QgcnRfdW5pdCAqc3ZjID0gcHJpdjsNCj4gICANCj4gKyAgICBp
ZiAoIHN2YyAmJiAhaXNfaWRsZV91bml0KHN2Yy0+dW5pdCkgKQ0KPiArICAgIHsNCj4gKyAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0KPiArICAgICAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmcHJ2LT5sb2NrLCBmbGFncyk7DQo+ICsgICAgICAgIHJ0X2FkbWlzc2lvbl90
ZXN0KHBydiwgc3ZjLT51bml0LT5kb21haW4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdmMtPnBlcmlvZCwgc3ZjLT5idWRnZXQsIDAsIDApOw0KDQpUaGlzIHVzZSBjYXNl
IGNsZWFybHkgc2hvd3MgeW91IGFyZSBub3Qgb25seSB0ZXN0aW5nLiA6LSkNCg0KPiArICAg
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwcnYtPmxvY2ssIGZsYWdzKTsNCj4gKyAg
ICB9DQo+ICsNCj4gICAgICAgeGZyZWUoc3ZjKTsNCj4gICB9DQo+ICAgDQo+IEBAIC0xMzg5
LDcgKzE0OTEsOCBAQCBydF92YWxpZGF0ZV9wYXJhbXMoY29uc3Qgc3RydWN0IHhlbl9kb21j
dGxfc2NoZWRfcnRkcyAqcnRkcywNCj4gICAgICAgc190aW1lX3QgYiA9IE1JQ1JPU0VDUyhy
dGRzLT5idWRnZXQpOw0KPiAgIA0KPiAgICAgICBpZiAoIHAgPCBSVERTX01JTl9QRVJJT0Qg
fHwgcCA+IFJURFNfTUFYX1BFUklPRCB8fA0KPiAtICAgICAgICAgYiA8IFJURFNfTUlOX0JV
REdFVCB8fCBiID4gcCApDQo+ICsgICAgICAgICBiIDwgUlREU19NSU5fQlVER0VUIHx8IGIg
PiBwIHx8DQo+ICsgICAgICAgICBiID4gKHNfdGltZV90KVJURFNfTUFYX0JVREdFVCApDQo+
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gICAgICAgKnBlcmlvZCA9IHA7
DQoNCg0KSnVlcmdlbg0KDQo=
--------------nPKCoo5UwUVjt6X2yrEIazsv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nPKCoo5UwUVjt6X2yrEIazsv--

--------------cHfNdzUgGgBZjB2FIuOf4NM3--

--------------M2rsuI2wpe2aMY4A8miBY270
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqnue8FAwAAAAAACgkQsN6d1ii/Ey/9
Rgf+IltOEULM/jC/NtcAXjvtGoGKdkfNP/gYx9yL2YUwtp0O8Awf4hlqp+BWY2uGIqBF/zA/fJuq
xTSMcaI+Xp4paYg9DrlG/wP385zo+BuUtScvtvoUpCkww8RAPdCzyaqm7qdsxAQYqvVOfFE4OkwJ
YmC56jN0WG9ibpQKmeJ9sEEZoas5zc1co5r+mLJ9md6qrH3WQgrq+6N/aFM/fvrpK43PH970csB1
INXz0WQa4ajdCs899S92nsu3JGZzsI9hXxoqP8IT2T3E4ISQpfIQCCSIXou7VxlarlkG8Ad/5GDz
AsLLnIaobmEB5GDv6E1nr8kCkOMRAZCRSVdkm/86oA==
=s9TV
-----END PGP SIGNATURE-----

--------------M2rsuI2wpe2aMY4A8miBY270--

