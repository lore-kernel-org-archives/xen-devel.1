Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715F2C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 16:52:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC9864DF9
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 16:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC9864DF9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77259.139826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AXG-0007Vb-B7; Thu, 28 Jan 2021 16:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77259.139826; Thu, 28 Jan 2021 16:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AXG-0007VU-6l; Thu, 28 Jan 2021 16:52:46 +0000
Received: by outflank-mailman (input) for mailman id 77259;
 Thu, 28 Jan 2021 16:52:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5AXE-0007VI-Na
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:52:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5AXE-00026K-MO
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:52:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5AXE-00041C-LV
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:52:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l5AX6-0004u2-QW; Thu, 28 Jan 2021 16:52:36 +0000
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
	bh=y0IP/50Tma6j8kAOk794FGHMly13GPM8p8QfrGCT8aQ=; b=ib9FxI3JfbdqhTXKUuVTU1Rwg0
	PPqTldR4kakHeyUmozfSZn9I7CHCZa16330MjYFuE9bPm55L+IJgyhvWTov8iC6MfmhN+mSvRjyt6
	8IRHIbrA0z/xolFrdFKdCqi5eDvp3SUIvMzjyGPJ1Tc93JYGKW5d016UuOa0HF9JqXuA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24594.60372.576668.147641@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 16:52:36 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Paul Durrant <xadimgnik@gmail.com>,
    Wei Liu <wl@xen.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen-release-management doc: More info on schedule
In-Reply-To: <cf93f027-e831-8fcb-7539-c9ed0c7585d9@suse.com>
References: <20210128163538.13922-1-iwj@xenproject.org>
	<cf93f027-e831-8fcb-7539-c9ed0c7585d9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] xen-release-management doc: More info on schedule"):
> On 28.01.2021 17:35, Ian Jackson wrote:
> > -The Xen hypervisor project now releases every 8 months. The actual release date
> > -depends on a lot of factors.
> > +The Xen hypervisor project now releases every 8 months.  We aim to
> > +release in the first half of March/July/November.  These dates have
> > +been chosen to avoid major holidays and cultural events; if one
> > +release slips, ideally the previous release cycle would be shortened.
> 
> s/previous/subsequent/ ?

No, we should go back in time and retrospectively not have slipped
after all :-).

> Lgtm apart from these - feel free to translate to an ack if you
> think one is needed.

Thanks for the review.  I have put your ack on it indeed and will push
it in a moment.

Ian.

