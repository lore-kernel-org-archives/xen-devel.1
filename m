Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166CBC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405196.1638729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fS8-0004DI-0l; Wed, 02 Sep 2026 07:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405196.1638729; Wed, 02 Sep 2026 07:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fS7-0004DB-Tw; Wed, 02 Sep 2026 07:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1405196;
 Wed, 02 Sep 2026 07:32:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1fS6-0004D5-5j
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:32:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fS6-001n2y-0F;
 Wed, 02 Sep 2026 07:32:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fS5-00FQNO-1d;
 Wed, 02 Sep 2026 07:32:09 +0000
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
	bh=GH8pyiKnuTxeVi4Fbf/zbc4aL42fGhagOTPMBLWcPdA=; b=XPzVjxnSQhk72HQcaAjtyuEnES
	R6mZQgwL2dANGEzMVWTwxpdbe2ew7gKecrQ215kpSlwIXd1lSN7riH2WLxBw45UQzN12fUdyaC5kT
	I2YJhNuvRNGp5PWNolr9QDQN8nvaPDJmUrMxpfWw435jplDbWAnRnPoQJhUMMub0fmts=;
Date: Wed, 2 Sep 2026 09:32:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 1/2] x86/CPU: re-arrange tail of early_cpu_init()
Message-ID: <apfQ9H8NjODTBD4f@macbook.local>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <347cd6bc-e10e-4696-a1d2-1aaa84811370@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <347cd6bc-e10e-4696-a1d2-1aaa84811370@suse.com>

On Wed, Aug 19, 2026 at 01:45:31PM +0200, Jan Beulich wrote:
> Some early setup doesn't need re-doing after ucode load. Move the call to
> initialize_cpu_data() slightly up and add a conditional return point.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> The parameter being named "verbose" may be a little irritating for this
> use, yet renaming would incur extra churn.
> 
> Clearly an alternative would be to split the function. I can't, however,
> seem to be able to think of a good name for the part that would be invoked
> post-ucode-loading. Maybe early_cpu_reinit(), except that calling that
> from early_cpu_init() then still feel somewhat odd.

No strong opinion.  The code that doesn't need redoing seems so little
that splitting this might not (yet?) be necessary.

Thanks, Roger.

