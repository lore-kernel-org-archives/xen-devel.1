Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4260C5CFCF
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 10:15:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388073.1629280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtjVp-0001IG-P1; Tue, 11 Aug 2026 10:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388073.1629280; Tue, 11 Aug 2026 10:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtjVp-0001I9-ME; Tue, 11 Aug 2026 10:15:13 +0000
Received: by outflank-mailman (input) for mailman id 1388073;
 Tue, 11 Aug 2026 10:15:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anshuman.khandual@arm.com>) id 1wtjVp-0001I3-A2
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 10:15:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtjVo-00DyeO-A2
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 12:15:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a7af62f-8faa-0a2a0a5109dd-0a2a4508e2b4-0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 12:15:11 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a7af62e-f659-0a2a45080019-d98c6eacd970-1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 12:15:10 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBEA1682;
 Tue, 11 Aug 2026 03:15:05 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0350C3F86F;
 Tue, 11 Aug 2026 03:15:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786443309; bh=+szcqBCq9eZ2ua7vWX4x/+s1q8ODJlqcpxLyiJuSiwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+Vm46x3ghCefqeO2I1n6DA88n8dnPA9fKF0KOYZamwYwLaVm1b44z72dYIEIsYC0
	 p/UxibT9bkIS6vm2g/03/53REk/x6Bjd7ZTy6XlUazb0cSaz7+p0GyYbiNAyjJgZGx
	 FyXK8Yk5Rfauuo195Y0NDG5YghHuk7t+gElvU4PU=
Date: Tue, 11 Aug 2026 15:45:06 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	David Hildenbrand <david@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, SJ Park <sj@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Mike Rapoport <rppt@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, ziy@nvidia.com, 
	pfalcato@suse.de, agordeev@linux.ibm.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	damon@lists.linux.dev
Subject: Re: [PATCH 2/9] mm: make hw_pte_t visible to generic PTE interfaces
Message-ID: <7xbai2nyu6nuyr6otqv556dnphpgwaqsmvwkqwoqwbh5nvj3ns@ddy5ezgvb7w3>
References: <20260806083926.1807279-1-usama.anjum@arm.com>
 <20260806083926.1807279-3-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806083926.1807279-3-usama.anjum@arm.com>
X-purgate-ID: tlsNG-c1860d/1786443311-CFED287B-77340A4B/0/0
X-purgate-type: clean
X-purgate-size: 2355

On Thu, Aug 06, 2026 at 09:38:40AM +0100, Muhammad Usama Anjum wrote:
> Later conversions use hw_pte_t in page-table checking, generic page-table
> helpers, and vmalloc interfaces. Include linux/pgtable_types.h from the
> headers that declare those interfaces before changing their types.
> 
> For vmalloc.h, replace the direct asm/page.h include with
> linux/pgtable_types.h. The latter includes asm/page.h, so pgprot_t remains
> available. It also provides either the default alias or the opted-in
> hw_pte_t wrapper.

Stand-alone header file updates are not ideal. Why cannot these changes be
folded in, where hw_pte_t gets used first time ever in the above mentioned
places.

> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Changes since RFC v1:
> - Clarify that the header provides both generic hw_pte_t definitions.
> ---
>  include/linux/page_table_check.h | 2 ++
>  include/linux/pgtable.h          | 1 +
>  include/linux/vmalloc.h          | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
> index 12268a32e8be1..12ee6d16ad339 100644
> --- a/include/linux/page_table_check.h
> +++ b/include/linux/page_table_check.h
> @@ -7,6 +7,8 @@
>  #ifndef __LINUX_PAGE_TABLE_CHECK_H
>  #define __LINUX_PAGE_TABLE_CHECK_H
>  
> +#include <linux/pgtable_types.h>
> +
>  #ifdef CONFIG_PAGE_TABLE_CHECK
>  #include <linux/jump_label.h>
>  
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a8..cf595608cc4c4 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/pfn.h>
>  #include <asm/pgtable.h>
> +#include <linux/pgtable_types.h>
>  
>  #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
>  #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index aed121d729b01..b068e6ade4207 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -8,7 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/list.h>
>  #include <linux/llist.h>
> -#include <asm/page.h>		/* pgprot_t */
> +#include <linux/pgtable_types.h>	/* pgprot_t, hw_pte_t */
>  #include <linux/rbtree.h>
>  #include <linux/overflow.h>
>  
> -- 
> 2.47.3
> 

