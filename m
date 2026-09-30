Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE20CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 08:51:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436837.1655616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBq1t-0005Rg-Cm; Wed, 30 Sep 2026 08:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436837.1655616; Wed, 30 Sep 2026 08:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBq1t-0005RZ-9W; Wed, 30 Sep 2026 08:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1436837;
 Wed, 30 Sep 2026 05:10:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anshuman.khandual@arm.com>) id 1xBmaV-00068r-Au
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 05:10:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBmaU-004xPZ-Kf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 07:10:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6abc99c8-bab6-0a2a0a5309dd-0a2a4503ad56-16
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:10:38 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6abc99cd-fae8-0a2a45030019-d98c6eacb9ce-1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:10:38 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD6551477;
 Tue, 29 Sep 2026 22:10:33 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBBB73F763;
 Tue, 29 Sep 2026 22:10:35 -0700 (PDT)
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
	t=1790745037; bh=HBnOiO4lKi56PuSH4xu/j4eJs0RVLoWx4P6ztp2ydZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyyFJBwudHElfeviZ00ITo1a6Xr9Q3NyTSeWfTWp8zjFH4KJEZuFNbQ9z9esgxx36
	 t4IFgPHmQLaWxfB8mibALu5LHDRYKETtddlKsa/mrM3VuXEUZdR5WzTLOHscsAE3WY
	 77cVlx5yRsj+dQ5Rtn3DsHPDmyL7aOM2T6haf/KA=
Date: Wed, 30 Sep 2026 10:40:33 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Pedro Falcato <pfalcato@suse.de>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, SJ Park <sj@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, damon@lists.linux.dev, kasan-dev@googlegroups.com, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/9] mm: convert PTE table entries in ptep_get()
Message-ID: <dhokijjou3rh3poqnqqpyoyac7wrqeprl4vlhzqokvh4lgjyya@g5hwn7sve3uw>
References: <20260922-pte0-v3-0-5670b8cb9059@arm.com>
 <20260922-pte0-v3-4-5670b8cb9059@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-pte0-v3-4-5670b8cb9059@arm.com>
X-purgate-ID: tlsNG-33051d/1790745038-6EACC4E9-8B121C5B/0/0
X-purgate-type: clean
X-purgate-size: 1817

On Tue, Sep 22, 2026 at 06:12:32PM +0100, Muhammad Usama Anjum wrote:
> ptep_get() now accepts a pointer to hw_pte_t storage but must continue to
> return a software PTE value. Add __pte_from_hw for both generic hw_pte_t
> definitions. Read the hw_pte_t table element atomically before converting
> it to pte_t.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Changes since v1:
> - Use software PTE value terminology.
> 
> Changes since RFC v1:
> - Define __pte_from_hw for the opted-in generic wrapper.
> - Apply READ_ONCE() to hw_pte_t before converting it to pte_t.
> ---
>  include/linux/pgtable.h       | 2 +-
>  include/linux/pgtable_types.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 19098e302b75a..41337da0d65aa 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -493,7 +493,7 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>  #ifndef ptep_get
>  static inline pte_t ptep_get(hw_pte_t *ptep)
>  {
> -	return READ_ONCE(*ptep);
> +	return __pte_from_hw(READ_ONCE(*ptep));
>  }

Just curious - when would other pgtable levels (PMD, PUD, P4D and PGD) be converted
in this format as well ?

>  #endif
>  
> diff --git a/include/linux/pgtable_types.h b/include/linux/pgtable_types.h
> index 07da05d375c2c..d6c5a7548550b 100644
> --- a/include/linux/pgtable_types.h
> +++ b/include/linux/pgtable_types.h
> @@ -8,8 +8,10 @@
>  
>  #ifdef CONFIG_ARCH_HAS_HW_PTE_T
>  typedef struct __hw_pte_t { pte_t __pte; } hw_pte_t;
> +#define __pte_from_hw(pte)	((pte).__pte)
>  #else
>  #define hw_pte_t pte_t
> +#define __pte_from_hw(pte)	(pte)
>  #endif
>  
>  #endif /* !__ASSEMBLY__ */
> 
> -- 
> 2.47.3
> 

