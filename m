Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1710606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=mcZtE9NR;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=mcZtE9NR
Received: from list by lists.xenproject.org with outflank-mailman.1486996.1689448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoFR-0004od-F9; Fri, 13 Nov 2026 10:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486996.1689448; Fri, 13 Nov 2026 10:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoFR-0004oW-AY; Fri, 13 Nov 2026 10:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1486996;
 Fri, 13 Nov 2026 10:11:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRoFP-0004oQ-Hr
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:11:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoFO-00GpTZ-R2
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:11:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af6e21f-8faa-0a2a0a5109dd-0a2a4501820c-42
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:11:06 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af6e23a-5984-0a2a45010019-c387df82db72-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:11:06 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3D94220E6;
 Fri, 13 Nov 2026 10:11:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E7661344A;
 Fri, 13 Nov 2026 10:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id csJQETni9modbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Nov 2026 10:11:05 +0000
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
	t=1794564665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/8ky+f6BsgjvJuUKdUPa6Pft75+/BbbfRiIIYtnUYpQ=;
	b=mcZtE9NRX7SX7LdzVUDI4quMI0QE/dC8+D4G4pV03rwl2iFuHlMeRHmA9Yr3MFthgnxzmU
	WFV4velNs1lgaPECf+Swef/6lgyQh55U+p2jF3tipEDVndW6NzuocBYDtrTRq8t0CIp8+v
	E3VzNNaX6pRx2L/QfeXyvpIdLyD9YhQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mcZtE9NR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794564665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/8ky+f6BsgjvJuUKdUPa6Pft75+/BbbfRiIIYtnUYpQ=;
	b=mcZtE9NRX7SX7LdzVUDI4quMI0QE/dC8+D4G4pV03rwl2iFuHlMeRHmA9Yr3MFthgnxzmU
	WFV4velNs1lgaPECf+Swef/6lgyQh55U+p2jF3tipEDVndW6NzuocBYDtrTRq8t0CIp8+v
	E3VzNNaX6pRx2L/QfeXyvpIdLyD9YhQ=
Message-ID: <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>
Date: Fri, 13 Nov 2026 11:11:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
 <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
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
In-Reply-To: <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1aE0G9cafX9m8M6MN7Ma2bTd"
X-Spamd-Result: default: False [-13.72 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-0.72)[-0.716];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,xenproject.org,vates.tech,kernel.org,xen.org,epam.com,arm.com,gmail.com,raptorengineering.com];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -13.72
X-Spam-Level: 
X-Rspamd-Queue-Id: E3D94220E6
X-purgate-ID: tlsNG-d62444/1794564666-C4F47757-2271F9F8/35/110847
X-purgate-type: clean
X-purgate-size: 5395
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1aE0G9cafX9m8M6MN7Ma2bTd
Content-Type: multipart/mixed; boundary="------------B1DTYn8OR8yEgiXwLulAQrs2";
 protected-headers="v1"; hp="clear"
Message-ID: <06fde455-ffd9-4cd5-823f-10d7728512ae@suse.com>
Date: Fri, 13 Nov 2026 11:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
 <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
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
In-Reply-To: <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>

--------------B1DTYn8OR8yEgiXwLulAQrs2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjYgMTA6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEzLzExLzIw
MjYgNzozMSBhbSwgT3J6ZWwsIE1pY2hhbCB3cm90ZToNCj4+DQo+PiBPbiAxMi1Ob3YtMjYg
MTk6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gVGhpcyBpcyBhIGxpc3Qgb2YgcG9p
bnRlcnMgd2hpY2ggaXMgb25seSBldmVyIHJlYWQuDQo+PiBJIHRoaW5rIHRoYXQncyBub3Qg
dHJ1ZS4gU2VlIHNjaGVkX3Rlc3RfZnVuYygpIG1hY3JvIGluIHNjaGVkdWxlcl9pbml0KCkg
dGhhdA0KPj4gYXNzaWducyBOVUxMIGluIGNhc2UgdGhlIHNjaGVkdWxlciBkb2VzIG5vdCBp
bXBsZW1lbnQgdGhlIHJlcXVpcmVkIGhvb2suDQo+IA0KPiBMb3ZlbHksIHNvcnJ5IEkgbWlz
cmVhZCB0aGUgY29uc3Qgb24gdGhlIG5hbWUgdGhlcmUuDQo+IA0KPiBzY2hlZF90ZXN0X2Z1
bmMoKSBvbiB0aGUgb3RoZXIgaGFuZCBjYW4gYmUgZGVsZXRlLsKgIFdlIGNhbiBmb3JjZSB0
aG9zZQ0KPiBjaGVja3MgYXQgY29tcGlsZXRpbWUuDQo+IA0KPiBCdXQsIHRoZXJlJ3MgdGhl
IGdsb2JhbCBpbml0IGNhc2UuwqAgTm9uZSBvZiB0aGUgY3VycmVudCBnbG9iYWwgaW5pdA0K
PiBob29rcyBkbyBhbnl0aGluZyBleGNlcHQgcmV0dXJuIDAsIGJ1dCBJIHN1cHBvc2UgaW4g
cHJpbmNpcGxlIHRoYXQgbWF5DQo+IHdhbnQgdG8gc3RheS4NCg0KVGhpcyBjYW4gZWFzaWx5
IGJlIGhhbmRsZWQgcGVyLXNjaGVkdWxlcjoNCg0KLSBtYWtlIC5nbG9iYWxfaW5pdCByZXR1
cm4gdm9pZA0KLSBpbiBjYXNlIGEgZ2xvYmFsX2luaXQgaG9vayBmYWlscywgbGV0IGl0IHNl
dCBhIHN0YXRpYyB2YXJpYWJsZSBpbiB0aGUNCiAgIHNjaGVkdWxlciwgcmVzdWx0aW5nIGlu
IGFueSAuaW5pdCgpIGNhbGwgZm9yIHRoYXQgc2NoZWR1bGVyIHRvIGZhaWwNCg0KVGhpcyB3
aWxsIGF2b2lkIGFueSBuZWVkIHRvIE5VTEwgYSBzY2hlZHVsZXIgaW4gdGhlIGFycmF5IChh
c3N1bWluZw0Kc2NoZWRfdGVzdF9mdW5jKCkgaGFzIGJlZW4gcmVtb3ZlZCwgdG9vKS4NCg0K
DQpKdWVyZ2VuDQo=

--------------B1DTYn8OR8yEgiXwLulAQrs2--

--------------1aE0G9cafX9m8M6MN7Ma2bTd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr24jkFAwAAAAAACgkQsN6d1ii/Ey+9
AAf/V74E4Xq5cj6Ncc3z1iHB40kD8ufqwWxpej5OdJNYSKh4G5X9h40EhHUVphM1yU7J/7627ynG
TzLrQwhF8jJKaJViYXEBBui5C2gu4bwJVNery1MC4pKgJ4mKfX+zgC9fbfke4n2EO2ptNIig4vO0
Q4X/s2jt4D6VJD83cNoCJs6Nwiy99naiXr+ZmcFNhAYqVWQAYpmnRMZRSWIgRhwsI/eK/51bXhBN
3fcTEVAG+09uBqLWBBW0/CXg9qufyELSrl2kL62lTykkAkD4+iwk4fOLk0D2gkrrusLOk7TW1i+Z
V2SwKHN9Gp/2uIXjyn+B5Csnb2tDh+hIv5S8dMFftw==
=fpMa
-----END PGP SIGNATURE-----

--------------1aE0G9cafX9m8M6MN7Ma2bTd--

