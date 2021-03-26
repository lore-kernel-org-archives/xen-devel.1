Return-Path: <SRS0=uMCZ=IY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78DAC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 12:05:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4266D6194B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Mar 2021 12:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4266D6194B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.101751.194763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlDG-0003kz-It; Fri, 26 Mar 2021 12:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101751.194763; Fri, 26 Mar 2021 12:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlDG-0003ks-Fw; Fri, 26 Mar 2021 12:05:14 +0000
Received: by outflank-mailman (input) for mailman id 101751;
 Fri, 26 Mar 2021 12:05:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDE-0003kh-Hb
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDE-00068I-Fu
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDE-0000jI-F5
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlDB-0002PO-0X; Fri, 26 Mar 2021 12:05:09 +0000
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
	bh=xkq1JLZu1IBIJIyAfG0d5ftkBLcvygCWFDE2TuHqVYQ=; b=lNU47e1zF2qzz6Jfl84d07To5X
	WzWSsvydioGNdeR7Gp2oqI+kINUzWFWtcLNdq83ob6HgaQFNTzYmCnMpVnPm6txDywWbWfKTdlN9d
	mGKRVZhYjclBsJ9ZgvWrY91v+s8G2yEpw3iO6c+xaNkx28hyj39Bh9NIEhyZsevPgfPE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52724.843848.16707@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:05:08 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    raphning@gmail.com,
    jgross@suse.com,
    paul@xen.org
Subject: Re: [PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the documentation for XS_RESUME
In-Reply-To: <20210325180607.13158-1-julien@xen.org>
References: <20210325180607.13158-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15?] docs/misc: xenstored: Re-instate and tweak the documentation for XS_RESUME"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 13dd372834a4 removed the documentation for XS_RESUME, however
> this command is still implemented (at least in C Xenstored) and used by
> libxl when resuming a domain.
> 
> So re-instate the documentation for the XS_RESUME. Take the opportunity
> to update it as there is a user of the command.

This is just docs, so:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

