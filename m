Return-Path: <SRS0=trq0=HZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A057C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 01:22:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BA964E57
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 01:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27BA964E57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88450.166321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMPU-0004mG-7N; Tue, 23 Feb 2021 01:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88450.166321; Tue, 23 Feb 2021 01:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEMPU-0004m8-4J; Tue, 23 Feb 2021 01:22:44 +0000
Received: by outflank-mailman (input) for mailman id 88450;
 Tue, 23 Feb 2021 01:22:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEMPT-0004lo-0m
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 01:22:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6415042-eeff-434c-9f04-58e5e503bc6e;
 Tue, 23 Feb 2021 01:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37FE860232;
 Tue, 23 Feb 2021 01:22:40 +0000 (UTC)
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
X-Inumbo-ID: a6415042-eeff-434c-9f04-58e5e503bc6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614043360;
	bh=oWm6YpCZFokyXFPg4w/nT1ETGWtxM4rWjT0X04AB81s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LE0/8+/pevloD1jA0tvpooneXesJD7l65fVSZIgUi+AkkmrOjn+CFX2eNzibVDw4U
	 GMxeHFFSHkEm/WZId2Z7V8in5o2GqVfmG0iGhaHbwmYcQriT7lHptDA9eQ8s2uJJn4
	 Isl03t2dgqS7P/R6Yjsz6t2MeLBVfoZk9oKsCq15ivW+dgOygur/PW86yq4BpHlG4a
	 QQLylMZijyKDNkI+JVyY8OVlDEwZgb1cFXuCMpqR+CO7kg7wxiuLH1+93b184T7mkd
	 ZMwbprqiYf3BesEasDp8kbH4NpZcFY/r/4Ef+fSLNKadWlLgV+oGPuzSuK8U1lzFNX
	 dNQhvI/kEOh0A==
Date: Mon, 22 Feb 2021 17:22:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, iwj@xenproject.org, 
    ash.j.wilding@gmail.com, Julien Grall <jgrall@amazon.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
In-Reply-To: <b68a644f-8b9c-3e1d-49c6-4058d276228b@xen.org>
Message-ID: <alpine.DEB.2.21.2102221217480.3234@sstabellini-ThinkPad-T480s>
References: <20210220194701.24202-1-julien@xen.org> <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com> <alpine.DEB.2.21.2102221208050.3234@sstabellini-ThinkPad-T480s> <b68a644f-8b9c-3e1d-49c6-4058d276228b@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1073832744-1614025194=:3234"
Content-ID: <alpine.DEB.2.21.2102221722300.3234@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1073832744-1614025194=:3234
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102221722301.3234@sstabellini-ThinkPad-T480s>

On Mon, 22 Feb 2021, Julien Grall wrote:
> On 22/02/2021 20:09, Stefano Stabellini wrote:
> > On Mon, 22 Feb 2021, Jan Beulich wrote:
> > > On 20.02.2021 20:47, Julien Grall wrote:
> > > > From: Julien Grall <jgrall@amazon.com>
> > > > 
> > > > The comment in vcpu_block() states that the events should be checked
> > > > /after/ blocking to avoids wakeup waiting race. However, from a generic
> > > > perspective, set_bit() doesn't prevent re-ordering. So the following
> > > > could happen:
> > > > 
> > > > CPU0  (blocking vCPU A)         |   CPU1 ( unblock vCPU A)
> > > >                                  |
> > > > A <- read local events          |
> > > >                                  |   set local events
> > > >                                  |   test_and_clear_bit(_VPF_blocked)
> > > >                                  |       -> Bail out as the bit if not
> > > > set
> > > >                                  |
> > > > set_bit(_VFP_blocked)           |
> > > >                                  |
> > > > check A                         |
> > > > 
> > > > The variable A will be 0 and therefore the vCPU will be blocked when it
> > > > should continue running.
> > > > 
> > > > vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the CPU
> > > > to read any information about local events before the flag _VPF_blocked
> > > > is set.
> > > > 
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > 
> > 
> > > > This is a follow-up of the discussion that started in 2019 (see [1])
> > > > regarding a possible race between do_poll()/vcpu_unblock() and the wake
> > > > up path.
> > > > 
> > > > I haven't yet fully thought about the potential race in do_poll(). If
> > > > there is, then this would likely want to be fixed in a separate patch.
> > > > 
> > > > On x86, the current code is safe because set_bit() is fully ordered. SO
> > > > the problem is Arm (and potentially any new architectures).
> > > > 
> > > > I couldn't convince myself whether the Arm implementation of
> > > > local_events_need_delivery() contains enough barrier to prevent the
> > > > re-ordering. However, I don't think we want to play with devil here as
> > > > the function may be optimized in the future.
> > > 
> > > In fact I think this ...
> > > 
> > > > --- a/xen/common/sched/core.c
> > > > +++ b/xen/common/sched/core.c
> > > > @@ -1418,6 +1418,8 @@ void vcpu_block(void)
> > > >         set_bit(_VPF_blocked, &v->pause_flags);
> > > >   +    smp_mb__after_atomic();
> > > > +
> > > 
> > > ... pattern should be looked for throughout the codebase, and barriers
> > > be added unless it can be proven none is needed. >
> > And in that case it would be best to add an in-code comment to explain
> > why the barrier is not needed
> .
> I would rather not add comment for every *_bit() calls. It should be pretty
> obvious for most of them that the barrier is not necessary.
> 
> We should only add comments where the barrier is necessary or it is not clear
> why it is not necessary.

Either way is fine, as long as it is consistent. Yeah we don't want to
add too many comments everywhere so maybe adding them only when the
barrier is required could be better.
--8323329-1073832744-1614025194=:3234--

