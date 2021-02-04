Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910DFC433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:48:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206DE64F45
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 206DE64F45
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81275.149901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7d7P-0006g0-On; Thu, 04 Feb 2021 11:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81275.149901; Thu, 04 Feb 2021 11:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7d7P-0006fr-Fh; Thu, 04 Feb 2021 11:48:15 +0000
Received: by outflank-mailman (input) for mailman id 81275;
 Thu, 04 Feb 2021 11:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d7O-0006fm-Hs
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:48:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d7O-0001pM-DL
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:48:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d7O-00063e-BY
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:48:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7d7L-0007sH-3j; Thu, 04 Feb 2021 11:48:11 +0000
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
	bh=YvDS7ySZBJgHDZ0Hnqw5KV5m1Cx6XZwdcT2Km+rURow=; b=M3AXYtmL+w9U//xMOisx/JwrcE
	dygWQH8qDj2jcgFSVfq7CFDGWULbwJ7ATmJQ7kn5QfymqDcdyTZ5fJ/iwUWzv5/p6vy7ZU4YbU19D
	UzXLPMvGM1i8UlRLfKOiTDkMcVbxwk5p44PTHCt3saHRYnQrZsoOjihp/MOqmHgIqgB0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24603.57082.898446.82977@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:48:10 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "Stefano  Stabellini" <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
    Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for acquire_resource
In-Reply-To: <20210202190937.30206-1-andrew.cooper3@citrix.com>
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] tools/tests: Introduce a test for acquire_resource"):
> For now, simply try to map 40 frames of grant table.  This catches most of the
> basic errors with resource sizes found and fixed through the 4.15 dev window.

FTAOD

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

