Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D81C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 14:51:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5080161041
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 14:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5080161041
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184502.333165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOhrp-0007Uu-KR; Fri, 10 Sep 2021 14:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184502.333165; Fri, 10 Sep 2021 14:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOhrp-0007Un-HO; Fri, 10 Sep 2021 14:51:01 +0000
Received: by outflank-mailman (input) for mailman id 184502;
 Fri, 10 Sep 2021 14:51:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOhro-0007Uh-BI
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:51:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOhro-0000jn-8p
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:51:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOhro-0004tS-7t
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:51:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOhrh-0002pD-U5; Fri, 10 Sep 2021 15:50:53 +0100
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
	bh=pq0J7Mq0GeXOrUXc8cqB0PEiSKid71V0BuwGQP9rSKw=; b=sAGmRavtW8F/wUyC7ptFzAzhse
	YAhJg9TXT8lVOWcWaTMh8qjrB929pDyrWzTFP7m3/Hmpzr+mz8KMHEOYnBuapk5ILyvHV5FA06jzw
	SAcOwNPRzx0egTaauGTjfqtlCk/GJWOJNcylqVXSe+V9o1o355YR3rKgxjhD8fznufPM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24891.28877.607703.662095@mariner.uk.xensource.com>
Date: Fri, 10 Sep 2021 15:50:53 +0100
To: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Stefanov <kevin.stefanov@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS [and 1 more messages]
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <bbde0f13-a1a5-53ed-82eb-704cd5d43178@citrix.com>,
	<affca979-4082-e825-dede-b27b5574631b@suse.com>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
	<20210909163441.44418-3-kevin.stefanov@citrix.com>
	<affca979-4082-e825-dede-b27b5574631b@suse.com>
	<20210909163441.44418-2-kevin.stefanov@citrix.com>
	<bbde0f13-a1a5-53ed-82eb-704cd5d43178@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 1/3] tools/libacpi: Use 64-byte alignment for FACS"):
> The current code is clearly wrong, but happens to work correctly in
> hvmloader because FACS is the first table written and it starts on a
> page boundary.  The logic does not work correctly when libxl passes a
> buffer which doesn't start on a page boundary.
> 
> As a consequence, I'm not sure what to suggest as a Fixes tag here,
> except "the logic has been wrong for 15 years - patch everything".

Jan Beulich writes ("Re: [PATCH 2/3] tools/libxl: Correctly aligned buffer for ACPI tables"):
> But the buffers obtained via libxl__malloc() have no association with
> guest address space layout (or at least they aren't supposed to have).
> That's solely determined by mem_alloc(). I think it is a bug of
> mem_alloc() to determine padding from alloc_currp; it should
> rather/also maintain a current address in guest address space (e.g.
> by having separate alloc_currp and alloc_currv). Not doing so leaves
> us prone to encountering the same issue again down the road. For
> example if higher than page alignment was requested from somewhere in
> libacpi.

I think the two of you are saying roughly the same thing here ?

There was a question about how (and if) this should be backported.
I'm afraid I don't quite follow all the implications, but I doubt that
a a substantial overhaul as described would be a good idea for a
backport.  What is the impact for backports, and can we have a more
targeted fix there ?  Are, in fact, Kevin's original patches, suitable
to fix the issue for stable trees ?

Thanks,
Ian.

