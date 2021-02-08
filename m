Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC8BC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:37:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4904564DFF
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4904564DFF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82920.153375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98ae-00073m-MJ; Mon, 08 Feb 2021 15:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82920.153375; Mon, 08 Feb 2021 15:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98ae-00073f-Ix; Mon, 08 Feb 2021 15:36:40 +0000
Received: by outflank-mailman (input) for mailman id 82920;
 Mon, 08 Feb 2021 15:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-00073a-Od
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-0006Yi-Kz
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98ac-0003mS-Ja
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:36:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98aX-0002lg-TP; Mon, 08 Feb 2021 15:36:33 +0000
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
	bh=IeKenqTVIrnUaxr0XGlDtL9CPSeaPfsXjev4fLBnT98=; b=Q2N+xm+U52BzBbqq/0RArE+3ID
	YpNBmG72VWHzHvBf896egEFBun2Js+T5eP65WAEJ8SsoY7mkamUBkWOlujocUJJotDub7644f6wHv
	jBHQBElbF+Z+SHZZkhixizMvduhpyWhUu5NtusshASHO/UU0jyeuJcXIGeUpt8CeUZUA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23169.639047.297808@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:36:33 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD  <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] tools: create libxensaverestore
In-Reply-To: <20210208155746.2021dde7.olaf@aepfle.de>
References: <20210111164646.13543-1-olaf@aepfle.de>
	<20210208155746.2021dde7.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v2] tools: create libxensaverestore"):
> Am Mon, 11 Jan 2021 17:46:46 +0100
> schrieb Olaf Hering <olaf@aepfle.de>:
> 
> > Move all save/restore related code from libxenguest.so into a separate library libxensaverestore.so.
> 
> Was this considered, in general, or for 4.15?

I'm afraid we have had a problem with tools review bandwidth, for
which I must apologise on behalf of the project.  This also falls
within one of my own areas of responsibility, but we have had a
shortage of effort in this area for a while now.

Ian.

