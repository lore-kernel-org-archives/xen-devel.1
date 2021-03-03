Return-Path: <SRS0=XTf+=IB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7173C433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Mar 2021 16:14:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7400664EFD
	for <xen-devel@archiver.kernel.org>; Wed,  3 Mar 2021 16:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7400664EFD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.92912.175224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU8P-0008IR-R9; Wed, 03 Mar 2021 16:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92912.175224; Wed, 03 Mar 2021 16:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU8P-0008IK-O7; Wed, 03 Mar 2021 16:14:01 +0000
Received: by outflank-mailman (input) for mailman id 92912;
 Wed, 03 Mar 2021 16:14:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-0008IC-Ev
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-00047r-E9
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU8O-00069t-DN
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:14:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU8L-0002Xc-2d; Wed, 03 Mar 2021 16:13:57 +0000
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
	bh=p4sREm35iyBY7TBcQKfjhYDaCyL95jjsV8ZAUaDmBhg=; b=IaTZrVBmSvi7XsK8IaMwg4rDNu
	mhW2yw3ErixvnhpQa5cG6Zq3gzcaP9TaPFHfkLUzAWjm8YAqWfrxx5Kg1ntc1+jZ6qVHEZAtuBDS9
	SffRCQ3UBy/ioCTxnWtsdqeRn50oy+L6CoSNFj6hK/9zMGR/lShmTJNr8pLi8ZOxQxcM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46532.800022.313673@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:13:56 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: Re: [PATCH XENSTORE v1 10/10] xs: add error handling
In-Reply-To: <20210226144144.9252-11-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-11-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 10/10] xs: add error handling"):
> In case of a failure deep in the call tree, we might return NULL as the
> value of the domain. In that case, error out instead of dereferencing
> the NULL pointer.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
> Reviewed-by: Raphael Ning <raphning@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

