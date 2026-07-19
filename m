Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88EC44512
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 19:41:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366023.1615984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlXNM-0001ye-Sr; Sun, 19 Jul 2026 19:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366023.1615984; Sun, 19 Jul 2026 19:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlXNM-0001yW-OP; Sun, 19 Jul 2026 19:40:36 +0000
Received: by outflank-mailman (input) for mailman id 1366023;
 Sun, 19 Jul 2026 19:40:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wlXNL-0001yQ-8r
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 19:40:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlXNJ-00EdOo-3O
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 21:40:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d27c8-5cb7-0a2a0a5109dd-0a2a4508d456-18
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 21:40:32 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d282f-f659-0a2a45080019-67a8ac99e09d-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 21:40:32 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0A3ED14000B8;
 Sun, 19 Jul 2026 15:40:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Sun, 19 Jul 2026 15:40:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jul 2026 15:40:30 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784490031;
	 x=1784576431; bh=3v2Ofi3nG1T6XBZcCr5iLVMgBDHkTJH5Pgc9MIBCFGA=; b=
	vR3eznJIUZeEhMJv2cZe4IGZXDJOvRFNsxoDtXChnwWrrIQ7sqoiTZZs7o/l8Buj
	1s4IFikxU9kDHkz5tHjrHX23Hmwfglu2mM9Cz7/iaxfSyrzhh+cUzqUggGyvpSqe
	Lz17TKhhCcH+q4XMnUwOSzQPBXq93LydhPxZasBc7bd5JBq8WBC8PLtV8YNit8k8
	HNtqpvf0DMSDR8WsXAoDhuY0F4DvoB4C2z4WszEvCGBXYPl7GUSinkvPtfX0KPN+
	CghAWGxNJE2Npg6YPohF87p8XcVKSW5+kESgbWOR7hvGGganjTJAgVbAVIVMvjyc
	Mm91lPRLNUL3QkGssmPlOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784490031; x=1784576431; bh=3v2Ofi3nG1T6XBZcCr5iLVMgBDHkTJH5Pgc
	9MIBCFGA=; b=U1CyFQ/pZD0X3LPF/R6hDgGJd1f7sn2k51Sh96mtmm+RH43Cndc
	xWN+BuVmvBhtaFCN1UWIHV6ufGK0NtTd1DDRPMoToUUDJKL1R8Dc9WhxRc35ojUr
	MjiALWBxyU7c1jKAhL/REXplwLMEi3RxWPzFyC69FJTiRMveWvNATxKcckowqSYG
	1SHVkannRL9U3vRryR2lf8jiKAYb+Hq2iFYJcwjVyIHM7c76wNzWib0z7Zpjr7Zz
	i9li6fURu67H5ey9Lh9Xuq8cMY/xGYR0oGBi3zcIUNqAPnIYp54PS3hUa7rxjQ5b
	AGD11nt4N/O2rXIJWIx4+K5VdCt+1oYqf4Q==
X-ME-Sender: <xms:Lihdau8uWwR7LzJxNafdP8OBvk69RKP6UUxbY21UywJ1t5tV-rrDOg>
    <xme:LihdamKtI__OzCzPHkoeHFxVwEcA4g8apVolZyx9zAeqM1a3pTzJfJVKNYFpiK2db
    SrMJUI5vyTQKV_hX9Qhw_2wAJtB_A-Tef5B8B6sGnJowYttn8M>
X-ME-Received: <xmr:LihdahbnzLaI3rdNtn5nhGFAI8oJOYn02XAMafznfGv5fyTnaMrgMUigUZOmnPcqOtxaxvsCQ-7HtP8UI14ltywKG46nwUddWu8>
X-ME-Proxy-Cause: dmFkZTG2Zdp225JzChDPxs2dHFgvT8zyZ1YjwiKkGm4KUwoxHteakC8IZbGJgdCBAdXoWc
    fGNQdBMT/Cf6TSdxuphBTo7qP00Mvn2M2BgQOEEjf1QyQ6OFF5WL37VkUH2QXgEQtl8cXj
    YUPPDFNg9VvvnC1rWq7Out/d9W/FlF0NGYTR+PVR4mymkxRSEc1AaCqEXQIQp9e/M3G9fF
    Sf66VuqbNXy/AFaFixDq1O5EAFz//tllzjD5FHep3DTthk+iNmUJ648PdeBvIAClx+DFQg
    GjrzHS0X5Z8ot4cIEk3ADJVNk6qRrpsTuRe8XzwN/rHTWXxURRUVC465XMq15MoNR2VKoC
    vRbBt2PPfo2fE1T9ruGEjPUQ1fNmvn8AQP/+tA44l1synBx2m5P3ZKKlNnLg35rVdYGimy
    0aZGqL5XGZAqIdXsqs9ksJ5e7xPpXiIQ3+31alkphNDfgiopJHJ0nrEzrMcDBDcC2KOBp1
    J6C/VooLnmHs5NeHEtai0GlPilHRMRCR4x508cHHpJvspF+tvRg3vkEFtHzynU4RKVETyR
    +MsiqaiCHFN0KZvde+yXl6gdnJAjavZP/fUSNK9DTJuY0xp2ycYO2xD8wyukrcFiDlDTGm
    rpoNshfKBWZ23r2TOAaM/68/i4U020f32eWq5tF3FbPJTK28mTvSiQ65IFdQ
X-ME-Proxy: <xmx:LihdagKs7vGkpIM4quHlrRI4XhhpOsoZhw6b9WlPtr4QfH0Fs0jfQA>
    <xmx:LihdanCEYil2Wq6jIf69M5d5TfEIARtLQFajBCsDSH0F9EwxXEzyIQ>
    <xmx:LihdatqEwGPNZqJdUqv_hZlEYxztAyJjXLQ_0G8LtsGA08QDf50Bvw>
    <xmx:Lihdaqh2H2N6-7Ds3--LX7vRcggDjax7xwMFKZMrEBsCDfzJfl72IQ>
    <xmx:Lyhdat2qPUQ2Rwm7gX8832GwUBz7oaXT02jvpHCjhvaVyDSa5Sg4BOI6>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 19 Jul 2026 21:40:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
Message-ID: <al0oK0ABYviuWU5P@mail-itl>
References: <ajUm2SQtMD6Y-K9S@mail-itl>
 <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
 <aluHsZA0hK8FcKnM@mail-itl>
 <alwvn_K_miQgiiIf@mail-itl>
 <CAHt6W4cyDAsTyOcPLcR2STQyhpkNe5W+to3JRn0yWnm3J9VF+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c8yRdO14Dzq9+i3e"
Content-Disposition: inline
In-Reply-To: <CAHt6W4cyDAsTyOcPLcR2STQyhpkNe5W+to3JRn0yWnm3J9VF+w@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1784490032-D795A87B-738D540C/0/0
X-purgate-type: clean
X-purgate-size: 10781

--c8yRdO14Dzq9+i3e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 21:40:27 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22

On Sun, Jul 19, 2026 at 08:31:28AM +0100, Frediano Ziglio wrote:
> On Sun, 19 Jul 2026 at 03:00, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Sat, Jul 18, 2026 at 04:03:29PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> > > > On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > I'm continuing testing 4.22 and found this:
> > > > > >
> > > > > > When a domU is suspended (even without host suspend) it crashes=
 on
> > > > > > resume with:
> > > > > >
> > > > > >     [   24.374629] BUG: kernel NULL pointer dereference, addres=
s: 0000000000000020
> > > > > >     [   24.374647] #PF: supervisor read access in kernel mode
> > > > > >     [   24.374657] #PF: error_code(0x0000) - not-present page
> > > > > >     [   24.374668] PGD 0 P4D 0
> > > > > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > > > > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not =
tainted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > > > > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_=
cpus.constprop.0+0x6f/0xb0
> > > > > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04=
 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0=
 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 =
83 fd
> > > > > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > > > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 =
RCX: 0000000000000404
> > > > > >     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff =
RDI: 0000000000770ef0
> > > > > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 =
R09: ffffc900000abc8c
> > > > > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 =
R12: ffffffff81835ac0
> > > > > >     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 =
R15: 0000000000000000
> > > > > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369=
000(0000) knlGS:0000000000000000
> > > > > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > > > > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 =
CR4: 0000000000770ef0
> > > > > >     [   24.374873] PKRU: 00000000
> > > > > >     [   24.374877] Call Trace:
> > > > > >     [   24.374884]  <TASK>
> > > > > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > > > > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > > > > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > > > > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > > > > >     [   24.374925]  kthread+0xfc/0x240
> > > > > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > > > > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > > > > >     [   24.374949]  ret_from_fork+0x158/0x170
> > > > > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > > > > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > > > > >     [   24.374973]  </TASK>
> > > > > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer=
 snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xe=
nfs binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr in=
tel_rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry int=
el_vsec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gn=
tdev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables over=
lay xen_blkfront
> > > > > >     [   24.375064] CR2: 0000000000000020
> > > > > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > > > > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04=
 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0=
 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 =
83 fd
> > > > > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > > > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 =
RCX: 0000000000000404
> > > > > >     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff =
RDI: 0000000000770ef0
> > > > > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 =
R09: ffffc900000abc8c
> > > > > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 =
R12: ffffffff81835ac0
> > > > > >     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 =
R15: 0000000000000000
> > > > > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369=
000(0000) knlGS:0000000000000000
> > > > > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > > > > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 =
CR4: 0000000000770ef0
> > > > > >     [   24.375241] PKRU: 00000000
> > > > > >     [   24.375247] Kernel panic - not syncing: Fatal exception
> > > > > >     [   25.417403] Shutting down cpus with NMI
> > > > > >     [   25.417447] Kernel Offset: disabled
> > > > > >
> > > > > > There is no change on the Linux kernel side (neither dom0 nor d=
omU), the
> > > > > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be alr=
eady
> > > > > > broken on -rc1 too). This happens for both HVM and PVH domains.=
 Haven't
> > > > > > tried PV domU (but dom0 survives host suspend).
> > > > >
> > > > > Any ideas?
> > > > >
> > > >
> > > > Hi,
> > > >    not many ideas but while testing my libxenguest changes I found
> > > > similar failures using xl create/save/restore. But I was testing mo=
re
> > > > PV guests.
> > > > Does 4.21 work ?
> > >
> > > It seems 4.21 also has this issue:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414211523
> > > But 4.20 is okay:
> > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414227095
> > >
> > > I guess I can bisect it further.
> >
> > So, bisect says the first bad commit is:
> >
> >     commit 9f892f84c27970840d255aef7e2851b762967de7
> >     Author: Andrew Cooper <andrew.cooper3@citrix.com>
> >     Date:   Mon Dec 30 11:49:14 2024 +0000
> >
> >         x86/domctl: Stop using XLAT_cpu_user_regs()
> >
> > My test isn't 100% reliable, but I retested parent of this commit a
> > couple of times and it was good every time.
> >
> > I wanted to test reverting it on top of 4.21, but there is a lot of
> > FRED-related work on top that makes such revert quite hard, to say the
> > least...
> >
>=20
> The generated XLAT_cpu_user_regs was
>=20
> #define XLAT_cpu_user_regs(_d_, _s_) do { \
>     (_d_)->__DECL_REG_LO8(b) =3D (_s_)->__DECL_REG_LO8(b); \
>     (_d_)->__DECL_REG_LO8(c) =3D (_s_)->__DECL_REG_LO8(c); \
>     (_d_)->__DECL_REG_LO8(d) =3D (_s_)->__DECL_REG_LO8(d); \
>     (_d_)->__DECL_REG_LO16(si) =3D (_s_)->__DECL_REG_LO16(si); \
>     (_d_)->__DECL_REG_LO16(di) =3D (_s_)->__DECL_REG_LO16(di); \
>     (_d_)->__DECL_REG_LO16(bp) =3D (_s_)->__DECL_REG_LO16(bp); \
>     (_d_)->__DECL_REG_LO8(a) =3D (_s_)->__DECL_REG_LO8(a); \
>     (_d_)->error_code =3D (_s_)->error_code; \
>     (_d_)->entry_vector =3D (_s_)->entry_vector; \
>     (_d_)->__DECL_REG_LO16(ip) =3D (_s_)->__DECL_REG_LO16(ip); \
>     (_d_)->cs =3D (_s_)->cs; \
>     (_d_)->saved_upcall_mask =3D (_s_)->saved_upcall_mask; \
>     (_d_)->__DECL_REG_LO16(flags) =3D (_s_)->__DECL_REG_LO16(flags); \
>     (_d_)->__DECL_REG_LO16(sp) =3D (_s_)->__DECL_REG_LO16(sp); \
>     (_d_)->ss =3D (_s_)->ss; \
>     (_d_)->es =3D (_s_)->es; \
>     (_d_)->ds =3D (_s_)->ds; \
>     (_d_)->fs =3D (_s_)->fs; \
>     (_d_)->gs =3D (_s_)->gs; \
> } while (0)
>=20
> registers are copied, but additional fields (error_code, entry_vector,
> saved_upcall_mask).
> Maybe you could try to copy them again.
> Also, just to be on the safe side, you could memset the structure
> where "Backing memory is pre-zeroed" comments are.

This does not help :(

Specifically:
1. Applied on top of staging-4.21:
  - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/188=
ca612c51a57ef54b917c833eaeb59666994c9
  - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/pipe=
lines/2688813821
2. Applied directly on top of 9f892f84c27970840d255aef7e2851b762967de7:
  - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/dd3=
dee35fc4fcd6ba284f3f5fa78b333c472888e
  - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/pipe=
lines/2688832398

Yet, parent of 9f892f84c27970840d255aef7e2851b762967de7 still passes:
 - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/dbcb=
bed4e9dc25faa211d359c2f04a9c70f087c9
 - test (pass): https://gitlab.com/xen-project/people/marmarek/xen/-/pipeli=
nes/2688835512

Hint about reading the above: I use two branches, one for building
(branch "test") and one for running the test (branch "automation-uki-grub-o=
nly"),
which takes build artifacts from the build branch. I do that to not
rebase test scripts. It's a bit opaque, but the console log of the test
contains "Latest ChangeSet" fields telling what actually was tested.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--c8yRdO14Dzq9+i3e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpdKCwACgkQ24/THMrX
1yx07wf9G7FZNEGPvp8D3nwUI0WiimXJjaxoVGCy8LmrCVPqwFcLGpEI8msxp4kG
+PqHKwKj3OyLfgd18krMc96H9Wos/IGpYY3OwRHir4F1WAzf6a1/quoxqR92lljL
/w+C4xwrLcpubawUaGWRL77lnWVsr8g5k0Dw+k+C/D/VYG6MOLaVaENL3GtuHJ8c
Qm1pvtC6jkjGhepA/QoFkzHFMx+6mQd8zg+NuOoeYndlXGHagsLeNL7XLiVx/f4W
Tk6WTEqNLlV7NmXa5WFpAE9IyBbcsPZRi921odFvVUM4/3FLE5HL+ixWmFm5Nv4N
SovxXahsIxoe5VswpwD9aC8k1pvlLQ==
=BA8R
-----END PGP SIGNATURE-----

--c8yRdO14Dzq9+i3e--

