Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025B9C4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 14:04:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E1B610FF
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 14:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7E1B610FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168837.308304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGieq-0004Vu-26; Thu, 19 Aug 2021 14:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168837.308304; Thu, 19 Aug 2021 14:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiep-0004Vn-V4; Thu, 19 Aug 2021 14:04:35 +0000
Received: by outflank-mailman (input) for mailman id 168837;
 Thu, 19 Aug 2021 14:04:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGieo-0004Vh-Tp
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:04:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGieo-0000ok-S6
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:04:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGieo-0004Py-R2
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:04:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGiel-0001uY-Dq; Thu, 19 Aug 2021 15:04:31 +0100
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
	bh=aiChozqk8NtZcHheZOm5sKFiXHDJq5xPxzof/ZAuA58=; b=SkwoF0OydS/wM4L1Zx/EpMLd+B
	0ptdTTpls1zDUUUo6p62mPS00+jEkxMbBrEZfz8e7twEK4lXhQovPy6U/omrE+AIH+YertFPYjSKY
	b86gHZ+juis0anehxGFfp+jeiY/+xrT9dqG6FB8lSfR/1x4AMnyWRpZn3hQmi27NxQkw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.25839.173006.316105@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 15:04:31 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.md: Explicitly desupport pvgrub1; and support
 grub-pv
In-Reply-To: <caa66294-1beb-959f-c117-53562a0d00f7@suse.com>
References: <24862.23463.360542.801702@mariner.uk.xensource.com>
	<20210819132617.10668-1-iwj@xenproject.org>
	<caa66294-1beb-959f-c117-53562a0d00f7@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH] SUPPORT.md: Explicitly desupport pvgrub1; and support grub-pv"):
> Probably, yes. OTOH keeping just old binaries should work without
> any problem. This might be worth considering.

Mmm.

> > +### x86/HVM pvgrub1 (aka stubdom pv-grub)
> 
> s/HVM/PV/

Oops, fixed in my tree.

Ian.

