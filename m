Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B9CC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:32:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428997.1651917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91XH-00018w-7K; Tue, 22 Sep 2026 14:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428997.1651917; Tue, 22 Sep 2026 14:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91XH-00018p-4a; Tue, 22 Sep 2026 14:31:55 +0000
Received: by outflank-mailman (input) for mailman id 1428997;
 Tue, 22 Sep 2026 14:31:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x91XF-00018e-85
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:31:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x91XD-00BBqm-1m;
 Tue, 22 Sep 2026 14:31:51 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x91XE-002cJP-04;
 Tue, 22 Sep 2026 14:31:51 +0000
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
	bh=rZVWmg66vbC05uITk/fmvmFmAIU5kmmNjz+n5/rMt+0=; b=O6I2TSzQQhmDP5MXWQ7nnBe1M8
	+yzYCXTVEwUDIIr+L2TC/3KGNN23d8x21l2QAOWVNtN2/vhm792dKCBoswZcs0cl4iIrkYv6QARLN
	sFi01JHRZIyXvkFY3lhINopHFIDHSJ0gPPXew8tgMbHTaOOyy1cYset81Efo1nFe/0qU=;
Date: Tue, 22 Sep 2026 16:31:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] automation/Eclair: tag directive 4.3 as well as rules
 17.2 and 21.17 as clean
Message-ID: <arKRVTZrQW1FdmlT@macbook.local>
References: <7a9080a2-6411-40f0-be7e-f08909c19501@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a9080a2-6411-40f0-be7e-f08909c19501@suse.com>

On Tue, Sep 22, 2026 at 03:41:48PM +0200, Jan Beulich wrote:
> These have been clean for a while already, without being marked so.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

