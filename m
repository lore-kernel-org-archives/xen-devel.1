Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C010C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:29:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4938123A9A
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4938123A9A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72870.131344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yNG-0001O3-7k; Fri, 22 Jan 2021 15:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72870.131344; Fri, 22 Jan 2021 15:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2yNG-0001Nw-4J; Fri, 22 Jan 2021 15:29:22 +0000
Received: by outflank-mailman (input) for mailman id 72870;
 Fri, 22 Jan 2021 15:29:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNF-0001Nk-Ba
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNF-0001w6-Ae
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2yNF-0006yE-8U
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:29:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2yNB-000454-Vp; Fri, 22 Jan 2021 15:29:18 +0000
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
	bh=mLcbc6Rf+OzS5Gqo4iZDw6MuvotouOr5njGP/SBkQN8=; b=Yxt9kYbiFCLPH38Kxa+GnspetV
	PWTbgNZ+3VhOKuDzBROqH4RJjlLQj2dX+P4/BDx92msNlQJsgQTzifCtqE153J6XLw2J7BdGKS3xN
	BqrfRqX3SYRgprPhu6GkkdKQTFhGigSkq0lnY71wPkqFO422GfydGPis+Ta+apv07T/Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24586.61261.769737.719390@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 15:29:17 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    "Tamas K  Lengyel" <tamas@tklengyel.com>
Subject: Re: [PATCH v7 03/10] tools/[lib]xl: Add vmtrace_buf_size parameter
In-Reply-To: <20210121212718.2441-4-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
	<20210121212718.2441-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v7 03/10] tools/[lib]xl: Add vmtrace_buf_size parameter"):
> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
> 
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

