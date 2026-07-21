Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73664C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 09:41:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367669.1617403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm6yd-0000mI-BW; Tue, 21 Jul 2026 09:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367669.1617403; Tue, 21 Jul 2026 09:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm6yd-0000mB-8Y; Tue, 21 Jul 2026 09:41:27 +0000
Received: by outflank-mailman (input) for mailman id 1367669;
 Tue, 21 Jul 2026 09:41:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wm6yb-0000m5-DR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:41:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wm6yb-000aca-13;
 Tue, 21 Jul 2026 09:41:25 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wm6ya-00FVWe-2O;
 Tue, 21 Jul 2026 09:41:24 +0000
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
Date: Tue, 21 Jul 2026 11:41:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] xen/kexec: Wire up kexec hypercalls for PVH hardware
 domains
Message-ID: <al8-tljQQFOZ_s9M@macbook.local>
References: <20260720185825.2204624-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720185825.2204624-1-andrew.cooper3@citrix.com>

On Mon, Jul 20, 2026 at 07:58:25PM +0100, Andrew Cooper wrote:
> Nothing in do_kexec_op() is PV specific.  Plumb in PVH guests too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> kexec-tools in userspace still has a PV check needing dropping before kexec is
> generally usable for PVH dom0's, but the Xen side should be all fine.

Yeah, I took a look into that but didn't attempt to remove the check.

However, a PVH dom0 would/could have two ways do to kexec:  it could
do a guest-only kexec (like other HVM guests), or a full host kexec
(like PV dom0).  Do we need a switch in kexec tools to signal whether
we want to perform a host vs guest kexec?  Or should we just assume
that a PVH dom0 will exclusively do host kexec?

Thanks, Roger.

