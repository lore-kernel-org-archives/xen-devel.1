Return-Path: <SRS0=Bsih=IA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2003BC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  2 Mar 2021 12:28:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7C364F7A
	for <xen-devel@archiver.kernel.org>; Tue,  2 Mar 2021 12:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7C364F7A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.92322.174202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH48Q-0006YE-33; Tue, 02 Mar 2021 12:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92322.174202; Tue, 02 Mar 2021 12:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH48Q-0006Y7-04; Tue, 02 Mar 2021 12:28:18 +0000
Received: by outflank-mailman (input) for mailman id 92322;
 Tue, 02 Mar 2021 12:28:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH48O-0006Y2-D3
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:28:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH48O-0004SU-8i
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:28:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lH48O-0002ZY-7W
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 12:28:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lH48K-0007Q3-UP; Tue, 02 Mar 2021 12:28:12 +0000
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
	bh=qYeYni0fVxOwJMUANxe21QD/smSLcjBLuyfubwGjUUg=; b=rNrK90XRZMxIfrYr5XtoilNAzw
	AOrnQqC9Q0G90oIHob3IlIo4I2fBLCyKdHQfCcv/PqEEP+0jl4SQTdp9IbNKY4Di8lSNjITFESUMA
	wy8wrq6d1s8L0tlAmTPhXqmH2iBT65H/bMpAPu/8WZjGF3rvSILW779DuxJFaVuR4Utk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24638.12124.687863.290191@mariner.uk.xensource.com>
Date: Tue, 2 Mar 2021 12:28:12 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
In-Reply-To: <7b4c0c51-5a3c-b9bb-7c9c-62285095183b@suse.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
	<1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
	<24637.4165.400955.400473@mariner.uk.xensource.com>
	<7b4c0c51-5a3c-b9bb-7c9c-62285095183b@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
> On 01.03.2021 17:03, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
> >> In this case the compiler is recognizing that no valid array indexes
> >> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
> >> ...)), but oddly enough isn't really consistent about the checking it
> >> does (see the code comment).
> > ...
> >> -        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
> >> +        if ( this_cpu == cpu )
> >> +            continue;
> >> +        /*
> >> +         * Guard in particular against the compiler suspecting out-of-bounds
> >> +         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
> >> +         * is the 1st of these alone which actually helps, not the 2nd, nor
> >> +         * are both required together there).
> >> +         */
> >> +        BUG_ON(this_cpu >= NR_CPUS);
> >> +        BUG_ON(cpu >= NR_CPUS);
> >> +        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
> >>              continue;
> > 
> > Is there some particular reason for not putting the BUG_ON before the
> > if test ?  That would avoid the refactoring.
> 
> I want it to be as close as possible to the place where the issue
> is. I also view the refactoring as a good thing, since it allows
> a style correction as a side effect.

I'm afraid that at this stage of the release I would prefer changes to
be as small as reasonably sensible.  So unless there is some
reason, other than taste, style or formatting, could we please just
introduce the new BUG_ON and not also do other refactoring.

Ian.

