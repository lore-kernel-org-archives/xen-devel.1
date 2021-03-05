Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AA2C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 16:34:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235DE64F6A
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 16:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235DE64F6A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93900.177372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDOx-0004gv-0k; Fri, 05 Mar 2021 16:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93900.177372; Fri, 05 Mar 2021 16:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDOw-0004go-U2; Fri, 05 Mar 2021 16:34:06 +0000
Received: by outflank-mailman (input) for mailman id 93900;
 Fri, 05 Mar 2021 16:34:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDOv-0004gj-KE
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:34:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDOv-0002Em-CE
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:34:05 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDOv-0000EB-BF
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:34:05 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIDOs-0000Va-2e; Fri, 05 Mar 2021 16:34:02 +0000
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
	bh=BVVbvU6Mxw7mfr6DS/ozDlUqGXS4+6nfrpDLr4KXMEY=; b=HIyToMRUUg9PxJSU3q3AGI6D2r
	Cj2jTCae+q+ynW5XJiBZujWrW2jVQRiYcw7ux3oXA6EXXKRrfPxlU8+jSQrUOVAzH5UjpdFbO5nez
	KrBPZswAz++4oE0MkIte1RluKePYG2XFk4RBmHd1CR0REd1CCLf4M2iOYCI/eoNe6Jn4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.23929.875373.263402@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 16:34:01 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH][4.15?] libxl/ACPI: add missing build dependency
In-Reply-To: <dcba50ca-59da-b7e8-f60a-7efd8ecd052e@suse.com>
References: <dcba50ca-59da-b7e8-f60a-7efd8ecd052e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15?] libxl/ACPI: add missing build dependency"):
> Just like all other object files - wherever *.o is mentioned, *.opic
> also needs mentioning to yield consistent behavior. Otherwise make may
> decide to (re)build the object before recursion into $(ACPI_PATH)/ (to
> update $(DSDT_FILES-y) and ssdt_*.h) was actually finished.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

