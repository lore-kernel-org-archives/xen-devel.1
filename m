Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C2FC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:46:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414069.1643907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZTk-0001Fg-Ha; Thu, 10 Sep 2026 07:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414069.1643907; Thu, 10 Sep 2026 07:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZTk-0001FZ-Eo; Thu, 10 Sep 2026 07:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1414069;
 Thu, 10 Sep 2026 07:45:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4ZTi-0001FR-Ja
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 07:45:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZTg-007zvy-1d;
 Thu, 10 Sep 2026 07:45:48 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZTg-006F4X-3D;
 Thu, 10 Sep 2026 07:45:48 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=qUqpvrLm01bEV3rqQHuL2VV7JdXjeU4C+n/Ocjhb0yM=; b=gVBDZQArKMxHixqEo2I9uxhHkH
	gnsi+cgsfacGGtmnYCqoifCJ9YnpbMqQrMl70GcKO40bJOwswyMKZhVLKlI27j92tYQzieqNNUU79
	mwqIGRKraPtqQrJsSWka613MqMNBOkX3xtKaQ7PZuX9V8kwyx9Us90ul6Ikhb/UIhZlM=;
Date: Thu, 10 Sep 2026 09:45:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 03/12] x86/shadow: eliminate unused forms of
 sh_map_and_validate_gl<N>e()
Message-ID: <aqJgKmGI0YkrXunB@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <9c4e5674-e79e-4623-b87c-ada690778ffa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c4e5674-e79e-4623-b87c-ada690778ffa@suse.com>

On Fri, Aug 28, 2026 at 09:00:57AM +0200, Jan Beulich wrote:
> The L2H, L3, and L4 forms only have GUEST_PAGING_LEVELS=4 call sites, i.e.
> their 2- and 3-level forms are unreachable, violating Misra rule 2.1. The
> L2H form additionally is unused (call site DCE-d) with PV32=n.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Looks like a net win in the number of ifdefs.

Thanks, Roger.

