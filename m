Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733CEC433E6
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 11:51:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247CF2311A
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 11:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 247CF2311A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74901.134684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Msv-0006fb-HW; Tue, 26 Jan 2021 11:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74901.134684; Tue, 26 Jan 2021 11:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Msv-0006fU-EX; Tue, 26 Jan 2021 11:51:49 +0000
Received: by outflank-mailman (input) for mailman id 74901;
 Tue, 26 Jan 2021 11:51:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-0006fO-Ma
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-00056I-Js
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4Mst-00089i-II
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:51:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4Msq-0006WS-8r; Tue, 26 Jan 2021 11:51:44 +0000
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
	bh=d8QXjyohNieFUr7gMsxw1DPmtY0Spr73TqonkxwwpEE=; b=tgdLQtPrAx85/VNoF/Iz60+2mm
	GRVZLVZfRmnqXH8a6e6AtwQSKxnwmiVwZ+QVa7n4a8uleJ8jRLYKEbGGeaDL/01Vv0wMxX3GN3VQ1
	VVt4IBeFXrFb1hZrGC+PRJl679rpybrolXrKo8YEt9HBiNwNMDrWmCxGIQ1Nz89zKX7I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.591.978125.717379@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 11:51:43 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 01/15] libxenguest: add get_unaligned_le32()
In-Reply-To: <a6cafbb2-9a85-e83a-7954-de5f8962c9a6@suse.com>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
	<a6cafbb2-9a85-e83a-7954-de5f8962c9a6@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 01/15] libxenguest: add get_unaligned_le32()"):
> Abstract xc_dom_check_gzip()'s reading of the uncompressed size into a
> helper re-usable, in particular, by other decompressor code.
> 
> Sadly in the mini-os case this conflicts with other functions of the
> same name (and purpose), which can't be easily replaced individually.
> Yet it was requested that no full set of helpers be introduced at this
> point in the release cycle. Hence the awkward XG_NEED_UNALIGNED.

How irritating.

> Requested-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

