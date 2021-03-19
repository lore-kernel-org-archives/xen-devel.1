Return-Path: <SRS0=uIhg=IR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51196C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 13:48:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1497C64EE1
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 13:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1497C64EE1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.99269.188642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFUb-0001hp-Ko; Fri, 19 Mar 2021 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99269.188642; Fri, 19 Mar 2021 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFUb-0001hi-GA; Fri, 19 Mar 2021 13:48:45 +0000
Received: by outflank-mailman (input) for mailman id 99269;
 Fri, 19 Mar 2021 13:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFUZ-0001hd-PZ
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:48:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFUZ-0004Hj-N8
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:48:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lNFUZ-00015B-MB
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:48:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lNFUT-0008FZ-8H; Fri, 19 Mar 2021 13:48:37 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=ZmFMA9Nxjl+/tOWcMNDm7X+CTkHhLSqQuSouR4BKC80=; b=cCJzX2wjRvDYDeXEBAedQyusgn
	8/A4YsGfkK9jszvOr4XvQ+RcerDZ70LvPqSDZ83xEKU8hnG8wYFoIY3Cjy8zCp1Y8TigwjGrH7zrZ
	wictq/ZRiUo0PPCklSswtQIDq7MyRZUEXfG7kt1pLZYkU85Ru4/+wCBy5Uhop7koIboY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24660.43957.65406.857669@mariner.uk.xensource.com>
Date: Fri, 19 Mar 2021 13:48:37 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
In-Reply-To: <24660.42333.417431.528632@mariner.uk.xensource.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
	<b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
	<24658.6228.390535.850901@mariner.uk.xensource.com>
	<e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
	<24660.42333.417431.528632@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: Call for tools backports (was Re: preparations for 4.13.3)"):
> Andrew Cooper writes ("Re: Call for tools backports (was Re: preparations for 4.13.3)"):
> > These are general backport requests, not specifically for 4.13
> 
> Thanks!

I have now applied these, I think each to the appropriate trees.

I went back to 4.11, which is still security-supported, because
several of the oxenstored changes seemed to have some kind of possible
security implications even if they weren't XSA-worthy.  It seemed
better to backport the whole lot for 4.11 and 4.12 than to try to pick
apart which, if any, were security-relevant.

So, thanks for the information.

Ian.

