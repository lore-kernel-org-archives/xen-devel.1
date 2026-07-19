Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA78FC4451B
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 22:51:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366072.1616001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlaLb-0007aK-Qg; Sun, 19 Jul 2026 22:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366072.1616001; Sun, 19 Jul 2026 22:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlaLb-0007aD-Ni; Sun, 19 Jul 2026 22:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1366072;
 Sun, 19 Jul 2026 22:50:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wlaLa-0007a7-GM
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 22:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlaLZ-00Gokj-Cc
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 00:50:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d5499-e002-0a2a0a5209dd-0a2a4508924e-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 00:50:57 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d54cf-f659-0a2a45080019-67a8ac95bd83-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 00:50:56 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 758C1EC00FA;
 Sun, 19 Jul 2026 18:50:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 19 Jul 2026 18:50:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jul 2026 18:50:54 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784501455;
	 x=1784587855; bh=+xVltXH47ZnQRv/KhBcdReuDxNKytw+IOjmdi7KdfXg=; b=
	NmlOqLazf5CHz+krwHqkK16bxVwFRqgRFaudixfeXmuyfi0liPhVSc7EjaBiz7Ow
	nEa3D2gq8CtJw857baaY2OsAqEDMzkkPKDP3xg9PhsJOChSu9hIDbaXU6+xn8QwP
	UD9T0/NOH6U1AmrAr+3JQuUBDa/+IwjB+b5B05Rbx8iFKhExlwY8LJFylZsidxCT
	mF2kYx5ckYWd4nDbCMIq9s7+koXqjsO6JsBQ9vZ0imCdYPbW60vbfRY8sZ+11YMF
	XaQH+zQqbO1mLXHxY9XzH0hl6iKa3h4iKXYu6fuAG1Mh0PQ3BA+/hDOW6fveWDmf
	mAUv3czIMI0jgQR2NlDxdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784501455; x=1784587855; bh=+xVltXH47ZnQRv/KhBcdReuDxNKytw+IOjm
	di7KdfXg=; b=OJFSYzVRL+sHD0XMUJVL9C4hwPLvFVbp5rpyYisiHKTIuB2+AWt
	iK7/QURaIUXM/g/JBAzElGzh+UR3ecpIY3mgm8LeW209m85dt+x8FLzXtu/mwvqf
	cfIRKkirjB0hlT8ImKDDwdIXWJmlIGHmMizaYE2nZaRxwIuXT7st+nJxE2ksDLDQ
	9/aDmdMaTEQdqW5xyHYLwAJMghvPPrraG3QD0QORc4HQyzRgOtCI9fHN+yc7Mv0/
	KTJpIimaDSblMozVbe4e5ON3+zB+z3LGa6/KMaAiAwLDCxs9ZS3yVCnuWTt0Zc9J
	83Jl3R5tVEHw17cwtcZAz0D7GXa5vyPKVAA==
X-ME-Sender: <xms:z1RdaiGPjPAQ_Ze8kWfOynQbgm8RRYXAAo6pxL0jj0mFrKXL8rUBQQ>
    <xme:z1RdaqyOrvZj8lkAwZlmUJFGKu_Kjad-FRtSUTCrbxRQBSTKMg8j45xg8PRiZXZB0
    Xh4fhgf2J1qp0XOu4rblSgO_rBQkRTlK4rCozgzYs6Wg0NzcQ>
X-ME-Received: <xmr:z1RdaphPj79pCOis1nbFQDLIU3XbBEFeuS5Q-lgDWzDFOVPKKoFAkZR0vxYJ52JyAdxlMGLQ_99i8jMT-HBoa6KxMvimwzpbKLw>
X-ME-Proxy-Cause: dmFkZTFugC/EomZYERVN9Bge0AzeAET4x6GNyZspB2Km7d7Ao2JQPRLXHuH1mgjrwy5CL6
    Qi28RlmEOF8hpfcko0iggXworNIat5yWZyNTPeMeyaNAEYhBIxykIAXnQTx2tbvREkFrUr
    /eolne0bVqXW+f2lMX4G+B8LDltKqY6T1mEAjfKxHrcTUDGJcCpMpNCng59/bR5CKo+oUy
    ty4gXFDmYDCFL0tLiv64X8AmXRVIuaqWOgq6kJ2cvz7rsIV6IBrND3sBEDFpVjtvEReB+e
    7JarJa/rpL5wpZQpplNLTvbgiyV+MFCR0Xxs9jGOEBqjjqdAqfMeDQ3GqA2GjnSqqxvyTb
    DTPDk0Z3G250E/z4NERse4fM+eMk7kMGIMEYOEQ7fFw6wwmg5RfJll5fiCIn26wHOmGQiN
    BLyQ3GVO8tgh4F9cGcP6jG5iaWRzunitcQKYAHf4AfSkHTVRco1O9mBrj7qzO3feS9D62b
    ABBzZ6FARLIW1VYko74I8op1SPYEFB4hKTaoIn/2mHp1F+cSX/023rClDn7a5T7/4UvZiH
    S2NSOMLbJvCRWOUIyRSyr2XTpjpJ3iPkvBGvdD20y7R47eJnB4h9542HqlmhaHGxtkvMX5
    s3N11uJV0ZUK8dVcYT1gLpBnYC0exnvmAKJHIK2Azlu2f4VYOLWiRTyd3MAA
X-ME-Proxy: <xmx:z1Rdalz3cWpLc8RBEiIMAE7181n7dCPzxtynW34604TDnM1-GWFREA>
    <xmx:z1RdasJ19PHVe1Z8L0uaFBbLvlW8qeQyRr4eXthMta0G9DGpnP2pbg>
    <xmx:z1RdasTwS3yI09Ka_kg4iruUkYJgw8GT0zBZ-_e03NfGu-4F-zlfdA>
    <xmx:z1RdakqlKIH3BjFo53d5KnhXMxUVBJpnbVh1f2KsUi8Trd1-NRRaYw>
    <xmx:z1Rdagcko9abkbeUDH3apw5y3ElyAt_0cnb-75mt9bukBi4w82MHqyQQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 20 Jul 2026 00:50:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
Message-ID: <al1UzGM4Jd-HALsm@mail-itl>
References: <ajUm2SQtMD6Y-K9S@mail-itl>
 <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
 <aluHsZA0hK8FcKnM@mail-itl>
 <alwvn_K_miQgiiIf@mail-itl>
 <CAHt6W4cyDAsTyOcPLcR2STQyhpkNe5W+to3JRn0yWnm3J9VF+w@mail.gmail.com>
 <al0oK0ABYviuWU5P@mail-itl>
 <CAHt6W4fWo-WXDieSM_+y1DgpjxVHTL=2KrX=b_iBhqz25jjs6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ARB6yuVHPZS+oxpN"
Content-Disposition: inline
In-Reply-To: <CAHt6W4fWo-WXDieSM_+y1DgpjxVHTL=2KrX=b_iBhqz25jjs6g@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1784501457-CD54C87B-8BFF743A/0/0
X-purgate-type: clean
X-purgate-size: 14110

--ARB6yuVHPZS+oxpN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 00:50:52 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22

On Sun, Jul 19, 2026 at 10:04:42PM +0100, Frediano Ziglio wrote:
> On Sun, 19 Jul 2026 at 20:40, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Sun, Jul 19, 2026 at 08:31:28AM +0100, Frediano Ziglio wrote:
> > > On Sun, 19 Jul 2026 at 03:00, Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Sat, Jul 18, 2026 at 04:03:29PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> > > > > > On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> > > > > > <marmarek@invisiblethingslab.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-=
G=C3=B3recki wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I'm continuing testing 4.22 and found this:
> > > > > > > >
> > > > > > > > When a domU is suspended (even without host suspend) it cra=
shes on
> > > > > > > > resume with:
> > > > > > > >
> > > > > > > >     [   24.374629] BUG: kernel NULL pointer dereference, ad=
dress: 0000000000000020
> > > > > > > >     [   24.374647] #PF: supervisor read access in kernel mo=
de
> > > > > > > >     [   24.374657] #PF: error_code(0x0000) - not-present pa=
ge
> > > > > > > >     [   24.374668] PGD 0 P4D 0
> > > > > > > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > > > > > > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 =
Not tainted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > > > > > > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __s=
top_cpus.constprop.0+0x6f/0xb0
> > > > > > > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > > > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 2=
4 04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 4=
9 f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20=
 41 83 fd
> > > > > > > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010=
046
> > > > > > > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13=
de4 RCX: 0000000000000404
> > > > > > > >     [   24.374790] RDX: 0000000000000040 RSI: fffffffffffff=
fff RDI: 0000000000770ef0
> > > > > > > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000ab=
c80 R09: ffffc900000abc8c
> > > > > > > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81c=
dc0 R12: ffffffff81835ac0
> > > > > > > >     [   24.374825] R13: 0000000000000000 R14: 0000000000000=
000 R15: 0000000000000000
> > > > > > > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809=
b369000(0000) knlGS:0000000000000000
> > > > > > > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> > > > > > > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2=
002 CR4: 0000000000770ef0
> > > > > > > >     [   24.374873] PKRU: 00000000
> > > > > > > >     [   24.374877] Call Trace:
> > > > > > > >     [   24.374884]  <TASK>
> > > > > > > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > > > > > > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > > > > > > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > > > > > > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > > > > > > >     [   24.374925]  kthread+0xfc/0x240
> > > > > > > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > > > > > > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > > > > > > >     [   24.374949]  ret_from_fork+0x158/0x170
> > > > > > > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > > > > > > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > > > > > > >     [   24.374973]  </TASK>
> > > > > > > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrt=
imer snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fa=
t xenfs binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_rejec=
t nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_ms=
r intel_rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry=
 intel_vsec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xe=
n_gntdev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables =
overlay xen_blkfront
> > > > > > > >     [   24.375064] CR2: 0000000000000020
> > > > > > > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > > > > > > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > > > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 2=
4 04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 4=
9 f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20=
 41 83 fd
> > > > > > > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010=
046
> > > > > > > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13=
de4 RCX: 0000000000000404
> > > > > > > >     [   24.375142] RDX: 0000000000000040 RSI: fffffffffffff=
fff RDI: 0000000000770ef0
> > > > > > > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000ab=
c80 R09: ffffc900000abc8c
> > > > > > > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81c=
dc0 R12: ffffffff81835ac0
> > > > > > > >     [   24.375184] R13: 0000000000000000 R14: 0000000000000=
000 R15: 0000000000000000
> > > > > > > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809=
b369000(0000) knlGS:0000000000000000
> > > > > > > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> > > > > > > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2=
002 CR4: 0000000000770ef0
> > > > > > > >     [   24.375241] PKRU: 00000000
> > > > > > > >     [   24.375247] Kernel panic - not syncing: Fatal except=
ion
> > > > > > > >     [   25.417403] Shutting down cpus with NMI
> > > > > > > >     [   25.417447] Kernel Offset: disabled
> > > > > > > >
> > > > > > > > There is no change on the Linux kernel side (neither dom0 n=
or domU), the
> > > > > > > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be=
 already
> > > > > > > > broken on -rc1 too). This happens for both HVM and PVH doma=
ins. Haven't
> > > > > > > > tried PV domU (but dom0 survives host suspend).
> > > > > > >
> > > > > > > Any ideas?
> > > > > > >
> > > > > >
> > > > > > Hi,
> > > > > >    not many ideas but while testing my libxenguest changes I fo=
und
> > > > > > similar failures using xl create/save/restore. But I was testin=
g more
> > > > > > PV guests.
> > > > > > Does 4.21 work ?
> > > > >
> > > > > It seems 4.21 also has this issue:
> > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/1541421=
1523
> > > > > But 4.20 is okay:
> > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/1541422=
7095
> > > > >
> > > > > I guess I can bisect it further.
> > > >
> > > > So, bisect says the first bad commit is:
> > > >
> > > >     commit 9f892f84c27970840d255aef7e2851b762967de7
> > > >     Author: Andrew Cooper <andrew.cooper3@citrix.com>
> > > >     Date:   Mon Dec 30 11:49:14 2024 +0000
> > > >
> > > >         x86/domctl: Stop using XLAT_cpu_user_regs()
> > > >
> > > > My test isn't 100% reliable, but I retested parent of this commit a
> > > > couple of times and it was good every time.
> > > >
> > > > I wanted to test reverting it on top of 4.21, but there is a lot of
> > > > FRED-related work on top that makes such revert quite hard, to say =
the
> > > > least...
> > > >
> > >
> > > The generated XLAT_cpu_user_regs was
> > >
> > > #define XLAT_cpu_user_regs(_d_, _s_) do { \
> > >     (_d_)->__DECL_REG_LO8(b) =3D (_s_)->__DECL_REG_LO8(b); \
> > >     (_d_)->__DECL_REG_LO8(c) =3D (_s_)->__DECL_REG_LO8(c); \
> > >     (_d_)->__DECL_REG_LO8(d) =3D (_s_)->__DECL_REG_LO8(d); \
> > >     (_d_)->__DECL_REG_LO16(si) =3D (_s_)->__DECL_REG_LO16(si); \
> > >     (_d_)->__DECL_REG_LO16(di) =3D (_s_)->__DECL_REG_LO16(di); \
> > >     (_d_)->__DECL_REG_LO16(bp) =3D (_s_)->__DECL_REG_LO16(bp); \
> > >     (_d_)->__DECL_REG_LO8(a) =3D (_s_)->__DECL_REG_LO8(a); \
> > >     (_d_)->error_code =3D (_s_)->error_code; \
> > >     (_d_)->entry_vector =3D (_s_)->entry_vector; \
> > >     (_d_)->__DECL_REG_LO16(ip) =3D (_s_)->__DECL_REG_LO16(ip); \
> > >     (_d_)->cs =3D (_s_)->cs; \
> > >     (_d_)->saved_upcall_mask =3D (_s_)->saved_upcall_mask; \
> > >     (_d_)->__DECL_REG_LO16(flags) =3D (_s_)->__DECL_REG_LO16(flags); \
> > >     (_d_)->__DECL_REG_LO16(sp) =3D (_s_)->__DECL_REG_LO16(sp); \
> > >     (_d_)->ss =3D (_s_)->ss; \
> > >     (_d_)->es =3D (_s_)->es; \
> > >     (_d_)->ds =3D (_s_)->ds; \
> > >     (_d_)->fs =3D (_s_)->fs; \
> > >     (_d_)->gs =3D (_s_)->gs; \
> > > } while (0)
> > >
> > > registers are copied, but additional fields (error_code, entry_vector,
> > > saved_upcall_mask).
> > > Maybe you could try to copy them again.
> > > Also, just to be on the safe side, you could memset the structure
> > > where "Backing memory is pre-zeroed" comments are.
> >
> > This does not help :(
> >
> > Specifically:
> > 1. Applied on top of staging-4.21:
> >   - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits=
/188ca612c51a57ef54b917c833eaeb59666994c9
> >   - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/=
pipelines/2688813821
> > 2. Applied directly on top of 9f892f84c27970840d255aef7e2851b762967de7:
> >   - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits=
/dd3dee35fc4fcd6ba284f3f5fa78b333c472888e
> >   - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/=
pipelines/2688832398
> >
> > Yet, parent of 9f892f84c27970840d255aef7e2851b762967de7 still passes:
> >  - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/=
dbcbbed4e9dc25faa211d359c2f04a9c70f087c9
> >  - test (pass): https://gitlab.com/xen-project/people/marmarek/xen/-/pi=
pelines/2688835512
> >
> > Hint about reading the above: I use two branches, one for building
> > (branch "test") and one for running the test (branch "automation-uki-gr=
ub-only"),
> > which takes build artifacts from the build branch. I do that to not
> > rebase test scripts. It's a bit opaque, but the console log of the test
> > contains "Latest ChangeSet" fields telling what actually was tested.
> >
>=20
> If it does not take long to test you could revert hunk by hunk
> starting from xen/include/xlat.lst.

Ok, I found what is wrong. It isn't about XLAT branch, but the native
one, x86_64 has a couple more registers...

This fixes it:

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9af833b6da59f66d58eac3369c30a89919d0d805..893ebaa13a6f934e1af026f9eb1=
3b1d18f746214 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1280,6 +1280,14 @@ int arch_set_info_guest(
=20
     if ( !compat )
     {
+        v->arch.user_regs.r15               =3D c.nat->user_regs.r15;
+        v->arch.user_regs.r14               =3D c.nat->user_regs.r14;
+        v->arch.user_regs.r13               =3D c.nat->user_regs.r13;
+        v->arch.user_regs.r12               =3D c.nat->user_regs.r12;
+        v->arch.user_regs.r11               =3D c.nat->user_regs.r11;
+        v->arch.user_regs.r10               =3D c.nat->user_regs.r10;
+        v->arch.user_regs.r9                =3D c.nat->user_regs.r9;
+        v->arch.user_regs.r8                =3D c.nat->user_regs.r8;
         v->arch.user_regs.rbx               =3D c.nat->user_regs.rbx;
         v->arch.user_regs.rcx               =3D c.nat->user_regs.rcx;
         v->arch.user_regs.rdx               =3D c.nat->user_regs.rdx;
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index b8bc0caaf205828f9254e03584709482f3ba38a6..40f4cb049ce3f84ef38a6042543=
92548a41342de 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1440,6 +1440,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_=
context_u c)
     if ( !compat )
     {
         /* Backing memory is pre-zeroed. */
+        c.nat->user_regs.r15               =3D v->arch.user_regs.r15;
+        c.nat->user_regs.r14               =3D v->arch.user_regs.r14;
+        c.nat->user_regs.r13               =3D v->arch.user_regs.r13;
+        c.nat->user_regs.r12               =3D v->arch.user_regs.r12;
+        c.nat->user_regs.r11               =3D v->arch.user_regs.r11;
+        c.nat->user_regs.r10               =3D v->arch.user_regs.r10;
+        c.nat->user_regs.r9                =3D v->arch.user_regs.r9;
+        c.nat->user_regs.r8                =3D v->arch.user_regs.r8;
         c.nat->user_regs.rbx               =3D v->arch.user_regs.rbx;
         c.nat->user_regs.rcx               =3D v->arch.user_regs.rcx;
         c.nat->user_regs.rdx               =3D v->arch.user_regs.rdx;

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ARB6yuVHPZS+oxpN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpdVMwACgkQ24/THMrX
1yyXXgf/bWMA05tcMD5uQz6TpjcxhOFv0yXLkV6G6l7frfv1sOSwbAb/rhxQy+lF
c5Qg0cZwSC23QCHAPUdpOZyfGnHyBpkuNDz654JwPkIzr8+6Qq3MeW0aetfXqrdS
sL1ugVxsrs4dpQIBlK/16CbXLTPcG1WkUrCVPDXl8CJVc3Cixtw6J1v7uBeuNGbe
NiKJtq/IndYPT35kM8omTkY7Qsk+X8hx8Eo4wqv4Kv3lBIvYR1n9WBfZNTfiSBJo
RB1mbLLggIvhSOSMxVuylStKn1njh8FDSzYya/t1CPS9BUjit7nIT/np+jjSKiXH
tXDBYByoakXlIIDhgQTDJuZF4mQL7w==
=IO8L
-----END PGP SIGNATURE-----

--ARB6yuVHPZS+oxpN--

