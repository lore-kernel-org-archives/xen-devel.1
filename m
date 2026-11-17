Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AD9606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=Rp1o2ZcB
Received: from list by lists.xenproject.org with outflank-mailman.1492189.1692906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHLh-0007XM-87; Tue, 17 Nov 2026 11:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492189.1692906; Tue, 17 Nov 2026 11:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHLh-0007XF-5W; Tue, 17 Nov 2026 11:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1492189;
 Tue, 17 Nov 2026 11:27:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTHLf-0007X9-PX
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:27:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTHLf-00000002u0Q-0TTo;
 Tue, 17 Nov 2026 11:27:39 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTHLf-0000000BfLj-1HCL;
 Tue, 17 Nov 2026 11:27:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=d09s/lzJCDynT+O9qvChpmkALKmBo83c2gB90GyQkQY=; b=Rp1o2ZcBdtICxv6HVdnvsul7E8
	3hMwfese+2nBE4xs1vUIMXxKtt6nd5h5dm0trCnZzJwwql4FgGrbXXqZfcUzSO52JX3rNEK17DPqN
	4O0XTmTI/VbeophwVUt+rjFuvDSh9ZAddZ/GNhhT8qR0JRbY2iC03A2hekSHhzd7UqTE=;
Date: Tue, 17 Nov 2026 12:27:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/4] x86: tighten PCI-related locking assertions
Message-ID: <avw6KXrXrecmP4_K@Mac.lan>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <5d5bc3c9-79ef-4a80-866b-8c374c4021e5@suse.com>
 <avwvcs256XUGxVOc@Mac.lan>
 <03d0cc4d-98b9-485d-a720-cecd792e113d@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03d0cc4d-98b9-485d-a720-cecd792e113d@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:11:42PM +0100, Jan Beulich wrote:
> On 17.11.2026 11:41, Roger Pau Monné wrote:
> > On Thu, Oct 29, 2026 at 03:25:04PM +0100, Jan Beulich wrote:
> >> With recent changes the .pi_update_irte() hook as well as
> >> {,un}map_domain_pirq() and allocate_and_map_msi_pirq() won't be called
> >> anymore with the global PCI lock held. Convert the assertions to check for
> >> just the domain's PCI lock.
> >>
> >> With that the somewhat ugly ASSERT_PDEV_LIST_IS_READ_LOCKED() isn't used
> >> outside of msi.c anymore, so move the #define there.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger@xenproject.org>
> 
> Thanks. I'm a bit puzzled about your further remarks, though.
> 
> > I agree about keeping a single ASSERT_PDEV_LIST_IS_READ_LOCKED()
> > definitions and dropping the unneeded NDEBUG preprocessor conditional.
> 
> Here you look to agree with ...
> 
> >> ---
> >> It being just two use sites which remain, we may want to do away with
> >> ASSERT_PDEV_LIST_IS_READ_LOCKED() altogether. Thoughts?
> > 
> > IIRC the reason for having this expression was so it could be used
> > everywhere to ensure the domain pdev list was somehow locked (either
> > by pcidevs lock or the per-domain rwlock).
> > 
> > If we now have fine grained control over the locking it possibly makes
> > no sense to keep it.
> > 
> >> (It also isn't
> >> qite clear to me why its #define(s) sit inside an #ifdef: The expression
> >> used ought to be fine to use also in release builds, as it looks.)
> 
> ... this observation, just to ...
> 
> > Hm, I'm not sure.  It looks like the debug expression could be used in
> > non-debug builds.
> 
> ... voice uncertainty here. And then ...

Uncertainty about why debug vs non-debug variants of the expression
were added in the first place :).  I agree with you and see no need
for them.

Thanks, Roger

