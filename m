Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85E7C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 12:17:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A83C64DD8
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 12:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A83C64DD8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80527.147331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ubx-0007mD-IT; Tue, 02 Feb 2021 12:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80527.147331; Tue, 02 Feb 2021 12:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ubx-0007m6-FR; Tue, 02 Feb 2021 12:16:49 +0000
Received: by outflank-mailman (input) for mailman id 80527;
 Tue, 02 Feb 2021 12:16:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ubw-0007m1-Ep
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:16:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ubw-0004fB-BI
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:16:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ubw-0004jL-9e
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:16:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6ubt-000200-35; Tue, 02 Feb 2021 12:16:45 +0000
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
	bh=viDI+kHkzZd9GUY5Vttquz2sCdCxMbggPYxeDQ/Ydp8=; b=zvd3i2hrJGMDtNY99H0YuxZpO8
	GV2RvTtciHOEuIbAjN015mCapsadp5THXcOoQQ24neULOL6vwd6IGyDt616T1qSCGFtqNhVr3U85a
	WEc53qWwbi5tQPl8YAxq8STcavOsbjAwTAnzuZxqBzEC5cTO4y0T3CdY24Hm1DGY+5wM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Message-ID: <24601.17068.666597.295268@mariner.uk.xensource.com>
Date: Tue, 2 Feb 2021 12:16:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    "Tamas K  Lengyel" <tamas@tklengyel.com>
Subject: Re: [PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter
In-Reply-To: <20210201232703.29275-4-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
	<20210201232703.29275-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter"):
> From: Micha³ Leszczyñski <michal.leszczynski@cert.pl>
> 
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
...

Wearing my maintainer/reviewer hat:

Release risk assessment for this patch:

 * This contains golang changes which might break the build or need
   updates to golang generated files.  This ought to be detected by
   our tests so we can fix it.  At this stage of the release that is
   probably OK.  The risk of actually shipping a broken build is low.

 * The patch introduces a new libxl config parameter.  That has API
   and UI implications.  But it is a very small change and the
   semantics are fairly obvious.  The name likewise is fine.  So I am
   very comfortable with recommending this late addition to these
   APIs.

 * The patch contains buffer size handling code.  In the general case
   that might produce a risk of buffer overruns.  But at least here in
   this patch this is actually just the configured size of a buffer,
   and actual length/use checks are done elsewhere, so this is is not
   a real risk.

Ian.

