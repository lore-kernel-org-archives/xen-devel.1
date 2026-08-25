Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03B7C61DBE
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 12:01:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399194.1635377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyppo-0000SW-9b; Tue, 25 Aug 2026 12:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399194.1635377; Tue, 25 Aug 2026 12:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyppo-0000SO-6E; Tue, 25 Aug 2026 12:00:56 +0000
Received: by outflank-mailman (input) for mailman id 1399194;
 Tue, 25 Aug 2026 12:00:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wyppm-0000SH-N8
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 12:00:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyppl-00FLtq-G3
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:00:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a8d83ef-bab6-0a2a0a5309dd-0a2a4506c396-26
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 14:00:53 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a8d83f5-195a-0a2a45060019-c387df82a34a-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 14:00:53 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B611F86CC6;
 Tue, 25 Aug 2026 12:00:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 788B513331;
 Tue, 25 Aug 2026 12:00:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G+VTHOyDjWrTYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 25 Aug 2026 12:00:44 +0000
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
	t=1787659248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nYI6Tw5TM49GzToIO3x4eefLbl+QFgyn24vAbLiQGGE=;
	b=MdQBFbphi0aiHvmD8WC9KuO/rIFvwE9TDmqmP2og2jj2ZU1HYsT6MBIbs2dP6mkrD8yonS
	tf8R8Y8QdA5E8naSmPLQp/si5IFEAAjayL7Ha4sGtb5rYxN6OLdb3OR8EWffkG7jUwmJZB
	TBTbhVz+u5J6viY9c60z/KVqgQWX388=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=kgznDe6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787659244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nYI6Tw5TM49GzToIO3x4eefLbl+QFgyn24vAbLiQGGE=;
	b=kgznDe6cAWgOkw54YfiiLkbfWJXOrQZoyk0MvaWAfXemvBSOtBEgwbGyL1MC2ReP88S5V2
	A8j0FI0vyOl6wcenzFCRgQY40IAgXmF0Y6XKbD47un3MFCta79THr6KocHuQ5xhpMhm7ib
	TLydZsVO9+KIbILDtSC6G1MeO/fGOcw=
Message-ID: <c654817b-dc5c-4e3b-be7a-156432af1dbf@suse.com>
Date: Tue, 25 Aug 2026 14:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: George Dunlap <gwd@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
 <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
 <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
 <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
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
In-Reply-To: <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2jktY701EIsqVP6R2djx5EbY"
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Queue-Id: B611F86CC6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-16d1c6/1787659253-F500977B-3834091A/0/0
X-purgate-type: clean
X-purgate-size: 11890

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2jktY701EIsqVP6R2djx5EbY
Content-Type: multipart/mixed; boundary="------------rBTJ0QPH0xXRrlonZW0NjZYI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <gwd@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <c654817b-dc5c-4e3b-be7a-156432af1dbf@suse.com>
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com>
 <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
 <044095b7-3c8d-40da-9d21-281c522a49ae@suse.com>
 <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
In-Reply-To: <CAFLBxZa0Fmmic1JLwHOdFCn1=rGP6Un2q1ZxBa1DpsO_AAmD6A@mail.gmail.com>
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

--------------rBTJ0QPH0xXRrlonZW0NjZYI
Content-Type: multipart/mixed; boundary="------------vBSusJ8khJoKDQ6QU4axMhnM"

--------------vBSusJ8khJoKDQ6QU4axMhnM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDguMjYgMTM6NDIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIE1vbiwgQXVn
IDI0LCAyMDI2IGF0IDEwOjAy4oCvQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToNCj4+IE9uIDIxLjA4LjIwMjYgMTc6MTcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6
DQo+Pj4gT24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgOTo0NeKAr0FNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDIwLjA4LjIwMjYgMTk6NDMsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+PiBPbmUgcG9pbnQgcmV2aWV3ZXJzIG1heSB3YW50
IHRvIGxvb2sgYXQgc3BlY2lmaWNhbGx5OiBwYXRjaCAxIGNoYW5nZXMNCj4+Pj4+IHdoZXJl
IHRoZSBwZXItZG9tYWluIHBhZ2UtdGFibGVzIGFyZSBhbGxvY2F0ZWQgZnJvbSwgYW5kIGl0
cyBjb21taXQNCj4+Pj4+IG1lc3NhZ2UgZGlzY3Vzc2VzIHRoZSAobWlub3IpIE5VTUEtcGxh
Y2VtZW50IGNvbnNlcXVlbmNlLg0KPj4+Pg0KPj4+PiBXaGlsZSBJIGRvbid0IHJlY2FsbCB3
aGljaCByZWNlbnQgcGF0Y2ggKHNlcmllcykgaXQgd2FzLCBJIGNhbid0IHZlcnkgd2VsbA0K
Pj4+PiBzYXkgIm5vIG5ldyB4ZW5oZWFwIGFsbG9jYXRpb25zIHBsZWFzZSIgdGhlcmUgd2l0
aG91dCBhbHNvIHNheWluZyBzbyBoZXJlLg0KPj4+PiBJJ3ZlIHJlYWQgb3ZlciBwYXRjaCAx
J3MgZGVzY3JpcHRpb24sIGFuZCB3aGlsZSBpdCB0cmllcyB0byBqdXN0aWZ5IHRoaXMNCj4+
Pj4gYWNjb3JkaW5nbHksIEkgc3RpbGwgcmVtYWluIGNvbmNlcm5lZC4gSSB0aGluayB3ZSBz
aW1wbHkgaGF2ZSB0byBhY2NlcHQNCj4+Pj4gdGhlIG1hcHBpbmcgb3ZlcmhlYWQsIHRvIGF2
b2lkIGFsbG9jYXRpbmcgZnJvbSBhIHBvb2wgd2hpY2ggLSBvdmVyIHRpbWUgLQ0KPj4+PiBp
cyByZXByZXNlbnRpbmcgYSBkZWNyZWFzaW5nIHBvcnRpb24gb2YgdG90YWwgbWVtb3J5IHN5
c3RlbXMgaGF2ZSAob24NCj4+Pj4gYXZlcmFnZSwgYW5kIG5vdCBldmVuIGNvbnNpZGVyaW5n
IHN5c3RlbXMgd2l0aCBleHRyZW1lbHkgc3BhcnNlIG1lbW9yeQ0KPj4+PiBsYXlvdXRzLCBh
bmQgd2l0aCBwZXJoYXBzIFBEWCBjb21wcmVzc2lvbiBub3QgZG9pbmcgZ29vZCBlbm91Z2gg
dG8NCj4+Pj4gY29tcGVuc2F0ZSkuDQo+Pj4NCj4+PiBZb3Ugc2hvdWxkIGNlcnRhaW5seSBo
YXZlIHRoZSBzYW1lIHJlc2lzdGFuY2UgdG8gYWRkaW5nIG5ldyB4ZW5oZWFwDQo+Pj4gYWxs
b2NhdGlvbnMuICBCdXQgbG9va2luZyBhdCB0aGUgbnVtYmVycywgSSBkb24ndCBzZWUgdGhh
dCB3ZSdyZQ0KPj4+IGFueXdoZXJlIG5lYXIgdGhlIHBvaW50IHdoZXJlIHdlIHNheSwgIkFi
c29sdXRlbHkgbm8gbmV3IHhlbmhlYXANCj4+PiBhbGxvY2F0aW9ucywgcmVnYXJkbGVzcyBv
ZiB0aGUgY29zdC4iDQo+Pg0KPj4gV2VsbCwgdGhhdCBkZXBlbmRzLCBhbmQgaW4gcGFydCBv
biB0aGUgbG9uZ2VyIHRlcm0gcGxhbnMgd2l0aCBBU0kuIEl0IGhhcw0KPj4gYmVlbiBteSAo
c2lsZW50KSBhc3N1bXB0aW9uIHRoYXQgZXZlbnR1YWxseSB0aGUgZGlyZWN0bWFwIHdvdWxk
IGdvIGF3YXkNCj4+IGFsdG9nZXRoZXIgd2hlbiBBU0kgaXMgaW4gdXNlLCB3aXRoIHRoZSBW
QSBzcGFjZSBmcmVlZCAoYWxtb3N0PykgYWxsDQo+PiBiZWNvbWluZyBhdmFpbGFibGUgZm9y
IHZtYXAoKS4gV2l0aCB0aGUgZGlzYXBwZWFyYW5jZSBvZiBkaXJlY3RtYXAsIHRoZQ0KPj4g
eGVuaGVhcCB3b3VsZCBuYXR1cmFsbHkgZGlzYXBwZWFyIGFzIHdlbGwuIEhlbmNlIHB1dHRp
bmcgc3R1ZmYgdGhlcmUgaW4NCj4+IG5ldyB3b3JrIGFjdHVhbGx5IGFkZHMgdG8gb3VyIHRl
Y2huaWNhbCBkZWJ0Lg0KPiANCj4gSSBkbyB0aGluayB0aGF0IG1ha2VzIHNlbnNlIGFzIGEg
bG9uZy10ZXJtIGdvYWwuICBBY3R1YWxseSwgSSBhc2tlZA0KPiBGYWJsZSB0byBkbyBhbiBh
dWRpdCBvZiB4ZW5oZWFwIGFsbG9jYXRpb25zLCBhc2tpbmcgaXQgdG8gY2xhc3NpZnkNCj4g
dGhlbSBhcyB0byB3aGV0aGVyIHRoZXkgbmVlZGVkIHhlbmhlYXAncyBrZXkgcHJvcGVydGll
cyAoZWFzeSBtZm4gPC0+DQo+IHZhIGNvbnZlcnNpb24sIGF2YWlsYWJsZSBpbiBlYXJseSBi
b290KSwgYW5kIGl0IHJlY2tvbmVkIG9ubHkgYWJvdXQgNCUNCj4gb2YgdGhlIGFsbG9jYXRp
b25zIChieSB2b2x1bWUpIGluIHRoZSBleGFtcGxlIHN5c3RlbSBJIGRpZCBudW1iZXJzIGZv
cg0KPiBuZWVkZWQgeGVuaGVhcC1zcGVjaWZpYyBwcm9wZXJ0aWVzLiAgTG90cyBvZiB0aGlu
Z3MganVzdCBuZWVkICpzb21lKg0KPiBnbG9iYWwgbWFwcGluZyBzb21ld2hlcmUsIGFuZCB3
b3VsZCBwcm9iYWJseSBhY3R1YWxseSBvdmVyYWxsIGJlbmVmaXQNCj4gZnJvbSBiZWluZyBt
b3ZlZCB0byB0aGUgdm1hcCwgc28gdGhleSB3b3VsZG4ndCBiZSByZXN0cmljdGVkIHRvIGEN
Cj4gc2luZ2xlIE5VTUEgbm9kZS4gIEdyYW50IGZyYW1lcyB3ZXJlIHRoZSBiaWdnZXN0IGNo
dW5rLg0KDQpQbGVhc2Ugbm90ZSB0aGF0IEknbSBjdXJyZW50bHkgd29ya2luZyBvbiBhIHBh
dGNoIHNlcmllcyB3aGljaCB3aWxsIG5lZWQNCnRvIGNvbnZlcnQgZ3JhbnQgZnJhbWVzIGFu
ZCBzb21lIG90aGVyIHhlbmhlYXAgYWxsb2NhdGlvbnMgdG8gdXNlIGRvbWhlYXANCmFuZCB2
bWFwKCkuDQoNCkN1cnJlbnRseSB0aGlzIGlzIGp1c3QgYSBwcm9vZiBvZiBjb25jZXB0IGZv
ciBYZW4gc3VtbWl0LCBidXQgSSBleHBlY3QNCnRoaXMgdG8gYmVjb21lIG1hdHVyZSBhZnRl
ciBzb21lIGZlZWRiYWNrIEkgaG9wZSB0byBnZXQgdGhlcmUuDQoNCg0KSnVlcmdlbg0K
--------------vBSusJ8khJoKDQ6QU4axMhnM
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

--------------vBSusJ8khJoKDQ6QU4axMhnM--

--------------rBTJ0QPH0xXRrlonZW0NjZYI--

--------------2jktY701EIsqVP6R2djx5EbY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqNg+wFAwAAAAAACgkQsN6d1ii/Ey8z
eQf6AtamFtk9zos2M2YL5I/mwhqVIMAuRUGs71xGYZLadKjvsEJ10JbUa7x6bREJ621VSen7gzFF
5M3Yfv8xDG0f/Kpu6LTjVbtRHdbLRt3EYix71F5S/QSX2+4czKq8bbw2KU+tKOfoUXOBFDBQzoyr
rbMDe2d7rNL3kRtiLtOCq/qIwMwBM75VvThzGAI5NhU70zZH6uD3Xd6+iXDAHCQic1Ur621648AH
uz85afuv4NLtflMNrG9cOlcYZ2arJ/YqSXuLzUtvf6OQg66E96LgQkWtD1HeyzGAHK49nj5z5BQ5
PC5J6scClf0tbHvCGvRFzeenDpAP9eHmJgDbkTtm6A==
=7oOB
-----END PGP SIGNATURE-----

--------------2jktY701EIsqVP6R2djx5EbY--

