Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F3C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 09:41:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401839.1637348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzt5W-0002R5-O2; Fri, 28 Aug 2026 09:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401839.1637348; Fri, 28 Aug 2026 09:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzt5W-0002Qy-Kw; Fri, 28 Aug 2026 09:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1401839;
 Fri, 28 Aug 2026 09:41:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wzt5V-0002Qs-Jm
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:41:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wzt5V-009zth-0d;
 Fri, 28 Aug 2026 09:41:28 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wzt5U-00Gh0O-22;
 Fri, 28 Aug 2026 09:41:28 +0000
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
	bh=U2BG25GqoxZT7zM9nFPfTYkm+YCYfTMQeu4PuwjB3iI=; b=MajoEN+WX4hX9tnyngwM2tV3hc
	4TUHxO+Lh2O/pSYgCET3po020lJNRF7rIWaWWZsHzmTOUjTXtHu3DH/dUKH6MGOeP1co5yoJAxh2S
	OS7lgVfumI0igoWSIAIwFxu7Y+oa9hTXMaVBW3CVwx8i1+8krstnlOruSxp/alKSX/+0=;
Date: Fri, 28 Aug 2026 11:41:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/cpuid: gate the hypervisor PV-only leaf on
 is_pv_domain()
Message-ID: <apFXvKqbWiaopd8X@macbook.local>
References: <20260826072526.767424-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826072526.767424-1-Zhao.Jiaqing@amd.com>

On Wed, Aug 26, 2026 at 03:25:26PM +0800, Jiaqing Zhao wrote:
> Hypervisor leaf 5 is PV-specific, but is gated with !is_hvm_domain(),

I would maybe write "..., but is gated using is_hvm_domain()".

> which stays a runtime test in a build without PV support. Test for a
> PV domain directly so the compiler can discard the leaf when
> CONFIG_PV is disabled.
> 
> Suggested-by: Roger Pau Monné <roger@xenproject.org>
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

