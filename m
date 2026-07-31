Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB7CC55167
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 05:50:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378738.1623835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpg7o-0000Mn-2a; Fri, 31 Jul 2026 05:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378738.1623835; Fri, 31 Jul 2026 05:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpg7n-0000Mg-Vc; Fri, 31 Jul 2026 05:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1378738;
 Fri, 31 Jul 2026 05:49:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anshuman.khandual@arm.com>) id 1wpg7m-0000Ma-B1
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 05:49:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpg7l-005CM6-O4
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 07:49:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a6c374e-e002-0a2a0a5209dd-0a2a450cabd2-30
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 07:49:37 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a6c3770-f479-0a2a450c0019-d98c6eacbde8-1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 07:49:36 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4315A204C;
 Thu, 30 Jul 2026 22:49:31 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18D93F7B4;
 Thu, 30 Jul 2026 22:49:34 -0700 (PDT)
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
	t=1785476975; bh=cp77iJVRWq97XcYYpGanGjI9nrMi/T9XyEKlGtEm3F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lm4Y9AxItuwNS2mYWEbr3jeJY8GANTkzrsF3Zc1UhcaT3R88O+XiEF6xuLUzbJgMf
	 FuLzKLdX/kUlFIkefo4NK3Qi11BbQwnmzc6Nw1Vo8+JrLjJC2+mL2OLu9EqmXtZRR3
	 PZUd6bbH8SNkQ4gsNj8M2Hcw3mNZqsBDiFwuMLbY=
Date: Fri, 31 Jul 2026 11:19:32 +0530
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
Subject: Re: [PATCH RFC 01/11] mm: introduce hw_pte_t for PTE table storage
Message-ID: <6xah74eadjmo2bozyr62wcxo4hhpsiufx2mshh7tztyy2dzzps@63m327m7pl5u>
References: <20260727164715.2866609-1-usama.anjum@arm.com>
 <20260727164715.2866609-2-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727164715.2866609-2-usama.anjum@arm.com>
X-purgate-ID: tlsNG-d25034/1785476977-76CDBA5B-E0C73676/0/0
X-purgate-type: clean
X-purgate-size: 2105

On Mon, Jul 27, 2026 at 05:46:52PM +0100, Muhammad Usama Anjum wrote:
> pte_t is used both for logical PTE values and for entries stored in a PTE
> table, so pte_t * does not distinguish a pointer to a copied value from a
> pointer to table storage.

Should we rather call them as "Linux PTE" and "HW PTE" instead ?

Some like "Logical PTE" does not really sound very clear on what it represents.

> 
> Introduce hw_pte_t as the generic name for a PTE table element. Define it
> as an alias of pte_t by default so architectures retain their existing
> representation and behavior until they opt in to a distinct storage type.

Makes sense.

> 
> Include asm/page.h so pte_t is defined before the generic alias.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  MAINTAINERS                   |  1 +
>  include/linux/pgtable_types.h | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 include/linux/pgtable_types.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15dd00c7ffec5..78aac05949829 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16981,6 +16981,7 @@ F:	include/linux/mmu_notifier.h
>  F:	include/linux/pagewalk.h
>  F:	include/linux/pgalloc.h
>  F:	include/linux/pgtable.h
> +F:	include/linux/pgtable_types.h

s/pgtable_types.h/pgtable_hw_types.h ?

>  F:	include/linux/ptdump.h
>  F:	include/linux/vmpressure.h
>  F:	include/linux/vmstat.h
> diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
> new file mode 100644
> index 0000000000000..ed5dba42a4f8c
> --- /dev/null
> +++ b/include/linux/pgtable_types.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PGTABLE_TYPES_H
> +#define _LINUX_PGTABLE_TYPES_H
> +
> +#include <asm/page.h>
> +
> +#ifndef __HAVE_ARCH_HW_PTE_T

__HAVE_ARCH_HW_PTE_T macro is a better approach here or a config ARCH_HAS_HW_PTE_T
based selective platform subscription should be introduced instead ?

> +#define hw_pte_t pte_t
> +#endif
> +
> +#endif /* _LINUX_PGTABLE_TYPES_H */
> -- 
> 2.47.3
> 

