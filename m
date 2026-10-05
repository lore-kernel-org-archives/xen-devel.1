Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD07DCA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:59:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441064.1658688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDm1w-0006yA-QP; Mon, 05 Oct 2026 16:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441064.1658688; Mon, 05 Oct 2026 16:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDm1w-0006y2-Nf; Mon, 05 Oct 2026 16:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1441064;
 Mon, 05 Oct 2026 16:59:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xDm1u-0006xw-R7
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:59:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDm1t-00G8ic-0a;
 Mon, 05 Oct 2026 16:59:09 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDm1s-003T9H-2R;
 Mon, 05 Oct 2026 16:59:09 +0000
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
	bh=R0vJhkLZq8xTAT6foTBi2Yg2LFhzLDe5AyaqSOrHIWU=; b=YCvD8pMDM4QDTu5D7PivY0JSI7
	CeBg2e0q7W/kJdXAVXaHHl+x1Xp22jxopGhMP9TZGxcT2rr1bzFBpA6hb6FIWFokHXVrNs5kdxOXI
	XqHSOWz3N6GS7RZjG/4iL5/ta46T5+kGO6ooOal9sZ7WegA4ThST+36Vwrpuus05SU0I=;
Date: Mon, 5 Oct 2026 18:59:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 12/14] gnttab: don't cast away constness
Message-ID: <asPXWmwRpzWtHXR9@Mac.lan>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <1f55b457-c8cc-4ef9-ba5a-96e52b95fbbe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f55b457-c8cc-4ef9-ba5a-96e52b95fbbe@suse.com>

On Wed, Sep 02, 2026 at 08:35:47AM +0200, Jan Beulich wrote:
> While _set_status_v2() indeed doesn't alter the grant_entry_header_t it
> is handed a pointer to, _set_status_v1() does. Drop the const from the
> parameter of the latter (and then necessarily also from _set_status()'s),
> while adding const to the local variable of the former.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Could we also use a union in the functions themselves to avoid the cast?

union {
    const grant_entry_header_t *shah;
    uint32_t *raw;
} grant = { .shah = shah };

> ---
> Really I think it would be best if we did away with the raw_shah local
> variables (which looks reasonably simple for at least _set_status_v2()).
> I'm unconvinced that we really need to use ACCESS_ONCE() here. Torn reads
> aren't a problem; what we require is that we look at a stable local copy,
> and that can be achieved by putting barrier() after the reads.

Possibly - I would be fine with that, which kinds of render my
previous suggestion to use a union not very useful, if we can get rid
of those variables in the first place.

Thanks, Roger.

