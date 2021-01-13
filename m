Return-Path: <SRS0=UsJP=GQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F65C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:01:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F6023405
	for <xen-devel@archiver.kernel.org>; Wed, 13 Jan 2021 13:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3F6023405
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66480.118080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfmF-0008Km-QG; Wed, 13 Jan 2021 13:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66480.118080; Wed, 13 Jan 2021 13:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfmF-0008Kf-N7; Wed, 13 Jan 2021 13:01:31 +0000
Received: by outflank-mailman (input) for mailman id 66480;
 Wed, 13 Jan 2021 13:01:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0008KZ-Jv
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0004Ar-Fz
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzfmE-0003hj-EH
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:01:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzfmA-00016S-Tx; Wed, 13 Jan 2021 13:01:26 +0000
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
	bh=RLAaFFz16DdmEVDRjOatBrQPJeZzEzcw+5CDygyZh6w=; b=xcgHkb2cwlYraLFR8CetE+z7Yc
	/Iunwek5HK38FMMsFCzd4DONiQH0ycmLXBARVjm3emIg93DlPYKKEsthH3/bynfkybYJXwLCtYIKM
	zysDUzqfQFZL/9dsHrsqT4oN+azYIqz2tEi30OiCQNzMim/yhhJLc8jUU6vhxU2f22kk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24574.61222.420015.914048@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 13:01:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Andrew Cooper <amc96@cam.ac.uk>
Subject: Re: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/
In-Reply-To: <20210113123455.23209-4-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
	<20210113123455.23209-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 3/3] tools: Move memshrtool from tests/ to misc/"):
> memshrtool is a tool for a human to use, rather than a test.  Move it into
> misc/ as a more appropriate location to live.  Also rename it to
> xen-memshare-tool

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

