Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F84606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=t8h55R7l
Received: from list by lists.xenproject.org with outflank-mailman.1454689.1668185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsZ1-0002tC-IZ; Mon, 19 Oct 2026 18:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454689.1668185; Mon, 19 Oct 2026 18:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsZ1-0002t5-FB; Mon, 19 Oct 2026 18:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1454689;
 Mon, 19 Oct 2026 18:58:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xIsZ0-0002sz-I1
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:58:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xIsZ0-000000021lY-2Jt9;
 Mon, 19 Oct 2026 18:58:26 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xIsZ0-0000000H1LX-0rno;
 Mon, 19 Oct 2026 18:58:26 +0000
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
	bh=2V75F28umQ7nU9A5a7X/2ueN6/PybeYSHghsuaipgis=; b=t8h55R7lMF/uYsBKS3sbbYTWBN
	TubWUuq8ykI/kdwHfWYh/KE26DwH7FFg9z+Fltji25t7zolpESL+zSdd/qkNEGgKWRW5ru4TGUIUg
	HBY8uivJR9CDvljx0GNJiJqZRmPnFISQDkH+DpG/d7zNt9XTpwfgx81GqwcRw0HvWiCs=;
Date: Mon, 19 Oct 2026 20:58:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/shstk: Fix possible crash while enabling Shadow
 Stacks
Message-ID: <atZoSz16waAvDlPw@Mac.lan>
References: <20261019155959.883789-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019155959.883789-1-andrew.cooper3@citrix.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:59:59PM +0100, Andrew Cooper wrote:
> Between writing MSR_S_CET.SHSTK_EN and establishing SSP using RSTORSSP or
> SETSSBSY, there must not be any CALL or RET instructions.
> 
> Building Xen with -fno-early-inlining causes wrmsr() to become out-of-line,
> and thus suffers #DF during boot.
> 
> Make the MSR and shstk helpers always_inline.  They ought to have been this
> way all along.
> 
> Reported-by: Roger Pau Monné <roger@xenproject.org>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Sorry seems like I'm a bit slow today.  Also worth adding:

Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks").

Thanks, Roger.

