Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67158C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 03:40:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420382.1646726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5xY9-0008Pl-Po; Mon, 14 Sep 2026 03:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420382.1646726; Mon, 14 Sep 2026 03:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5xY9-0008Pd-MH; Mon, 14 Sep 2026 03:40:09 +0000
Received: by outflank-mailman (input) for mailman id 1420382;
 Mon, 14 Sep 2026 03:40:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <akpm@linux-foundation.org>) id 1x5xY8-0008OS-2w
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 03:40:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5xY7-002Eii-1N
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 05:40:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <akpm@linux-foundation.org>)
 id 6aa76c81-bab6-0a2a0a5309dd-0a2a4508a836-12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:40:06 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <akpm@linux-foundation.org>)
 id 6aa76c93-f659-0a2a45080019-aceafc1f9d02-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:40:05 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8DFC540A5C;
 Mon, 14 Sep 2026 03:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FF91F000FF;
 Mon, 14 Sep 2026 03:39:59 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=korg header.d=linux-foundation.org header.i="@linux-foundation.org" header.h="Date:From:To:Cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789357202;
	bh=x5zisV7HoQ8XMweM1XOT4E07P1NlnKsteMfQzVmO4Js=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pHy6fbeflVTU8QtsqFS5eh8OvOR3ntwRr+lHZYMkoAT3ltm91/zKHpwN5XKZntEOS
	 ILIVvwKavB+/VLgc77oFP5R90/PbqE2ALcouMF/TdFK9XZ9ovr5QioyLZB1yLh6r2e
	 gdt1bOJXa+0zPlb1i7I7WNxSlmbqXRfHn0UsNCp4=
Date: Sun, 13 Sep 2026 20:39:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Minchan Kim
 <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James
 Clark <james.clark@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-perf-users@vger.kernel.org, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, Eric
 Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk
 Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Oscar Salvador
 <osalvador@suse.de>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Tal Zussman <tz2294@columbia.edu>,
 Gao Xiang <xiang@kernel.org>, Jan Kara <jack@suse.cz>, Yue Hu
 <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep
 Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, Chunhai
 Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, linux-trace-kernel@vger.kernel.org, Trond Myklebust
 <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-nfs@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze
 <amarkuze@redhat.com>, Viacheslav Dubeyko <slava@dubeyko.com>,
 ceph-devel@vger.kernel.org, Song Liu <song@kernel.org>, Yu Kuai
 <yukuai@fygo.io>, Li Nan <magiclinan@didiglobal.com>, Xiao Ni
 <xiao@kernel.org>, linux-raid@vger.kernel.org, Richard Weinberger
 <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>,
 linux-mtd@lists.infradead.org, Baoquan He <baoquan.he@linux.dev>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Dave Young <ruirui.yang@linux.dev>, Shuah
 Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/16] Remove PG_private by using page/folio->private
 checks instead
Message-Id: <20260913203959.6b46b0b5a052aec818a7f267@linux-foundation.org>
In-Reply-To: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789357206-CF75B87B-29B29271/0/0
X-purgate-type: clean
X-purgate-size: 1221

On Sun, 13 Sep 2026 22:23:58 -0400 Zi Yan <ziy@nvidia.com> wrote:

> This patchset removes PG_private to make space for upcoming PG_folio for
> identifying pages from a folio (more details in Note below). Instead of
> checking PG_private, all code is changed to check page/folio->private !=
> NULL instead.
> 
> MM people are cc'd on all patches and subsystem people are cc'd on the
> cover letter and corresponding patches.
> 
> Patch 6 is picked up separately in f2fs tree, but since mm-new does not
> have it yet, it is sent for MM testing.

AI review claims to have found a pre-existing critical level deadlock
in f2fs:

	https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com

it also had a few things to say about this patchset and, as always,
hugetlb.c.


Thanks, The MM bits appear adequately reviewed and review of the non-MM
bits are, as usual:

  Great to have but I won't permit lack of other-than-MM review to
  block MM improvements.

So I'll queue it all up and shall push it into -next after a few days.

Acks from non-MM maintainers are appreciated.

If a non-MM patch appears in linux-next I'll autodrop the mm.git copy
of that patch.


