Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB8C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 12:29:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414571.1644323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dtz-0004Ys-PZ; Thu, 10 Sep 2026 12:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414571.1644323; Thu, 10 Sep 2026 12:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dtz-0004Yl-M3; Thu, 10 Sep 2026 12:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1414571;
 Thu, 10 Sep 2026 12:29:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4dty-0004Yf-5Z
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:29:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4dtw-0086cH-2d;
 Thu, 10 Sep 2026 12:29:13 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4dtx-009sYG-0s;
 Thu, 10 Sep 2026 12:29:13 +0000
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
	bh=iXPS5Bo+BPvr1CNvxVUEYJd/49ImjH+vF4ef4UYV234=; b=vEjQDnZSE+ikN6fYnKaaPn6ldH
	Ng4rl5IS+prrUEBG2leKdCju1HfvBYvcClGzfPdPCFWX5DDZD6NP5dnDVCer6uShsiL/MRZpx5su4
	repnZR/0r6yHYamvWBPK4DeZGsIn9hNDZoRIJaK/UlDU4hixLvmCDHpAYG/kzjmDfbmE=;
Date: Thu, 10 Sep 2026 14:29:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
Message-ID: <aqKikxvL_6SCs_Cj@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
 <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
 <aqJ4myv4_II75W5K@macbook.local>
 <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>

On Thu, Sep 10, 2026 at 11:52:10AM +0200, Jan Beulich wrote:
> On 10.09.2026 11:30, Roger Pau Monné wrote:
> > On Thu, Sep 10, 2026 at 10:38:34AM +0200, Jan Beulich wrote:
> >> On 10.09.2026 09:49, Roger Pau Monné wrote:
> >>> On Fri, Aug 28, 2026 at 09:02:18AM +0200, Jan Beulich wrote:
> >>>> The use of unreachable(), when unreachability is visible to Eclair (and
> >>>> compilers), is deemed a violation. Drop the redundant statement.
> >>>
> >>> Urg, isn't that something that should be fixed in Eclair then?
> >>> Otherwise all the unreachable() calls in our codebase are likely to be
> >>> found by Eclair sooner or later, and will need to be removed.
> >>
> >> No, aiui most are covered by deviations. In particular ones in BUG() and
> >> ASSERT_UNREACHABLE().
> > 
> > Shouldn't this be a deviation then also?
> 
> Maybe, just that I had no good idea how to express such a deviation (preferably
> without a SAF comment).
> 
> >  Maybe it would be helpful if
> > the commit message states why this is handled differently from other
> > unreachable() instances then.
> 
> I've added "..., , and the one here isn't covered by a deviation" to the first
> sentence. Will that suffice?

TBH, the handling of unreachable() feels inconsistent to me.  I don't
blame you for this, I know you are just trying to fix the remaining
issues.

I guess I will defer the change to someone more familiar with MISRA
and why some unreachable() usages are covered by deviations while
others aren't.

I think the point of adding something to the commit message is to
justify why this is removed vs a deviation being added.

Thanks, Roger.

