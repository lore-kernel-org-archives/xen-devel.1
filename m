Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB011C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:10:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C712242A
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C712242A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71649.128461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H0G-0001iR-Tx; Wed, 20 Jan 2021 17:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71649.128461; Wed, 20 Jan 2021 17:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H0G-0001iK-QH; Wed, 20 Jan 2021 17:10:44 +0000
Received: by outflank-mailman (input) for mailman id 71649;
 Wed, 20 Jan 2021 17:10:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H0F-0001iF-GL
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:10:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H0F-0005dJ-A6
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:10:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H0F-0005dr-8M
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:10:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2H08-0006VA-QW; Wed, 20 Jan 2021 17:10:36 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=MiNUFUX3zmBHmVnDDyYzGKbJufhLs6U9gDvEbvRqb9Q=; b=iKgFLJpjHqSCVD/wIBmMB4N6q7
	uuqwxtfpnAqt1G59ve1+kXJBk9B/AmVpFB2Yas3xk9Hsc7e1t6/EFlKYK5UiVHn8e+i6m9U7zzDNY
	MRGUHVwQYr/+1h+S7nB/Pi+8KahOiY5mpvQhhE+rCGuac+P7W1gVn4EZFDdzn9EqSqsQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.25612.523093.188718@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 17:10:36 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
In-Reply-To: <20210120165615.GB5035@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<20210112181242.1570-16-bouyer@antioche.eu.org>
	<20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
	<24584.17302.958286.788145@mariner.uk.xensource.com>
	<20210120151321.GB4175@antioche.eu.org>
	<24584.19725.745755.464840@mariner.uk.xensource.com>
	<20210120165615.GB5035@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] libs/light: make it build without setresuid()"):
> On Wed, Jan 20, 2021 at 03:32:29PM +0000, Ian Jackson wrote:
> > Yes, the dm is qemu.  If qemu restriction is not supported, that makes
> > a big difference.  The complex situation here is to do with trying to
> > kill a possibly hostile qemu.
> 
> Hum, I'll have to check this (how to check, BTW ?).
> I assumed qemu was running as root but it may not be completely true.
> Especially as I notice, now that I'm re-reading the patch, that
> we're doing a kill to -1. If we were doing so as root, user processes
> would be killed.

It may well be that this whole piece of code won't be executed on
NetBSD becauwe dm restriction will be off.

The background: dm restriction is a set of arrangements for trying to
run qemu without given it any more privilege than it needs, and
certainly not ultimate privilege over the host.  This is quite
complicated and includes running it as a non-root user, chroot, and so
on.

On Linux it's run in its own network namespace, so that a qemu
compromised by the guest cannot access host daemons.  IDK what
facilities one might want to use on NetBSD to try to contain qemu.

This seems to me all a matter for future work.  I'm sorry that code
for a feature you're not going to be benefiting from is getting in
your way.

> > (One option for making this work would be to simply disable the
> > killing by uid on NetBSD.  But I don't think that's a good answer
> > because killing by uid after eg setuid is more reliable even if it is
> > not 100% bulletproof.  So switching to setuid or maybe setreuid is the
> > right answer.)
> 
> This would have to be checked, but I don't think a non-root process
> can ptrace a process whose saved-user-id is root.

If I remember rightly the saved-set-id is reset by setuid.  But I
could be wrong.  This stuff is all quite complex :-/.

> Actually I think I could mimic the setresuid() with setreuid() and seteuid().

My last mail had in it a thing that claims to be a proof that this is
not possible.

But I'm hoping we can avoid this.

> > > OK so if I understand properly, you say Xen should not be used on NetBSD ?
> > 
> > I'm sorry to have offended and discouraged you.  That was not my
> > intention.  My apologies for sending an off-putting message.  For the
> > avoidance of any doubt, definitely don't think that.  We should make
> > this work properly.
> > 
> > Would you be willing to look into the two points I mention above and
> > send a revised version of the patch ?  If you find the refactoring
> > awkward I or Roger can help.
> 
> Actually I don't see how I could split this in a different file, without
> lot of duplicate code (even in just kill_device_model_uid_child(),
> we're talking of about 7 lines of code out of 75). So some guidance here
> would be welcome.

I think splitting it out at precisely the function needed is probably
better.

Can you try this experiment: what happens if you replace the call to
setresuid with abort() ?  I think you may find it all works, because
you're not using that code path.

If so then I suggest introducing

  int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid);

which would call setresuid on Linux and on NetBSD would do this

  assert(!"setresuid is not available on NetBSD, and dm restrction is not supported, so this code path should not have been reached")

What do you think ?

Ian.

