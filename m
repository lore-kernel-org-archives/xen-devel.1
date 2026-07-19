Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77183C4450A
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 21:05:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366055.1615993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlYh0-0003Bn-LW; Sun, 19 Jul 2026 21:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366055.1615993; Sun, 19 Jul 2026 21:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlYh0-0003Bf-IA; Sun, 19 Jul 2026 21:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1366055;
 Sun, 19 Jul 2026 21:04:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlYgy-0003BZ-Sq
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 21:04:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlYgx-009a6I-Qp
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 23:04:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5d3b8c-bab6-0a2a0a5309dd-0a2a4509bbf0-38
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 23:04:55 +0200
Received: from [209.85.128.170] (helo=mail-yw1-f170.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5d3bf6-be1a-0a2a45090019-d15580aab129-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 23:04:55 +0200
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-81eff3ddba4so17343657b3.3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 14:04:55 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784495094; cv=none;
        d=google.com; s=arc-20260327;
        b=fNBYCDVu68NQwTor8XLAEMX2gyDbSBcokccbRCIHqv8YyWRltaxQxpZouXQ1cKAF6F
         diglsdNmruDTz2cfZyALMGmZGy3uTkWUJ2QFHOMZIiniULg9tN/rTmqVvOo2ibYf0Peq
         vqPwEcvk+CjgDdpcmQGZ2eptNWbvU44Po04NABTdBM4VItroQlGR9faCUCInW4DHJNav
         cGPI8723NRY9o5rnbGwOSxBY98y17RsuSJUoYxgDOXBUKzyHoS5iU1I5qLvoh5+OBvy5
         xd3bJx5bCeL83DBhRozqpMDVLuSVEJMfHeJ16yhzhmEbNYXPwWg6AySMsKdmAUQwlVWX
         vjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kgwQSCzFlU4oZMvaRLEDCchuo+4+6Zn05TJg0kihVhY=;
        fh=xICrRNGL1/wiAEX7CoGX/RRRWm4TcI+zcC/u/Ri/Jas=;
        b=I2Opg0QAUco2rStV0CWKDBR5zNbLjkE1/n9vpO1s3BMJF/RZpmwuXZu1zDjwABVXYv
         g7jQWXLO9GvB1gGf8AggCjtM+7OGpf9gHPTEOWzD29qqSfHObyZZlKIz7UZ6j/sp42nj
         iqusVkUuGgK5f1EvxV8raYDlxSK8YaEpcExLJj8KCg8KA1ik9mtQpHrShu+iKBRtWFgA
         /ts87hxa6veqzb+THkJ7cgsu2liRuZW3erKv+4MNBYjRGQxBhrUWjkTP2uSj4leky8ND
         /R84PQylis6ur2nQTOlhSbB6N7aciw1MA1hDf0e2N7yKT2uIZD+L22U501wca6PRVanO
         6cGA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495094; x=1785099894; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgwQSCzFlU4oZMvaRLEDCchuo+4+6Zn05TJg0kihVhY=;
        b=ghEuwpQhA+UvljAwrS0scPe5AsX5vGlTolfkjLxWHVyF9ZtlybN+vlp2xioTLcZ5v0
         YNz+zIAv/YEyPS8ppq8S62Qqh8rjlk08EbpduFAqb5FMk+VY78L8K8GBEJjSL3FIOYNG
         I2AYVBSnHCQnS+Rh1T0NoF+1vpLWyzz8BffhIzWxI9Lz6niKFjNYEm49zS1H8kfrAA2B
         4OdS/bEbALxai6vo+HdGYzc57x23F6bWYtNlhkrBIhmpvuyPOi3bOd2eVY/fPT+xYw/I
         8Pex9yq7dtR60ZiNbkxFFhylM4lwMX244b9SsLYCzirogMiv7hEoQg5OuTMxW3kdBE8n
         yeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495094; x=1785099894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgwQSCzFlU4oZMvaRLEDCchuo+4+6Zn05TJg0kihVhY=;
        b=Omuf3pmEI4+Ai0D463iQ6zVXSkd+onBoimi6pSTKZosraxAerxxy7H/G1ALugvgECA
         2ElhRXalTlYGtbQ0J+RSfm1nsqWImsKtP5v0OTQfLjPJqcxngIzrdYNWmuMOFHTCWEUM
         IJOfiJk2f4ew7qZcUE9nx5yO5/ABHs+QATJEuyUEoBtD/lcaDUFQ9+5rXPJFiTd/Unlp
         f20rv8Qh2DTluFYaX3uxTNvzjLKPkPVMvnzcjQ4wf/ZJ7UZskUgLKkqxUyjmXKTdAE5O
         cM45sLk/t2YvbYr2c9VVhCMRFNVOgJl6q/J32bphq+y4fltZmLF9g0V/0XYmYrnrKwF6
         O6pQ==
X-Gm-Message-State: AOJu0Yz97BQkjVwPTJcrbGYLYiyFa5NaQB0/RSudV/F8WJkoWMlPMac9
	WUs9Mhg08JduBnOfQjkXYOAhCknm5cQ6Z2gvHVHIR8uqkYpWBbLdxtH52Fc594k502lmm9gHLSk
	9chz6YQIBhuFs6gZC3WxrcjuOSBDiVcA=
X-Gm-Gg: AfdE7cm4x/BjzqEUQoJDXdHE7lRbif+9JeFdJbBwSC9zwqFViPj+4ynSlWnj1gZrb86
	M2Sjw/bJkc9g3d9T1ZjUm/2VoQtoOKAEEfwBWT9Ji4ov4O596saW6TC0fKQmFEqgFpIYKOyPrff
	SN8AU8JCmwnuDNKEFFUGlpI/YlMKXH14qSKJl1tltnhewFDyv+YSL3hCpwmvrbgpFLjahBnTpj2
	S+IpAEmPaWloQqSp28dJ02g0uvaO4REI7mT6ypr7ojSi6MbUDwVjEiSrHGgasyP0ZEUtu09B4aA
	HZdTIdYVjkImwzAfkg==
X-Received: by 2002:a53:c0c5:0:b0:664:ef34:3b with SMTP id 956f58d0204a3-6683bba373dmr2411772d50.42.1784495093938;
 Sun, 19 Jul 2026 14:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <ajUm2SQtMD6Y-K9S@mail-itl> <alZt_boT-hJuVlD6@mail-itl>
 <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
 <aluHsZA0hK8FcKnM@mail-itl> <alwvn_K_miQgiiIf@mail-itl> <CAHt6W4cyDAsTyOcPLcR2STQyhpkNe5W+to3JRn0yWnm3J9VF+w@mail.gmail.com>
 <al0oK0ABYviuWU5P@mail-itl>
In-Reply-To: <al0oK0ABYviuWU5P@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sun, 19 Jul 2026 22:04:42 +0100
X-Gm-Features: AUfX_mwQsEp9J0E2lTshbzDD6-InJ2o4oTIBnNcC9itG-8NtAZhEGuACNBT832M
Message-ID: <CAHt6W4fWo-WXDieSM_+y1DgpjxVHTL=2KrX=b_iBhqz25jjs6g@mail.gmail.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1784495095-3A0C5034-E98F2CB8/0/0
X-purgate-type: clean
X-purgate-size: 10128

On Sun, 19 Jul 2026 at 20:40, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Sun, Jul 19, 2026 at 08:31:28AM +0100, Frediano Ziglio wrote:
> > On Sun, 19 Jul 2026 at 03:00, Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Sat, Jul 18, 2026 at 04:03:29PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Fri, Jul 17, 2026 at 09:22:47PM +0100, Frediano Ziglio wrote:
> > > > > On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
> > > > > <marmarek@invisiblethingslab.com> wrote:
> > > > > >
> > > > > > On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I'm continuing testing 4.22 and found this:
> > > > > > >
> > > > > > > When a domU is suspended (even without host suspend) it crash=
es on
> > > > > > > resume with:
> > > > > > >
> > > > > > >     [   24.374629] BUG: kernel NULL pointer dereference, addr=
ess: 0000000000000020
> > > > > > >     [   24.374647] #PF: supervisor read access in kernel mode
> > > > > > >     [   24.374657] #PF: error_code(0x0000) - not-present page
> > > > > > >     [   24.374668] PGD 0 P4D 0
> > > > > > >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> > > > > > >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 No=
t tainted 6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> > > > > > >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __sto=
p_cpus.constprop.0+0x6f/0xb0
> > > > > > >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > > >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 =
04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 =
f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 4=
1 83 fd
> > > > > > >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 0001004=
6
> > > > > > >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de=
4 RCX: 0000000000000404
> > > > > > >     [   24.374790] RDX: 0000000000000040 RSI: fffffffffffffff=
f RDI: 0000000000770ef0
> > > > > > >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc8=
0 R09: ffffc900000abc8c
> > > > > > >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc=
0 R12: ffffffff81835ac0
> > > > > > >     [   24.374825] R13: 0000000000000000 R14: 000000000000000=
0 R15: 0000000000000000
> > > > > > >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b3=
69000(0000) knlGS:0000000000000000
> > > > > > >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
> > > > > > >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a200=
2 CR4: 0000000000770ef0
> > > > > > >     [   24.374873] PKRU: 00000000
> > > > > > >     [   24.374877] Call Trace:
> > > > > > >     [   24.374884]  <TASK>
> > > > > > >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> > > > > > >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> > > > > > >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> > > > > > >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> > > > > > >     [   24.374925]  kthread+0xfc/0x240
> > > > > > >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> > > > > > >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> > > > > > >     [   24.374949]  ret_from_fork+0x158/0x170
> > > > > > >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> > > > > > >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> > > > > > >     [   24.374973]  </TASK>
> > > > > > >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtim=
er snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat =
xenfs binfmt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject =
nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr =
intel_rapl_common intel_uncore_frequency_common intel_pmc_ssram_telemetry i=
ntel_vsec polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_=
gntdev xen_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables ov=
erlay xen_blkfront
> > > > > > >     [   24.375064] CR2: 0000000000000020
> > > > > > >     [   24.375071] ---[ end trace 0000000000000000 ]---
> > > > > > >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> > > > > > >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 =
04 00 00 00 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 =
f0 ff 0b 75 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 4=
1 83 fd
> > > > > > >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 0001004=
6
> > > > > > >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de=
4 RCX: 0000000000000404
> > > > > > >     [   24.375142] RDX: 0000000000000040 RSI: fffffffffffffff=
f RDI: 0000000000770ef0
> > > > > > >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc8=
0 R09: ffffc900000abc8c
> > > > > > >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc=
0 R12: ffffffff81835ac0
> > > > > > >     [   24.375184] R13: 0000000000000000 R14: 000000000000000=
0 R15: 0000000000000000
> > > > > > >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b3=
69000(0000) knlGS:0000000000000000
> > > > > > >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
> > > > > > >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a200=
2 CR4: 0000000000770ef0
> > > > > > >     [   24.375241] PKRU: 00000000
> > > > > > >     [   24.375247] Kernel panic - not syncing: Fatal exceptio=
n
> > > > > > >     [   25.417403] Shutting down cpus with NMI
> > > > > > >     [   25.417447] Kernel Offset: disabled
> > > > > > >
> > > > > > > There is no change on the Linux kernel side (neither dom0 nor=
 domU), the
> > > > > > > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be a=
lready
> > > > > > > broken on -rc1 too). This happens for both HVM and PVH domain=
s. Haven't
> > > > > > > tried PV domU (but dom0 survives host suspend).
> > > > > >
> > > > > > Any ideas?
> > > > > >
> > > > >
> > > > > Hi,
> > > > >    not many ideas but while testing my libxenguest changes I foun=
d
> > > > > similar failures using xl create/save/restore. But I was testing =
more
> > > > > PV guests.
> > > > > Does 4.21 work ?
> > > >
> > > > It seems 4.21 also has this issue:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/154142115=
23
> > > > But 4.20 is okay:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/154142270=
95
> > > >
> > > > I guess I can bisect it further.
> > >
> > > So, bisect says the first bad commit is:
> > >
> > >     commit 9f892f84c27970840d255aef7e2851b762967de7
> > >     Author: Andrew Cooper <andrew.cooper3@citrix.com>
> > >     Date:   Mon Dec 30 11:49:14 2024 +0000
> > >
> > >         x86/domctl: Stop using XLAT_cpu_user_regs()
> > >
> > > My test isn't 100% reliable, but I retested parent of this commit a
> > > couple of times and it was good every time.
> > >
> > > I wanted to test reverting it on top of 4.21, but there is a lot of
> > > FRED-related work on top that makes such revert quite hard, to say th=
e
> > > least...
> > >
> >
> > The generated XLAT_cpu_user_regs was
> >
> > #define XLAT_cpu_user_regs(_d_, _s_) do { \
> >     (_d_)->__DECL_REG_LO8(b) =3D (_s_)->__DECL_REG_LO8(b); \
> >     (_d_)->__DECL_REG_LO8(c) =3D (_s_)->__DECL_REG_LO8(c); \
> >     (_d_)->__DECL_REG_LO8(d) =3D (_s_)->__DECL_REG_LO8(d); \
> >     (_d_)->__DECL_REG_LO16(si) =3D (_s_)->__DECL_REG_LO16(si); \
> >     (_d_)->__DECL_REG_LO16(di) =3D (_s_)->__DECL_REG_LO16(di); \
> >     (_d_)->__DECL_REG_LO16(bp) =3D (_s_)->__DECL_REG_LO16(bp); \
> >     (_d_)->__DECL_REG_LO8(a) =3D (_s_)->__DECL_REG_LO8(a); \
> >     (_d_)->error_code =3D (_s_)->error_code; \
> >     (_d_)->entry_vector =3D (_s_)->entry_vector; \
> >     (_d_)->__DECL_REG_LO16(ip) =3D (_s_)->__DECL_REG_LO16(ip); \
> >     (_d_)->cs =3D (_s_)->cs; \
> >     (_d_)->saved_upcall_mask =3D (_s_)->saved_upcall_mask; \
> >     (_d_)->__DECL_REG_LO16(flags) =3D (_s_)->__DECL_REG_LO16(flags); \
> >     (_d_)->__DECL_REG_LO16(sp) =3D (_s_)->__DECL_REG_LO16(sp); \
> >     (_d_)->ss =3D (_s_)->ss; \
> >     (_d_)->es =3D (_s_)->es; \
> >     (_d_)->ds =3D (_s_)->ds; \
> >     (_d_)->fs =3D (_s_)->fs; \
> >     (_d_)->gs =3D (_s_)->gs; \
> > } while (0)
> >
> > registers are copied, but additional fields (error_code, entry_vector,
> > saved_upcall_mask).
> > Maybe you could try to copy them again.
> > Also, just to be on the safe side, you could memset the structure
> > where "Backing memory is pre-zeroed" comments are.
>
> This does not help :(
>
> Specifically:
> 1. Applied on top of staging-4.21:
>   - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/1=
88ca612c51a57ef54b917c833eaeb59666994c9
>   - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/pi=
pelines/2688813821
> 2. Applied directly on top of 9f892f84c27970840d255aef7e2851b762967de7:
>   - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/d=
d3dee35fc4fcd6ba284f3f5fa78b333c472888e
>   - test (fails): https://gitlab.com/xen-project/people/marmarek/xen/-/pi=
pelines/2688832398
>
> Yet, parent of 9f892f84c27970840d255aef7e2851b762967de7 still passes:
>  - build: https://gitlab.com/xen-project/people/marmarek/xen/-/commits/db=
cbbed4e9dc25faa211d359c2f04a9c70f087c9
>  - test (pass): https://gitlab.com/xen-project/people/marmarek/xen/-/pipe=
lines/2688835512
>
> Hint about reading the above: I use two branches, one for building
> (branch "test") and one for running the test (branch "automation-uki-grub=
-only"),
> which takes build artifacts from the build branch. I do that to not
> rebase test scripts. It's a bit opaque, but the console log of the test
> contains "Latest ChangeSet" fields telling what actually was tested.
>

If it does not take long to test you could revert hunk by hunk
starting from xen/include/xlat.lst.

Frediano

