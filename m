Return-Path: <SRS0=fakL=LQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB8FC2B9F4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 11:38:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFAA613B4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 11:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFAA613B4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.145854.268281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvejJ-0001I5-Cw; Tue, 22 Jun 2021 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145854.268281; Tue, 22 Jun 2021 11:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvejJ-0001Hy-9y; Tue, 22 Jun 2021 11:38:09 +0000
Received: by outflank-mailman (input) for mailman id 145854;
 Tue, 22 Jun 2021 11:38:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-0001Hs-HD
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-0001ds-CZ
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-00028M-Bd
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lvejE-0003Xy-Q3; Tue, 22 Jun 2021 12:38:04 +0100
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
	bh=GuDijgEM/gxBLTHzy3G1iP3qZzBVCe1tc04lGY29Sy8=; b=N30Dc9PXAtoVz2r4lnlERSbagP
	lgEaBLt4pyahPO6AHlk5byJwz7obAzWwJUfOaTCKxQHu2+VF61LLDkxD5KaXbj8fQ0SrKjoj6Yk1f
	lpqCv7gcuQ1dD0FqHYmm6aWoD5ylcrp/zOvnLPtm5mQGMZAAI/pByl+RYBhW5Dg8nL0A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24785.52124.476428.674630@mariner.uk.xensource.com>
Date: Tue, 22 Jun 2021 12:38:04 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/5] libxencall: introduce variant of xencall2() returning
 long
In-Reply-To: <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
	<c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 3/5] libxencall: introduce variant of xencall2() returning long"):
> Some hypercalls, memory-op in particular, can return values requiring
> more than 31 bits to represent. Hence the underlying layers need to make
> sure they won't truncate such values.

Thanks for this.

All 5 patches:

Acked-by: Ian Jackson <iwj@xenproject.org>

Nit:

> While adding the new function to the map file, I noticed the stray
> xencall6 there. I'm taking the liberty to remove it at this occasion. If
> such a function would ever appear, it shouldn't lane in version 1.0.
                                                  ^^^^

Typo for "land", I think.

Ian.

