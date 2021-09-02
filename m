Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D1EC676A8
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:41:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17A061026
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 16:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D17A061026
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177572.323085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpll-00039F-Hx; Thu, 02 Sep 2021 16:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177572.323085; Thu, 02 Sep 2021 16:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLpll-000398-Dt; Thu, 02 Sep 2021 16:40:53 +0000
Received: by outflank-mailman (input) for mailman id 177572;
 Thu, 02 Sep 2021 16:40:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-000392-M4
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-0000fj-LF
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLplk-00019p-KT
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 16:40:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLplf-0003Tl-VM; Thu, 02 Sep 2021 17:40:47 +0100
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
	bh=GYDi4db046fx5JmmXElXDDtxBBBEsA4Th0cEYvzm6zg=; b=2LvnozFAb3yNbpSa4d5bY76QSt
	aKwgZG8n3+bo1Pb0Pusn2VsSSFiPRSTHekGmznA6JKDKyd9z9KlRCFdmoAZh6yc+YghF9/0kc61tc
	uF+RjQOXzouELYRA9waRq5MPmpqFVYl3tnyU8W7y6jh38UREyGtev43sF0Steb7HyYpw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24880.65167.715236.551394@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 17:40:47 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools: ROUNDUP() related adjustments
In-Reply-To: <c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
References: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
	<c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] tools: ROUNDUP() related adjustments"):
> On 10.08.21 12:03, Jan Beulich wrote:
> > For one xc_private.h needlessly repeats xen-tools/libs.h's definition.
> > 
> > And then there are two suspicious uses (resulting from the inconsistency
> > with the respective 2nd parameter of DIV_ROUNDUP()): While the one in
> > tools/console/daemon/io.c - as per the code comment - intentionally uses
> > 8 as the second argument (meaning to align to a multiple of 256), the
> > one in alloc_magic_pages_hvm() pretty certainly does not: There the goal
> > is to align to a uint64_t boundary, for the following module struct to
> > end up aligned.

This is really quite unpleasnt, to my mind.  ROUNDUP taking a bit
length is bad enough, but the magic knowledge about alignment is
really poor too.  It may not be right on all future architectures,
although I think your changae is correct on all the ones we support
(or which people are working on).

So IOW I think your change is correct and warranted, but I really
dislike the code here.

Therefore:

Acked-by: Ian Jackson <iwj@xenproject.org>

> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks for the review!

Ian.

