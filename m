Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4407C98311
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 09:02:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431910.1653575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fLT-0007gc-Vy; Thu, 24 Sep 2026 09:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431910.1653575; Thu, 24 Sep 2026 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fLT-0007gV-Sr; Thu, 24 Sep 2026 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1431910;
 Thu, 24 Sep 2026 09:02:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x9fLS-0007gP-Rd
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 09:02:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x9fLS-00FE9l-0K;
 Thu, 24 Sep 2026 09:02:22 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x9fLS-006l9O-1t;
 Thu, 24 Sep 2026 09:02:22 +0000
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
	bh=nz7hWmOQzkI5zOz4nbp6z0d6UAAtWrS9kfIiP9sTrKw=; b=5TIHr4qaCJ7mu98+B9TCSLXo5T
	O466VYM+pF5zhCisMOx1zL0oaAd/j1ES0jfIH5TKYdX2BZ80O5EcoF71AeH67YE1ppoefBVJze6S4
	jwplGYqBq5h8MuHmS8x7oufwyRvR+e6JZVDQiGFYZbq/zK2wAeiMCHjmsjdhLyhqYxZk=;
Date: Thu, 24 Sep 2026 11:02:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 3/6] x86/vPCI: tighten locking assertions
Message-ID: <arTnGy24-o79NapH@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <1b8c4276-0031-4a19-9663-b63799f5cf81@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b8c4276-0031-4a19-9663-b63799f5cf81@suse.com>

On Tue, Sep 08, 2026 at 03:02:19PM +0200, Jan Beulich wrote:
> Already when they were introduced, they seemed overly lax. In particular
> anything invoked solely from vpci_{read,write}() can check that the per-
> domain PCI r/w lock is held. There's no need to permit the alternative of
> holding the global PCI devices lock.

I think this was (mostly?) done so that the macro could beused
generically without having to think whether the context is locked by
the pcidev_lock or the domain lock (or possibly both).

> vpci_msi_arch_update()'s sole call site is update_msi(), which in turn is
> solely called from write handling hooks.
> 
> vpci_msi_update(), besides being called from vpci_msi_arch_update() (see
> above), has two further call sites:
> - vpci_msi_arch_enable(), called upon control register writes,
> - vpci_msix_arch_enable_entry(), called solely from update_entry(), which
>   in turn is again called upon control register writes, plus from
>   msix_write(), which read-locks the domain's PCI lock.
> Both arch_enable functions therefore can also have their assertions
> adjusted.
> 
> vpci_msi_disable() is called from
> - vpci_msi_arch_disable(), called upon control register writes, 
> - vpci_msix_arch_enable_entry(), covered above,
> - vpci_msix_arch_disable_entry(), called update_entry() (see above) and
>   upon control register writes.

I was under the impression that the long term plan was to drop the
pcidevs_lock side of ASSERT_PDEV_LIST_IS_READ_LOCKED(), and convert
that assert to check exclusively for the per-domain pci_lock.

However doing it would require assessing (and possibly adjusting) of
all users, which is unlikely to happen.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> With this perhaps the comment near the top of vpci_msix_arch_print() might
> better go away. Thoughts?

I would remove it now - previously it was the outlier and hence
deserved a comment, that's not the case after your change.

Thanks, Roger.

