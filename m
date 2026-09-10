Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C179EC79FB7
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:36:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414017.1643871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZKZ-0006Lh-3k; Thu, 10 Sep 2026 07:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414017.1643871; Thu, 10 Sep 2026 07:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZKZ-0006La-0w; Thu, 10 Sep 2026 07:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1414017;
 Thu, 10 Sep 2026 07:36:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4ZKY-0006LU-Fa
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 07:36:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZKX-007zkR-0D;
 Thu, 10 Sep 2026 07:36:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4ZKX-005jP5-1f;
 Thu, 10 Sep 2026 07:36:21 +0000
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
	bh=Vy7/5yw5D43SVvElmSodx3WN5su6H6CmFdyMxNAl5s8=; b=Z8wCFOZxiXaF9zinIS8nWs9cnb
	FgeB80T9oYGkppdmwt7f++Enb2qXywAbmT+QhCe4oNEWdgwzpjCNWb4da+vNnnJTp0Y4VkZggjvIl
	zwuH9Rn7s2Oeo2ezv4QjT6tajoNg2y+BCmqFJCjlZV+qexDH2vZgRnEIpeTLrxUlzDcI=;
Date: Thu, 10 Sep 2026 09:36:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 02/12] x86/mm: pagetable_dying() is HVM+SHADOW_PAGING only
Message-ID: <aqJd7wETEZ1MKRSl@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <12b3dd09-7249-47cd-8c66-e0efc1611b14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12b3dd09-7249-47cd-8c66-e0efc1611b14@suse.com>

On Fri, Aug 28, 2026 at 09:00:04AM +0200, Jan Beulich wrote:
> The referenced commit didn't go far enough, leaving a Misra rule 2.1
> (unreachable code) violation: The function lacks "noreturn" in this
> configuration. Since with SHADOW_PAGING=n paging_mode_shadow() is compile-
> time-constant false, the compiler can DCE the call site. Hence we can
> avoid building the function itself altogether.
> 
> No functional change.
> 
> Fixes: 2fb2dee1ac62 ("x86/mm: pagetable_dying() is HVM-only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

