Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F4EC4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:07:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CD26108D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 13:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84CD26108D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168770.308139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhl7-0008Nk-P0; Thu, 19 Aug 2021 13:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168770.308139; Thu, 19 Aug 2021 13:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhl7-0008Nd-Lz; Thu, 19 Aug 2021 13:07:01 +0000
Received: by outflank-mailman (input) for mailman id 168770;
 Thu, 19 Aug 2021 13:07:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhl7-0008NW-1n
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:07:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhl6-00081Y-V5
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:07:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhl6-0006kf-UA
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:07:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGhl1-0001jM-PH; Thu, 19 Aug 2021 14:06:55 +0100
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
	bh=yBGGiBTG9U92F2kmdQ+naj8M8aX3+zTHxiwFc6W6kc8=; b=VH5HaSK5lipUC2vyF5SSKC8Mtb
	YfD9Y1u3+oSLwbh1XQhgrTkeciXZB7so6B4zeCfFWEXNXwA9D2PQzVz3N2tRjyE9ZVFi8Hno83xUo
	3bDp7BJEpc4Ziv/MEDwgCjb/BBH3IPkXaA02gFZQ7d4/AC3p6qBjZTOMTZTDzdgLwJ2s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.22383.344815.571655@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 14:06:55 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
In-Reply-To: <771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
References: <osstest-164237-mainreport@xen.org>
	<63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
	<24862.21094.866583.748384@mariner.uk.xensource.com>
	<771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [xen-unstable test] 164237: regressions - FAIL"):
> Does this mean we should de-support pvgrub? Or even remove it?

I think so.

> BTW, I don't see any reason why someone would want to keep using pvgrub
> with grub-pv being available...

Precisely.

Ian.

