Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B3EC98311
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 09:28:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431948.1653592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fkT-0003Bq-2W; Thu, 24 Sep 2026 09:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431948.1653592; Thu, 24 Sep 2026 09:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9fkS-0003Bj-W6; Thu, 24 Sep 2026 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1431948;
 Thu, 24 Sep 2026 09:28:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x9fkR-0003Bd-8y
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 09:28:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x9fkQ-00FFf4-1u;
 Thu, 24 Sep 2026 09:28:10 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x9fkR-008cch-0E;
 Thu, 24 Sep 2026 09:28:10 +0000
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
	bh=2qQjfmwYwMgSFjYQudrNjPJiuxq453V22V7l2VkBGn0=; b=1C0QUS+HA9v6rqqvE+gSLd/uAB
	3O6k4e9CpwshzSnDEK8ruOlI+z3cE0MgRscKXU0GdC7BKCXhzXKRpteKJKenMb+IPhz4hgUyvVaSf
	AbFOi88unrbwL8hI5/4HS+PQgb0iSsV9PDLgJrN8wZEaNcIVexAqbEr848QvkNt5mPKo=;
Date: Thu, 24 Sep 2026 11:28:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH 4/6] vPCI: drop bogus locking assertion
Message-ID: <arTtKCqMn7X4G4sG@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <a6766b40-7798-472a-9f61-dc96aa6b59d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6766b40-7798-472a-9f61-dc96aa6b59d0@suse.com>

On Tue, Sep 08, 2026 at 03:03:17PM +0200, Jan Beulich wrote:
> msix_find() is a local helper, with all callers explicitly acquiring the
> per-domain PCI r/w lock. The checking, which should never have included
> the alternative of holding the global PCI devices lock, therefore is
> pretty much pointless.

Hm, maybe.  I guess we need to put some limits on how much we assert
for correct locking if the callers are all in the same translation
unit.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

I wouldn't have removed it myself, but I'm also not going to oppose.

Thanks, Roger.

