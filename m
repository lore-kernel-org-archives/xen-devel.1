Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E96CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 18:41:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437803.1656782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBzEe-0003Nq-9e; Wed, 30 Sep 2026 18:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437803.1656782; Wed, 30 Sep 2026 18:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBzEe-0003Ni-5U; Wed, 30 Sep 2026 18:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1437803;
 Wed, 30 Sep 2026 18:02:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Usama.Anjum@arm.com>) id 1xBydQ-0004dx-NB
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBydQ-00AVKA-04
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 20:02:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6abd4e9f-bab6-0a2a0a5309dd-0a2a4501ca44-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 20:02:27 +0200
Received: from [40.107.130.58]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6abd4eb3-5984-0a2a45010019-286b823abb89-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 20:02:27 +0200
Received: from PAZP264CA0097.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::8)
 by AS1PR08MB7561.eurprd08.prod.outlook.com (2603:10a6:20b:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 18:02:15 +0000
Received: from MI3PEPF00008493.eurprd03.prod.outlook.com
 (2603:10a6:102:1fb:cafe::a9) by PAZP264CA0097.outlook.office365.com
 (2603:10a6:102:1fb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 18:02:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008493.mail.protection.outlook.com (10.167.240.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 18:02:14 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by GVXPR08MB11787.eurprd08.prod.outlook.com (2603:10a6:150:316::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 17:46:10 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0472.012; Wed, 30 Sep 2026
 17:46:09 +0000
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
 b=Pf3AkXcKel8p4LUJQC0e2vcSFRN3WKW1LGZMxUXwymGBT+G6MXv6B+dzPNgzDxHDKPmMrYPAeHTc00PMUchrKEETT772Mt9c3P+8cr62nW+3rgNgOdaQ3+bZnJCwtRxI7VN3q7uG9n08e7C5yJcxy1ZK5ZPk90hugE7QEo0XD0R+QQEotvR1e4erleadLJA3bmYybur2n2ZMab/PiA1LDWQUQ73cyAXF58ZqwBD+iAUqMT8YJ1vHlLFmLBf9braKahEoS84sboHqk1XVP/0QoLvv9log39zMenWh9STzWO4sk2M48sPm3LPJ0vq4pckbNVD3y7IlfgBy0aoUsrV7ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aEn4ubSlfZC8d5zvTQtfBiiaBLSDPSceR3sArTbNzQ=;
 b=rM59Fm/6rsdHArT+fhUJ7+NnqpucwwGgzqnA1iPF3eh5BdWnNRrAku02ia6uGb8R8yAO5r7R66NE9s7gU2p6TYZpjY6yW9M8VmRndz2HvxBscprInbUJMV0vn9L8W3hWF3qt7EilxHN9T7a3Lmn55vsrIHaw356FFf2/dKIwUChUlK+r9H26uaIGR4jngzVlSQNB7RpGmS8uM3kWEzB0FIY/Ih01xYHpNaWnZoK2fDNVeh8g2aKiYo+6wyWa55/jToVTioQxPQ5PJ9WVsDdPwM4Jo7Nbg9b/ThA68qjsxFxkSBeVDZXtbouQVVDjLPgvJ3WXo5CCY0b9BsWOq/pdjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aEn4ubSlfZC8d5zvTQtfBiiaBLSDPSceR3sArTbNzQ=;
 b=e5YpwPeHK7pAtQ/qb0k69OTcEWf/KbpXCCJPLXQkuM8RXGXpBhD/XPcWItkbKTshWp5HIMPueTjwLWHAXHn4t9PsGA361buN5J/XU1M89pp9C/PNyWjkcNsKAMkkyZGxuuGzBHmaWDRIw9Bj2+WXSKzelCztognoPierPFf1d6w=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfkl2k50yIYjdGeMbUiIF0rrLLmt5/RkXdUnQVABHxYJT7Eh5OTIl9ZObXkohhFG/096DXxPKea0hK+UdBVNlB+rbDP7uCbeg8t2jb/PojZQarJ1Pq7hFRj0NDZ/5dm1E/3ESQk9QjWSDqa9mIaODPbhxpXkrbMBZ0+WsboP9vwclEhC1h2qhT4yqozVlGZgxkbrd54IDCGcrwprbr42T7K9hqSI3+VoDRa6hY9eBZf2laSJhfFIzeUiEs48q9IcvMZL21RmgNbsMoEa3eXqYx0EqNIMxVO/US3fFjvorKO4EOKTZ1R3TnjECWby5jX2YlQw3vwCGKR0YzXImFfEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aEn4ubSlfZC8d5zvTQtfBiiaBLSDPSceR3sArTbNzQ=;
 b=ZsggRuyxLjcd8+2f4JXPpiWJb7z/RdwMlc/1OsaKp3QfGH+7efVgUS7TRQ08hawPnxT9HZf0Io06NQwMx7j+vsSWq5URWBJVw9sLsLR2GraphdNuJscW6zflIaCHH/VRlwWOAb1g57Q3XS51Vg4QO4Ae8jm2ddAN89NCXmxeHIIrXnrbqSmZpUAe8CqLiabrAa9ZMZduVNzTwW8sqCtOIDiRW3qj1eNCtci7hVWc9hoDkgcKRT8lpEKnTS4wtgDGyRHQpTnF3mH5aMVZT0kPlClhF0tYKmwGQyNzhYcm+Bgezg9a0RlXWmcc2WOVk9GbmrodsgUUfb4Bt15Ani7PBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aEn4ubSlfZC8d5zvTQtfBiiaBLSDPSceR3sArTbNzQ=;
 b=e5YpwPeHK7pAtQ/qb0k69OTcEWf/KbpXCCJPLXQkuM8RXGXpBhD/XPcWItkbKTshWp5HIMPueTjwLWHAXHn4t9PsGA361buN5J/XU1M89pp9C/PNyWjkcNsKAMkkyZGxuuGzBHmaWDRIw9Bj2+WXSKzelCztognoPierPFf1d6w=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <872cb298-8187-41b9-9553-b0db8ce0557d@arm.com>
Date: Wed, 30 Sep 2026 18:46:04 +0100
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
Subject: Re: [PATCH v3 4/9] mm: convert PTE table entries in ptep_get()
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20260922-pte0-v3-0-5670b8cb9059@arm.com>
 <20260922-pte0-v3-4-5670b8cb9059@arm.com>
 <dhokijjou3rh3poqnqqpyoyac7wrqeprl4vlhzqokvh4lgjyya@g5hwn7sve3uw>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <dhokijjou3rh3poqnqqpyoyac7wrqeprl4vlhzqokvh4lgjyya@g5hwn7sve3uw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0519.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::14) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|GVXPR08MB11787:EE_|MI3PEPF00008493:EE_|AS1PR08MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd628e0-543d-4c59-dba9-08df1f1cf59e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 l9hI3Oabjw6gk2JG4lKodRzavQcorcEJkMoiVGYQoSx+pVgXjpBAlCH28YVA/H2bcu8jFMcs8yxnXb7xuyR2ZeeuN3A+u+X5jWuxffvkJQbZsvGB8tb2uBFZcMGLiivoy9dPd61bi2sHr35UxZvCyrTIrPQ76+Sh2sG/3DyjHP+QMizypilAoFcP8nV/cWA80tumvBfHgDXt8s0K5GgeCvYY30O1n0DPnxNUBEBPK+clJf86c/ecxBanrf0WDwK5w1+ohTRBoty/hYdwebuCRhj3cWPqashM4L0j6hDkKLqyQwS4J0YSQA/fplSLcEQGX1nPD6kXh+XgqZ6u1kmMaCT0thxOi//qNQRgYxJwV7Tww3rnybN+1/5+/OZFh3zTQRTc37nGRDbROuSbe44gV3OlKhLbhjydQHt9rXpzeKHFAxCsX4ymZEQn5KfvB9SPdu1nsJM5tQjBQIyHn+Ax5Lmxko0RWGD8vb4+F3SUxwt4u0CysC7ovuOkCU81v7Rv7a3BNzVKZn6M3zRo4+hWZaMuHrUz1Fk81k6aU40s+kApEGWtVaan+h7nng4xRstkSkwPCfXrCT6XRLfHKHjpddNUzRQL84YDM4N29vH/K1BYa1Hyqiiw1Z6rGf4ABzjRiNlIyrEPDqwbJOjoy3McCnuETTq+P+jtnn0aqiqe/oE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 eoqglAgi1nBFmowgDYlmh5NsECyYCBBi4iKTD9HbyKVulUPH7OOZZLsafvPdLMO0oGoyPr7qaWHY2xesx2OQgVrH8JjZWtRk+t2XFLls+miJxEpk/QNUHsdCTIVRZIEYchd2GxPo17AQbM8nOhpZGYr16kOEfKUAasNgX6hcSVq8VsP38DSl9e0Y2dXy4RuwwYxY7Q7tBFLpU23WrT+9OyoCvb2Zu+xtx9O6NODp48Vj6lwcxGV6VqlXLdLC+Am5PnyTIMZsyGsZpqGmVHqTEhQOsvasmM9HQmSiTCySlMCmtES5hRd3FveryCz/uei0/g82wRy4F+uBe1UTxz5Qiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11787
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008493.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99ea4608-baf6-473c-408a-08df1f1ab5ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|23010399003|1800799024|376014|14060799003|36860700016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qtGnieypPl6umB7VQueu4Yd6BHfhVYnY0yML0VOuLD+CX0/hcen8leZCOpC0sQWquUQ0P8lnHaNusUvV8F88LjUIYRoxdl/Li/gwYWjJf7ETLhUg5aew7iDOW3gnU6tY8OocA5+OmKPTomBgeOffPBkRLmn1IUFuNV6KX6xRpEiUCEJpKt0pk8vzPcLx+GLgfFotazWoGA+uVWTywoRu+ZgfAAFV1B9LejHr2WLSk7HFCJH6eDE2NRNzp5uuj+5ShAuerb9DqMPwyofbT8fFhsDDZDCMCqQRLJRLcloRWFpR8r0yr5Wa/8jffUWWIea/sLunpm0a1I5n4Ew9mB76gO79hWGf3cRyeWKz6udOgeTg62kb9KjZDwT0o5OakaV4Qpz4cXAuudrWDNxfBeD7WXjVaIkHhZf/6HoTC8j+nuVp4hJrd9tH4NRwo6kv5MxT5aH1Q0SKLEwoZ9WU8Y4YnfG1lFA8j6GdKfmxa8DP5C5EisCiDmlDRxFAOpQkF5fBjJWigwaAj5dghcX8YLxk0AY8EuI19Husmia6XLoQsagMX7ngIGmTYFGb1kvkFh6JfZMnfYzczSiE/xkyhUgghZgqQL39o8BrxCGoTJBIjrn7lO8w3YXSuyd/QuJpFVi+8LnimPMMSWRtTZKpURhKLMtdK+qgeQxAfYwgnLLa7zdLywj2zcCD9wCdKqTzut9M4v+dp1DVh590hcEfTMLvOA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(23010399003)(1800799024)(376014)(14060799003)(36860700016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4FWyfgwKnXPOJKB/mzhruUWvdbZQCa5BKsN9EFaONg/JosGBVdzlippip8LcsIjce+puH0NdlAvy6dxXNGlIq4PVbqKrRPylufRPTDftNlxsSNfN/O5NTzGMAe/+IZMDjoJLI1rMLgiW71FR13p+DYjJ5vsdfrt2PD0IsLmQh69XQGIFfQ9vAaUtRaEO+b6UAH8RoMX1kfnQv/vlt5zuPpQm5sYXHXUvTzwTF2b2hzFdiBX2HYrMNETqmdK0j6m6xPXHe/iL41s2rWOqIhb31dwnMuwZbCtrwU+Vfrh5nlXBYCA1G5Vo5EJenSt+AyNXbTmJe2P135o5aK3XEJrB5GAUS/3fU9RyiBJQ7qLfa2twxZ+nFzAQEoTQkgjErNh5Mb63apn3I4jX/yNOPesr8x+CODk7g3dH2wge/gj24rVh/ctPrr8uUd7w0bxWhwcD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 18:02:14.8275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd628e0-543d-4c59-dba9-08df1f1cf59e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008493.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7561
X-purgate-ID: tlsNG-d62444/1790791347-1D87F757-1DE7D5C2/0/0
X-purgate-type: clean
X-purgate-size: 1821

On 30/09/2026 6:10 am, Anshuman Khandual wrote:
> On Tue, Sep 22, 2026 at 06:12:32PM +0100, Muhammad Usama Anjum wrote:
>> ptep_get() now accepts a pointer to hw_pte_t storage but must continue to
>> return a software PTE value. Add __pte_from_hw for both generic hw_pte_t
>> definitions. Read the hw_pte_t table element atomically before converting
>> it to pte_t.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>> Changes since v1:
>> - Use software PTE value terminology.
>>
>> Changes since RFC v1:
>> - Define __pte_from_hw for the opted-in generic wrapper.
>> - Apply READ_ONCE() to hw_pte_t before converting it to pte_t.
>> ---
>>  include/linux/pgtable.h       | 2 +-
>>  include/linux/pgtable_types.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 19098e302b75a..41337da0d65aa 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -493,7 +493,7 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>>  #ifndef ptep_get
>>  static inline pte_t ptep_get(hw_pte_t *ptep)
>>  {
>> -	return READ_ONCE(*ptep);
>> +	return __pte_from_hw(READ_ONCE(*ptep));
>>  }
> 
> Just curious - when would other pgtable levels (PMD, PUD, P4D and PGD) be converted
> in this format as well ?

I've patches for conversion of all levels offline. But it would have been
so much difficult and complex (to review and rebase) if I would have posted
all of them. That's why this split was done. I'll be sending other conversion
after acceptance of these current series. PMD conversions has some patches
which require discussion. Other remaining levels are going to be straight
forward. Maybe I'll send those together.

-- 
Thanks,
Usama

