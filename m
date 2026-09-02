Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B6C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:27:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405187.1638722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fNS-0002RF-I7; Wed, 02 Sep 2026 07:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405187.1638722; Wed, 02 Sep 2026 07:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fNS-0002R8-Dj; Wed, 02 Sep 2026 07:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1405187;
 Wed, 02 Sep 2026 07:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1fNR-0002R2-Is
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:27:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fNR-001mxE-0a;
 Wed, 02 Sep 2026 07:27:20 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fNQ-00EwVS-1n;
 Wed, 02 Sep 2026 07:27:20 +0000
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
	bh=cVKgxywC1O2zSO0F9vjmJuAEozgqi3gcnsXP3MlROuc=; b=1qksZ6gstlC5xBb2PauzSir3sj
	Claw11wj8EXIcnjKFiouuASmpux14HNwcbYemUtgqx2PzC5oFY/dzfl9RwNps2fT8czAow3rwY5l4
	eUX1SL+nNqI7QGTMvmbP/UMQcfqaXMk80O0eGRMPYrhGLz+Vqtx6LhnepYzcGKO9YNPM=;
Date: Wed, 2 Sep 2026 09:27:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/alternatives: mark .altinstructions r/w
Message-ID: <apfPz0njzKVwJ22s@macbook.local>
References: <a16d4079-cd8c-4eca-8a60-3cef40173cfd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a16d4079-cd8c-4eca-8a60-3cef40173cfd@suse.com>

On Wed, Sep 02, 2026 at 09:15:46AM +0200, Jan Beulich wrote:
> Forever since the introduction of the .priv member it has been wrong to
> record the section as r/o.
> 
> .alt_call_sites, otoh, is legitimately r/o, hence
> __alt_call_sites_{start,end}[] would better reflect that.

Right, we don't however have a .init.rodata section, and hence it gets
placed in the .init.data section which is r/w.  No objection about the
addition of const, it's the right thing.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

I think you want:

Fixes: 4008c71d7af2 ("x86/alt: Support for automatic padding calculations")

Thanks, Roger.

