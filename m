Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A8DC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:04:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388830.1629803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3wF-0004Bd-4i; Wed, 12 Aug 2026 08:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388830.1629803; Wed, 12 Aug 2026 08:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3wF-0004BW-1z; Wed, 12 Aug 2026 08:03:51 +0000
Received: by outflank-mailman (input) for mailman id 1388830;
 Wed, 12 Aug 2026 08:03:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wu3wD-0004BQ-N3
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:03:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wu3wB-000N4t-2f;
 Wed, 12 Aug 2026 08:03:47 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wu3wB-009qz4-0m;
 Wed, 12 Aug 2026 08:03:47 +0000
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
	bh=9jlzanOekz2XXAaJ5zcmQ7sOSxIgj5uoNV+7cGh7kj0=; b=jQ43aNnRbjWUw1cVfyusxAd/Vu
	9uijm1P2Hx/Nd/8F7viornmfoyjX7IAcSthaIrPLOmjBJzIbcUqwD3EHxWbQ1B6H++u5aILpFuJCG
	Xpu6Xf9DtWbR6O4zZucR8QNcJbIFYP7bv0kYPMJNyC0i8X+hsranlzBBiLQ7gxlod7eQ=;
Date: Wed, 12 Aug 2026 10:03:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
Message-ID: <anwo2QtEh9tObNDD@macbook.local>
References: <20260810230359.671587-3-dmukhin@ford.com>
 <anrXvTfBls4flBqK@macbook.local>
 <anuMfq/lDjxbR8Om@kraken>
 <ba78a8a1-6862-41b0-a6a5-cae7eada3627@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba78a8a1-6862-41b0-a6a5-cae7eada3627@suse.com>

On Wed, Aug 12, 2026 at 09:28:46AM +0200, Jan Beulich wrote:
> On 11.08.2026 22:56, dmukhin@ford.com wrote:
> > On Tue, Aug 11, 2026 at 10:05:17AM +0200, Roger Pau Monné wrote:
> >> On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
> >>> +static int __init cf_check misc_init(void)
> >>> +{
> >>> +    register_keyhandler('X', show_hypervisor_info,
> >>> +                        "show hypervisor information", 0);
> >>
> >> "show hypervisor information" seems too generic to me, almost all
> >> debug keys could be defined by this sentence TBH.  I think this needs
> >> to be more specific, but I'm not sure what's the plan regarding this
> >> key.  Is there an intention to print more stuff here, or just the
> >> command line?  Knowing the full set of information to be printed might
> >> help come up with a better name.
> > 
> > I will update to "show_cmdline" since I originally planed to expose Xen
> > command line only so it is possible to better debug a system when dom0
> > becomes almost unresponsive.
> 
> Yet as indicated already on v1 (I think) - a precious debug key character
> for just the command line seems rather wasteful to me. If it's only the
> command line, and if that _really_ needs exposing via a debug key (i.e.
> if there are reasonable scenarios where "xl info" cannot be used), perhaps
> attach it to e.g. the 'h' key output?

I was going to say that we should not overload the 'h' key with
printing a possibly long string, but I see we already print a bunch of
information there, like the buildid and the compiler banner.

One option would be to introduce a new debug character, and move the
printing of the buildid and the banner to that key, together with the
command line.  Then 'h' output will be cleaner and just print the list
of installed handlers.  That would give the new key more content, and
help cleanup the output from the 'h' debug key at the same time.

Thanks, Roger.

