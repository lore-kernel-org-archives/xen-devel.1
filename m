Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E88F94CB0
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 22:16:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289503.1569435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJNo-0008ET-Do; Tue, 21 Apr 2026 22:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289503.1569435; Tue, 21 Apr 2026 22:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJNo-0008EM-Av; Tue, 21 Apr 2026 22:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1289503;
 Tue, 21 Apr 2026 22:15:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJNm-0008EG-RT
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:15:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJNm-004wr3-4u
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:15:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f713-e002-0a2a0a5209dd-0a2a4501e340-2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:15:50 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f714-c1f2-0a2a45010019-aceafc1faaa0-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:15:49 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D0B924398A;
 Tue, 21 Apr 2026 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C38AC2BCB0;
 Tue, 21 Apr 2026 22:15:47 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776809747;
	bh=NfBjnF3RMsUTEmScq9PdBZRS6CXEDdg+7HmbQnO8qxo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R2bYwOXyngl7K8YMlwELC+H3KmwMPxDNGPvAnwtynguqOQLPwx0rEmH+fRKumO7+H
	 iDWROpX0Qc91c3+KZq/1QDz0FzBU6q7H0O0T2NQ9Ybq7l9PFAeOGx0aS7Jkfanx2+o
	 y2vUnnV424ZqgVusAhXqlcAKeWswdbO0fuURUIgRrN5rboJLT+aqnkQJptyRB+SmxD
	 M4FNIqxLmpnDfz6dUmPYuBWjavgWolv7wpnSIeJCqvejWkHZgFiE6At8aCtPS5SKMD
	 CazwAbbxj584SiM49PRLUYOW9YqhJ5uMCXW3SPHeBQogSlr3WwtEsaS8q+4XrMAjlO
	 hnz4oWHY6GHjg==
Date: Tue, 21 Apr 2026 15:15:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Thomas Huth <thuth@redhat.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 interface.h
In-Reply-To: <20260421142701.548978-1-thuth@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2604211513030.2712345@ubuntu-linux-20-04-desktop>
References: <20260421142701.548978-1-thuth@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d62444/1776809750-BD66FFF4-29793DDF/0/0
X-purgate-type: clean
X-purgate-size: 1743

On Tue, 21 Apr 2026, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I haven't been closely following the __ASSEMBLER__ vs __ASSEMBLY__
discussion. If there is general agreement to use __ASSEMBLER__ in
headers, I am happy to go along with that. Currently, I see more than
140 uses of __ASSEMBLY__ compared to fewer than 20 uses of
__ASSEMBLER__, but I'll defer to your judgment if the project is moving
in that direction.


> ---
>  Note: This patch has been split from an earlier patch series of mine
>  to ease reviewing.
> 
>  include/xen/arm/interface.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/xen/arm/interface.h b/include/xen/arm/interface.h
> index c3eada2642aa9..61360b89da405 100644
> --- a/include/xen/arm/interface.h
> +++ b/include/xen/arm/interface.h
> @@ -30,7 +30,7 @@
>  
>  #define __HYPERVISOR_platform_op_raw __HYPERVISOR_platform_op
>  
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  /* Explicitly size integers that represent pfns in the interface with
>   * Xen so that we can have one ABI that works for 32 and 64 bit guests.
>   * Note that this means that the xen_pfn_t type may be capable of
> -- 
> 2.53.0
> 

