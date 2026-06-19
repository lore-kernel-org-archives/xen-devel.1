Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18B8CD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 14:55:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342444.1602619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waad3-0003Tk-W9; Fri, 19 Jun 2026 14:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342444.1602619; Fri, 19 Jun 2026 14:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waad3-0003Td-TL; Fri, 19 Jun 2026 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1342444;
 Fri, 19 Jun 2026 14:55:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1waad2-0003TX-E2
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 14:55:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waacz-00DTbW-MG
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:55:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a355849-e002-0a2a0a5209dd-0a2a4508878e-34
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:55:29 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a355861-9ee7-0a2a45080019-d155d0b0ec73-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 16:55:29 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39669bcaadfso19584461fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 07:55:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1781880929; cv=none;
        d=google.com; s=arc-20240605;
        b=Xg3HZAeJADRWTAGHuBv0LTFvj2294mYY9P0lHpG+FRaUqVnVi92KLdNnilu31lD2wa
         sPEKl4mVYXuvgEVpBY6DNTDJccggNi71qiyqUYOlg9tgVzGqH0sLtjjj7nfJmK07vmJu
         X5rXaMyv/urIF5mx/J8Tb4nYklK8H3GsckvO4hky5ZbOkPbjg/xdNDRGABYPwpNMiu/p
         nZ50qwfv9QCMyf+XLJjthXc1nXYC3XC7w7tRlfmjQ3+E9801wSdA8n6SJqw4HKy5flmr
         wLAtdhxsX9SSG4I5Ta8GBzEahm7dBpRgF8BdBElc7GiBU14hxSj3eG4t+TrcvOFHlEZE
         SnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmu9QKKfh3nVMnrE7wgqORZB1L1F/iwZCnIMkBW2pGk=;
        fh=aSZkuWeigIJCrae/Wb+6PXZ+hiibTT2ihTXZEANuOJE=;
        b=aLtXlveU0NTx3V2E5gaPy7eHzX0Y9HYUXLbghYIQfIM4c1o90t0/Skydtl9e8+xE6/
         meQfiQDnG4Z0HvF8FVqBFRUZKbOKDUBT/7p94yln4NKMQOiHdufuPhCffkePdkuVdTM/
         h+DmMqUYfBt/WfwAgt39ZeT7Znslo3F0/BSmubEGzWWJuuHYeBSpFY24hQ74idaGQKgB
         OTWRcbWo6z+Bzm/xbAUlHxZXEeIqvuRe6ersTYfLGxlu2h6vvgDAunbtKZDO4Cej7+FN
         HJthE4qi07hXFfWf3a2Tv8mER64qzRKH75nr7+eTmEvCT1RFMYU1NoYmgc8GCPxtpKxU
         ogHg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781880929; x=1782485729; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmu9QKKfh3nVMnrE7wgqORZB1L1F/iwZCnIMkBW2pGk=;
        b=Fxm0/QQGy9o12KPHwki5KzshXQKEqMEJVpyRzOKOzDpWc2+2WOCqDORI7uy+y7SpUp
         7BjN8/u/5COjEf/ArK1krKu/8PGHJWhOaY0tfzclsOtsGqJXB1y5RsplfNeYOkR8hdTC
         uEo+2lNOzuEqQVoyOyuuCLvu1gPGpk79Gva1NjXO6yXvluUbNQnBCucXp634F724E+8G
         9//6U0Xz1xd7APpRWcv9Zao5O1CBU8YD7Oi5TB+P626n7k2kAAFF8o2uAYvuItG/N09d
         9rWqV+JVpWrL9bjxEab/YP/kBeWnjli0I4k+ODvAaxPJMXD8wTGY65FbrXJt7RlzA2Zb
         LEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880929; x=1782485729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmu9QKKfh3nVMnrE7wgqORZB1L1F/iwZCnIMkBW2pGk=;
        b=AVMfRhzvjhWqJV/Zc/401BElsma3ainI8MjxeSLlbu4/+jqYdIDsFrAx4UCmVeqFIE
         u7a217RxrlRTCB+BfttqlZr5Tzj1g8Q90/Bxpfl8gHfUz22ml0/bl+G+M1m5HFocc7md
         loufAkv8QpVMVt3T5njz7RJFiUuimSWbssCdu4SF4Gv6Y2g8k5mhP0rZohK+pyjbhZ6r
         l0TNkhtif9mEVCYFYqwNnRN7x6ECNY3w5CnueeyfgzoCkjeNblNTCSO+mIGjJxNu/AU2
         DpWdpkARNU0nxs58HkYTPEnBXliadfvcHK8JJ7frVO/SSV02c/OCCe1ZGQA/7CvUq7VL
         Digg==
X-Forwarded-Encrypted: i=1; AFNElJ8n80A9uuSmxWcdVFw50neVhbOGOMnFRZJBG6OmkQo6NkZodSO6zrptGl63zpNNDFTp/xKlHpQWNkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVdAui+Vgb2JKVFtPYkj2YAehg4hPgkl2NsRUBRcmJNdQ4IZ2G
	TczOPRIWdHV7NIA6Ou8ie8VxXItUF9x55pfbszDINiiek1IOtMSavxXT/yqBYFGmtgNRQfndfdm
	nl++THmVky9jeW98zxy7U1QiZ9cJ+Zlg=
X-Gm-Gg: AfdE7cl+OGot7WqJE+PPJ8dUPFYdEuYk2nnb9+CsO2qBVYmcegW7zgyMMjUgovDsd8s
	jk8ONAe1J02M58bfwmtFS0noNFO1NsI8GrQpHnbyS81O1WYd4wU/0SjS4Wlu8Uum+CXR1XWNYib
	jSekB+MmAOLluwXd7sFoIOJ716syrjjf72c+ExRE75c1iUKMaCL2VqFwIIzhj/owh2oleDoR0pG
	RUHHUQojLMEosBo/dKBsivJv1crTWNjPHkV3UcMvL32zABB8SmtAB16C313TGdCTu+aDcejnm8E
	Zmo5eQ==
X-Received: by 2002:a05:651c:b28:b0:399:7511:1c21 with SMTP id
 38308e7fff4ca-3998bd67f90mr10516351fa.16.1781880928617; Fri, 19 Jun 2026
 07:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com> <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org> <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
 <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
In-Reply-To: <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 19 Jun 2026 17:55:17 +0300
X-Gm-Features: AVVi8CctgXEH7-Dwulp4yN7zHREYy4v72TMR9cYE_Cv0Lrbu8bBwD4zNTMZz1Ng
Message-ID: <CAGeoDV_LM9hQch5YEqYFA07t76eXKxZRT5tzxMqzWkej5Jwidw@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Julien Grall <julien@xen.org>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1781880929-64A2B0FA-B959F33F/0/0
X-purgate-type: clean
X-purgate-size: 3198

Hi Julien, Oleksii,

On Fri, Jun 19, 2026 at 2:52=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
>
>
> On 19/06/2026 12:34, Orzel, Michal wrote:
> >
> >
> > On 19-Jun-26 13:23, Julien Grall wrote:
> >> Hi Michal,
> >>
> >> On 19/06/2026 10:48, Orzel, Michal wrote:
> >>> @Oleksii, can we ask for a release ack here?
> >>
> >> Can you explain the pros/cons of introducing this patch quite late?
> > The advantage is that it fixes the broken LPIs on affected hardware.
>
>  > The disadvantage is the reordering risk but I don't think there is
> any issue.
>
> See more below.
> >>
> >> One of the risk here is that we are now initializing the LPIs *after*
> >> the ITSes. I understand this is because we want to know the workaround=
.
> >> However, I vaguely recall that there was a dependency in the
> >> configuration. So are we confident the new ordering will not bring oth=
er
> >> issues? Ideally this should have been explained in the commit message.
> > gic-v3-its.c never references host LPI state, so ITS init has no depend=
ency on LPIs.
>
> My concern is at the HW level. The ITS is using LPIs. But we will
> configure the ITS first and then the LPIs.
>
> What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem
> to allocate memory. This is a bit fragile though.

Regarding the ordering concern, the only operation moved by this patch
is gicv3_lpi_init_host_lpis(). It does not program either the
Redistributor or the ITS. It initializes Xen-side host LPI bookkeeping,
registers the CPU notifier, and allocates the boot CPU pending table.

gicv3_its_init() programs the ITS tables and command queue and enables
the ITS, but Xen does not enqueue any ITS command there. The first
MAPC/SYNC commands are issued by gicv3_its_setup_collection().

The relevant hardware-visible sequence in gicv3_cpu_init() therefore
remains:

    gicv3_lpi_init_rdist()       /* program PENDBASER/PROPBASER */
    gicv3_enable_lpis()          /* set EnableLPIs, followed by wmb() */
    gicv3_its_setup_collection() /* issue MAPC/SYNC */

So the ordering introduced by 95604873cc is preserved: no MAPC command
is submitted before GICR_PENDBASER/GICR_PROPBASER have been programmed
and the write setting GICR_CTLR.EnableLPIs has been made visible.

This matches the relevant architectural requirement: while
GICR_CTLR.EnableLPIs is 0, ITS translation requests or commands
involving LPIs in that Redistributor are ignored. This patch changes
when the backing memory is allocated, not when the Redistributor is
programmed or when the first ITS command is submitted.

The benefit of taking this for 4.22 is that it fixes broken LPIs on
systems where an ITS workaround changes the required memory attributes.
The ordering-specific fragility is that this reasoning relies on
gicv3_lpi_init_host_lpis() remaining allocation/bookkeeping-only. I
agree that this implicit dependency should be documented explicitly.

I will respin the commit message to describe this ordering and explain
why the hardware-visible sequence is unchanged.

Does this address your concern about taking the fix for 4.22?

Best regards,
Mykola

