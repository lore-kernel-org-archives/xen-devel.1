Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E4EC4451B
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 14:04:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365564.1615903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl5dg-0004uD-RN; Sat, 18 Jul 2026 14:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365564.1615903; Sat, 18 Jul 2026 14:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl5dg-0004u5-M5; Sat, 18 Jul 2026 14:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1365564;
 Sat, 18 Jul 2026 14:03:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wl5de-0004tg-VG
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 14:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wl5dd-00BMRH-QI
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 16:03:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5b87a7-bab6-0a2a0a5309dd-0a2a45079f5c-10
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 16:03:33 +0200
Received: from [103.168.172.159] (helo=fhigh-a8-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5b87b4-b4ea-0a2a45070019-67a8ac9fd4e3-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 16:03:32 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A17E0140011B;
 Sat, 18 Jul 2026 10:03:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sat, 18 Jul 2026 10:03:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 10:03:30 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784383411;
	 x=1784469811; bh=dUZjqeNV9O8XFmgIDunVFPeL7mArc/vhn5dDixvyo/M=; b=
	pyiMl2faJkWw7yCucQdYhreR8JxmS1qV6TLyyfMgDrDLGeeGMl55XttRE1pCDesG
	lvuHj8ErjmDz1xN79hvYxLSUsmznovFBgf2f+BiIlbhVeiu2QScaiZk0+2QcZKDv
	EPztC4lpcwSJr9GWMQ3pDV78D/fIsDQ4v2Lz4WTFXT9ELyHbvejN62vrc52nGtac
	Q4X9iG2uMfRTYxJJRY5e2cdnWBdxY31pZpfTpbWUBFHYoB1s4Qpnp2Zom0ATTk0K
	gBwLVBYBNPH4lfmPhpSAn/nJjDf+8am0kXuhMtqFDuUvzWAP4IVkSEzgUoqTmHD6
	zHJgUkiUzxHzRmaiA9/OkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784383411; x=1784469811; bh=dUZjqeNV9O8XFmgIDunVFPeL7mArc/vhn5d
	Dixvyo/M=; b=CHSiAmcfPJoMPYpDMkVzubbDqKejodk4B7yTuR4Nuw/yd1Tr5/e
	p+H+9wxt2/msp47RgSoT6XsbOQFNR8lkPfS3OSaVtOwkKgdJANymBzAlBybL9Gc/
	+cL0gCg/POT0g892o0mKF7rsNGHm18SGUCKlJaQfA715sXHfDqTywh/RHrpnSZaq
	qtxLl8gZuY9kAlvl+ONWGyIuF3kR9IbcV/SZA4qqC6gYT9B4vdPeb9zT8Y2X4YsK
	KrulPWB3ucB+EzlMfGql7Pk+5v0eubaYCA63WqSU5jyaeNPZBmD+BD+2BiaAAJXZ
	wfcF+lfSuA37OTKQyVue0Wxk9rl+cpRMpmQ==
X-ME-Sender: <xms:s4dbasWct-IJE399b-HaXGVr0fOu3sPhIecvsiXwyHHQ-InnsmkT1Q>
    <xme:s4dbamldNrNoCTkoweLm3UkSLV_FbLq3XjFGHSfvFDci80KuE-HCOornBlzCBryOn
    r0yjG4nRV9jcbcauIsa8ibHJT53vaESPblQqblJgN8CD3cC4A>
X-ME-Received: <xmr:s4dbauARJ4UTPnOIcu8WtFIWPWwLESw46gEVo16oj_hHxM9QdeQ3S-nxJ4fOzEH27rMPnZzkbyosWbdkskZvAjyuGOfJ9-QuJ-M>
X-ME-Proxy-Cause: dmFkZTGNMs+atV6X6essUDq39J0quKdiKZwFDBMdiN5uczZVBJG43rtCngECVrGea8jAU6
    wRygrXodnSrn/OI3eqOtScFtiKexfforiWmyDr3e1sFWcJR8/kh25OHByQzWxKKAcZNkgA
    TnnwMQyzyO2HOWHczzi1q0xXPql5ImmTScZDpstcudgYP/hGma4+2gkY88oKhrLX/OnjQv
    078dF7AHtIuwdqrIPsDhkekj6n9/aB3xHZFhIPnZO0qC2n5A5mpP4nfwL+ISNfGoo/Au9V
    JYBLMkRwpUIxtny1uHyW9CMZWE5/U4S1Zr0m1JtLAIEWeWTMx6m4hkjmjN7n7Jkl+tqbNa
    P6E1VdhHQ3ZW7T65iNJaD2j+I414Fhymme2DwaNLZcCY7nid+fk0PNsrBlYQAO1/l6SA6m
    n/ro1y8nz1hJQpSPacDj86m4HXqtJcu3wSswgU0adEL618vkh2TlE7MeV8UmObBwzs17SX
    K8t2bSfAlg/xg6KkRqFDlKu+tlI2tc9K9UKxXzEtVkEmF1JZ/BdYxjo7wNab89EZosLZT+
    GWU4QL4VcYaREZDiGrN60akqXlSkj6J4YxsgYyJi5mk0NIFie/cRLjyKQdOTZh0L+P5pIJ
    non6hDotPl8mnPnj8ug48VsB08fJY+MyF63YWELkWNssxWS2BgwCkRXBchOw
X-ME-Proxy: <xmx:s4dbamclDK4HY-tSffcGE604Mabh0ESpeAfE4B4t2EZP8tG7P24ilw>
    <xmx:s4dbapL0gLvZcyqXb_wEZ6pkH45Oa8f8hOafhF4F2fdJnbrrPmxMaw>
    <xmx:s4dbapc502Fjb61-CTDAbyJtGqGefkKc42y378FnZTqgq-enPjvSMw>
    <xmx:s4dbag3idVFNHqBDuDGf9DHgSKmy6OJq0_NbLW-NRGxlA91TNCp0_A>
    <xmx:s4dbavTY7oVdMsM9OyOs3RQoicF8MMX6ycc02TwakoFAZA0Nt_M7rkr3>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 18 Jul 2026 16:03:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
Message-ID: <aluHsZA0hK8FcKnM@mail-itl>
References: <ajUm2SQtMD6Y-K9S@mail-itl>
 <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="igHU3V1eAOL0i68e"
Content-Disposition: inline
In-Reply-To: <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
X-purgate-ID: tlsNG-ef75cf/1784383413-3C610AE4-404B737C/0/0
X-purgate-type: clean
X-purgate-size: 6718

--igHU3V1eAOL0i68e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 16:03:29 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: domU crash when resuming from suspend - Xen 4.22

On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Hi,
> > >
> > > I'm continuing testing 4.22 and found this:
> > >
> > > When a domU is suspended (even without host suspend) it crashes on
> > > resume with:
> > >
> > >     [   24.374629] BUG: kernel NULL pointer dereference, address: 000=
0000000000020
> > >     [   24.374647] #PF: supervisor read access in kernel mode
> > >     [   24.374657] #PF: error_code(0x0000) - not-present page
> > >     [   24.374668] PGD 0 P4D 0
> > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tainte=
d 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus.c=
onstprop.0+0x6f/0xb0
> > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00=
 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b=
 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0=
000000000000404
> > >     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0=
000000000770ef0
> > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09: f=
fffc900000abc8c
> > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: f=
fffffff81835ac0
> > >     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15: 0=
000000000000000
> > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(00=
00) knlGS:0000000000000000
> > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0=
000000000770ef0
> > >     [   24.374873] PKRU: 00000000
> > >     [   24.374877] Call Trace:
> > >     [   24.374884]  <TASK>
> > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > >     [   24.374925]  kthread+0xfc/0x240
> > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > >     [   24.374949]  ret_from_fork+0x158/0x170
> > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > >     [   24.374973]  </TASK>
> > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd_s=
eq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs bi=
nfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct n=
f_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_ra=
pl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_vse=
c polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev x=
en_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xe=
n_blkfront
> > >     [   24.375064] CR2: 0000000000000020
> > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00=
 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b=
 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 0=
000000000000404
> > >     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 0=
000000000770ef0
> > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09: f=
fffc900000abc8c
> > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: f=
fffffff81835ac0
> > >     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15: 0=
000000000000000
> > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(00=
00) knlGS:0000000000000000
> > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 0=
000000000770ef0
> > >     [   24.375241] PKRU: 00000000
> > >     [   24.375247] Kernel panic - not syncing: Fatal exception
> > >     [   25.417403] Shutting down cpus with NMI
> > >     [   25.417447] Kernel Offset: disabled
> > >
> > > There is no change on the Linux kernel side (neither dom0 nor domU), =
the
> > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
> > > broken on -rc1 too). This happens for both HVM and PVH domains. Haven=
't
> > > tried PV domU (but dom0 survives host suspend).
> >
> > Any ideas?
> >
>=20
> Hi,
>    not many ideas but while testing my libxenguest changes I found
> similar failures using xl create/save/restore. But I was testing more
> PV guests.
> Does 4.21 work ?

It seems 4.21 also has this issue:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414211523
But 4.20 is okay:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414227095

I guess I can bisect it further.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--igHU3V1eAOL0i68e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpbh7EACgkQ24/THMrX
1yz3ZAf9HiZ0RQJ8Hx2w+i4nGwwRjErh/GdZAHcQgeUdSKc6VaRu72iquajZuKy1
3GblAgiMCnKQ/biFV+EUCQnnRVKXrLr1ydeC/hKLe7n9xm7XzasUky1Ul05xLfn4
nvB2y+gAVkGBuf27N5UIxjkgt88fF9lxsMeZxnrEPRpFBiOZOpueUTT6/7Xu2vAU
gzANRKJ8AWdYasFlqQwHC/8Na74FI7a7r34nwUYvRc5pzqIS0S7qzWoOiFvz+kIp
VLsjdHMQwHiThkPNR9mGo0fmPvM6NPgPFgm8QNn5+IonduUnt2X2ZJgFdMDYE/ty
kbn1t0pmRuVUCbFmrNnmKsgiIW1i7g==
=o/3J
-----END PGP SIGNATURE-----

--igHU3V1eAOL0i68e--

