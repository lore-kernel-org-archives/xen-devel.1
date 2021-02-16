Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDEBC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:14:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BEE64E07
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0BEE64E07
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85919.160816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2yz-0001Zv-BE; Tue, 16 Feb 2021 16:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85919.160816; Tue, 16 Feb 2021 16:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2yz-0001Zo-89; Tue, 16 Feb 2021 16:13:49 +0000
Received: by outflank-mailman (input) for mailman id 85919;
 Tue, 16 Feb 2021 16:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0001Zi-Dd
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0004En-C3
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2yy-0004WE-B9
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:13:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2yv-0000lF-0T; Tue, 16 Feb 2021 16:13:45 +0000
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
	bh=xk/YdcwjCHmroxzlKQxTpW5y3R7/G6VMsvaVS7Nkriw=; b=Zv1KGPu1SgOnumJSQ/nbCu1BIB
	R+u/wlNS2/y3jvADIWLqV1J72VHkg2rFrYk/bawK7oCCQCXgU6QBC5tM+levY1NKaYB71NuSTGYP1
	VNmY4vQrM2NaWBoFp3y4t/kpGOf7t9BmIP9Ql0FAVZgoCMP4yCyWP3pgrJIXqf5MCdcE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.61240.746260.35610@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:13:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 09/10] tools/libs: Add rule to generate headers.lst
In-Reply-To: <20210212153953.4582-10-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-10-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 09/10] tools/libs: Add rule to generate headers.lst"):
> abi-dumper needs a list of the public header files for shared objects, and
> only accepts this in the form of a file.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

because it's not run by default, but...

> +headers.lst: FORCE
> +	@{ $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp

Missing set -e.  If the disk fills up temporarily you might get a
partial file here...

> +	@$(call move-if-changed,$@.tmp,$@)

Ian.

