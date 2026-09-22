Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B550C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 05:05:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428079.1650780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8sge-0003at-DR; Tue, 22 Sep 2026 05:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428079.1650780; Tue, 22 Sep 2026 05:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8sge-0003am-Ac; Tue, 22 Sep 2026 05:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1428079;
 Tue, 22 Sep 2026 04:16:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1x8rve-0005ct-MY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 04:16:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8rvd-0048zA-H1
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:16:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nzzhao.sigma@gmail.com>)
 id 6ab20104-8faa-0a2a0a5109dd-0a2a4506c046-24
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:16:25 +0200
Received: from [74.125.227.139] (helo=mail-pj2-f11.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nzzhao.sigma@gmail.com>)
 id 6ab20117-195a-0a2a45060019-4a7de38bde87-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:16:25 +0200
Received: by mail-pj2-f11.google.com with SMTP id
 98e67ed59e1d1-398a384b5f7so2214693a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 21:16:24 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0674d65d4sm2204031a91.15.2026.09.21.21.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 21:16:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790050583; x=1790655383; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDLbvCKUB+a+IDR0laoJE09QGbcCCmet6VJT4AONztI=;
        b=Yr64FpSFTB+kfunZOesJqW4HNkMWeQFcIhKv9N+Op5AD0id34lPrveZJL3i0BORsf9
         sAIebmtK1+o7BMbVWlNi67xz0FE2YfrmVzqpTzMABe+qBEsSlnY8UV6yj0sxg7m2mvzh
         H/Rkm+SgkIjsCgHhSmD69X2Kg8SZgnfPpO4iivj+np6uBZGA8twqiTSHnbGeXcgAgrom
         lXC/c0UaKvcPhbjOt/CvRSUJRK3+vUiP19m/sL6gU4rTVsr5RxiKJmS+ryPY6Bm10++0
         cnxPer19AOF10E1TikKZdXpCUw1kJncNAoqJtltNyR+tCBwrEXdS82Ab34hykRrIRE2h
         lVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050583; x=1790655383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDLbvCKUB+a+IDR0laoJE09QGbcCCmet6VJT4AONztI=;
        b=Pyiywdz7QkloURkz5ABCha+9DHRGWqziiMigxrUJ+OI4iCQl/6kJGv/gJaUD9KXPfz
         fILs9wWqguhOSVs9wrDSw1Yz4VKHtnXTfCWg2iTOBUk/hVmLBuC2M+u1eCtIkvi88Hej
         9UcFNFyi6R8nf/CA53BwGrswh1BO+UOzeH5pY7jwqzX4d5Xng/Da19vcML9f8ISldRbw
         UNwH1tuH/0Gifj3bniJVlfr7dq6PXSOVtuTsNNMlIIAH4wjF9GXb/F4QY9ZIorck0cC+
         CybVGBq6dkSrBjZCYibq/hKtZkBIzammWrQFNDSlvP8qC1CPrmvSHJPJHbGLe557OCA7
         2+Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwFOsJFSmLwFcVUaDknEQ4tlBtEoEf+HTxYRI1ywqqmyWZzXS5btQHNladJSDaffI9bdZBlW8U6pJk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lmlrFRfpRM+pMe0vJVSvFTlYslF3eZ75/7E9WQPemKzFQhw/A4
	Gi/CQ9Gtw1ias9Elb/glcF6IIP2MiKBFUCMZdNdtuFGEKKkPDwGkOBwj
X-Gm-Gg: AYBFou1IhBLaHI02mRMtucJemPLewQuPTROOsFdbG2RS3rh78BjWVWBMsUZyg1K1d7d
	t21LfTPDPzULe7XY+cwWzgD9xof7cBLTQOwHNiormgDUgYI6RndcvxZ72sT7/09W/vwKJDiQeKC
	OQZdJkw2qVkTqhpJ6+SkcRVw6KUp23T1aYWzlBTV7SP6oBxY50znPGB2ue3cau/Hy4CTfzWuMFH
	QX7719iNHzxf0YWNYYvkOOfVMPBDOVeJ97o/4gAf9vewNBiSQcrNsnUw4+xWnS3mh345agd8FdQ
	IcuuZsAXfS/qB5gLoDDHr+QmexNb0sP00aT+/MajXn1cBU6LR9M1mamsGTbh8+sS7oh/hJZCBq2
	t8i05kf1XQk1gZe67ezwbrVkHdy7HJ5E8jYubqCieJcuqu8DREoYIe26Xh9ehv4G31V3TPwndzA
	2HndxuZqStcNoQ+xjMJWM+r517fLKArDCnzzmKD+JI3ENUXHzI3bLSQrsL2/bZgVt17wJMpW7JS
	7pQn+fdmmG2M4WyBSJgXsQ8LkHJ9It8FInu
X-Received: by 2002:a17:90b:56c5:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39e55008a3amr25857593a91.14.1790050583196;
        Mon, 21 Sep 2026 21:16:23 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Jan Kara <jack@suse.cz>,
	linux-doc@vger.kernel.org,
	Alex Markuze <amarkuze@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	kexec@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Young <ruirui.yang@linux.dev>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mm@kvack.org,
	Hongbo Li <hongbohbli@tencent.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tal Zussman <tz2294@columbia.edu>,
	Baoquan He <baoquan.he@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Anna Schumaker <anna@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yue Hu <zbestahu@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	x86@kernel.org,
	ceph-devel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Wei Xu <weixugc@google.com>,
	xen-devel@lists.xenproject.org,
	Gao Xiang <xiang@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	linux-fscrypt@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-mtd@lists.infradead.org,
	Axel Rasmussen <axelrasmussen@google.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Yuanchu Xie <yuanchu@google.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Juergen Gross <jgross@suse.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-nfs@vger.kernel.org,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-perf-users@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	Trond Myklebust <trondmy@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>
Subject: Re: [PATCH v5 00/17] Remove PG_private by using page/folio->private checks instead
Date: Tue, 22 Sep 2026 12:16:00 +0800
Message-ID: <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790050585-F7CCD77B-1B725A83/0/0
X-purgate-type: clean
X-purgate-size: 716

Hi Zi Yan,

Thanks for the series. The cleanup is a nice help for the f2fs
large-folio work -- it removes the page-based private-flag plumbing that
my series would otherwise have to carry itself.

My large-folio series v2 [1] can be rebased on top of this series. The
only overlap is the PAGE_PRIVATE_* flag helpers, which I can re-express
on top of the F2FS_FOLIO_PRIVATE_* names while keeping the
f2fs_folio_state indirection.

Jaegeuk, do you have a preference on the ordering here? My personal
suggestion would be to review and merge this series first, and I'll
rebase on top of it.

[1] https://lore.kernel.org/linux-f2fs-devel/20260915041909.2903887-1-zhaonanzhe@xiaomi.com/

Thanks,
Nanzhe

