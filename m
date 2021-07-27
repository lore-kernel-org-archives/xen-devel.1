Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF43C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:22:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7261461A0B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7261461A0B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161167.295923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N2I-00050n-U4; Tue, 27 Jul 2021 13:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161167.295923; Tue, 27 Jul 2021 13:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N2I-00050g-Pk; Tue, 27 Jul 2021 13:22:18 +0000
Received: by outflank-mailman (input) for mailman id 161167;
 Tue, 27 Jul 2021 13:22:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N2G-00050a-MW
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:22:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N2G-0005xv-J7
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:22:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N2G-0007Kn-I6
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:22:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N2D-0002Se-6i; Tue, 27 Jul 2021 14:22:13 +0100
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
	bh=iHS1st1/07QQ/fFswWPnFvtUuVTkxRQYLglOfSq5qYg=; b=13ld505HE8wr9uOOebrLJsS65a
	36LG1DtT07pUciZpaMLAlhrBZuH0VVT4xWP2T/KMITJvyEgbPBT9r444CvQAQFz1nEkdma8P4LbAy
	S5tbFjzS27vdhFVBb3bYszd0Zgb6geMXkpjBcho2x7086ngt3092RJlNHWqYDvlvK3ms=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2180.937351.89575@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:22:12 +0100
To: Scott Davis <scottwd@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Scott Davis <scott.davis@starlab.io>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg
In-Reply-To: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
References: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Scott Davis writes ("[XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg"):
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.
> 
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

and queued.

Ian.

