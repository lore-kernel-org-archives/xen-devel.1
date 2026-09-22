Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBDC98308
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:31:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429166.1652097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92T1-0004wZ-7h; Tue, 22 Sep 2026 15:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429166.1652097; Tue, 22 Sep 2026 15:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92T1-0004wS-4q; Tue, 22 Sep 2026 15:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1429166;
 Tue, 22 Sep 2026 15:31:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jaegeuk@kernel.org>) id 1x92T0-0004wG-6d
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:31:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92Sz-008QEg-6F
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:31:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jaegeuk@kernel.org>)
 id 6ab29f49-bab6-0a2a0a5309dd-0a2a4503abf8-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:31:33 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jaegeuk@kernel.org>)
 id 6ab29f53-fae8-0a2a45030019-aceafc1faed8-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:31:32 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 81B3D40DC1;
 Tue, 22 Sep 2026 15:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F71F00893;
 Tue, 22 Sep 2026 15:31:26 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091090;
	bh=VFYj6sjedfWGEBuGl++9heS9zoD83sYWZIxoZFH52Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oxgbajWAx+ewgz3EYGgJPYtZfNNrVy2jiDvlrL0XB6QieOmgNe9oJ8tWYTAmWkd4E
	 40O1bShYyuGwabzOZg2yryGvTCOWVoLErNmP15TezU6CcK1+IP50a2puK4iDmaw6R3
	 PCwUfPw/jYwdSq8HtaOBJAU/3KQvk7VOfDVSLU+W6MZTQuGVG14os2s8QuaTXuRpZy
	 c1E7BQMp5Oh5V6N9yXEOXRU2Ns8Xz5BjaAREZfd68p1jzII0svn4YeEB6D4D+XgUXP
	 mn6RKCk0xuOhAtFCkmd48wAcJ6k5w8jrTIJhK2olCjTjtXsHqi1z/Ac++TcJ8CKg7E
	 LVSLUkJaZCs2w==
Date: Tue, 22 Sep 2026 15:31:25 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Alistair Popple <apopple@nvidia.com>, ceph-devel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, xen-devel@lists.xenproject.org,
	Gregory Price <gourry@gourry.net>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	linux-fscrypt@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Nico Pache <nico.pache@linux.dev>,
	linux-perf-users@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Byungchul Park <byungchul@sk.com>,
	linux-trace-kernel@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Muchun Song <muchun.song@linux.dev>,
	linux-f2fs-devel@lists.sourceforge.net,
	Minchan Kim <minchan@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alex Markuze <amarkuze@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mtd@lists.infradead.org, Chunhai Guo <guochunhai@vivo.com>,
	Jonathan Corbet <corbet@lwn.net>, Dev Jain <dev.jain@arm.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Gao Xiang <xiang@kernel.org>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Borislav Petkov <bp@alien8.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Tal Zussman <tz2294@columbia.edu>,
	Ilya Dryomov <idryomov@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, linux-nfs@vger.kernel.org,
	linux-mm@kvack.org, linux-erofs@lists.ozlabs.org,
	Mike Rapoport <rppt@kernel.org>, Ian Rogers <irogers@google.com>,
	Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Yuanchu Xie <yuanchu@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Yue Hu <zbestahu@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Richard Weinberger <richard@nod.at>,
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Usama Arif <usama.arif@linux.dev>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namhyung Kim <namhyung@kernel.org>, Juergen Gross <jgross@suse.com>,
	kexec@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [f2fs-dev] [PATCH v5 00/17] Remove PG_private by using
 page/folio->private checks instead
Message-ID: <arKfTXizFeTeKYDx@google.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
X-purgate-ID: tlsNG-33051d/1790091093-6ECCB4E9-45AFFC6D/0/0
X-purgate-type: clean
X-purgate-size: 1132

On 09/22, Nanzhe Zhao wrote:
> Hi Zi Yan,
> 
> Thanks for the series. The cleanup is a nice help for the f2fs
> large-folio work -- it removes the page-based private-flag plumbing that
> my series would otherwise have to carry itself.
> 
> My large-folio series v2 [1] can be rebased on top of this series. The
> only overlap is the PAGE_PRIVATE_* flag helpers, which I can re-express
> on top of the F2FS_FOLIO_PRIVATE_* names while keeping the
> f2fs_folio_state indirection.
> 
> Jaegeuk, do you have a preference on the ordering here? My personal
> suggestion would be to review and merge this series first, and I'll
> rebase on top of it.

Let's keep working on the f2fs tree, since we should not merge this in my tree.
Later, we'd need to prepare how to address the merge conflict.

> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20260915041909.2903887-1-zhaonanzhe@xiaomi.com/
> 
> Thanks,
> Nanzhe
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

