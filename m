Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878DF606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=YDSGspc3
Received: from list by lists.xenproject.org with outflank-mailman.1463378.1674272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4nZ-000089-I0; Wed, 28 Oct 2026 14:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463378.1674272; Wed, 28 Oct 2026 14:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4nZ-00007x-F9; Wed, 28 Oct 2026 14:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1463378;
 Wed, 28 Oct 2026 14:38:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xM4nY-00007l-IS
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:38:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4nY-00000000fBr-2T3W;
 Wed, 28 Oct 2026 14:38:40 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4nY-00000007NCK-0HNw;
 Wed, 28 Oct 2026 14:38:40 +0000
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
	bh=oS10hp55OsDF8FwJ9DfVx7C2kVo6HY5PR1aboUwnmk4=; b=YDSGspc3d+6yO2ua2au6DdIbwP
	SKcO8EyAKG0/qmeWk0q+Q+6y/okrMnb02TKfIC7fV4J0WnFPjKZNlT5hSXmJDuHk1dmbCkvaQNZ8L
	4yTsFCxrOCPJX0d+rD7IK2qsOdvnA89EEQjmgX6+wbT3KsWgbScacYLuIzh+GMBNfT+w=;
Date: Wed, 28 Oct 2026 15:38:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 4/5] x86/vPCI: make better use of "pdev" in
 vpci_msix_arch_print()
Message-ID: <auII7rNEJN-xvkql@Mac.lan>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
 <b21db453-c2ad-4321-8f8f-76d801dfe998@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b21db453-c2ad-4321-8f8f-76d801dfe998@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 30, 2026 at 01:43:34PM +0200, Jan Beulich wrote:
> Move the declaration to function scope, so that not only the (so far)
> immediately following spin_unlock() can make use of it, but also the
> assertions at the top. Also add const, as the pdev itself isn't supposed
> to be altered here.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

