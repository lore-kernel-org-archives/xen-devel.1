Return-Path: <SRS0=eVLD=NW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4060FC432BE
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 10:29:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28D66054F
	for <xen-devel@archiver.kernel.org>; Tue, 31 Aug 2021 10:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F28D66054F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.175607.319841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL10u-0007t7-Ge; Tue, 31 Aug 2021 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175607.319841; Tue, 31 Aug 2021 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL10u-0007t0-Dh; Tue, 31 Aug 2021 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 175607;
 Tue, 31 Aug 2021 10:29:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0007su-NW
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0003Qk-Kb
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0007yP-JQ
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mL10n-0004yj-LN; Tue, 31 Aug 2021 11:29:01 +0100
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=37UsOb1XHoPxYG9ArdJjELr2xXmueuwsjfJ3tYrYWlI=; b=pLg/kmYmvZQ0n69eBHuh3CpbSw
	f/Ybqaote7sqN6/20YVZFQfJgChm18d9x2himTFcZ3GyDIQwlYo5E6+fuHllJ6us6pIJkHXqCmT7C
	KIF59mzorVXXAH1R2DN5OIjMYPLjgal6Gnkca2IvZXWBHgLwljH1AU3yHVlehU242sVs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24878.1133.402035.705283@mariner.uk.xensource.com>
Date: Tue, 31 Aug 2021 11:29:01 +0100
To: Jan Beulich <jbeulich@suse.com>
CC: security@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: 4.13..4.15 testing suspended pending XSA-378 fixes
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I had the following irc conversation with Jan.  I wanted to make a record
(in particular, to refer to from the stop files in osstest):

09:36 <jbeulich> Diziet: To give osstest some relief, and to also have fixes 
                 for the XSA-378 fallout have a faster path to an eventual push 
                 (provided they get reviewed / agreed upon), could you please
09:37 <jbeulich> - put the OVMF backport also on 4.11 (which ought to allow 
                 that branch to get a push)
09:37 <jbeulich> - suspend testing on 4.13-4.15 for the time being?
10:46 <@Diziet> jbeulich: I pushed the ovmf fix.  Let me look at the current 
                flights
10:50 <@Diziet> Your point about the XSA fallout fixes is that you would like 
                to have osstest testing putative fixes promptly ?
11:01 <jbeulich> Yes. With all the other branches also getting continuously 
                 tested, the latency for unstable flights to complete is quite 
                 high.
11:02 <jbeulich> And an initial set of fixes has been posted.
11:27 <@Diziet> Done.  I've cancelled one not-yet-started but doomed 4.14 
                flight too

