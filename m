Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6F606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=i9jmBhRV
Received: from list by lists.xenproject.org with outflank-mailman.1463384.1674281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4zk-0003Rr-Ia; Wed, 28 Oct 2026 14:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463384.1674281; Wed, 28 Oct 2026 14:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4zk-0003Rj-FY; Wed, 28 Oct 2026 14:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1463384;
 Wed, 28 Oct 2026 14:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xM4zj-0003Ra-CW
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:51:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4zj-00000000fRy-1loB;
 Wed, 28 Oct 2026 14:51:15 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4zi-00000007rlb-3m1w;
 Wed, 28 Oct 2026 14:51:15 +0000
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
	bh=6H19WpD8PUT2zKNPeBfcDZ1hhv3Q7VZOYRatMv7zVwI=; b=i9jmBhRVxeXD7yzpC9TfN4QO6C
	E2gS9RbY/hmfyDmNjipOigO3JOzTpWIGlnbfbulydTXmL9/iBHawYXIL5QVGzzxyBUzSfaEoiOJux
	G6I3/WapGy45Vio+tsRBA4pBWPSrzREXsiH/Y789ul20CxqE04S1kjxe/9p97cNzO54s=;
Date: Wed, 28 Oct 2026 15:51:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 5/5] x86/vMSI: avoid "goto" in msixtbl_pt_unregister()
Message-ID: <auIL4OH2DQZ1F9iU@Mac.lan>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
 <3f19c5e9-d8d2-4752-99a1-b5115c3c862b@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f19c5e9-d8d2-4752-99a1-b5115c3c862b@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 30, 2026 at 01:43:59PM +0200, Jan Beulich wrote:
> "goto" can be helpful in certain situations, yet where easily possible I
> think it's better to avoid its use. With the re-arrangement also restrict
> the scop of two of the local variables, and add const to one of them.
> 
> No functional changed intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

