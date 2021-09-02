Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F8BC83026
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 17:18:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0006460FE6
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0006460FE6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177599.323135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLqLb-0000fi-6b; Thu, 02 Sep 2021 17:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177599.323135; Thu, 02 Sep 2021 17:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLqLb-0000fb-3Q; Thu, 02 Sep 2021 17:17:55 +0000
Received: by outflank-mailman (input) for mailman id 177599;
 Thu, 02 Sep 2021 17:17:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqLa-0000fV-8G
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:17:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqLa-0001T6-6O
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:17:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqLa-0000rf-5N
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:17:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLqLP-0003au-9j; Thu, 02 Sep 2021 18:17:43 +0100
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
	bh=umiEI7GI1ws1A9D4DUyhTQcphKTnzeVma7/jDhfL17Y=; b=u62kLIS/FgD59gVZ9daqK4fLPc
	XSgGpBGAF3SlzgA8WBEwl9yndpiFnBtpfw4nwNDnq8uPvlFWppzPYSeKoMqRHGUj7D8yRcn+j4oO2
	3aHlx4hFMP0TigC2PKqcQSb5JcQ1HdooYxMUpEocyn/+yZTDsdDzHPMwUvPnyACrFcYo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24881.1846.830472.226170@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 18:17:42 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    George Dunlap <george.dunlap@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] libxenguest: avoid allocating unused deferred-pages
 bitmap
In-Reply-To: <3aea7472-6c1d-f786-db5f-ead60eb03240@suse.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
	<61ff4f26-a9cc-d123-98a0-be6c23f21e9b@suse.com>
	<44825600-c27b-34ac-01b2-1ffb5e0bf0be@citrix.com>
	<3aea7472-6c1d-f786-db5f-ead60eb03240@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 04/12] libxenguest: avoid allocating unused deferred-pages bitmap"):
> [stuff]

I have read this conversation several times and it is not clear to me
whether Andrew was saying Jan's patch is bad, or the existing code is
bad.

I'm hesitant to give an ack for an optimisation without understanding
what the implications might be.  Andrew, can you explain what will go
wrong if we take Jan's patch ?

(I amk not really familiar with this area of the code.  If necessary I
could go and read it to form my own opinion.)

Thanks,
Ian.

