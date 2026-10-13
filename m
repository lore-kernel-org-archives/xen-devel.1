Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEECC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:09:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447997.1663962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGe7X-0004Fj-Gj; Tue, 13 Oct 2026 15:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447997.1663962; Tue, 13 Oct 2026 15:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGe7X-0004Fc-D3; Tue, 13 Oct 2026 15:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1447997;
 Tue, 13 Oct 2026 15:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGe7V-0004ER-NY
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGe7V-00000003Qvw-2d6l;
 Tue, 13 Oct 2026 15:08:49 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGe7U-00000002NA6-2fym;
 Tue, 13 Oct 2026 15:08:49 +0000
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
	bh=zrMIdH8hBmD1+odGiJwmQINQWdwA3ihIbKHe38IxbyU=; b=Q0bsAVvztm0x6B88FBmc5FntT4
	zP0RuHGU5dZfwuRbm8rHa9XhJqWZijqlEDNVMvG2tIrRcOLAyixA48CIqk4Zf/A7efUYCyyLR3hfH
	Qjd694sqDfBU2smZW7uy/9z3yMBpRchdi51sBp7bajHvK4N7pq3hTMQbqWVA8T9HQI/o=;
Date: Tue, 13 Oct 2026 17:08:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
Message-ID: <as5Jfsrg4HJxaIEp@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
 <as42mhs42tvU9XIL@Mac.lan>
 <5756a0b2-9480-4f31-ab0a-e23fd0ee080b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5756a0b2-9480-4f31-ab0a-e23fd0ee080b@suse.com>

On Tue, Oct 13, 2026 at 04:53:11PM +0200, Jan Beulich wrote:
> On 13.10.2026 15:48, Roger Pau Monné wrote:
> > On Mon, Oct 12, 2026 at 10:21:55AM +0200, Jan Beulich wrote:
> >> pvh_populate_p2m() needs to populate RAM according to the initial map
> >> established, prior to any stealing by pvh_steal_ram(). Subsequently the
> >> invocations of those functions will (need to) move ahead of
> >> pvh_populate_p2m(), so what to act on is no longer Dom0's memory map at
> >> the time of invocation.
> > 
> > But (most of?) the uses of pvh_steal_ram() expect to access the stolen
> > RAM, and hence using pvh_steal_ram() ahead of pvh_populate_p2m() is
> > not a present use-case?
> > 
> > I assume you have a further use-case for pvh_steal_ram() that wants to
> > steal a range before it's populated, which might be worth mentioning
> > here, to add a bit more context?
> 
> I thought that I'm saying just that already with "Subsequently ...". All
> that logic needs splitting: Obtain a range ahead of populating, access
> the range only afterwards.

OK, it wasn't obviously clear from the message.  I would possibly
explicitly mention that it's just the allocation that's moved ahead,
the access must be kept after pvh_populate_p2m().

> >> @@ -1389,6 +1395,15 @@ int __init dom0_construct_pvh(const stru
> >>  
> >>      iommu_hwdom_init(d);
> >>  
> >> +    nr_orig_e820 = d->arch.nr_e820;
> >> +    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
> >> +    if ( !orig_e820 )
> >> +    {
> >> +        printk("No memory for copy of E820 map (%u entries)\n", nr_orig_e820);
> > 
> > For some of the printks during dom0 PVH construction we already print
> > the domain (%pd), and I think it would be good to print it here also.
> > Some not-yet-upstream uses (hyperlaunch) create several domains using
> > this logic, it would be good to easily spot which domain triggered the
> > errors.
> 
> Can do, sure. That'll be a little inconsistent then for a while; maybe
> I should add a patch adjusting all printk()s I didn't otherwise touch.

It's kind of inconsistent already, see for example the messages at the
top of dom0_construct_pvh().  I won't request that you fix the
existing ones, but it would be better if new additions print the
domain as part of the message.

Thanks, Roger.

