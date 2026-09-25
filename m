Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E8C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:14:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434175.1654276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8ZD-0005qV-Sz; Fri, 25 Sep 2026 16:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434175.1654276; Fri, 25 Sep 2026 16:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8ZD-0005qL-Nz; Fri, 25 Sep 2026 16:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1434175;
 Fri, 25 Sep 2026 16:14:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA8ZC-0005qF-JY
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:14:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8ZB-00HMCP-2D;
 Fri, 25 Sep 2026 16:14:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8ZC-00Gpay-0Y;
 Fri, 25 Sep 2026 16:14:29 +0000
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
	bh=Vn4DJJINCckapUM/DpeWC5xWnTfz/oIAs/nplnC3Fuc=; b=eEU6VGDFxXBhpCCMN3rglBMX+l
	i7f9LvbuKa6CaP3BoxhiFVshkOccCc2hRF+kh/ZK4DrjB94Iga9oPnkl+dm714YP9UTLeTafNb1im
	0uRl5KV3ewMHBIUvz39+KZfgM6TDVl7FcM8sWeu24oUM9YR1ah1WhzFY40Q51LFKB+S4=;
Date: Fri, 25 Sep 2026 18:14:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 5/6] x86/pass-through: use simpler locking primitives in
 pt_irq_{create,destroy}_bind()
Message-ID: <arad42KgIIfphCWC@macbook.local>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <d9cedc6d-6884-4565-a62e-08bd8aefd236@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9cedc6d-6884-4565-a62e-08bd8aefd236@suse.com>

On Tue, Sep 08, 2026 at 03:03:45PM +0200, Jan Beulich wrote:
> Both functions already assume IRQs to be enabled upon entry, by e.g. their
> acquiring of the domain's event channel lock. Hence like e.g.
> hvm_migrate_pirq() (also called from here) does, saving/restoring of
> EFLAGS.IF isn't necessary (because of the functions called, we can't
> really avoid the saving there).

To clarify this expectation (as code moves around and changes), I
would introduce an explicit ASSERT() that interrupts are enabled.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Preferably with the above:

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

