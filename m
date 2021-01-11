Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D30C433E6
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 15:00:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9599227C3
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 15:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9599227C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64936.114858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyygR-0001gF-Rg; Mon, 11 Jan 2021 15:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64936.114858; Mon, 11 Jan 2021 15:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyygR-0001g8-OP; Mon, 11 Jan 2021 15:00:39 +0000
Received: by outflank-mailman (input) for mailman id 64936;
 Mon, 11 Jan 2021 15:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0001g2-Fs
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0006KP-BX
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kyygQ-0006kS-AU
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:00:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kyygN-0003uB-4o; Mon, 11 Jan 2021 15:00:35 +0000
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
	bh=52iqesxvb2TX5g3pwH2QtROtLe6SDQ+EE7+0us7+jRM=; b=mQlDu1ZfUWHRBRWw0o+pyvuF8z
	xFgVyYT2kHeMPTXrxIKWxvM4lYy7/QbmCfSkamLcoLWoMSczJuVT63jnvduVscMbHPnkRBT5k7aHD
	r8AbWLXTGxY7MxAhZ4GCe67Tm1TAd+KEmkex+N63CORssl2EWJIXKIhUqRy/Oe2Ux3YM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24572.26642.803938.622698@mariner.uk.xensource.com>
Date: Mon, 11 Jan 2021 15:00:34 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libxenstat: ensure strnlen() declaration is visible
In-Reply-To: <ae0d2084-75d7-bcd9-33bc-54b846dd5681@suse.com>
References: <ae0d2084-75d7-bcd9-33bc-54b846dd5681@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] tools/libxenstat: ensure strnlen() declaration is visible"):
> Its guard was updated such that it is visible by default when POSIX 2008
> was adopted by glibc. It's not visible by default on older glibc.
> 
> Fixes: 40fe714ca424 ("tools/libs/stat: use memcpy instead of strncpy in getBridge")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

