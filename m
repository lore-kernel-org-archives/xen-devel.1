Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7357606A324
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=G3BovOp0;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=G3BovOp0
Received: from list by lists.xenproject.org with outflank-mailman.1505294.1700130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWy8F-0007fg-F5; Fri, 27 Nov 2026 15:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505294.1700130; Fri, 27 Nov 2026 15:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWy8F-0007fZ-CM; Fri, 27 Nov 2026 15:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1505294;
 Fri, 27 Nov 2026 15:45:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xWy8E-0007fT-H7
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:45:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWy8D-0033NO-TC
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:45:01 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6b09a572-8faa-0a2a0a5109dd-0a2a450aa24e-16
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:45:01 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6b09a57d-f2d2-0a2a450a0019-c387df829b7a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:45:01 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E64122675;
 Fri, 27 Nov 2026 15:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04453134E8;
 Fri, 27 Nov 2026 15:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kR81M3ylCWtCIwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 27 Nov 2026 15:45:00 +0000
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
	t=1795794301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=axbN9lgMVm9glFmvA5c1QCpi1+WmdMrxJoMgO92U3Kw=;
	b=G3BovOp0jUwq5XItMSaAuUfIWuPlFdrTzzZC77ErFXk2MKVQebEE9QgPMSuR1f7BZgyOQL
	R3wD+HlzTyptT3Rb6KLqv3rFAgsX/yQIx8+4HSc2FE/ffTbWhibkUUhcmrS1UY4KAF0yN/
	+WTBurPVMyLa1YXag9pZdCZJifT/vCc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795794301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=axbN9lgMVm9glFmvA5c1QCpi1+WmdMrxJoMgO92U3Kw=;
	b=G3BovOp0jUwq5XItMSaAuUfIWuPlFdrTzzZC77ErFXk2MKVQebEE9QgPMSuR1f7BZgyOQL
	R3wD+HlzTyptT3Rb6KLqv3rFAgsX/yQIx8+4HSc2FE/ffTbWhibkUUhcmrS1UY4KAF0yN/
	+WTBurPVMyLa1YXag9pZdCZJifT/vCc=
Message-ID: <641c1c14-30bf-47eb-a841-0c82aae35628@suse.com>
Date: Fri, 27 Nov 2026 16:45:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
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
In-Reply-To: <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b1RLz1OTRDQmnYRP7XhRanuX"
X-Spamd-Result: default: False [-10.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	NEURAL_SPAM_LONG(3.50)[0.999];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -10.79
X-Spam-Level: 
X-purgate-ID: tlsNG-4011c0/1795794301-528DDCFC-2C09F168/35/110847
X-purgate-type: clean
X-purgate-size: 7124
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b1RLz1OTRDQmnYRP7XhRanuX
Content-Type: multipart/mixed; boundary="------------ZLvRDgursKfLK6BisGSa9UFH";
 protected-headers="v1"; hp="clear"
Message-ID: <641c1c14-30bf-47eb-a841-0c82aae35628@suse.com>
Date: Fri, 27 Nov 2026 16:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix potential NULL dereference in
 sched_move_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261124122004.2487366-1-jgross@suse.com>
 <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>
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
In-Reply-To: <52e2c84f-2e14-40cf-a515-d59bf32a3b5a@suse.com>

--------------ZLvRDgursKfLK6BisGSa9UFH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI2
IDEzOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSWYgYSBkeWluZyBkb21haW4gaGFz
IG5vdCBhbGwgb2YgaXRzIHZjcHVzIGZpbGxlZCBhbmQgaXQgaXMgbW92ZWQgZnJvbQ0KPj4g
YSBjcHVwb29sIHdpdGggZ3Jhbj1zb2NrZXQgdG8gb25lIHdpdGggZ3Jhbj1jb3JlLA0KPiAN
Cj4gV2h5IHdvdWxkIGEgZHlpbmcgZG9tYWluIG5lZWQgbW92aW5nIGluIHRoaXMgd2F5IGlu
IHRoZSBmaXJzdCBwbGFjZT8NCj4gUG9zc2libHkgY29ubmVjdGVkIHRvIHRoaXMsIC4uLg0K
PiANCj4+IGl0IG1pZ2h0IGhhcHBlbiB0aGF0DQo+PiBkdXJpbmcgYXNzaWdubWVudCBvZiB0
aGUgbmV3IHVuaXRzIHRvIHRoZSB2Y3B1cyBhIE5VTEwgcG9pbnRlciBpcw0KPj4gYmVpbmcg
ZGVyZWZlcmVuY2VkOg0KPj4NCj4+IC0gc3lzdGVtIGhhcyAyIHNvY2tldHMgd2l0aCAyIGNv
cmVzIGVhY2gsIGVhY2ggY29yZSBoYXMgMiB0aHJlYWRzDQo+PiAtIFBvb2wtMCBoYXMgZ3Jh
bj1jb3JlLCBvdGhlciBjcHVwb29sIGhhcyBncmFuPXNvY2tldA0KPj4gLSBkb21haW4gd2l0
aCBtYXhfdmNwdXM9NCBoYXMgb25seSAzIHZjcHVzIGFuZCBpcyBpbiBjcHVwb29sIHdpdGgN
Cj4+ICAgIGdyYW49c29ja2V0DQo+PiAtIGRvbWFpbiBpcyBkeWluZyBhbmQgaXMgbW92ZWQg
dG8gUG9vbC0wDQo+PiAtIGluIHNjaGVkX21vdmVfZG9tYWluKCkgdGhpcyByZXN1bHRzIGlu
IHZjcHVfZmFpbGVkIGJlaW5nIHNldCB0bw0KPj4gICAgdHJ1ZSBmb3IgdGhlIGxhc3QgdW5p
dCBvZiB0aGUgZG9tYWluLCByZXN1bHRpbmcgaW4gdGhlIHVuaXQgbm90DQo+PiAgICBiZWlu
ZyBhbGxvY2F0ZWQgKCJjb250aW51ZSIgc3RhdGVtZW50IGlzIGJlaW5nIGhpdCkNCj4+IC0g
aW4gdGhlIGZvcl9lYWNoX3ZjcHUoKSBsb29wIG9mIHNjaGVkX21vdmVfZG9tYWluKCkgZm9y
IHZjcHUgMg0KPj4gICAgdGhlIHVuaXQgcG9pbnRlciB3aWxsIGJlIHNldCB0byBOVUxMLCBh
cyB1bml0LT5uZXh0X2luX2xpc3QgaXMgbm90DQo+PiAgICBwb3B1bGF0ZWQgZHVlIHRvIGFi
b3ZlICJjb250aW51ZSINCj4+DQo+PiBGaXhlczogNDgzNWMwNzhlNWNmICgieGVuL3NjaGVk
OiBjb3JlOiBza2lwIG1pc3NpbmcgdmNwdSBzbG90cyBpbiBzY2hlZF9tb3ZlX2RvbWFpbigp
IikNCj4+IFJlcG9ydGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAYW1kLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyB8IDExICsrKysrKystLS0t
DQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2Nv
bW1vbi9zY2hlZC9jb3JlLmMNCj4+IGluZGV4IDEwYjZlZWNjY2QuLmVlNzA3N2I4NzAgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gKysrIGIveGVuL2Nv
bW1vbi9zY2hlZC9jb3JlLmMNCj4+IEBAIC04MzAsMTAgKzgzMCwxMyBAQCBpbnQgc2NoZWRf
bW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpDQo+PiAg
ICAgICAgICAgaWYgKCB1bml0LT51bml0X2lkICsgZ3JhbiA9PSB2LT52Y3B1X2lkICkNCj4+
ICAgICAgICAgICAgICAgdW5pdCA9IHVuaXQtPm5leHRfaW5fbGlzdDsNCj4+ICAgDQo+PiAt
ICAgICAgICB1bml0LT5zdGF0ZV9lbnRyeV90aW1lID0gb2xkX3VuaXQtPnN0YXRlX2VudHJ5
X3RpbWU7DQo+PiAtICAgICAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3Rh
dGVdKys7DQo+PiAtICAgICAgICAvKiBUZW1wb3JhcmlseSB1c2Ugb2xkIHJlc291cmNlIGFz
c2lnbm1lbnQgKi8NCj4+IC0gICAgICAgIHVuaXQtPnJlcyA9IGdldF9zY2hlZF9yZXMobmV3
X2NwdSk7DQo+PiArICAgICAgICBpZiAoIHVuaXQgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAg
ICAgICAgICAgIHVuaXQtPnN0YXRlX2VudHJ5X3RpbWUgPSBvbGRfdW5pdC0+c3RhdGVfZW50
cnlfdGltZTsNCj4+ICsgICAgICAgICAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3Rh
dGUuc3RhdGVdKys7DQo+PiArICAgICAgICAgICAgLyogVGVtcG9yYXJpbHkgdXNlIG9sZCBy
ZXNvdXJjZSBhc3NpZ25tZW50ICovDQo+PiArICAgICAgICAgICAgdW5pdC0+cmVzID0gZ2V0
X3NjaGVkX3JlcyhuZXdfY3B1KTsNCj4+ICsgICAgICAgIH0NCj4+ICAgDQo+PiAgICAgICAg
ICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7DQo+IA0KPiAuLi4gaXMgdGhpcyBmaWVsZCBiZWNv
bWluZyBOVUxMIHJlYWxseSBva2F5Pw0KVHVybnMgb3V0IGl0IGlzbid0Lg0KDQpJZiB2Y3B1
X3dha2UoKSBpcyBjYWxsZWQgZm9yIHN1Y2ggYSB2Y3B1IHRoZW4gTlVMTCBpcyBiZWluZyBk
ZXJlZmVyZW5jZWQuDQpJIGRvbid0IHNlZSB3aHkgdGhpcyBjb3VsZG4ndCBoYXBwZW4gZm9y
IGEgZHlpbmcgZG9tYWluLg0KDQpBbmQgSSdtIHN1cmUgb3RoZXIgY2FzZXMgZG8gZXhpc3Qs
IHRvby4NCg0KDQpKdWVyZ2VuDQo=

--------------ZLvRDgursKfLK6BisGSa9UFH--

--------------b1RLz1OTRDQmnYRP7XhRanuX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsJpXwFAwAAAAAACgkQsN6d1ii/Ey/N
9Af/YiEH2nC53gPXCJPNBmpNgXluOAb8oWpQipfZzmkEGClVC4ve41kJPy68M8bKTeNoJKeV16Mt
RSXNLmJXdlI9oeao1l3BsC0++voPgu4rdCSskf3RyqDUfmHbyp/hDeLJJCjVw8EZs4MyCIjYxfq7
167UGIayuCVTNe2/4vlV/65nZBZ1ifRPRuBKiKsxoCYwXPt2EuuY0ZFZvOt59KvPkFVVAHZGLtEK
N2LKkda/bj9+6CS+ImBOccBU0hjRUuvaA6CRtElOcVV6eAU+3u51uXVepccz7skgwSirARFPJAiu
femZHhSOygzEh7eaj3p9fCR9sz0M4DHZuEYTHTHP8g==
=0NZz
-----END PGP SIGNATURE-----

--------------b1RLz1OTRDQmnYRP7XhRanuX--

