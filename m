Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D0CD98F6
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 11:24:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342098.1602368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXKb-00029y-4p; Fri, 19 Jun 2026 11:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342098.1602368; Fri, 19 Jun 2026 11:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXKb-00029r-1T; Fri, 19 Jun 2026 11:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1342098;
 Fri, 19 Jun 2026 11:24:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1waXKZ-00029h-LY
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waXKY-000pNW-GN
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:24:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3526d7-2eae-0a2a0a5409dd-0a2a45048b18-8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:24:14 +0200
Received: from [103.168.172.150] (helo=fout-a7-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3526dc-5f9f-0a2a45040019-67a8ac96dcff-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:24:13 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 771D9EC0339
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 07:24:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 19 Jun 2026 07:24:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 07:24:11 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1781868252; x=1781954652; bh=zS5XY4Wnge
	YAQQqPLIRDFD0gb3iB6q+n6dsttPoG8j8=; b=SBa/I9Oc35rjmx0uADaqLjLqES
	6I6JO9iLLucErpqfggL9wrpQqFVz3mLntOkFIpSBHjfOuYwtmBPxitNCeYKKHRt5
	lxW0sWw5VgObwBW2o1ieFT75DyG+7pHH64o83FtdyyQKP3YzP88sphGzJ2gEBIJ5
	uOTQv9uvKQtyuYFz33ywOeFPXklD0lD81KgdHAkdE/CCps18GzetMYEwcPx5yed4
	TBN8esQGxsMxz7Q5EJEEbMZSFUoff5ThnLMuXxaEb1iY9FyfV9puPGmcawRWQJjB
	VasYQP+og4c8iZFIAaL/Ny6NTJruAl3REYDmsWoFScb+A2Jrx26Q1Zdb1pCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781868252; x=
	1781954652; bh=zS5XY4WngeYAQQqPLIRDFD0gb3iB6q+n6dsttPoG8j8=; b=O
	TPB+k8SFkZoQlQWiKSJOTg7b0EN176Z2KQ7k/O5CccyzqLoT9Uf8PEQkbHFKxLn9
	0DYqXqGifWbCLGmkg6N/6CGl3r8fAU5QPYWG8pIJAWAVeM4IDiOcSsD+pcfjzSmY
	dYyjynNEk9/JHE9INbvSBKiXUWJQli4SriXJwu7PEK55/IgZ2ovm6+FBGl3jSmei
	Pww4MY/e7Mue1ypvxyMzRiGRYK35zJkJFaUTjxCoTckQVNLd1Z/AZUMkRBARKxfh
	1otuE84YWsq0TLkGD64QjxIcJPBfvuIiP2D6hiM45m+hq6pOBMuDOxUfGysgtZBv
	SRQ1ZlD5DXwPSowow+lfA==
X-ME-Sender: <xms:3CY1agElFlWeLu4CjB-xBR4waMcGzcyiglfPYvgmvQdnuRJF0-9kwA>
    <xme:3CY1agS8OMFwncI_xjYPBbt4R7A-yuDP8KHlfWRk_DhPXpsksPb7g-3i4H_upr4bO
    TdoIUnTfXlK9Y56qZvrd2pdshXbRHd8pjeFxnWOt_LGX3iPjA>
X-ME-Received: <xmr:3CY1avwQ5oW3Vc2MwR57qk4cq2Om4Z7LSeF8gabJH0cAXmUgawzlF4_qaPSlh73QWtEYyhCRVjJWmroYWHM5ndKGifApcexTvlA>
X-ME-Proxy-Cause: dmFkZTFh2Pjwc5ELf/Co+v11Ftqc4Hd70+ktu41rMBK8CVwhxaVlfxtv4IoSxgOfyJGH/p
    9GijXhSDNXE3HFbjpLreqPY1mpVJ6xFaFgmGAbS5tg7Fgl+7zH76oabIwcSgMyd6s4Nf4x
    7nBrnzFbGLX1bivCMMO1rtKwh/n1/trjEJELcBc8hWzXqQYeQ5/hZ3TP+Fb1+Q1cCgLSz/
    aoPjrixv+x3ya/Dxn2XDlbnpqWMKuO+tpMPqkdrxMJqItwtR+dHJypvejN+fkO5wtQKqVw
    AiQj+ItsTt8yIv3KKayDOX79DjP/XsBBrQV0Lj3s8anCJSYLVYtMMmD0hCg33+/qayDOAS
    N1kXiZw2bp5KR/OBvoFRIyr7Hz4ZDgWMn2WChHkEY9KWQCa41qR+0edweaLgUenoyqj5QK
    aQGn4WqKsX/OWGJxtJ6RM0IXLV4yRZmJWndzN8ytfNiY+bfKHf7J/BAl1uheEY83jK0WxH
    2DiTZ9BjHHGoxUeBKB0OB7GnKgTAZlUPNPV2Yyz12UrBYqZznHXZuajsJifq37oqdrBVe7
    J4jQIlO2uXS37nhqKQkNz+et06NrndlQHmxaMpIVMgkNNoSjFx5Yxlai6vwvtkB6eNpH6Y
    g8cRy0niJddkIZ4Egf2ORRitRGlnfnFguDasZhaeJSI5BhfAAFg1LcB6IaPA
X-ME-Proxy: <xmx:3CY1anMk_U724azw7qXwnl-b-qtXScDStCnHriYzbsq-b4CWhrZKdg>
    <xmx:3CY1amPMsAUxIU_snoJmUmNKaGunsC0eKrQopG3nrmmt2bKxhbmp_Q>
    <xmx:3CY1ahTl1kqpqYKjP9x4NVf4_-qlI1Riends4LN_Bq4LBxlrwnZCCQ>
    <xmx:3CY1agCLvoSZIuL-zlC2OmFTtZk3lqrDPe9AVYEj93Hvox8wtcQwlw>
    <xmx:3CY1apdumClNH41MEuRU3CNNBpXzZuJRfoqPmmBBkMRYhqV-7bOxfjhA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 19 Jun 2026 13:24:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: domU crash when resuming from suspend - Xen 4.22
Message-ID: <ajUm2SQtMD6Y-K9S@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oCpGgJ5gAmJQ2dex"
Content-Disposition: inline
X-purgate-ID: tlsNG-ebf023/1781868254-475DC141-482526D4/0/0
X-purgate-type: clean
X-purgate-size: 5563


--oCpGgJ5gAmJQ2dex
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 13:24:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: domU crash when resuming from suspend - Xen 4.22

Hi,

I'm continuing testing 4.22 and found this:

When a domU is suspended (even without host suspend) it crashes on
resume with:

    [   24.374629] BUG: kernel NULL pointer dereference, address: 000000000=
0000020
    [   24.374647] #PF: supervisor read access in kernel mode
    [   24.374657] #PF: error_code(0x0000) - not-present page
    [   24.374668] PGD 0 P4D 0=20
    [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
    [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tainted 6.18=
=2E31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)=20
    [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus.constpr=
op.0+0x6f/0xb0
    [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
    [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 00=
 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 13=
 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
    [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
    [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0000000=
000000404
    [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0000000=
000770ef0
    [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc90=
0000abc8c
    [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fffffff=
f81835ac0
    [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000=
000000000
    [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) kn=
lGS:0000000000000000
    [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0000000=
000770ef0
    [   24.374873] PKRU: 00000000
    [   24.374877] Call Trace:
    [   24.374884]  <TASK>
    [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
    [   24.374900]  cpu_stopper_thread+0xa3/0x170
    [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
    [   24.374917]  smpboot_thread_fn+0xf3/0x220
    [   24.374925]  kthread+0xfc/0x240
    [   24.374933]  ? __pfx_kthread+0x10/0x10
    [   24.374940]  ? __pfx_kthread+0x10/0x10
    [   24.374949]  ret_from_fork+0x158/0x170
    [   24.374957]  ? __pfx_kthread+0x10/0x10
    [   24.374965]  ret_from_fork_asm+0x1a/0x30
    [   24.374973]  </TASK>
    [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd=
_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs binfmt_m=
isc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl_com=
mon intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_vsec poly=
val_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen_gnt=
alloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_blkf=
ront
    [   24.375064] CR2: 0000000000000020
    [   24.375071] ---[ end trace 0000000000000000 ]---
    [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
    [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 00 00=
 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 75 13=
 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
    [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
    [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0000000=
000000404
    [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0000000=
000770ef0
    [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09: ffffc90=
0000abc8c
    [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fffffff=
f81835ac0
    [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000=
000000000
    [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(0000) kn=
lGS:0000000000000000
    [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0000000=
000770ef0
    [   24.375241] PKRU: 00000000
    [   24.375247] Kernel panic - not syncing: Fatal exception
    [   25.417403] Shutting down cpus with NMI
    [   25.417447] Kernel Offset: disabled

There is no change on the Linux kernel side (neither dom0 nor domU), the
only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
broken on -rc1 too). This happens for both HVM and PVH domains. Haven't
tried PV domU (but dom0 survives host suspend).


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oCpGgJ5gAmJQ2dex
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo1JtkACgkQ24/THMrX
1ywKwAf9GTmqABohaFm34Iacc4tRoShEasxbdPtGG0GCNPpEej3y0X4ArQESx2ZG
BbBoBXEQzL2NLQzCfz61XemlkoIh5HLK2apW/8CO+eHrLuob36oZUnNPy9jrkvN7
BX+juQa1ibOhf1qmWbUQDcd4A5iJKcas/xTiQCJ94U9TO29Garox4kzGuIZU5VgR
L3UziZSD8ggrzQEzBQBnlaE/VdllS2Hw7wwULK4mVhbZU37WWaf1Hb90UC0dzvZq
FEBgGFP7QHKTtdjmgAraqe36JFbIz4Yz4SFJVV/1gcnrET1uYWjofDh8rsH5SIa9
xpSonNlPROOWad5DU4VTwbHKAqKiow==
=08qa
-----END PGP SIGNATURE-----

--oCpGgJ5gAmJQ2dex--

