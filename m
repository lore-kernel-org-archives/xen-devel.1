Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D84C4451B
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 20:23:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365180.1615823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkp5M-0006x4-Im; Fri, 17 Jul 2026 20:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365180.1615823; Fri, 17 Jul 2026 20:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkp5M-0006ww-CY; Fri, 17 Jul 2026 20:23:04 +0000
Received: by outflank-mailman (input) for mailman id 1365180;
 Fri, 17 Jul 2026 20:23:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wkp5K-0006wq-8S
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 20:23:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkp5J-00AUhC-LE
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 22:23:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5a8f25-bab6-0a2a0a5309dd-0a2a45039276-2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:23:01 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5a8f24-fae8-0a2a45030019-d15580afe0ae-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:23:01 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-80814edb536so51633967b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 13:23:01 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784319780; cv=none;
        d=google.com; s=arc-20260327;
        b=M+bDxLB3GaTX/panvxPWSaa3wTcJt3EB76unN6H+lZF6EzAOkyIltmqQYMRzyoY/G4
         w3WhQZ0FWtNDabuNuIZwOmmN+cZpFuQtt1Cz7byGoxX0Asc579pCgSM6Aou5Rur3g9LB
         t1e8ZpukoTSp29dzyLdWWSnQaM0nsMrnZHmE9eLmdHaq6hLD2VJC/EcHDDGq4GK1HcI+
         MdBbenxkQuUioE4/SC+MSZABF60Z4wce2/L1OiEUz0mxC+iAZe2DTIIMSXof9qk9Jo0x
         N6Q+9sB4viHl7FxcvMhq8VbwcmMmNmGxFc9poPKyQ4DosLtFuJqi3AaKMang/2dThV0t
         um6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+MM+mHW7dNH075ZwhWIZVYA9nHOq7CloauT16szj+6s=;
        fh=mIDWfUsqppc0bUwSrD1+fljqRLCHlr9feJ1oOM8RcV8=;
        b=lE1FthDwNS8RYnH48qo1+Uv/Jfuk5uT6TZfW5BlBuxZsakPZN8/DcEdBaDbA33wDFR
         6Ss0g6Xb/I/l+a5Mj9PG3P9F98vvPkfIMRvhHQjTCCJxgw0wuIi3l3our6VYP23nqSuD
         qu8AxlWO8k2gXNFOM2qNo4tOc91VknalKUHW7tZ1MlPxfkBPpd7uShbZxpZQ2XgOHSg8
         1ENqgaWYnLmijmpER/LzaUpTTLzBCLMDiDZt9k2c9KfjwCxYRyzqIpoI47pgFIzxEBY5
         BCpDVWoxMg7eot/jTeQfsN5JAU22CwGCIjzhfH/97xHXBheO5eW1si/+nGwJOSCTlXqu
         lUsg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319780; x=1784924580; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MM+mHW7dNH075ZwhWIZVYA9nHOq7CloauT16szj+6s=;
        b=mWli3qwsYoINZ3ZFIYE3m9RkW9of7KOrJY2JkQr9A8dy1kqcYzJ53uwBsKNSgEGy7y
         aRJ6eJoL/P6fjGONv/Xu5bFKyz560JfBXmVPe4CNAXEEAdALxTwf2DDA4ogYz6Wt/Crj
         K1TkltIonAe/GH/EOwFAwllfksshBx4BvLr431PFZ/Jft5iJGqtKoWFRv2Td1qkynNTr
         EynGxbXAHntbP/a10Oyx+WGScYgumljcTa7aMNrqV3LjrQE21+/yF7aMxLwTWGBAQr0C
         /K2GtMfl0t34x61iPxEQWndpSWGjtUWtqyQpr5lCDLtH4THXgfPrHEJfCDidxiaN2Bpu
         WmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319780; x=1784924580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MM+mHW7dNH075ZwhWIZVYA9nHOq7CloauT16szj+6s=;
        b=G9uh+DWKUIc8W64BhERq6EiIgyZ71Zc2ZpLXN8gqNLLIQtZr+T0J+XkFLNayLPEnrt
         NgfD6V6Pbd9ii3AbhnHnhMbYNyxC1xa7LkMyg1LPgGx+wGF0M9okqHu9HDlObFWl5mpQ
         0zSxRi5jLBrWg76v+nrDfjMhzVGG6b2BimYpQw6jiNGIczz+61c7m/ySHzpOSmirAVIu
         OEPp1WM1d31u4y9ENqCqn8C8fh0pTjHU+peWPz6JJ1kVr5hc9Th14l4y/Jd1cECeML6S
         q66A9u9Ew/xF9LW+MsJcE5vO86SiXwdeTyUUaRMOc7iWVtx2orlWzECXeznhs9Vj/tYS
         MbGw==
X-Gm-Message-State: AOJu0Yxk8wzS20utShnZpeebnMXYQWaPl+vtw4XoVlXmMr691XUUy0J0
	asEV6XWGkz4wTIiIzFfeolusses5Ktsqp++ppKOnLVJzA/cZbzwaWqmGCuH+V5+dD1hPmysvLFk
	tDfeewFypcc4rwDxatPNG+YBWAot2FeQ=
X-Gm-Gg: AfdE7ck7xO+2SmoKELaA8g3zYkEAR23eE3Wu8kmtj8j/kM87Icf1znqk9eGIr+ZZ1hf
	9tp790lVDRXjWU0JfCLngqIH+mXqsb37QNv1VE7gr8tCkuEcBXuzOOK4UkK3GeffhR+k4N4Bb1G
	TNMwMNkV1DYbOlgHd1vQcwV3d013bmFqBccXvFiIB61MEYWp67VKEv149dqwymmV00sjxSxAjTY
	CVtTAnli/mqplwXimR5xZ3KfC3q9QD9vEn7BqBWeHB0LregJkAoFszwD3XcVfD9iM9ffJosgFgM
	SYL1tvTPbW9pOPNIhA==
X-Received: by 2002:a05:690c:6c01:b0:81e:ba6b:a099 with SMTP id
 00721157ae682-81ef262b90amr14612937b3.60.1784319779988; Fri, 17 Jul 2026
 13:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <ajUm2SQtMD6Y-K9S@mail-itl> <alZt_boT-hJuVlD6@mail-itl>
In-Reply-To: <alZt_boT-hJuVlD6@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 17 Jul 2026 21:22:47 +0100
X-Gm-Features: AUfX_myLV60zgTm9GGSEQi9CVxhoqCTqIB63RgwvFxBuwpvHTHzPJIYTQLwAXac
Message-ID: <CAHt6W4eBibmZ3fXd=sW4=nbuYV1QQMCQzEX=L7FaqL5aXeOvGQ@mail.gmail.com>
Subject: Re: domU crash when resuming from suspend - Xen 4.22
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1784319781-766FB4E9-97D1FF36/0/0
X-purgate-type: clean
X-purgate-size: 5124

On Tue, 14 Jul 2026 at 18:12, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Jun 19, 2026 at 01:24:09PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >
> > I'm continuing testing 4.22 and found this:
> >
> > When a domU is suspended (even without host suspend) it crashes on
> > resume with:
> >
> >     [   24.374629] BUG: kernel NULL pointer dereference, address: 00000=
00000000020
> >     [   24.374647] #PF: supervisor read access in kernel mode
> >     [   24.374657] #PF: error_code(0x0000) - not-present page
> >     [   24.374668] PGD 0 P4D 0
> >     [   24.374675] Oops: Oops: 0000 [#1] SMP NOPTI
> >     [   24.374685] CPU: 0 UID: 0 PID: 19 Comm: migration/0 Not tainted =
6.18.31-1.qubes.13.fc41.x86_64 #1 PREEMPT(full)
> >     [   24.374705] Stopper: multi_cpu_stop+0x0/0x140 <- __stop_cpus.con=
stprop.0+0x6f/0xb0
> >     [   24.374723] RIP: 0010:multi_cpu_stop+0x63/0x140
> >     [   24.374734] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 0=
0 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 7=
5 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> >     [   24.374764] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> >     [   24.374775] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 000=
0000000000404
> >     [   24.374790] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 000=
0000000770ef0
> >     [   24.374801] RBP: 0000000000000002 R08: ffffc900000abc80 R09: fff=
fc900000abc8c
> >     [   24.374813] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fff=
fffff81835ac0
> >     [   24.374825] R13: 0000000000000000 R14: 0000000000000000 R15: 000=
0000000000000
> >     [   24.374837] FS:  0000000000000000(0000) GS:ffff88809b369000(0000=
) knlGS:0000000000000000
> >     [   24.374850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     [   24.374860] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 000=
0000000770ef0
> >     [   24.374873] PKRU: 00000000
> >     [   24.374877] Call Trace:
> >     [   24.374884]  <TASK>
> >     [   24.374891]  ? __pfx_multi_cpu_stop+0x10/0x10
> >     [   24.374900]  cpu_stopper_thread+0xa3/0x170
> >     [   24.374908]  ? __pfx_smpboot_thread_fn+0x10/0x10
> >     [   24.374917]  smpboot_thread_fn+0xf3/0x220
> >     [   24.374925]  kthread+0xfc/0x240
> >     [   24.374933]  ? __pfx_kthread+0x10/0x10
> >     [   24.374940]  ? __pfx_kthread+0x10/0x10
> >     [   24.374949]  ret_from_fork+0x158/0x170
> >     [   24.374957]  ? __pfx_kthread+0x10/0x10
> >     [   24.374965]  ret_from_fork_asm+0x1a/0x30
> >     [   24.374973]  </TASK>
> >     [   24.374978] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq=
 snd_seq_device snd_timer snd soundcore cfg80211 rfkill vfat fat xenfs binf=
mt_misc nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_=
conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl=
_common intel_uncore_frequency_common intel_pmc_ssram_telemetry intel_vsec =
polyval_clmulni ghash_clmulni_intel xen_netfront xen_privcmd xen_gntdev xen=
_gntalloc xen_blkback xen_evtchn fuse loop nfnetlink ip_tables overlay xen_=
blkfront
> >     [   24.375064] CR2: 0000000000000020
> >     [   24.375071] ---[ end trace 0000000000000000 ]---
> >     [   24.375080] RIP: 0010:multi_cpu_stop+0x63/0x140
> >     [   24.375089] Code: 49 0f a3 1c 24 41 0f 92 c6 c7 44 24 04 00 00 0=
0 00 31 ed 49 8d 5f 24 eb 2d 41 83 fd 02 74 6e 41 83 fd 03 74 49 f0 ff 0b 7=
5 13 <41> 8b 47 20 41 8b 77 10 83 c0 01 41 89 77 24 41 89 47 20 41 83 fd
> >     [   24.375115] RSP: 0018:ffffc900000abe30 EFLAGS: 00010046
> >     [   24.375124] RAX: 0000000000000000 RBX: ffffc90000a13de4 RCX: 000=
0000000000404
> >     [   24.375142] RDX: 0000000000000040 RSI: ffffffffffffffff RDI: 000=
0000000770ef0
> >     [   24.375155] RBP: 0000000000000002 R08: ffffc900000abc80 R09: fff=
fc900000abc8c
> >     [   24.375170] R10: 0000000000000000 R11: ffff88801e81cdc0 R12: fff=
fffff81835ac0
> >     [   24.375184] R13: 0000000000000000 R14: 0000000000000000 R15: 000=
0000000000000
> >     [   24.375200] FS:  0000000000000000(0000) GS:ffff88809b369000(0000=
) knlGS:0000000000000000
> >     [   24.375214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     [   24.375226] CR2: 0000000000000020 CR3: 000000000d6a2002 CR4: 000=
0000000770ef0
> >     [   24.375241] PKRU: 00000000
> >     [   24.375247] Kernel panic - not syncing: Fatal exception
> >     [   25.417403] Shutting down cpus with NMI
> >     [   25.417447] Kernel Offset: disabled
> >
> > There is no change on the Linux kernel side (neither dom0 nor domU), th=
e
> > only change is updating Xen 4.19.4 -> 4.22-rc2 (seems to be already
> > broken on -rc1 too). This happens for both HVM and PVH domains. Haven't
> > tried PV domU (but dom0 survives host suspend).
>
> Any ideas?
>

Hi,
   not many ideas but while testing my libxenguest changes I found
similar failures using xl create/save/restore. But I was testing more
PV guests.
Does 4.21 work ?

Frediano

