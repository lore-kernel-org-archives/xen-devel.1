Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49EFCA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 18:41:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437793.1656779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBzEe-0003LQ-2o; Wed, 30 Sep 2026 18:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437793.1656779; Wed, 30 Sep 2026 18:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBzEd-0003LJ-Va; Wed, 30 Sep 2026 18:40:55 +0000
Received: by outflank-mailman (input) for mailman id 1437793;
 Wed, 30 Sep 2026 17:56:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Usama.Anjum@arm.com>) id 1xByY7-0002S5-Eq
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 17:56:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xByY6-00FB6B-Rx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 19:56:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6abd4d4c-e002-0a2a0a5209dd-0a2a4505bd4a-18
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:56:58 +0200
Received: from [40.107.130.55]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6abd4d69-4cb1-0a2a45050019-286b8237575b-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:56:57 +0200
Received: from DB8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:110::21)
 by DB3PR08MB9058.eurprd08.prod.outlook.com (2603:10a6:10:430::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 17:56:52 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::75) by DB8PR04CA0011.outlook.office365.com
 (2603:10a6:10:110::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 17:56:52 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 17:56:52 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 17:40:33 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0472.012; Wed, 30 Sep 2026
 17:40:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R9A+eYV9CpyZdJDZSh2W7EpxObEy9o4PI569HPFjRlH//nP+rv3hYm7LyMj05x6ZRfAMtnSi3MmD6M2SjxIBNxmyid82RnVbgMW/oS9vg+YMArAHJVFoofttTMC+VtbIWsF9a2q97R3bVABOOjvGKWPeM4OdRXlHuNV33Lrcfax+UizFF185Y9Qm2Lc3Lr0lg5P7KrljFCLYbJf5Se2PcbQeTmWmxwOYh0zOn+AEF6lAmwUxi4JoXMk1kdluEXfs6urpBByuYG4OEHvB8W+JbIKziVkZ/eRXhAGMXVe1zUNjbQZ+/L5FMn0o7ixsc5BMSfXV4/eE0G1BRjB385I69g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dj3mza0d7acfswRMgXyXAp0FLYQUvs4v9I7WURo1EM=;
 b=MnD0EdCDabWj74E/z59U1y+WE1cQ6sbz/KeCE+yTPbMaekQ58X7uBMUhuyde1+IgbBaXBkuPPvy6Cs85d1XvrXqx/QhLvfK8zM+ekLMJ/B+mXCLYfkOz7aXPJnE2deL3xM4eCgV64Ru0FVrNEgr+/ZZoa20HaDgwh+8IQmOV+Ih0kcEgguZ5F/LgDxOHY1P7GUAgvfWm+VuLZ7wJzcCB2/fvreFz51To9+Tjq3od021GWpwzEif1YJtv5YKRqKD/JUp+tZnFuym0u9fVNz26nrPq6EGJyL3GjzwMI3jWCdAV9kKOQ0+a2j90H5JaVVcu/QWzyl+KzVbElV9QkADqBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dj3mza0d7acfswRMgXyXAp0FLYQUvs4v9I7WURo1EM=;
 b=oDOAon48OeBS6pTAWmIZUiQfOFqJqq0xC/o9Tw0s5gOjXQnDoL+hPmSOeIkUgQpL+YkpspeF+nomKaA5eICb+l8wbbqFVNLMc+h2jYeZCLL8eWRyN5teXiYFyGCxF3PiWxHeWL27e/t/Lx4Wc8Ar2gbhQeb+jWPPxZ9fx1sWosc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUZQb3FAg7yfr2Gmy65jr58i8W7Vn13ARnWdNaUoxX4nsvwmwZAYBAvK52SM7RPBMA2jLKTeQjot5JDkgVcSPC0SS8AwTnJk98aLdlWmxhB5rSXOtR9ObN/iQuVdnX9h+nqy3v5PNsCyJlHIxrBuL8X0wN46uF7tSgaiHR6juqe3StVFe6EsN4NDOC1bxNmKJXhedpIAypEaraZX1M3DGRFk242WiBT7OFtCCP7JdLl0ExLB8cgNGhE/KrUI/Tt0BztagRXiX1POKo2JsuG+t/qydQMUn72csR4mKdNUwNAWwKN7iFmH3KJGd9CWc3hTXN0c/p7FDr7kHl8F0WvnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dj3mza0d7acfswRMgXyXAp0FLYQUvs4v9I7WURo1EM=;
 b=VLFluQFA4wUPvgWQqHMQT8kDLgBsVRnxlZBM2UP9tj/aZn2yC8vHyHQ6aCyngsOl2jw1YVXg2vvUYrtRFUOjt2qSKRMJRLXwcLedBPPi/rSTLR6a58omQe6iS0Wy2Qy7j+InZjL+X7H7Nsw8dFepQKnkClXmiELQhiy59cz3a6X+33l1HbEA3fUL/r6kGULXPlrpsGNC4yAIchLd9ZWe9jIqgL+PG4kxLz0UfXY+FTQZGUyBohS33RTOyu6lSBqOGBis73hp3IXIcD6+/uVStswqXKLNKazfxIMVc6Wv1dgJGlfQ/NNyoOrvBOlL+Qg2X0od6iYBNk9IrjA4zDEiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dj3mza0d7acfswRMgXyXAp0FLYQUvs4v9I7WURo1EM=;
 b=oDOAon48OeBS6pTAWmIZUiQfOFqJqq0xC/o9Tw0s5gOjXQnDoL+hPmSOeIkUgQpL+YkpspeF+nomKaA5eICb+l8wbbqFVNLMc+h2jYeZCLL8eWRyN5teXiYFyGCxF3PiWxHeWL27e/t/Lx4Wc8Ar2gbhQeb+jWPPxZ9fx1sWosc=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <63db3469-82d0-4997-9bcf-31bb3aa59deb@arm.com>
Date: Wed, 30 Sep 2026 18:40:28 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Pedro Falcato <pfalcato@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@linaro.org>, SJ Park <sj@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev,
 kasan-dev@googlegroups.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/9] mm: use hw_pte_t for generic PTE table storage
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20260922-pte0-v3-0-5670b8cb9059@arm.com>
 <20260922-pte0-v3-3-5670b8cb9059@arm.com>
 <xzlxdkrjilskjcagnl33eed7ijxrgfhoalmmmq5ks3wgjmkkhi@zchtxpr2amff>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <xzlxdkrjilskjcagnl33eed7ijxrgfhoalmmmq5ks3wgjmkkhi@zchtxpr2amff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|AS8PR08MB9840:EE_|DU2PEPF00028D07:EE_|DB3PR08MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6d6139-0540-4993-6209-08df1f1c3537
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 oGI7muJrlZpwF/CpDHEzSDJCtzoqS/F3W423126M4B7XVwwmWQMfuelL6Drv404qx12ulnjM4McoRoH2NEquKYER7GCiXUBW2yAtyKLG5ZfBjfUL99P38usNcVC0HjNO/EWQlAlszKFgqK3QjtoK4jRiTZR7h6q3UCvMmEmJj+Zc9flQRzesGOjw4Bjzlc3JwakYyyuP81YRfDZjr7WXaL/YBEk7WP5Zx6XX8bST7EL+YkcQsAL+jYauBpPQJMJTxHW0+4D6r28jU7hFISb4k5fLhdxsCJMhvjoqyCScUWK2XexS1WeyCKHxbXAiR9Y4lzTTl3bM0wOUObWbYPGoseq1+bd9V+gDvz44n9Z4sZWuclTXfJ797kFqNJ/dPY0hlLRBBtPFczXpxW4Jrwo6fhrvbUxlTKhMYweDNyxCG4hMOWqh3Pr0y8Cb31TKDgfZ4nTLwfT0q+OdTJKI+g3t2OHVEynSCqM+0eNK6RhXhg9pN4QLKVzZrNL/3bJPKMPULVkmlZhCDxhH3d2glFtWSxtnJJjOqVwGHoiEvWxeYzo9pWCj1RGSYhinwWMWpXcHfT1Ts1H82zA8m24Olqxekvt6pCSivv9BdoOTXhQuY5Z51sxkdkvXU/UY5OHdGsaD/0ljbuXWDhq2J61EwuOBFAIVLiLOUXMAB0as2Shst3Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 ZRh/vaUJ8vPLDwbrpqZLGWjxaIwOvyvt14r+gVvGKmgPPwK2TDTTLFe3d41eOrldXN2Fh6Rlgp30is4w/0Ee+/Iz707w8ulVg8jMkeJmQ9QgGwFHZ5aPzws0sX9jQQk+GVEI8LwKndr1/707rxzO8hbJd1HDaxV8NCyM+pYvcnxP1HNJHpEykUsZ0nxE9BGYRfQ1OVtCbOkU9xW6FoIiOOaiHUJhQJUJf98vL796fhWLRMJ5tWyDNUEy39UrG+G97sssgwv7emKfpTstqUBx5b83Q5zktpXhxsiXlgmkTb7hcUBoY38o6Myeb2CjQybUiRxo5I3mlgrYuef+nXXc+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a3f536c-6b22-4217-dabc-08df1f19ed82
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|35042699022|82310400026|376014|1800799024|36860700016|14060799003|6133799003|3023799007|11063799006|10067099003|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	YD6uUtAFnjhIQmpPdxvGHY9mofP2MV+tSU2nsvH9Qo0pjurKy4ZEZvmteUmzHI7EMQCahSnRjeFJPHFOZ9E8P+xpNlE5BzgsixfDmHV3LCuuWgz21BVF/I6Hm6CDNcAEXje5ltMdqkdY0ucbogJUmah/52+wF58PYN+mqjTkhZcRFIoBszVRdP5tigQ/kEVV1WLNh2pRi/dq52vdkR4Na1ceZPb/8YmV+90o7M0iHJfTrd1pt2ijtOzHdKejUNfLXMYC1REGytfc6Jv4PajNDRlAa8//acgbwOlfHI3zN2vVDSKZOK9E0ZyQ8NYYg++diXYGHCUh2CY52eyEKGbb9qh/voSw/KdaPmHDPuWJCe6A7AfWnDLGT1lslxFLVfHjzwo+gYEAYlTl/HmD/G21zZKfI4NzxGUuR79sGSm+TIonO29+m7NpSdJemcGrEJR7C7j8bb/iGqhAO4Fg7l79We52asKJYG/eGKO0t6DC7YMIyxzqiVtEzx47nH6JX8XHZFngA3S1iipm8hKGYtUP1SL0BR8Gt41i718Q8lomSPprHWE5HOEPcDczNYV5Oxspt5AiFx5dMaQLzpFGQPF8beshtVdDhDmEC7jN7BiS5DnZ5U9B4JI9DWDyWD5RzsGTmm3Hhnl5cGjGDq0MTSX/G5tdqhyxfXBl/C42I5n1w73uiwlkue/0x5tN8HCR8UIwyJO1rcOc9dYFPc+Tuj22Uw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(82310400026)(376014)(1800799024)(36860700016)(14060799003)(6133799003)(3023799007)(11063799006)(10067099003)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tjeDUqtfMBfSy1f6kQOFrYgyAtaf+TxBkGP5JoCyESvM9JMWnQYQ8DYbkskO/lnJSFXEjk2G3qrvVIPlACKKtOMZP7Hc5J9vJbWL+r2+oGIU+WiUauu/lVldClEiTqPbwWvm1Kxoq3owrg6xbSWTstuqLHmOu/TctXaHvIE3sWkzRzndlErTLsDeQuZMQiIp8P1YKX3BQudRZfnNtBO+I1CiiJlEadzONEI+T3rSemFqmFLFvYuH2byJBLVOdh8uXjA2aoBpF+5w6ESPqNztsFH1jkPP2CqvZ0jAEosYgJTR/wCX2WyJuvJGVAcVKcY55RUuAIUzoJydG0GoSxZ8d/pAZ1dLW4x9Cxb+djXgRtRUT400t2tbFrcsihQgLlHvcpAN53a1og+IWhRXiGRLtlAdvXECDVXXo0zdk8QQ5H8unXsqqNg0hw8mlTm4gpfd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:56:52.1203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6d6139-0540-4993-6209-08df1f1c3537
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9058
X-purgate-ID: tlsNG-c201ff/1790791018-F48A62A1-08EE1633/0/0
X-purgate-type: clean
X-purgate-size: 1538

On 30/09/2026 5:35 am, Anshuman Khandual wrote:
> On Tue, Sep 22, 2026 at 06:12:31PM +0100, Muhammad Usama Anjum wrote:
>> Generic page-table interfaces use pte_t * for both pointers to PTE table
>> storage and pointers to software PTE values. Convert the generic
>> declarations and their MM, fs, and kernel users together so parameters,
>> return types, callbacks, and local pointers that designate table storage
>> use hw_pte_t *.
>>
>> Include linux/pgtable_types.h from headers that expose the converted
>> interfaces. It continues to provide pgprot_t to vmalloc.h through
>> asm/page.h.
>>
>> Keep software PTE values as pte_t and retain pte_t * for value interfaces.
>>
>> No architecture selects ARCH_HAS_HW_PTE_T at this point, so hw_pte_t
>> remains an alias of pte_t and this changes the interface vocabulary without
>> changing representation or behavior.
>>
>> Most of this mechanical conversion was generated with the Coccinelle script
>> included in the cover letter. The script deliberately ignores pte_t *
> 
> Just wondering - should this Coccinelle script that converted all these
> instances be saved inside ./scripts/coccinelle/ for future referene.

Thanks for the suggestion. This script was written for this one-time conversion
and requires manual review to distinguish HW PTE table pointers from SW PTE
pointers. After the conversion, it would not be useful.
(Maybe other arch can use it to do their conversion. But they can always
copy script from the series)

-- 
Thanks,
Usama

