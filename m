Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A8C5CFCF
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 09:48:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388060.1629271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtj5Z-0005OE-Ks; Tue, 11 Aug 2026 09:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388060.1629271; Tue, 11 Aug 2026 09:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtj5Z-0005O7-Ht; Tue, 11 Aug 2026 09:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1388060;
 Tue, 11 Aug 2026 09:48:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anshuman.khandual@arm.com>) id 1wtj5Y-0005Mt-4q
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 09:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtj5W-00AYhB-OC
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 11:48:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a7aefb7-2eae-0a2a0a5409dd-0a2a4506b958-20
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 11:48:01 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <anshuman.khandual@arm.com>)
 id 6a7aefd0-195a-0a2a45060019-d98c6eacd35c-1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 11:48:01 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53CA01682;
 Tue, 11 Aug 2026 02:47:56 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC363F632;
 Tue, 11 Aug 2026 02:47:59 -0700 (PDT)
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
	t=1786441680; bh=9BoMtxA4Y0P7/HlT09wIdHqLAsjiBcPF0bOK0SA6y88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6ccwcWanhV2NaMQGyN2LuxorwwpnGJX87UVp3OA/ioC8kalbAN29GEdYDjGMly4L
	 +yi+Q/zEcN/N5K6/AZJJ9VjzIZc7OuAomjl/vPpcEdxNEFoRGn9LR525fZF+bpEreD
	 Ak2C6/i9Np4uONZAT7JjQS//RpxwX0LWi0gAmmt8=
Date: Tue, 11 Aug 2026 15:17:57 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
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
	pfalcato@suse.de, ryan.roberts@arm.com, linux-kernel@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, damon@lists.linux.dev
Subject: Re: [PATCH 1/9] mm: introduce hw_pte_t for PTE table storage
Message-ID: <u457qwrnkaquvqfn4op2a4wcdflm6d4gzut5ii4ialbeqjiyfj@qpn5fu5kwn4z>
References: <20260806083926.1807279-1-usama.anjum@arm.com>
 <20260806083926.1807279-2-usama.anjum@arm.com>
 <3db8233c-3785-444e-b2eb-3e5fc5cb2f17-agordeev@linux.ibm.com>
 <eef14e97-20cd-4b08-ae22-7636af049b09@arm.com>
 <4a42c498-58ca-46f4-819f-da14cfba154f-agordeev@linux.ibm.com>
 <52b5066c-64f6-40bb-9bce-365a18f24265@arm.com>
 <b40d4359-3156-4d02-9662-73bfeace607c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b40d4359-3156-4d02-9662-73bfeace607c@kernel.org>
X-purgate-ID: tlsNG-16d1c6/1786441681-FD20877B-C043E738/0/0
X-purgate-type: clean
X-purgate-size: 1266

On Mon, Aug 10, 2026 at 01:20:00PM +0200, David Hildenbrand (Arm) wrote:
> On 8/10/26 12:09, Muhammad Usama Anjum wrote:
> > On 09/08/2026 6:45 pm, Alexander Gordeev wrote:
> >> On Fri, Aug 07, 2026 at 04:24:00PM +0100, Muhammad Usama Anjum wrote:
> >>> Thank you for testing it out on s390.
> >>>
> >>> As __hw_pte_t isn't being used yet in this series, would s390 enablement
> >>> patches add __hw_pte_t to this definition?
> >>
> >> I hope there is a better solution. As I noted m68k, powerpc and sparc
> >> may also be affected, so I would suggest to look into those as well.
> >> I would prefer s390 to use the generic one rather than circumvent a
> >> compile error in a custom way.
> > I've just checked all of these architectures by doing dirty conversion and
> > reached to same conclusion that __hw_pte_t must be defined like:
> >  
> > typedef struct __hw_pte_t { pte_t __pte; } hw_pte_t;
> > 
> > I'lll add __hw_pte_t to this series. (Initially on last email I'd thought
> > that the first user would add __hw_pte_t. But it seems sensible to add it
> > now)
> 
> Yes, do it as part of the introduction. Also a good idea to mention in the patch
> description *why* that is required.

Agreed.

> 
> -- 
> Cheers,
> 
> David

