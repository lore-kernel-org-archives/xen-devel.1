Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FAC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 15:58:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B5964DE5
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 15:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B5964DE5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91756.173069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkva-0006E2-BC; Mon, 01 Mar 2021 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91756.173069; Mon, 01 Mar 2021 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkva-0006Dv-7e; Mon, 01 Mar 2021 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 91756;
 Mon, 01 Mar 2021 15:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-0006Dq-Lr
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-0002y7-Hi
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-00005H-Eh
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGkvU-0004kk-TO; Mon, 01 Mar 2021 15:57:40 +0000
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
	bh=D6ber2Y4v3368Vq2zqGOCcZQ0X8vbXNk5rYjNgWHM7g=; b=moU0gcLGQakxbsDeGu7klJNbOR
	BRNLqyNA8O2H2GS0CJLLONBUo/ij2pBa/5XTD2bfs5hEzP5fYi2xEhGFBdl6Vs5EAu0+EtcT5ORsG
	g5uK5PXvW9rxW7PI/DjBRyEkI0wKoVTcY73SGM8P/h1qIDvoES4cdSb/qrille4VrNqk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.3828.576373.217715@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 15:57:40 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Connor Davis <connojdavis@gmail.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Dario Faggioli  <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1
In-Reply-To: <171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
	<171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1"):
> In this case the compiler is recognizing that no valid array indexes
> remain, and hence e.g. reports:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

