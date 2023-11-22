Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A922C61D97
	for <xen-devel@archiver.kernel.org>; Wed, 22 Nov 2023 22:14:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.639216.996253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vTr-0008Tb-7D; Wed, 22 Nov 2023 22:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639216.996253; Wed, 22 Nov 2023 22:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vTr-0008TU-3x; Wed, 22 Nov 2023 22:13:59 +0000
Received: by outflank-mailman (input) for mailman id 639216;
 Wed, 22 Nov 2023 22:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5vTp-0008TM-Bc
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:13:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb83d8c-8984-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:13:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 37B66CE1EC8;
 Wed, 22 Nov 2023 22:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504E9C433C8;
 Wed, 22 Nov 2023 22:13:47 +0000 (UTC)
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
X-Inumbo-ID: 6bb83d8c-8984-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700691228;
	bh=M8Tl3ON+zp5daS+e97ebO8BwuGUFkccW38TlFP6aaxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T5zomco9I/N3EDnr5LE2PSkLcMboN11sISZDLdWDhuVjnhWzJ4t4hChpQZcJUfnin
	 uxotfTVr2xXt6cDmiHUXObPn/56bNeoHCsKGEEN/lNuXn3EDd+djwvkzEMUVmC8D2I
	 RKyxSfV7TiEkbpP+eMapBRCr05+4hEJV7fZyB7cn01QYyHsWREMNm5c+u7SiwQao/X
	 wJi1/0q8W5XUF/qVGye5/du3kuL69ddNFlLpFhgVwN9uZd5bYExJa494QsT9YB9w5I
	 5fu3blHau/dcs27EofYuk763fARYGHEIOTj+ruXvosT0e8ji92sCJ06IucSFtKcaK8
	 TUSnK7YbMbIDQ==
Date: Wed, 22 Nov 2023 14:13:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
In-Reply-To: <20231122142733.1818331-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311221410400.2053963@ubuntu-linux-20-04-desktop>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com> <20231122142733.1818331-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Andrew Cooper wrote:
> The differences between inline, __inline and __inline__ keywords are a
> vestigial remnant of older C standards, and in Xen we use inline almost
> exclusively.
> 
> Replace __inline and __inline__ with regular inline, and remove their
> exceptions from the MISRA configuration.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index 2866cb191b1a..b7c2000992ac 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -84,7 +84,7 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
>         __volatile__:
>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
> -       __const__, __inline__, __inline:
> +       __const__:
>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>         typeof, __typeof__:
>            see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.

Asking the Bugseng guys as well, do we need to add to
C-language-toolchain.rst:
inline __attribute__((__always_inline__))
inline __attribute__((__gnu_inline__))

Given that the problem was also present before this patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 04b8bc18df0e..16d554f2a593 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -20,9 +20,8 @@
>  #define likely(x)     __builtin_expect(!!(x),1)
>  #define unlikely(x)   __builtin_expect(!!(x),0)
>  
> -#define inline        __inline__
> -#define always_inline __inline__ __attribute__ ((__always_inline__))
> -#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
> +#define always_inline inline __attribute__((__always_inline__))
> +#define gnu_inline    inline __attribute__((__gnu_inline__))
>  #define noinline      __attribute__((__noinline__))
>  
>  #define noreturn      __attribute__((__noreturn__))

This is where they are used.


> @@ -83,7 +82,7 @@
>   * inline functions not expanded inline get placed in .init.text.
>   */
>  #include <xen/init.h>
> -#define __inline__ __inline__ __init
> +#define inline inline __init
>  #endif
>  
>  #define __attribute_pure__  __attribute__((__pure__))
> -- 
> 2.30.2
> 
> 

