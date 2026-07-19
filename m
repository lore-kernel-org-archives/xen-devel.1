Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF4CC44521
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 02:00:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365760.1615956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlGp9-0006Zz-HB; Sun, 19 Jul 2026 02:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365760.1615956; Sun, 19 Jul 2026 02:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlGp9-0006Zs-Ds; Sun, 19 Jul 2026 02:00:11 +0000
Received: by outflank-mailman (input) for mailman id 1365760;
 Sun, 19 Jul 2026 02:00:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wlGp8-0006Zm-2G
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 02:00:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlGp4-00DD4B-Pw
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 04:00:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5c2fa2-2eae-0a2a0a5409dd-0a2a4505ad5c-4
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 04:00:06 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5c2fa4-4cb1-0a2a45050019-67a8ac9a9a6d-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 04:00:05 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2E35414000F9;
 Sat, 18 Jul 2026 22:00:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sat, 18 Jul 2026 22:00:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 22:00:01 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784426404;
	 x=1784512804; bh=1ErJGdjEhth/Eob/VkTb8c1e1El++n8jCN1d1Yp6eYQ=; b=
	icBcboJw1LIQEZkaf585bweDQbRuRddZ5v2yVXBsgbHU1rfVsuwlx9VBp5Js6h4S
	WkwBBFxfjYlX5MXHJVbplhh4rITJF4MkWS9VA+JjKD1Bl3DXBOzhNWG+zWABkJIq
	XosykeBlcMiHRtUNQIURyYa+rK1eY2WGR3zPMHWa2WlP2qHe3utrAop1Vmx4ghQ+
	cobnduB6fYuBVuG1SkhZM7XX81Pd8DmnvhI4MruLGm6ur94J+VNxhtjKVkBtV/k+
	vPfn1EK00ZKeEuREaVVa6XbKmTGcmh+/LnSWVX01SOgTq7l6/9PmbWH5nyUyv/xT
	8vEapo/xIQ0aodFyjd0eTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784426404; x=1784512804; bh=1ErJGdjEhth/Eob/VkTb8c1e1El++n8jCN1
	d1Yp6eYQ=; b=ZvgdMtlYhfOuIfuT0L+UFUBQOBGk4UFdpTYc7nUz5wjYvKpC0PG
	wiKdwrIhwU3QeZ0urse1/ifxL5ca3Vl14JRMf/yOmFMoT4avgJ+OCGeMGdUIkg4Q
	g4E/ybMoqYOX6Fx7Kau5cLJhqvfUVJUPUpbtAsvrVyTFTgStyEF71YkatgYbXjoQ
	tY9nhhfH5r3N/RBdKH+xc67+vCvB+d8pERaDPodHh8++nEu+QC6+6H6TTHezNrUG
	nPInQNDzOLBZfxLc7n3Ru3Heiin+wzW6Jp4+ayp7S63m/2cex1NR/OBiFSQkdti3
	Bk+DCnGga4lja9iUsNuvECMVbdXKhEZ7gZQ==
X-ME-Sender: <xms:oy9cai9YjLan0rTXoGTlQPkK1_FblQcWm3pNyQOsnXzkrIAowtBdng>
    <xme:oy9caqK9IZACOlq7ZAJsVJ9jn5tc-FqFi43RpwMy1augPxyR5TnMuOwTM6v2mV05Z
    nqXBeuIbr_3zt48LBHUvQli8YcleG2cUn77FQ-JI-ZER9O1yA>
X-ME-Received: <xmr:oy9calZSkzDujtmkccf-GvdAMBuDeKmWYvdTwKaXvKLs69dkGuS4ygwtMHIMqsLLiHjMlUwn_iVpKVTKS0GwtAyzNIndheV6-Z4>
X-ME-Proxy-Cause: dmFkZTFLgguxNsmWhBz88Hg6moEus109haiRNpwjvKYekTYFMw02WHq9TDrljlNLdCjJUk
    FW2Nq5oXBtgagDyyYHGNJRc+nRRN6YmIkx1/RUtFL/tz4iRQgOgSLhjx7PK0R4RtXlkcPN
    xm7FwAiHWXugMNhHyqYhlEWi9++2x/Zg+IrjYEL1pFUVTWEcYofZPod17vfuaQXUP7Ohgj
    G6OxEKowwLCrlrPecrmtI20QnGp0TaAj/HZi4UxFcnP5N6c7Mc0fdDywhHFvWhx8e/THD/
    u+36usG6kf/ZXAyF0Ts9N4kkaTl3vOsUXV7GBF9QVG/4rmHc3oGOzyQHRnDVn16qJfjcI7
    OSxpV3Aqggul3wee+D3geCXJqj1tXZNTWsNwof6eQvM1mXVzrNu5NVUwvZX7gkkPfuf5us
    gAplPBn1r5bvYE4UA6fmwlhKSS99JmTMFex1q6dpwdT/7kFVoyatl1e6mMHYp59xqDrSvI
    kEm1C2lcv0+eKhI7p3fPtczw3GMhhz4oxtnSzw6WKcP9iLmQAcK5HTeYzMa2l2VaiXU4tW
    E0zG4vxnjML5eIXV+OJog2wKxUkZpoeUwXZ15OpSc/3Q89piU9UgZUr12wnQYxm+n/ipj9
    7uIeneCDuSHhc+WPHqQSIxq0nEvQjORL1MilTIjk1u1I0ocyyqPb3DCQWAVw
X-ME-Proxy: <xmx:oy9cakLWxW6bu13uFzpncAgZbpcoFxOov1RJMhxhH6S3WrYLNYcEUQ>
    <xmx:oy9carAB9RNqbiqa95mm50qMgTceHC272nXDzQA2tD53zhYHOjpKuw>
    <xmx:oy9cahpZp9eMHwzjGaGyjMBuz6PN8rL1C8c0PKqjOPcJfEH4AWDEiA>
    <xmx:oy9cauhVGUosMl8XwntffZhV124P_9EEhNI7L7Ug8TVwELnJSqk5Hg>
    <xmx:pC9cah0HKVBO0nP9h-oT31sjJdjMqNtdzFFBxJ4656xctAvw6t8HWntV>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 19 Jul 2026 03:59:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
Message-ID: <alwvn_K_miQgiiIf@mail-itl>
References: <ajUm2SQtMD6Y-K9S@mail-itl>
 <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
 <aluHsZA0hK8FcKnM@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ueeXD7YG02vtiuxW"
Content-Disposition: inline
In-Reply-To: <aluHsZA0hK8FcKnM@mail-itl>
X-purgate-ID: tlsNG-c201ff/1784426406-243112A1-3D61557F/0/0
X-purgate-type: clean
X-purgate-size: 7542

--ueeXD7YG02vtiuxW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 03:59:59 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22

On Sat, Jul 18, 2026 at 04:03:29PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> > On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >
> > > > I'm continuing testing 4.22 and found this:
> > > >
> > > > When a domU is suspended (even without host suspend) it crashes on
> > > > resume with:
> > > >
> > > >     [   24.374629] BUG: kernel NULL pointer dereference, address: 0=
000000000000020
> > > >     [   24.374647] #PF: supervisor read access in kernel mode
> > > >     [   24.374657] #PF: error_code(0x0000) - not-present page
> > > >     [   24.374668] PGD 0 P4D 0
> > > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tain=
ted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus=
=2Econstprop.0+0x6f/0xb0
> > > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 =
00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff =
0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> > > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX:=
 0000000000000404
> > > >     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI:=
 0000000000770ef0
> > > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09:=
 ffffc900000abc8c
> > > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12:=
 ffffffff81835ac0
> > > >     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15:=
 0000000000000000
> > > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(=
0000) knlGS:0000000000000000
> > > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4:=
 0000000000770ef0
> > > >     [   24.374873] PKRU: 00000000
> > > >     [   24.374877] Call Trace:
> > > >     [   24.374884]  <TASK>
> > > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > > >     [   24.374925]  kthread+0xfc/0x240
> > > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > > >     [   24.374949]  ret_from_fork+0x158/0x170
> > > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > > >     [   24.374973]  </TASK>
> > > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd=
_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs =
binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct=
 nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_=
rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_v=
sec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev=
 xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay =
xen_blkfront
> > > >     [   24.375064] CR2: 0000000000000020
> > > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 =
00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff =
0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> > > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX:=
 0000000000000404
> > > >     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI:=
 0000000000770ef0
> > > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09:=
 ffffc900000abc8c
> > > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12:=
 ffffffff81835ac0
> > > >     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15:=
 0000000000000000
> > > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(=
0000) knlGS:0000000000000000
> > > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4:=
 0000000000770ef0
> > > >     [   24.375241] PKRU: 00000000
> > > >     [   24.375247] Kernel panic - not syncing: Fatal exception
> > > >     [   25.417403] Shutting down cpus with NMI
> > > >     [   25.417447] Kernel Offset: disabled
> > > >
> > > > There is no change on the Linux kernel side (neither dom0 nor domU)=
, the
> > > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
> > > > broken on -rc1 too). This happens for both HVM and PVH domains. Hav=
en't
> > > > tried PV domU (but dom0 survives host suspend).
> > >
> > > Any ideas?
> > >
> >=20
> > Hi,
> >    not many ideas but while testing my libxenguest changes I found
> > similar failures using xl create/save/restore. But I was testing more
> > PV guests.
> > Does 4.21 work ?
>=20
> It seems 4.21 also has this issue:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414211523
> But 4.20 is okay:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414227095
>=20
> I guess I can bisect it further.

So, bisect says the first bad commit is:

    commit 9f892f84c27970840d255aef7e2851b762967de7
    Author: Andrew Cooper <andrew.cooper3@citrix.com>
    Date:   Mon Dec 30 11:49:14 2024 +0000

        x86/domctl: Stop using XLAT_cpu_user_regs()

My test isn't 100% reliable, but I retested parent of this commit a
couple of times and it was good every time.

I wanted to test reverting it on top of 4.21, but there is a lot of
FRED-related work on top that makes such revert quite hard, to say the
least...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ueeXD7YG02vtiuxW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpcL58ACgkQ24/THMrX
1yy+sggAjd2PFsZHIBLvDDp5Xe4aTHMCLoKghK94qix24gUr9XsWVNAfrVeVLyEf
NF/4e7dOFpM2KGkUGRBBfhTHOOTsVjzeDQbUlVqfoEnGRbw5ywOQmWwzC6GXpTV8
e3IM1/5g2x51JDwNqBJi3wGbKqlx+n1Z5FiwthG7FlZttL3oXd/k9v1Sau2UVGcC
3T4p4koAnKNh/kqfUKIt+ineJVjHqVktI/3Rf9OKDRum+SWqfq1qp2vaHVgAYvrq
U7lgbZkz2VaRo000QdFZXEIOlk9A+svhdYGmocey2gnoFfqkvyofuTS+TXgoHElH
u9gSlRVuDAerHcm+2Bb9Ul0+SvVVUQ==
=nezp
-----END PGP SIGNATURE-----

--ueeXD7YG02vtiuxW--

