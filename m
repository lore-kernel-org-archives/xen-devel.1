Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C341CC54EFC
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 08:16:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372224.1619604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woczK-0006IS-Ql; Tue, 28 Jul 2026 08:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372224.1619604; Tue, 28 Jul 2026 08:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woczK-0006IL-O5; Tue, 28 Jul 2026 08:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1372224;
 Tue, 28 Jul 2026 08:16:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1woczJ-0006IF-AJ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:16:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1woczJ-00DJsI-0R;
 Tue, 28 Jul 2026 08:16:32 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1woczH-002c8w-21;
 Tue, 28 Jul 2026 08:16:32 +0000
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
	bh=7oGaqfsemSBSrXtzjs1/LsnbYBcTO+WY+Mx/Osl3AA4=; b=fHk7ZnKnNDW9UR4bbTqY6IcFcq
	3cKULKbWQ8Vk5TurSQA02CW7SvCR4esP8A/2EhIwnnzK4CjQxd0ThvdlISXBc7CkBL7Zj0BdNGNPt
	vab0qcT0nCDRMdiRbqLlH4cqkhNwONykJ9qQwb9gdry/LsuPhLuhBpk1JgJXtAHXcn/U=;
Date: Tue, 28 Jul 2026 10:16:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 2/3] x86/Intel: split model-specific freq calculation
 off of intel_log_freq()
Message-ID: <amhlV4FGWcfxcfLV@macbook.local>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <80b20aa4-8954-47ed-85f0-3f09d46717cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80b20aa4-8954-47ed-85f0-3f09d46717cf@suse.com>

On Tue, Jun 30, 2026 at 04:06:21PM +0200, Jan Beulich wrote:
> ..., for that logic to become reusable. While doing so undo the open-
> coding of DIV_ROUND_UP(). Also switch to the new struct cpuinfo_x86 field
> names.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

AFAICT this doesn't introduce any functional change.

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

