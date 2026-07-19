Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8027C44512
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 07:32:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365826.1615974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlM02-00030l-RP; Sun, 19 Jul 2026 07:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365826.1615974; Sun, 19 Jul 2026 07:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlM02-00030e-On; Sun, 19 Jul 2026 07:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1365826;
 Sun, 19 Jul 2026 07:31:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlM01-00030Y-QK
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 07:31:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlM01-006ufg-7I
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 09:31:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5c7d16-2eae-0a2a0a5409dd-0a2a4501bb96-48
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 09:31:45 +0200
Received: from [74.125.224.50] (helo=mail-yx1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5c7d5f-5984-0a2a45010019-4a7de032cc55-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 09:31:44 +0200
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-668296d0ff3so3700618d50.0
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 00:31:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784446303; cv=none;
        d=google.com; s=arc-20260327;
        b=VHMBT4zqUfv9QOc5VgY1tFtlPBXuoClDvlzSBBTrwj+1GcBmECKdFjp7/GuzwaclrG
         wJzRrN8W2iPEu05jrlKmxMMPtOJgzeKfWJ5A3mDFVkEl3uazlhJKZM98dJey4WDbRhIr
         P9/k7KHwZjjXQiU7QqVyyfoRM8kCmBWq3WquNNLLHsfXrn8DYiBewaWQPLYwWc7GBzWQ
         yJX0PI5gT8RxGimuxCriUjk3rciFKNeL/qcaHiyrUG5oFfrZZJftZwJIJwi6v3dCBb2+
         T5yDxMu5/y2s+FLCECiT7uEEHWSR43eyrhNktjref9K3nVQmMpvP6Bg3vCDNupioyOGf
         BZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yXhVGLrq8BbOV499aq5difJP2J7h0KknahtbRk8BpgU=;
        fh=xICrRNGL1/wiAEX7CoGX/RRRWm4TcI+zcC/u/Ri/Jas=;
        b=lbAlrqQSgtOGOSETIvjQJy77C3/sT9FlIi4K0w8M37AbCzIgc57cNTNo4AaJyKq8zz
         Knw7KojqG0cj2gZ3Bi72QRWGtwPI2pHvHgsz7pX8P4wm8BjEVGYXjLT1AUrEoslHym0E
         jLTT6uMjyvJkfBwISHvZ4SFhJcm2Yw0dh4mqvB0bqovXqvFMMHwvnG3Un0hGlhY4lzbf
         pehJ4n41tUbApQJ7lMVvTH37ATqesJIqG9NUQlNZT8femeQvtxJ5p7zGCSKUCMNln+LI
         7weGkZ4vabSMnP7qJdIpGMfyOHbldBeQWkfVCtWvePzoHED2kDLDiw+4ifcJLfCshQEa
         bgcw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784446303; x=1785051103; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXhVGLrq8BbOV499aq5difJP2J7h0KknahtbRk8BpgU=;
        b=Zid2Bpg9ke5dXnIVYg2KCeHc8uKstePGb0UVYvW5j4ABG6QfN2BsnHIxhjRLQhy3k1
         S3gK7mmuDzgO8/DZwuj32+o7roh7d5bb0cTe1Nny1HoYXtdDT1sbxy01yFbB7F39tAay
         Tcr/uv//bNcmpxhNu2xIpQwlVnj2NGct/MydI1ptfZWhl7dV2r5jeSxwR/X5lVxUDEMa
         SwzWsZPpU9mgVnDu4cfOlNLeIgG0WOn8bs91cI4KgzOfCR7Z4Aj8nVKnPbO0aE4y8Q2a
         3MAikzqlFRcM2VDQw7vV6uAjKRLunh9jpnDOL2KBWpxyY3a8QgHtStLIVfU2OIGzoy2P
         iMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784446303; x=1785051103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXhVGLrq8BbOV499aq5difJP2J7h0KknahtbRk8BpgU=;
        b=JGZWNcjFCkZnyf4p7wH9viGj42lMrfT+2v4XFSAxAMOuoUh4PutD2RhHGKR0DzxHps
         GuMYYAR4pAfSk8HfgEei2yktB8teS9tHTeVqRCz2cYBFZOgv+ViUzsWDHT7OC84wO1xY
         8Y03secrNJV7IY+ln47tyw6+2kJwmFrknYQIAnCIooywORmMXWhFjgZ5lvQx9AsD3Tx8
         l9uvQ75511C/BYDzpK8Rd+hWMMMCeH0G2TzgGDzBbdc1PNyinkme4A7GygZV/gUF7Z2W
         Zadqc8uRmQcyh15zdhfNFQE9Z8peoSO4TEBQYySh0IZ0I0Okbu5xM/MPuEUsluzDfxoS
         ndhw==
X-Gm-Message-State: AOJu0Yx28ZpFI5/Yc05qJ/8W/UmORinW28oJX13BBU0QDmHKUfXzKIJM
	PkW54VDTTCseHSdFS+9nF0VUNAD3f1FmisNKkyaZycv4orFNCHCD6KyWWPyIJ6ZC3DCzPNG6XTE
	wMfT7KOlRYzZm6CxKUBVY2d9sG09pwP0=
X-Gm-Gg: AfdE7cmm1RdF+E+8MFUINZZeoK3rV/UQiXeFpV8BcjqukKvi20T+VF+3mmQmAis0mtu
	Ms8H3A6GW1KHp+vMJENv5NqhP3wyO4SbIiScLae/T4Vv7nAoVgZlCJr3LXRbUM4ptZ0oMXg7zLW
	sGy3bbcHWL3IUeFCqvhRF1zZxdidfdOck7wUzN2kJRXWZ2XacVVWhz/KhXVDNnBYb5gKTL1eO6x
	s7fT4eHLdbo5VTEePHZAiwc29Izf1vPGAatpuwRydLLrJVoZRgf2z1GJYDlLKyLOAf1U7T4fsax
	TxVARyonF33hmHAeYQ==
X-Received: by 2002:a53:edcc:0:b0:667:b503:4d2e with SMTP id
 956f58d0204a3-6683bb0bb22mr2198558d50.37.1784446303394; Sun, 19 Jul 2026
 00:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <ajUm2SQtMD6Y-K9S@mail-itl> <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
 <aluHsZA0hK8FcKnM@mail-itl> <alwvn_K_miQgiiIf@mail-itl>
In-Reply-To: <alwvn_K_miQgiiIf@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sun, 19 Jul 2026 08:31:28 +0100
X-Gm-Features: AUfX_mzFyfEnSO35C8y3ZvptCsQMwNK7aGNTOym53mEaG6YSKQNCUZjQgY6qB4E
Message-ID: <CAHt6W4cyDAsTyOcPLcR2STQyhpkNe5W+to3JRn0yWnm3J9VF+w@mail.gmail.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1784446305-BEC61757-CBCA5DDA/0/0
X-purgate-type: clean
X-purgate-size: 8029

On Sun, 19 Jul 2026 at 03:00, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Sat, Jul 18, 2026 at 04:03:29PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> > > On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > Hi,
> > > > >
> > > > > I'm continuing testing 4.22 and found this:
> > > > >
> > > > > When a domU is suspended (even without host suspend) it crashes o=
n
> > > > > resume with:
> > > > >
> > > > >     [   24.374629] BUG: kernel NULL pointer dereference, address:=
 0000000000000020
> > > > >     [   24.374647] #PF: supervisor read access in kernel mode
> > > > >     [   24.374657] #PF: error_code(0x0000) - not-present page
> > > > >     [   24.374668] PGD 0 P4D 0
> > > > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > > > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not ta=
inted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > > > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cp=
us.constprop.0+0x6f/0xb0
> > > > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 0=
0 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 f=
f 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83=
 fd
> > > > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RC=
X: 0000000000000404
> > > > >     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RD=
I: 0000000000770ef0
> > > > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R0=
9: ffffc900000abc8c
> > > > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R1=
2: ffffffff81835ac0
> > > > >     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > > > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b36900=
0(0000) knlGS:0000000000000000
> > > > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR=
4: 0000000000770ef0
> > > > >     [   24.374873] PKRU: 00000000
> > > > >     [   24.374877] Call Trace:
> > > > >     [   24.374884]  <TASK>
> > > > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > > > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > > > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > > > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > > > >     [   24.374925]  kthread+0xfc/0x240
> > > > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > > > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > > > >     [   24.374949]  ret_from_fork+0x158/0x170
> > > > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > > > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > > > >     [   24.374973]  </TASK>
> > > > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer s=
nd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenf=
s binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_=
ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr inte=
l_rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry intel=
_vsec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntd=
ev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overla=
y xen_blkfront
> > > > >     [   24.375064] CR2: 0000000000000020
> > > > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > > > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 0=
0 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 f=
f 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83=
 fd
> > > > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> > > > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RC=
X: 0000000000000404
> > > > >     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RD=
I: 0000000000770ef0
> > > > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R0=
9: ffffc900000abc8c
> > > > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R1=
2: ffffffff81835ac0
> > > > >     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > > > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b36900=
0(0000) knlGS:0000000000000000
> > > > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR=
4: 0000000000770ef0
> > > > >     [   24.375241] PKRU: 00000000
> > > > >     [   24.375247] Kernel panic - not syncing: Fatal exception
> > > > >     [   25.417403] Shutting down cpus with NMI
> > > > >     [   25.417447] Kernel Offset: disabled
> > > > >
> > > > > There is no change on the Linux kernel side (neither dom0 nor dom=
U), the
> > > > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be alrea=
dy
> > > > > broken on -rc1 too). This happens for both HVM and PVH domains. H=
aven't
> > > > > tried PV domU (but dom0 survives host suspend).
> > > >
> > > > Any ideas?
> > > >
> > >
> > > Hi,
> > >    not many ideas but while testing my libxenguest changes I found
> > > similar failures using xl create/save/restore. But I was testing more
> > > PV guests.
> > > Does 4.21 work ?
> >
> > It seems 4.21 also has this issue:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414211523
> > But 4.20 is okay:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/15414227095
> >
> > I guess I can bisect it further.
>
> So, bisect says the first bad commit is:
>
>     commit 9f892f84c27970840d255aef7e2851b762967de7
>     Author: Andrew Cooper <andrew.cooper3@citrix.com>
>     Date:   Mon Dec 30 11:49:14 2024 +0000
>
>         x86/domctl: Stop using XLAT_cpu_user_regs()
>
> My test isn't 100% reliable, but I retested parent of this commit a
> couple of times and it was good every time.
>
> I wanted to test reverting it on top of 4.21, but there is a lot of
> FRED-related work on top that makes such revert quite hard, to say the
> least...
>

The generated XLAT_cpu_user_regs was

#define XLAT_cpu_user_regs(_d_, _s_) do { \
    (_d_)->__DECL_REG_LO8(b) =3D (_s_)->__DECL_REG_LO8(b); \
    (_d_)->__DECL_REG_LO8(c) =3D (_s_)->__DECL_REG_LO8(c); \
    (_d_)->__DECL_REG_LO8(d) =3D (_s_)->__DECL_REG_LO8(d); \
    (_d_)->__DECL_REG_LO16(si) =3D (_s_)->__DECL_REG_LO16(si); \
    (_d_)->__DECL_REG_LO16(di) =3D (_s_)->__DECL_REG_LO16(di); \
    (_d_)->__DECL_REG_LO16(bp) =3D (_s_)->__DECL_REG_LO16(bp); \
    (_d_)->__DECL_REG_LO8(a) =3D (_s_)->__DECL_REG_LO8(a); \
    (_d_)->error_code =3D (_s_)->error_code; \
    (_d_)->entry_vector =3D (_s_)->entry_vector; \
    (_d_)->__DECL_REG_LO16(ip) =3D (_s_)->__DECL_REG_LO16(ip); \
    (_d_)->cs =3D (_s_)->cs; \
    (_d_)->saved_upcall_mask =3D (_s_)->saved_upcall_mask; \
    (_d_)->__DECL_REG_LO16(flags) =3D (_s_)->__DECL_REG_LO16(flags); \
    (_d_)->__DECL_REG_LO16(sp) =3D (_s_)->__DECL_REG_LO16(sp); \
    (_d_)->ss =3D (_s_)->ss; \
    (_d_)->es =3D (_s_)->es; \
    (_d_)->ds =3D (_s_)->ds; \
    (_d_)->fs =3D (_s_)->fs; \
    (_d_)->gs =3D (_s_)->gs; \
} while (0)

registers are copied, but additional fields (error_code, entry_vector,
saved_upcall_mask).
Maybe you could try to copy them again.
Also, just to be on the safe side, you could memset the structure
where "Backing memory is pre-zeroed" comments are.

Frediano

