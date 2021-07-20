Return-Path: <SRS0=ej9i=MM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86303C07E95
	for <xen-devel@archiver.kernel.org>; Tue, 20 Jul 2021 16:00:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431CA60233
	for <xen-devel@archiver.kernel.org>; Tue, 20 Jul 2021 16:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 431CA60233
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.158909.292386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5s9w-0007VS-TY; Tue, 20 Jul 2021 15:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158909.292386; Tue, 20 Jul 2021 15:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5s9w-0007VL-Qa; Tue, 20 Jul 2021 15:59:52 +0000
Received: by outflank-mailman (input) for mailman id 158909;
 Tue, 20 Jul 2021 15:59:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0007VF-HI
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0004e2-Es
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m5s9v-0002Lv-EG
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 15:59:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m5s9q-00076G-GN; Tue, 20 Jul 2021 16:59:46 +0100
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
	bh=m6lXHNp84L4qxVdcfu8S6UdlOLXsxk8kwJskYOfOCpI=; b=2bpv9z9PsSjdaFoqb24MW2BJ4Z
	QDxfuQLARhxHuhWCgi4rmj/DKvpeCEklpDFQ46dJTS3on2Rrehy7Q3eWg2y5PDVxCQyC+2wpyKcvi
	ynW0j5iNeN6wHoO0spUHWdLAiixW+z8ryE/4L2G10D4WA0g6eZHDiv5r92kv6rT4CFGE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24822.62194.343959.454998@mariner.uk.xensource.com>
Date: Tue, 20 Jul 2021 16:59:46 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
    <xen-devel@lists.xenproject.org>,
    <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tests/xs: Check asprintf result
In-Reply-To: <048868ab-3291-70d9-791d-325fc79caccd@citrix.com>
References: <20210718135633.28675-1-jandryuk@gmail.com>
	<24822.56879.260780.652184@mariner.uk.xensource.com>
	<048868ab-3291-70d9-791d-325fc79caccd@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] tests/xs: Check asprintf result"):
> On 20/07/2021 15:31, Ian Jackson wrote:
> > fixed this (with slightly different style, and despite not mentioning
> > this change in the commit message)
> 
> ?  Literally half of the commit message pertains to this failure.

Sorry, I meant the title, which talks only about Makefile stuff.

Ian.

