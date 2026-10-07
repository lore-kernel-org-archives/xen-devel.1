Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA23CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:59:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442523.1660084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEU2e-0007XY-9D; Wed, 07 Oct 2026 15:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442523.1660084; Wed, 07 Oct 2026 15:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEU2e-0007XR-4f; Wed, 07 Oct 2026 15:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1442523;
 Wed, 07 Oct 2026 15:58:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEU2c-0007XL-Ma
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:58:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEU2c-001hKG-0k;
 Wed, 07 Oct 2026 15:58:50 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEU2b-003PQY-2u;
 Wed, 07 Oct 2026 15:58:50 +0000
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
	bh=jR8JWj+lE7x4RrahFD+kLgeeLgo2Ww30CzL7fgVm0nw=; b=opbeA5OzcUEGZ1zbIADnF77th9
	v/bw1QuH+d7veTn4OEunf5Cxz+KLb5uMEIwGvfziSzIKYxiaItbLrJlFJn+kSrMgcnIoYMraYLUym
	Z5HS9FxyegwnAjU4IkKSE7BuxMvRrFK+oZ2X7l9nSC9lleLPWUcJPRl8QhH8P1xAhDWo=;
Date: Wed, 7 Oct 2026 17:58:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 03/18] x86/mm: prepare destroy_perdomain_mapping() for
 per-vCPU perdomain areas
Message-ID: <asZsNzkRSctOxCNs@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-4-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-4-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:36AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> We want to change per-domain mappings to be per-vCPU mappings.  In
> preparation for that, we want to arrange that
> destroy_perdomain_mapping() work either with a single perdomain area,
> or with a per-vCPU perdomain area.
> 
> The one remaining caller, free_compat_arg_xlat(), is already in a vCPU
> context, so we just need to change the parameter from a domain pointer
> to a vCPU pointer.

Without the linear mapping usage this is now a non-functional change,
I would possibly state that on the commit message.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

