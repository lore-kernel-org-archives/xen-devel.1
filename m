Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2FEC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 09:38:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401829.1637339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzt28-0000Pc-9l; Fri, 28 Aug 2026 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401829.1637339; Fri, 28 Aug 2026 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzt28-0000PU-6r; Fri, 28 Aug 2026 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1401829;
 Fri, 28 Aug 2026 09:37:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wzt26-0000PN-Mf
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:37:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wzt26-009zoV-1B;
 Fri, 28 Aug 2026 09:37:58 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wzt25-00G23P-2Y;
 Fri, 28 Aug 2026 09:37:58 +0000
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
	bh=V42N1s76PU9hlOX8CkrzYvjBpNAXKMnOiAvs6hvwk5Y=; b=2stE97ZpSlB1WB16qSo8yN4U12
	Y3m9II9uWSkUWkiZ2AoapVAxY3yjz2Y1gFnsBntmfroafVuK45ien498c+y3YPIAiQvue9Odm963b
	AZV9jXAUuNbvB5PfGnRWzkEZdlkzt/0mfC4bVhC4ecfryUoQtPPKAO07pYaVnEN16s8c=;
Date: Fri, 28 Aug 2026 11:37:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: xen-devel@lists.xenproject.org, axboe@kernel.dk,
	linux-block@vger.kernel.org, konrad.wilk@oracle.com,
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Subject: Re: [PATCH] xen/blkback: Prevent missed completion when draining I/O
Message-ID: <apFW7CH1aZasMKiV@macbook.local>
References: <20260730084000.3305702-1-hanguidong02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730084000.3305702-1-hanguidong02@gmail.com>

On Thu, Jul 30, 2026 at 04:40:00PM +0800, Gui-Dong Han wrote:
> xen_blk_drain_io() sets drain before checking inflight.
> xen_blkbk_unmap_and_respond_callback() decrements inflight with
> atomic_dec_and_test() before checking drain.
> 
> The pre-wait condition check was added to avoid missing a completion, but
> atomic_set() is unordered. With one I/O in flight, the drain path can set
> drain to 1 and read inflight as 1 before the completion decrement. The
> completion path then decrements inflight to 0 but can still read drain as
> 0. It skips complete(), so the drain path waits until the timeout despite
> no I/O remaining.
> 
> Add a full barrier between setting drain and reading inflight.
> atomic_dec_and_test() already provides full ordering on the completion
> side.
> 
> Fixes: 6927d92091df ("xen/blkback: Fix two races in the handling of barrier requests.")
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Sorry for the delay, this slipped through the cracks:

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

