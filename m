Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648FCC44508
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2026 17:12:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362466.1614295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjggQ-0005Nd-9x; Tue, 14 Jul 2026 17:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362466.1614295; Tue, 14 Jul 2026 17:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjggQ-0005NN-5U; Tue, 14 Jul 2026 17:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1362466;
 Tue, 14 Jul 2026 17:12:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wjggO-0005MF-8F
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 17:12:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjggM-000jvm-Ve
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 19:12:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a566de7-e002-0a2a0a5209dd-0a2a4504de4e-20
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 19:12:34 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a566e01-b57f-0a2a45040019-ca0c7c99a163-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 19:12:34 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9BD477A0101
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 13:12:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 14 Jul 2026 13:12:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 13:12:32 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784049153;
	 x=1784135553; bh=pPs3vfbucKxNUGnD4xCty5vM5Kl+Ko5YVvWgGFpyQfs=; b=
	u/M0WWL2p01anXtKKWZ4KXDVXzRcO9LWqLRij0ypJjX9mvaeps7trL2UcV/EUDfl
	7uPsGtypwPvoVyu+oDLvluL4A9gkOl4RrqkGtD/Jwj3M3WAWisOlzzaSFvYgi3GF
	JpPOKDUcUFZtAkO0RPvKaHTaCVArX4MkqTQXzMqjHw/cD7iyzp55JUk465IXJagx
	k13xVPvx9zA9Kv0c1b0RtlD7BcEAX040FoHItCvgvl2NMiOhNE92rYCQ/jZaNZBP
	b5ixJC+p5W6OSwIg+OF7QFfbOwAQGGpr7z67m4B/e/g/NFFoZLmE/PdFVUCCZaLc
	GNjY2FVw95b29L7kUvG02w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784049153; x=1784135553; bh=pPs3vfbucKxNUGnD4xCty5vM5Kl+Ko5YVvW
	gGFpyQfs=; b=BPVfbCWdn3KysSvoC+qM9Vp9zys7yXyiF0Z7yZEfSDjteEjmkyR
	Ful9IQn6K16OMHRvbbZPnByUux/1UGo9m4qArGZE8KH+UdHEynPzs8yfFtfRlj0U
	ZEUHChMfuI6kZ8MBo1neELqBwxlq39PE67+7UOOIg0HonibZaF5Jb0l2WNDpPQHJ
	R9vDTQRQAAgKbkBJfeD5nP9k9LknwFUa+kV9I0GYSHXjOg3gMD6L6sZio/hhtWQH
	X6V4UOUxiezysME9yXBx1ViXrIbkX/TAfgffmekgp/Rt3NFQ9uHOeqmAnJkeTS1s
	sF8ShwYo7u0/dy2qgTDlPRe3XREUfGSXY1A==
X-ME-Sender: <xms:AW5WakBcXeRRO23OG18PbkmDhPhPdSTq16INf4JTodBKlhBfp_v10w>
    <xme:AW5WatfbQU7mWr_ViupUPLOMJmoZc_hQkMe1mjTKpF7ppzdWNZB6oYlCBWtddRKfb
    SneuJvJUe5ydsK060DiWQPsvCIq0PZJOPUykEKWhgMNC-uuVg>
X-ME-Received: <xmr:AW5WatMv5BVwv991nKwFNy5PxVTbRnPa9gaP3yaQuaGPF2r_Nz6sGbMK-SQXc_tMW2kYy4sgIfWRofcdR5UxK-Fuk8A78skvX-g>
X-ME-Proxy-Cause: dmFkZTGTskvJgfJB/UzEvyOX+uX/kqokrHrRiDOzfsUIayCBMHYnKQ6P3HRCNIZ3O9TQvR
    f7chAC9XKG2OnxOWVRVmCLEH5c5ycCwNj23tI8eiFWCufw2qQCh9uxZTO5imAVr8kFvWCu
    PfKpv5eGevKfUrVL+cJXBCg7RNi2GVcZ69AdP640kmrynmMzXkRnxPv1aRyMGsQFgXW3ic
    5rlXHAJZR23J419ATvgLiYBCbys2IUGBM1R8es/JYjiQIB4TPW8uTEhhrsUAj9SiYqyBhR
    IWk7vQryROylQtXFAFHC4FTcAKQEvYQb7vFUZZ3FMkAMJicqv6LcuxH9v8U5+A9tOQ8LqM
    3H/7hYlwdJVBxEWsuxU8I45/2TKJ9aCNWkjJS/X9D/MvH/VDVB1lpZCQ68vLBaEEtLhSTA
    r40UBXRY6XnodI5U1YCJjqufyym25Mtzh+1oUwE/Jde6LmaJ+U5EIJrRDEfYRmBQ6cugFp
    u7YRjGeghO4z0JLxII4VSxfVcqf2iBrc+e9LSZOeaLQepzlAVHotW2JTnaKTgDUL3SR/zZ
    QvvOmpDF4Gi/C3njiSWtv3dUrnWUs+gxMUfScV21HdXO8H6XwFfDpfh15pW+M3s+3rBRtN
    y5dNglUgZDCoo58+MFDMXa71WG4ZCol9WftVZTZHVkzBMrjCL8i2CEMlRQQQ
X-ME-Proxy: <xmx:AW5Wav5vGc6Vchick6YpOciuChC5UEVewWq-NHTCi_qPKcOrolHukw>
    <xmx:AW5WapLYv74e0tt8jOqCyJoLIWrtXqG10AXxzlCdOcOo1hUXE4axjA>
    <xmx:AW5WahdPhZjNZc8c6c82GyyyLuUdXhqJ3BC5uSNwSaa_T9-m6JhOrg>
    <xmx:AW5WakdgBKDm97OyjANgVQZnH6qe48bA8pKciXgSRvkTWooS4AckJw>
    <xmx:AW5WarhMeSEhuz1P1zpCol5F5GK3dCp2rzoK24aKuGGg-9vlE2zWR72L>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Jul 2026 19:12:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
Message-ID: <alZt_boT-hJuVlD6@mail-itl>
References: <ajUm2SQtMD6Y-K9S@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YdlsN5AHP5+U/HIc"
Content-Disposition: inline
In-Reply-To: <ajUm2SQtMD6Y-K9S@mail-itl>
X-purgate-ID: tlsNG-ebf023/1784049154-514D3B50-F8F862E0/0/0
X-purgate-type: clean
X-purgate-size: 5794


--YdlsN5AHP5+U/HIc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:12:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: domU crash when resuming from suspend - Xen 4.22

On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> I'm continuing testing 4.22 and found this:
>=20
> When a domU is suspended (even without host suspend) it crashes on
> resume with:
>=20
>     [   24.374629] BUG: kernel NULL pointer dereference, address: 0000000=
000000020
>     [   24.374647] #PF: supervisor read access in kernel mode
>     [   24.374657] #PF: error_code(0x0000) - not-present page
>     [   24.374668] PGD 0 P4D 0=20
>     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
>     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tainted 6.=
18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)=20
>     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus.const=
prop.0+0x6f/0xb0
>     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
>     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 =
00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 =
13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
>     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
>     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 00000=
00000000404
>     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 00000=
00000770ef0
>     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc=
900000abc8c
>     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fffff=
fff81835ac0
>     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15: 00000=
00000000000
>     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) =
knlGS:0000000000000000
>     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 00000=
00000770ef0
>     [   24.374873] PKRU: 00000000
>     [   24.374877] Call Trace:
>     [   24.374884]  <TASK>
>     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
>     [   24.374900]  cpu_stopper_thread+0xa3/0x170
>     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
>     [   24.374917]  smpboot_thread_fn+0xf3/0x220
>     [   24.374925]  kthread+0xfc/0x240
>     [   24.374933]  ? __pfx_kthread+0x10/0x10
>     [   24.374940]  ? __pfx_kthread+0x10/0x10
>     [   24.374949]  ret_from_fork+0x158/0x170
>     [   24.374957]  ? __pfx_kthread+0x10/0x10
>     [   24.374965]  ret_from_fork_asm+0x1a/0x30
>     [   24.374973]  </TASK>
>     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq s=
nd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs binfmt=
_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_co=
nntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl_c=
ommon intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_vsec po=
lyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen_g=
ntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_bl=
kfront
>     [   24.375064] CR2: 0000000000000020
>     [   24.375071] ---[ end trace 0000000000000000 ]---
>     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
>     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 =
00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 =
13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
>     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
>     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 00000=
00000000404
>     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 00000=
00000770ef0
>     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc=
900000abc8c
>     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fffff=
fff81835ac0
>     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15: 00000=
00000000000
>     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) =
knlGS:0000000000000000
>     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 00000=
00000770ef0
>     [   24.375241] PKRU: 00000000
>     [   24.375247] Kernel panic - not syncing: Fatal exception
>     [   25.417403] Shutting down cpus with NMI
>     [   25.417447] Kernel Offset: disabled
>=20
> There is no change on the Linux kernel side (neither dom0 nor domU), the
> only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
> broken on -rc1 too). This happens for both HVM and PVH domains. Haven't
> tried PV domU (but dom0 survives host suspend).

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YdlsN5AHP5+U/HIc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpWbf0ACgkQ24/THMrX
1ywgxAf/Tt5gykoL8zkjOqUyFhSZ/s8ef7Wo9yszpn0vzBgCqJ40ECSvjD7pjgqj
a2iM8c79tyYtFwFfrQ31St6Ag9pL26gLtMtwPaTl4IcsFRQa1ny/MVuTQNDFymCJ
2OHOX1aRwAroJ3PN7I6M0vwp79x2IH+3xoiVNa4auZCf7+pq6St1qe6sj/r32GwZ
J9Y+17vClLJAXnjVZYbB1n8Vfs7p0MnGlsnkdI026eYuA5TxAtx6+JyXbvsjMlz6
A7/j8z3PnPyJA1rj+3YcK7Sbjv+JR/vCFHWMPhD9lIAT/knTxUPfakFsh4PggULg
Re8uO/gUXsBM9m+4jUSaZcDPs86C8g==
=62Ue
-----END PGP SIGNATURE-----

--YdlsN5AHP5+U/HIc--

