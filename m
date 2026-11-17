Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E811606A334
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=GBgooajt
Received: from list by lists.xenproject.org with outflank-mailman.1492129.1692825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGWX-0004S7-Ak; Tue, 17 Nov 2026 10:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492129.1692825; Tue, 17 Nov 2026 10:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGWX-0004S0-8A; Tue, 17 Nov 2026 10:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1492129;
 Tue, 17 Nov 2026 10:34:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTGWW-0004Ru-5x
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:34:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGWV-00000002sr3-2ZJm;
 Tue, 17 Nov 2026 10:34:47 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGWV-0000000APJq-3VB3;
 Tue, 17 Nov 2026 10:34:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=uInqVrVM1tAi8C/oJxb5tEcjdjRSy/IsqJ2YER+UJG0=; b=GBgooajtcNhVfvIYi+fFD0JZ59
	oXty79qkv3kGuTIDCOet8jWX4UmFTL8igpn1eDD+/nZZF79NoPQ3mwQ8ZT9o6Wlo7F1EEKh46kp5U
	N6KXfIaHMkuSGc4JakuPHVUql4NOoyp4Zx4gE1KxrVAsZH6oRZALfSCJjLAjf8mqxIX8=;
Date: Tue, 17 Nov 2026 11:34:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 3/4] x86/MSI: drop redundant checking
Message-ID: <avwtxQQ1FGFquEta@Mac.lan>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <297da05f-756d-4af2-8784-5af3355ee121@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <297da05f-756d-4af2-8784-5af3355ee121@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:24:32PM +0100, Jan Beulich wrote:
> __pci_enable_msi{,x}() are local helpers of pci_enable_msi(). That one
> already checks for pdev to be non-NULL, and it also asserts the necessary
> locking state. msi_capability_init() in turn is a local helper of
> __pci_enable_msi().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monne <roger@xenproject.org>

Thanks, Roger.

