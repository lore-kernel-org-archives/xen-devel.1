Return-Path: <SRS0=4OGc=HH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F833C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 15:39:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F359650ED
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 15:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F359650ED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81810.151239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83C8-0007z7-LE; Fri, 05 Feb 2021 15:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81810.151239; Fri, 05 Feb 2021 15:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83C8-0007z0-HT; Fri, 05 Feb 2021 15:38:52 +0000
Received: by outflank-mailman (input) for mailman id 81810;
 Fri, 05 Feb 2021 15:38:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83C7-0007yu-CW
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:38:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83C7-0000a6-9Z
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:38:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83C7-0002fl-8q
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:38:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l83C4-0002zq-3e; Fri, 05 Feb 2021 15:38:48 +0000
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
	bh=16mzkL9plM92z0MNgTt2S6zESa+fJFqwk/urzUjR48U=; b=UM2GkWwkcYdSEtRLtDnSgYmTOw
	qet/O8ToqkWIwblC7B5hyHmVOBXxIporn6aaJdbSPmAHi9U6hkvv8AR2BGGzmxU/8ROWJQhiDqTJY
	muhrzJiHnGLlPMZM8FbiiBqz+iAbv1zLqO6bSER2/8jak5h6PGDsHsnCt4bi9UVrysuo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24605.26247.828218.254710@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 15:38:47 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/tests: fix resource test build on FreeBSD
In-Reply-To: <20210205121938.4636-1-roger.pau@citrix.com>
References: <20210205121938.4636-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] tools/tests: fix resource test build on FreeBSD"):
> error.h is not a standard header, and none of the functions declared
> there are actually used by the code. This fixes the build on FreeBSD
> that doesn't have error.h
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Build tested on both Linux and FreeBSD. The risk would be breaking the
> build, but it's already broken on FreeBSD so there's not much to lose.
> Build breakages on Linux will be spotted fast by either osstest of the
> gitlab build.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.  I think this was probably a typo.

Ian.

