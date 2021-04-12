Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AEEC43460
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 10:12:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058106101D
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 10:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058106101D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.108893.207771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtYT-0004IX-Lh; Mon, 12 Apr 2021 10:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108893.207771; Mon, 12 Apr 2021 10:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtYT-0004IQ-HZ; Mon, 12 Apr 2021 10:12:29 +0000
Received: by outflank-mailman (input) for mailman id 108893;
 Mon, 12 Apr 2021 10:12:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0004IL-Nq
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0002Ru-Mx
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lVtYS-0001nn-LO
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:12:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lVtYN-0001p0-P4; Mon, 12 Apr 2021 11:12:23 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=pAYIduxS3HtVbvf2kSC+TLaNmCWJAl5JKz6Z2jv7TUY=; b=V0I3+y7N5My2X0dsziwU1UV5Y0
	DjQfWASZZkWx8snU158/vwug/Dc7rm8IHd2R+jyLfBgguWnZ0v0gjawfSJqdaspsSH9dMCmmyOEZn
	UUsW/fXJNcaKWm+w2junS3GPW0ChUmDEgy4ShVn6CMxRadRo79h5CXHfLIn/qpY986FY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24692.7431.556782.870034@mariner.uk.xensource.com>
Date: Mon, 12 Apr 2021 11:12:23 +0100
To: Jan Beulich <jbeulich@suse.com>
CC: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Commit moratorium on staging-4.15 lifited
In-Reply-To: <24687.11032.872713.894725@mariner.uk.xensource.com>
References: <24684.14467.302145.214064@mariner.uk.xensource.com>
	<24687.11032.872713.894725@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: Commit moratorium on staging-4.15"):
> Please hold off pushing to staging-4.15 until advised.  I need to
> do post-release updates do the version number and README and so on.  I
> plan to do that on Monday.

This is now done.  Backports may be pushed to staging-4.15 by the
stable tree maintainers, subject to the usual processes for stable
maintenance.

I noticed that 4.14 seems to be lacking the MAINTAINERS update so I
will do that now too.

Ian.

