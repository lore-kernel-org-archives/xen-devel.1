Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE197C5B574
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 07:48:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387979.1629191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthDd-00012u-C4; Tue, 11 Aug 2026 07:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387979.1629191; Tue, 11 Aug 2026 07:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthDd-00012n-7q; Tue, 11 Aug 2026 07:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1387979;
 Tue, 11 Aug 2026 07:48:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wthDc-00012h-Az
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 07:48:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthDb-00GI3u-0k;
 Tue, 11 Aug 2026 07:48:14 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthDa-008A7l-1z;
 Tue, 11 Aug 2026 07:48:14 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=oXJmNSnU5V7rY/kwedMvqgDw8RAbb8RVEHCCWmM35dg=; b=CvBJMdBsShf/vPkbA7cJP2207t
	qm+6ImerU8RBj+fesqRwM9s0M+rjnlNTA+sLV+KiryUKauBTkYLdTw5IiOISYry8vFEOjwzS8mDJK
	vFhBD+Iil3Zgur+7MEq5Ufq5SL8Saaer32nOAFYtT+o6XhOTed8XxdYQRVRJPnRaKUt0=;
Date: Tue, 11 Aug 2026 09:48:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v4 2/2] xen/console: add compile-time rate-limiting
 controls
Message-ID: <anrTtS1LKOVbvFwl@macbook.local>
References: <20260729072520.1556970-1-dmukhin@ford.com>
 <20260729072520.1556970-3-dmukhin@ford.com>
 <annMNjOodiS3hHp7@macbook.local>
 <annM2322Ig23p4RG@Mac.lan>
 <anoQv9sWca/mLWQR@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anoQv9sWca/mLWQR@kraken>

On Mon, Aug 10, 2026 at 10:56:15AM -0700, dmukhin@ford.com wrote:
> On Mon, Aug 10, 2026 at 03:06:35PM +0200, Roger Pau Monné wrote:
> > On Wed, Jul 29, 2026 at 12:25:20AM -0700, dmukhin@ford.com wrote:
> > > From: Denis Mukhin <dmukhin@ford.com> 
> > > 
> > > Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> > > for configuring rate-limiting policy at the compile time.
> > > 
> > > Use symbols for global rate-limiting initialization in the console driver.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > Changes since v3:
> > > - added note on security support for non-standard configurations
> > > - gated menu with EXPERT
> > > 
> > > I kept both settings for now.
> > > ---
> > >  xen/common/Kconfig         | 36 ++++++++++++++++++++++++++++++++++++
> > >  xen/drivers/char/console.c |  6 ++++--
> > >  2 files changed, 40 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > > index da80fdba8469..749d3bfb08e0 100644
> > > --- a/xen/common/Kconfig
> > > +++ b/xen/common/Kconfig
> > > @@ -672,4 +672,40 @@ config PM_STATS
> > >  	  Enable collection of performance management statistics to aid in
> > >  	  analyzing and tuning power/performance characteristics of the system
> > >  
> > > +menu "Console rate-limiting"
> > > +	visible if EXPERT
> > 
> > No strong opinion, but there's a drivers/char/Kconfig which might be a
> > more natural place for those option to live, and then there's no
> > reason for the extra menu?
> 
> I had the knob initially in drivers/char/Kconfig, but moved to
> common/Kconfig to address Jan's feedback:
> 
>   https://lore.kernel.org/xen-devel/2eba7de1-a8e2-4c45-affb-8ecb91278707@suse.com/

OK, as I said, I don't have a strong opinion.  I think we want to keep
drivers/char/Kconfig for console driver specific options, but not
generic console related parameters.

Thanks, Roger.

