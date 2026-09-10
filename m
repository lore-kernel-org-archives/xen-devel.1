Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0CC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:55:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414089.1643926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Zcd-0003Ya-Iv; Thu, 10 Sep 2026 07:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414089.1643926; Thu, 10 Sep 2026 07:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Zcd-0003YT-Fp; Thu, 10 Sep 2026 07:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1414089;
 Thu, 10 Sep 2026 07:55:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4Zcc-0003YN-Fi
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 07:55:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Zca-00807d-34;
 Thu, 10 Sep 2026 07:55:01 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Zcb-006j5N-1J;
 Thu, 10 Sep 2026 07:55:01 +0000
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
	bh=ZeLEtSI+pTw804a0+0vh7wmdpkxtV8MoRKXGVeME87M=; b=eWE1qF9KzqSNwU61M1bQGNb9eh
	u7k7ATuzl6OAm0p7529GmUqUFqv/1Ona+RxDEiP1fKzqcbSK7p326ZY7EDjhXKmrpjzZfGdS5zZQr
	ftRl9UWl1Owj44BOwSmc6LI+2WLPSGZP6Pn4pR2AWUpXbTgFWwJDDlcK9wkHYy+j1HfI=;
Date: Thu, 10 Sep 2026 09:54:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 11/12] x86/HVM: address Misra 2.1 rule violations
Message-ID: <aqJiUv7FbLPPMzcj@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <65330fe2-0a0d-4b70-a647-27290d0041e0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65330fe2-0a0d-4b70-a647-27290d0041e0@suse.com>

On Fri, Aug 28, 2026 at 09:05:43AM +0200, Jan Beulich wrote:
> In hvm_set_cr3() the "bad_cr3" label is reachable only with
> SHADOW_PAGING=y; the code being there is therefore a Misra rule 2.1
> (unreachable code) violation when SHADOW_PAGING=n.
> 
> Similarly code past the initial switch() in hvm_debug_op() is reachable
> only when CONFIG_INTEL_VMX=y.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

