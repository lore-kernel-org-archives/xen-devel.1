Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB26CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:37:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437276.1656122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuUR-0004sd-DT; Wed, 30 Sep 2026 13:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437276.1656122; Wed, 30 Sep 2026 13:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuUR-0004sW-Av; Wed, 30 Sep 2026 13:36:55 +0000
Received: by outflank-mailman (input) for mailman id 1437276;
 Wed, 30 Sep 2026 13:36:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xBuUQ-0004sQ-Qt
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:36:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xBuUQ-006j2I-0R
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:36:54 +0000
Received: from mail-lr2-f35.google.com ([74.125.230.99])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xBuUQ-00D5yA-16
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:36:54 +0000
Received: by mail-lr2-f35.google.com with SMTP id
 38308e7fff4ca-3a5919af2eeso43575801fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=UhRwckzznhEcHWKEuqjedPMlNn4TzhS3JR92hsTl9xQ=; b=fRZ/+HKBYNYgFukw2IrXkaav1r
	RqVLLsow3h/UU8z2qcdSxvskBBo39EQigB3JQyVGBG9BFxYOLT8CImy7gfFZ5X+GCi3W8Np8DVJnC
	tRfbH0k4ApkGAZ3+3iBB5LPYYfocIi3SZPM+UWiErqrfQpGa9IcRyxR3yz9hEv4fyVFM=;
X-Gm-Message-State: AFq9FYLfeib2LEsYZz4yEZ3sKlrmGo1KRPS188LGSVzKY5eUcodwPB8J
	5Byt4DzYCWqtSprOsX6qILtRqCk5xdiu54XB9N/lTIdwom9eJqW6p4jJ3ZLR1IBKZFGYuSAgsJe
	8V7Kcjkhaqlfh/DCmCF8wIuezXxQ0bb4=
X-Received: by 2002:a2e:a7cf:0:b0:3a6:60e0:8b86 with SMTP id
 38308e7fff4ca-3a779184351mr4592441fa.9.1790775413406; Wed, 30 Sep 2026
 06:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260929140542.249693-1-Zhao.Jiaqing@amd.com>
In-Reply-To: <20260929140542.249693-1-Zhao.Jiaqing@amd.com>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 30 Sep 2026 14:36:40 +0100
X-Gmail-Original-Message-ID: <CAFLBxZao+HXmvz6o9zQpbQNB2EmUy12f4zidZqbhCoEmS3dd6Q@mail.gmail.com>
X-Gm-Features: AclHuK_6dibTGOJc5c2O0A1WmrGRBrpfKVdbM1mvbpTQbsw6AC4ANvtBH0vG_hY
Message-ID: <CAFLBxZao+HXmvz6o9zQpbQNB2EmUy12f4zidZqbhCoEmS3dd6Q@mail.gmail.com>
Subject: Re: [XEN PATCH] xen/credit2: let the tickled pCPU pick up the unit it
 was tickled for
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:07=E2=80=AFPM Jiaqing Zhao <Zhao.Jiaqing@amd.com>=
 wrote:
>
> runq_tickle() picks an idle pCPU without taking CSCHED2_MIGRATE_RESIST
> into account, but runq_candidate() on that pCPU still applies it. With
> the unit's credit within CSCHED2_MIGRATE_RESIST of CSCHED2_CREDIT_MIN,
> the tickled pCPU declines the unit because it is not its master, while
> the master has already skipped it as deferred to the tickled pCPU. Both
> go idle and the unit stays runnable on the runqueue with nobody to run
> it.
>
> Seen as a permanent PVH dom0 stall under nested virtualization, where
> dom0 overruns its slice far enough to be clamped at CSCHED2_CREDIT_MIN.
>
> Don't resist migration to the pCPU that was tickled for the unit.
>
> Fixes: 069cf39fb171 ("xen: credit2: make tickling more deterministic")
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> ---
>  xen/common/sched/credit2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 4949606881..3791a8d4cd 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3517,6 +3517,7 @@ runq_candidate(struct csched2_runqueue_data *rqd,
>           * its credit is at least CSCHED2_MIGRATE_RESIST higher.
>           */
>          if ( sched_unit_master(svc->unit) !=3D cpu
> +             && svc->tickled_cpu !=3D cpu

Thanks for this.  This is the right fix; the only issue is that the
comment above this is stale; it needs to be expanded to include the
extra condition you've added here.

With that addressed:

Reviewed-by: George Dunlap <gwd@xenproject.org>

