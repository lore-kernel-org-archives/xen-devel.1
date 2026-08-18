Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FF7C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:48:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393954.1632755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHME-00065q-3p; Tue, 18 Aug 2026 10:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393954.1632755; Tue, 18 Aug 2026 10:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwHME-00065j-12; Tue, 18 Aug 2026 10:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1393954;
 Tue, 18 Aug 2026 10:47:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwHMC-00064H-1t
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:47:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwHMA-00BMMf-Rm
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:47:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a843837-2eae-0a2a0a5409dd-0a2a45049f6e-44
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:47:46 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a843852-b57f-0a2a45040019-c387df83e2cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:47:46 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76E0D3E4A;
 Tue, 18 Aug 2026 10:47:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4681722BA;
 Tue, 18 Aug 2026 10:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1KegD0Y4hGpDJwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 18 Aug 2026 10:47:34 +0000
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
	t=1787050058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zm1OIKnWNLDe+fPcFREt3GIochIMEEweQR0cKalomks=;
	b=rs6Q7d/XGVGFNNSRm2rfHvRl0lJOXiRzaxOsxdT5wF6oN1TaChRmjtbhuH7MtxkAR+7Hkf
	nrhu/yHq/exnet0U2IXXDIA0O6xys5AS23rMdESQtqxAtaNhxQiEoBeskvxjUQ7Rq1U7Xg
	Agtc5T25D1qJkdqE+uugFc02BOoaM2k=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787050054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Zm1OIKnWNLDe+fPcFREt3GIochIMEEweQR0cKalomks=;
	b=RrYCv1rOWkpb514kmvRYOc4lXD/qDQvWe1/PDbEFqvyFM5bzBWqX6altIZWFnuvmWOdy4K
	sX1r4n5gFs8ZAoa63cY7MOcd0ylnjQEF1M6x/PcArRYSQeThSPwZCo9XDSX4l8QdKyr7vY
	RrGdLHnV21Kr5VAGyyygtE/qtd5Rk18=
Message-ID: <27889c5e-ff00-4209-9b7e-674cd145442e@suse.com>
Date: Tue, 18 Aug 2026 12:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
 <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
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
In-Reply-To: <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HIn7oqEkWLG6yHL03DqUoyxz"
X-Spamd-Result: default: False [-6.19 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.989];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com,lists.xenproject.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-purgate-ID: tlsNG-ebf023/1787050066-538C1B50-6E878E36/0/0
X-purgate-type: clean
X-purgate-size: 14501

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HIn7oqEkWLG6yHL03DqUoyxz
Content-Type: multipart/mixed; boundary="------------X7grn7hpczWpj6TPR95lMoie";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org
Message-ID: <27889c5e-ff00-4209-9b7e-674cd145442e@suse.com>
Subject: Re: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in
 sched_move_domain()
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-2-frn1furkan10@gmail.com>
 <030c7756-c959-465d-9d14-9bb3523e8c31@suse.com>
 <1d50520d-68bf-4765-8a13-c7c047580f2e@gmail.com>
 <887cce18-5a67-4177-bdaf-7ef9bc192bea@citrix.com>
 <1b281dff-d43c-4ab6-9429-e30765a93be3@suse.com>
 <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
In-Reply-To: <cf0fe335-a45b-4721-b5cd-ac1fd293553a@citrix.com>
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

--------------X7grn7hpczWpj6TPR95lMoie
Content-Type: multipart/mixed; boundary="------------Hr6LP4AM9ISu7BxeozvC4NC3"

--------------Hr6LP4AM9ISu7BxeozvC4NC3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMTI6MzUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE4LzA4LzIw
MjYgMTE6MTMgYW0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxOC4wOC4yNiAxMjow
NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxOC8wOC8yMDI2IDg6NTMgYW0sIEZ1
cmthbiDDh2FsxLHFn2thbiB3cm90ZToNCj4+Pj4gT24gOC8xOC8yNiAxMDoxMSwgSsO8cmdl
biBHcm/DnyB3cm90ZToNCj4+Pj4+IE9uIDE4LjA4LjI2IDA4OjMyLCBGdXJrYW4gQ2FsaXNr
YW4gd3JvdGU6DQo+Pj4+Pj4gc2NoZWRfbW92ZV9kb21haW4oKSBkZXJpdmVzIHRoZSBudW1i
ZXIgb2YgdW5pdHMgdG8gcmVidWlsZCBmcm9tDQo+Pj4+Pj4gZC0+bWF4X3ZjcHVzLCB3aGlj
aCBpcyBmaXhlZCBhdCBkb21haW4gY3JlYXRpb24gYW5kIG5ldmVyIHJvbGxlZA0KPj4+Pj4+
IGJhY2sgaWYgdmNwdV9jcmVhdGUoKSBmYWlscyBwYXJ0d2F5IHRocm91Z2ggYnVpbGRpbmcg
YSBkb21haW4uIFNvDQo+Pj4+Pj4gZC0+dmNwdVtpXSBjYW4gYmUgTlVMTCBmb3Igc29tZSBp
IGV2ZW4gdGhvdWdoIG1heF92Y3B1cyBzdGlsbA0KPj4+Pj4+IGNvdW50cyBpdCAtIHRoaXMg
aGFwcGVucyBpZiBzY2hlZF9hbGxvY191ZGF0YSgpIHJldHVybnMgTlVMTC4NCj4+Pj4+Pg0K
Pj4+Pj4+IFRoZSBwZXItdW5pdCBsb29wIGRvZXNuJ3QgY2hlY2sgZm9yIHRoaXM6IGl0IHNl
dHMNCj4+Pj4+PiB1bml0LT52Y3B1X2xpc3QgPSBkLT52Y3B1W3VuaXRfaWRdIChOVUxMKSBh
bmQgaGFuZHMgdGhhdCBicm9rZW4NCj4+Pj4+PiB1bml0IHN0cmFpZ2h0IHRvIHRoZSBkZXN0
aW5hdGlvbiBzY2hlZHVsZXIncyBhbGxvY191ZGF0YSgpLA0KPj4+Pj4+IHdoaWNoIGFzc3Vt
ZXMgdmNwdV9saXN0IGlzIGFsd2F5cyB2YWxpZCBhbmQgY3Jhc2hlcyBYZW4gd2hlbg0KPj4+
Pj4+IGl0IGlzIG5vdC4NCj4+Pj4+Pg0KPj4+Pj4+IFJlcHJvZHVjZWQgYnkgYnVpbGRpbmcg
YSBkb21haW4gaW4gYSBub24tZGVmYXVsdCBjcHVwb29sIHdoZXJlDQo+Pj4+Pj4gdmNwdSBj
cmVhdGlvbiBmYWlscyBwYXJ0d2F5IHRocm91Z2gsIHRoZW4gZGVzdHJveWluZyBpdC4NCj4+
Pj4+PiBkb21haW5fa2lsbCgpIG1vdmVzIHRoZSBkb21haW4gYmFjayB0byB0aGUgZGVmYXVs
dCBjcHVwb29sIHZpYQ0KPj4+Pj4+IHNjaGVkX21vdmVfZG9tYWluKCkgYmVmb3JlIGFjdHVh
bGx5IGRlc3Ryb3lpbmcgaXQsIGNyYXNoaW5nDQo+Pj4+Pj4gaW5zaWRlIHRoZSBkZXN0aW5h
dGlvbiBzY2hlZHVsZXIncyBhbGxvY191ZGF0YSgpIChzZWVuIGluDQo+Pj4+Pj4gQ3JlZGl0
MidzIGNzY2hlZDJfYWxsb2NfdWRhdGEoKSAtPiBpc19pZGxlX3VuaXQoKSAtPiBOVUxMIGRl
cmVmKS4NCj4+Pj4+Pg0KPj4+Pj4+IEJlZm9yZSBidWlsZGluZyBhIHVuaXQgaW4gc2NoZWRf
bW92ZV9kb21haW4oKSwgY2hlY2sgdGhhdCBhbGwgb2YNCj4+Pj4+PiBpdHMgdmNwdSBzbG90
cyBhcmUgcG9wdWxhdGVkLCBhbmQgc2tpcCBpdCBpZiBhbnkgYXJlIG1pc3NpbmcuIFRoZQ0K
Pj4+Pj4+IHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIHdhbGtzIHRoZSB2Y3B1cyB0aGF0IGFjdHVh
bGx5IGV4aXN0LCB2aWENCj4+Pj4+PiBmb3JfZWFjaF92Y3B1KCkgcmF0aGVyIHRoYW4gbl91
bml0cywgc28gc2tpcHBpbmcgYSB1bml0IGhlcmUNCj4+Pj4+PiBkb2VzIG5vdCBsZWF2ZSBh
bnl0aGluZyBlbHNlIG91dCBvZiBzeW5jLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KPj4+Pj4+IC0t
LQ0KPj4+Pj4+ICDCoMKgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgMTkgKysrKysrKysr
KysrKysrKysrKw0KPj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+Pj4+IGluZGV4IGQzYTBhOTdlMWQu
LmQ1NDJjNzY1NDMgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMNCj4+Pj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+Pj4+IEBAIC03
NDUsNiArNzQ1LDI1IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpk
LA0KPj4+Pj4+IHN0cnVjdCBjcHVwb29sICpjKQ0KPj4+Pj4+ICDCoMKgIMKgwqDCoMKgwqAg
Zm9yICggdW5pdF9pZHggPSAwOyB1bml0X2lkeCA8IG5fdW5pdHM7IHVuaXRfaWR4KysgKQ0K
Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgew0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKg0KPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogU2tpcCB0aGlzIHVuaXQgaWYgYW55IG9mIGl0cyB2
Y3B1cyBpcyBtaXNzaW5nLiBCb3VuZGVkIGJ5DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAg
KiBtYXhfdmNwdXMuDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgYm9vbCB2Y3B1X2ZhaWxlZCA9IGZhbHNlOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgZm9yICggdW5zaWduZWQgaW50IGkgPSAwOw0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpIDwgZ3JhbiAmJiB1bml0X2lkeCAqIGdyYW4g
KyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhZC0+dmNwdVt1bml0X2lkeCAq
IGdyYW4gKyBpXSApDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgew0KPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmNwdV9mYWlsZWQgPSB0cnVlOw0K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+
Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHZjcHVfZmFpbGVkICkNCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+Pj4+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyBjb3JyZWN0Lg0KPj4+Pj4NCj4+Pj4+IElmIHRoZXJlIGFyZSBzb21l
IHZjcHVzIGluIHRoZSB1bml0IHlvdSB3aWxsIGxvb3NlIHRoZW0gKGkuZS4gbWFrZQ0KPj4+
Pj4gdGhlbSBubw0KPj4+Pj4gbG9uZ2VyIGJlIGFibGUgdG8gYmUgc2NoZWR1bGVkKSwgcmln
aHQ/DQo+Pj4+Pg0KPj4+Pj4gRm9yIGEgZHlpbmcgZG9tYWluIHRoaXMgbWlnaHQgYmUgb2th
eSwgYnV0IG5vdCBmb3Igb25lIHN0aWxsDQo+Pj4+PiBhY3RpdmUuIFNvIEkgdGhpbmsNCj4+
Pj4+IHlvdSBzaG91bGQgYXQgbGVhc3QgdmVyaWZ5IHRoZSBkb21haW4gaXMgZHlpbmcsIG90
aGVyd2lzZQ0KPj4+Pj4gc2NoZWRfbW92ZV9kb21haW4oKQ0KPj4+Pj4gc2hvdWxkIGp1c3Qg
ZmFpbC4NCj4+Pj4+DQo+Pj4+PiBBbiBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0byBmaXggdGhl
IE5VTEwgZGVyZWZlcmVuY2luZyB3aGVyZSBuZWVkZWQsDQo+Pj4+PiBidXQgdGhpcw0KPj4+
Pj4gY291bGQgYmVjb21lIHRlZGlvdXMuDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IEp1ZXJnZW4N
Cj4+Pj4gUmlnaHQuIE15IGluaXRpYWwgYXR0ZW1wdCBvbmx5IGNoZWNrZWQgJ2QtPnZjcHVb
dW5pdF9pZHgqZ3Jhbl0nDQo+Pj4+IGZvciB0aGUgaGVhZCB2Q1BVLiBUaGUgY3Jhc2ggaGFw
cGVucyB3aGVuIHVuaXQtPnZjcHVfbGlzdCBpcyBzZXQNCj4+Pj4gdG8gZC0+dmNwdVt1bml0
X2lkeCpncmFuXSAod2hpY2ggaXMgTlVMTCkgYW5kIHBhc3NlZCB0bw0KPj4+PiAnYWxsb2Nf
dWRhdGEoKScsDQo+Pj4+IGNhdXNpbmcgYSBOVUxMIGRlcmVmZXJlbmNlLg0KPj4+Pg0KPj4+
PiBJIGV4cGFuZGVkIHRoZSBsb29wIG92ZXIgJ2dyYW4nIHRvIGhhbmRsZSBjb3JlLXNjaGVk
dWxpbmcgY2FzZXMgd2hlcmUgYQ0KPj4+PiBzdWJzZXF1ZW50IHZDUFUgZmFpbHMgbWlkLXVu
aXQsIGJ1dCBhcyB5b3UgcG9pbnRlZCBvdXQsIHRoYXQgZHJvcHMgdGhlDQo+Pj4+IHdob2xl
IHVuaXQgZm9yIGFjdGl2ZSBkb21haW4uDQo+Pj4+DQo+Pj4+IEknbGwgdXBkYXRlIHRoZSBw
YXRjaCB0byBjaGVjayBkLT5pc19keWluZyB0byBza2lwIGluY29tcGxldGUgdW5pdHMNCj4+
Pj4gb25seSBmb3IgZHlpbmcgZG9tYWlucywgYW5kIGhhdmUgc2NoZWRfbW92ZV9kb21haW4o
KSBmYWlsIGlmIGFuIGFjdGl2ZQ0KPj4+PiBkb21haW4gaGFzIG1pc3NpbmcgdkNQVXMNCj4+
Pg0KPj4+IEknbSBhZnJhaWQgdGhhdCB3b250IGZpeCBldmVyeXRoaW5nLg0KPj4NCj4+IFdo
eSBub3Q/DQo+IA0KPiBkb21VJ3MgaW4gdGhpcyBzaXR1YXRpb24gZG8gbm90IGhhdmUgaXNf
ZHlpbmcgc2V0Lg0KDQpQbGVhc2UgY2xhcmlmeSB3aGF0IHlvdSBtZWFuIHdpdGggInRoaXMg
c2l0dWF0aW9uIi4NCg0Kc2NoZWRfbW92ZV9kb21haW4oKSBpcyBiZWluZyBjYWxsZWQgZWl0
aGVyIGR1ZSB0byBhbiBhZG1pbiBhY3Rpb24NCigieGwgY3B1cG9vbC1taWdyYXRlIiksIG9y
IGR1cmluZyBkb21haW5fa2lsbCgpIGluIG9yZGVyIHRvIG1vdmUgdGhlDQpkb21haW4gdG8g
Y3B1cG9vbDAgZm9yIGF2b2lkaW5nIGEgem9tYmllIGRvbWFpbiBibG9ja2luZyBjcHVwb29s
DQpyZW1vdmFsLg0KDQpUaGUgZmlyc3QgY2FzZSBpcyBhbGxvd2VkIHRvIGZhaWwsIHdoaWNo
IHRoZSBzdWdnZXN0ZWQgZml4IHdvdWxkIGRvLA0Kd2hpbGUgdGhlIHNlY29uZCBjYXNlIGlz
IGhhcHBlbmluZyBvbmx5IGFmdGVyIERPTURZSU5HX2R5aW5nIGhhcyBiZWVuDQpzZXQgZm9y
IHRoZSBkb21haW4uDQoNCg0KSnVlcmdlbg0K
--------------Hr6LP4AM9ISu7BxeozvC4NC3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Hr6LP4AM9ISu7BxeozvC4NC3--

--------------X7grn7hpczWpj6TPR95lMoie--

--------------HIn7oqEkWLG6yHL03DqUoyxz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqEOEUFAwAAAAAACgkQsN6d1ii/Ey/5
2QgAir7+RRdj7Ppt76PZ+PY/ynyBAS2m+1QjvErVZlp6atv8ZcyUy6irqmaf16M/YDLxM7/t+QFc
lDIiqZKDoH1CWOgp7QDg8ZsP45Zj/4MyRaScucfCGzLH9bOqX+UPzPe31f8LmFCXKOyHE16m7kGt
WfNnJAwMsEvmr6GPAPJrpdN223F7wL7T1XHL9iGG5Df56YXxh4L7wQk1XmlFRAOWdBJZIsZzwoFr
6cs9wTSs1Zivt+upHUxACS5YFCREcdUP5S0Y+UmivObcwD/B18nZwNULBOxTfXHs5CZ8NcJcSRZu
SqlrmWuvo7Dn5B9Gq/bKyEEy66UfvpA58k6HPpt5GA==
=poQi
-----END PGP SIGNATURE-----

--------------HIn7oqEkWLG6yHL03DqUoyxz--

