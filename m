Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F769C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:16:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434183.1654285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8aX-0006NW-3l; Fri, 25 Sep 2026 16:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434183.1654285; Fri, 25 Sep 2026 16:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8aX-0006NP-0g; Fri, 25 Sep 2026 16:15:53 +0000
Received: by outflank-mailman (input) for mailman id 1434183;
 Fri, 25 Sep 2026 16:15:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA8aV-0006NF-Kz
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:15:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8aV-00HMDR-0g;
 Fri, 25 Sep 2026 16:15:51 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8aV-00GsE8-23;
 Fri, 25 Sep 2026 16:15:51 +0000
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
	bh=eYkejJAUy11NSkhda+Wu5Oy6aR+cxvWl329PJthFpXg=; b=XavxgSpdkbLs0epWxu9b1gsf+k
	oVfTzzjwvsLibkuMaySDn/vkUjec+A01RiHiYr67foBDKUuJDGCP9iz3AkZr18LfNbS3NEEor4tgS
	VYmf1k9WTw32AJ3rECeV1OLFa20hgwDFGKthIooj7Gh0/MGs7iIBJPSXXd9/eB/cFQEU=;
Date: Fri, 25 Sep 2026 18:15:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 6/6] x86/HVM: drop vector parameter from
 .pi_update_irte() hook
Message-ID: <araeNe2S-8DcETao@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <20d7bba5-33d2-48c0-963e-7ed24e014e21@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20d7bba5-33d2-48c0-963e-7ed24e014e21@suse.com>

On Tue, Sep 08, 2026 at 03:04:05PM +0200, Jan Beulich wrote:
> It's redundant with the struct pirq * being passed, and the vector field
> in struct msi_desc wanting to be cleared can be derived from v (and hence
> pi_desc) being NULL.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

