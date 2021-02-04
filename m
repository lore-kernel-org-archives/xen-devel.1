Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC28C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:35:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF5E64F43
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF5E64F43
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81265.149850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cuc-0005A5-Jk; Thu, 04 Feb 2021 11:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81265.149850; Thu, 04 Feb 2021 11:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cuc-00059y-Gc; Thu, 04 Feb 2021 11:35:02 +0000
Received: by outflank-mailman (input) for mailman id 81265;
 Thu, 04 Feb 2021 11:35:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cub-00059r-72
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:35:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cub-0001Z1-5E
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:35:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cub-0005Hc-3j
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:35:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7cuX-0007pQ-VN; Thu, 04 Feb 2021 11:34:58 +0000
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
	bh=FPDIdnUNMiMHHy6o6gUtOrv9YXX7IS/ZYDrAN33+SgI=; b=yDiTvQ1DYA3SjMHmBH9fMVBh6d
	gSCFDUHdQu2UZ39gttrgaIKZpx6UVKPOMqW2eOmdGi4nF42o7adBiQT42e1KkAANI0FXxVI67bWFU
	n2jlYu9OcGo8LO8m963ul2TBPo7TefVzJ9bkQc1dTHSXZc3OO8HAPXb96d2W36UCfk8g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24603.56289.723251.263900@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:34:57 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
In-Reply-To: <20210204093833.91190-1-roger.pau@citrix.com>
References: <20210204093833.91190-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] autoconf: check endian.h include path"):
> Introduce an autoconf macro to check for the include path of certain
> headers that can be different between OSes.
> 
> Use such macro to find the correct path for the endian.h header, and
> modify the users of endian.h to use the output of such check.
> 
> Suggested-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> Please re-run autogen after applying.
> 
> The biggest risk for this would be some kind of configure or build
> failure, and we should be able to catch it in either osstest or the
> gitlab build tests.

Thanks.  I agree.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

