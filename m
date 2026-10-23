Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E8606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=y2AzbLjE
Received: from list by lists.xenproject.org with outflank-mailman.1459324.1671292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFrR-0007iG-Ot; Fri, 23 Oct 2026 14:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459324.1671292; Fri, 23 Oct 2026 14:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFrR-0007i9-MF; Fri, 23 Oct 2026 14:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1459324;
 Fri, 23 Oct 2026 14:03:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xKFrQ-0007hz-P7
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:03:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKFrQ-00000009CyB-2vzx;
 Fri, 23 Oct 2026 14:03:08 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKFrQ-0000000Daqu-0yiT;
 Fri, 23 Oct 2026 14:03:08 +0000
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
	bh=Wc3tn8C8x90b0BbNhFnMcCsKHf7Q9nHWOBW+BOOCRJQ=; b=y2AzbLjEQInr/OFjy7S7YAm/HM
	i9XSN6Y0xDserYwO88O8/c+nLPazKSWhr98StlqK1W99qST1ND6sbTUkDw91seZ+6v0quurJ3fDg5
	l9zkHDVvymBYsT46fZs3NByBkVodW6zZpXaSkiguoaV1nExrNIDzG4fJnEMyf0hb/bkY=;
Date: Fri, 23 Oct 2026 16:03:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vcpu: ensure no write when runstate handler is NULL
Message-ID: <attpGYh9A62gwAN4@Mac.lan>
References: <20261023133316.64204-1-roger@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023133316.64204-1-roger@xenproject.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:33:16PM +0200, Roger Pau Monne wrote:
> Both the normal and the compat versions of
> VCPUOP_register_runstate_memory_area allow registering a NULL handler as a
> way to signal deregistration of the previous area, and
> update_runstate_area() will skip the update when the handler is NULL.
> 
> However when handling the VCPUOP_register_runstate_memory_area hypercall
> itself there's an unconditional attempt to update the newly registered
> runstate area, without taking into account whether it points to NULL.  Skip
> such update if the user-provided handle is NULL.

I've added:

Fixes: 705ea2b54c35 ("New VCPUOP_register_runstate_memory_area hypercall.")

Roger.

