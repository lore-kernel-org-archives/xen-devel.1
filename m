Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA80C88E73
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 14:22:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420994.1647176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x67Ys-0007iW-TM; Mon, 14 Sep 2026 14:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420994.1647176; Mon, 14 Sep 2026 14:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x67Ys-0007iP-QF; Mon, 14 Sep 2026 14:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1420994;
 Mon, 14 Sep 2026 14:21:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Usama.Anjum@arm.com>) id 1x67Yr-0007iJ-OJ
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:21:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x67Yq-00DbO7-HO
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 16:21:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6aa802e8-e002-0a2a0a5209dd-0a2a4507c1c8-14
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 16:21:31 +0200
Received: from [52.101.66.59]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Usama.Anjum@arm.com>)
 id 6aa802ea-b4ea-0a2a45070019-3465423be1ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 16:21:30 +0200
Received: from PA7P264CA0143.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:377::16)
 by GV2PR08MB8193.eurprd08.prod.outlook.com (2603:10a6:150:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Mon, 14 Sep
 2026 14:21:25 +0000
Received: from ZR1PEPF0000E6AE.eurprd05.prod.outlook.com
 (2603:10a6:102:377:cafe::84) by PA7P264CA0143.outlook.office365.com
 (2603:10a6:102:377::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 14:21:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6AE.mail.protection.outlook.com (10.167.241.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 14:21:23 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by AS8PR08MB5941.eurprd08.prod.outlook.com (2603:10a6:20b:296::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 14:20:47 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 14:20:47 +0000
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
 b=XR3MzMMsCLfi1h+dESjG8KtWgGQUHqk8UtKIE8R4AiOvLRkE0U1KQZGxBIj0IDBckU2LDtuzrlySXOSUm7hjhPRBSa3FeqB1gtg+BTFlIYRBUtGiotclj3FfVg/ApT6RvT7QHr0eGmbNef7V3YyC1GOWc6FNWDn94f6IbttzS7eKJRlKC+qVG6jiPmSGyolcixwior6bFun2W+bAOaYRFDEfgZpm4bWrJQeLXlXQpn6ZgTGNKeppFEUjVu7vDEnGGYBj06UQZnPSPaOz3qO1/hAaH5MPiejLy2tWzOSBJr90DsnkzzX426d2gNAH2Z1oGFSYShAxZamwiUk1VMHtVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkgII8j+B/QTCnrNsKIPJFbW+bzzcbLKy2xc45UpZ5E=;
 b=NE2r53R9U9WHfM2TlDGRGwfu9ibzwpG7AlAtMUprXzJN9LWMh1Ongti1DcG1YzJUnmN1SE17q9G/r0wxNMDhjiv30YXz5EkHYySQCDyjdgmUK5fphME+pSG2r8BbR/ZBZiznA+iR2BxHGIhV0ej1iwpbNSJ7m2/i28h/ZXhspMPEgGGTIA8MM9309hLslmYbv2ZORvKOBJ8QAsNfBzgyIA3DpDAwp5hfX/zNsMN3FBGGl4oUZD9+xjnxOJJCWarZzNNePaQkS6J1baroDV0+mzP7hOfyGxpcnZr/uxNIknTvndbwe/HsAOp8zT/HmiQk0W7qZ1FJ9xsBczR5j5amNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkgII8j+B/QTCnrNsKIPJFbW+bzzcbLKy2xc45UpZ5E=;
 b=A1gWcfxgzuTR97Fz99KaJWYhe9KQYmnZ7qVDQ4OZ+7MmqLG/tavH5JbSEezpwV0LJyGwmry8N0DAtqasHpVZedb6mJ11sngGsEdfCURti3vF/k93I0/RHIAvJlH3vmLfFnuA4Lq8tXN/RD5V8zxlR4M3dcq0ZWyt0BIx19teA1c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtZEPMsAQEu7Q2aR8kjGAqorM/H7o26fZY4gOl9ETXpEKQxpTLoBEbGepH22GKEPrcM26qxEV36jVCYsvmQxflGWAJuipOppMsXtyhveiaPgJh1lcsCT0r0+ND8TOKqOlB2mFTNAXrW0XB9066235SO6fbYjchYTRr4TpeQgy5h/Mm6XMHqeXKKTIK7hc65jL+ba7WmSb95QDeKSwBOmvKm4m4MasqEXpVzEJwbCkYCI1RnNUrvXA8xchasAEKb3cOJD/AgJZ86CHPTBCGF02aLOR9PRKP3hvDlsey2h/PeVFIDUC6K1bx2if5WJnEJxe+OdXqbv23ah3V/4pmdPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkgII8j+B/QTCnrNsKIPJFbW+bzzcbLKy2xc45UpZ5E=;
 b=SLQNf00nX/qGALisM7+0893bPJYE1HCLB1A2ixREYKLCPVdjyz/Jdyor6hHv5VYeh6DvFYAxv9yDXaAzWgem3kitKrC9DSYjG8AdcE3xNB6wmaZ/Mv2sMFs60mt1LFAZLd8D72xkULjx1YVW5+E5TWScbcxZKLzXqoP6nezCAmDm6xdaP66CHeRW4NxMzXigDZ1u042u2EKhSdMIlPrN0MqaaNzPHPCdHZOc1SRWojMeY35ZBpoHfiUFSZo22eUIwPb8CVPX92jJ7+94TI8w3IzuAJIHuoyVONT1av7jq1JR8p175RaWcsbbilKGdLoHtYO+OtirbpaePKKA4Ui9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkgII8j+B/QTCnrNsKIPJFbW+bzzcbLKy2xc45UpZ5E=;
 b=A1gWcfxgzuTR97Fz99KaJWYhe9KQYmnZ7qVDQ4OZ+7MmqLG/tavH5JbSEezpwV0LJyGwmry8N0DAtqasHpVZedb6mJ11sngGsEdfCURti3vF/k93I0/RHIAvJlH3vmLfFnuA4Lq8tXN/RD5V8zxlR4M3dcq0ZWyt0BIx19teA1c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <5f9279ef-2386-482f-b0bc-76a52b52d676@arm.com>
Date: Mon, 14 Sep 2026 15:20:44 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev
Subject: Re: [PATCH v2 0/8] mm: distinguish PTE table storage from PTE values
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, SJ Park <sj@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Mike Rapoport <rppt@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 ziy@nvidia.com, pfalcato@suse.de, agordeev@linux.ibm.com,
 ryan.roberts@arm.com
References: <20260903103002.1091859-1-usama.anjum@arm.com>
 <d5093fa7-d057-471d-9c50-f53e6fe267df@kernel.org>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <d5093fa7-d057-471d-9c50-f53e6fe267df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|AS8PR08MB5941:EE_|ZR1PEPF0000E6AE:EE_|GV2PR08MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 317cca55-8395-46dc-9dcd-08df126b74a6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|921020|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 nHqdZi896xslxpr5bFTsP7Cr5Iu5XTgM2rD0wnDOqRt++y+UelQPkjR6Q93St8VtNPwXSmDJY5Wjo9ONs/+6vxESuzyGfIua1LpeoMBX1Qa+1mpEXoKKEcXwRc9CdBMgGGSLGmNih+sIjYUHjUk7u/X67P10YO1hzxoe0TpayMRQqyTgIKxd8yskXYARn1vLyNJEd8GIvtgV3p4SDAzy7izD0zorHUNMmNIWNbK0NEft6dDMmQrX6RDTfQ97FUgBYURGPme+fPOIGqpdXU++Tv0rrDsWUE4cc/ruX9Pk/D57Yu7K/VqfsLU+3HVLQAvyuoT/gMqcgm6B3ersq5BQqoTudAOYHvgd2Xbqi5vUuPC/EMJxs9w/RqgKNo4toGq46GeUqpG1t8Gsl7q0dzhvd3OlwhITOxUsy9HkBgMs/+ZjdcH7mIzmU8COfLvQrV6SAUPVRDk5VD7u2hvyFNocnr7FEFTaroZV1rFWTYEIS0+hcOQ7Kh0K9fOPSUgTCa/L4q4yx9Jzq8bTF40gPUnIT9p0XciJ1j2UjQ8xQIFCgn7Xzo0y1WdvZ/SKrwdcji04LmGV6ZwEGneS6d7Ev75IExh8tD3DbwRGkGD2eqa6yVFZ92hB9SeRwBygVbHtmhd4zWArLyfAjWsYNjGnJS4len/dRwagvg1JoK8p3TiWlC/wmB6vFo8l1hhXiqgQZ46e1maj7XIemcwE4UD4NBs3Rw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(921020)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 x6jc8Ibf6nj8zYdsacdPlIriRr5eXndO8f3rVZKtJOglXFytmmpAAYQxI0LC37aEYFHWsK9V/PZU5BtFtWu+DbRMWo4KVBfka1dv0iR1eD0glezqHnmgs3DMsaR3uBUc+zZMuGI8VL6ocwrUpEGsgvECPI0dBL4Ezw5uE/J5cHxbQnXyRouW/cxhx1JNaUr+axWxy1pusRABAMv9TVJzqnW7tE9Qbv+lB+LUAa+KSfgtszliTTvCv/fGmDK4eEtF0Nn87fKeMtw6FrFmlvbSq9PJ9UNyIxmzfysXBfDb5BSlNUIGm/RD7uvrK42NUS/mRnBhC1KU/bxU6UBqIR9juQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5941
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07a6a9c2-9204-4db3-3804-08df126b5ecd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|23010399003|14060799003|36860700016|376014|7416014|18002099003|22082099003|921020|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	0PXH/drgR7Qs700WRE0lczL+BOSRU5MmIevTqtxAkEL/PNBX2UcMsCw9dv+9Iwtq7BUpJXlo9zNsyoWKeGORjpbX3Zd8gcqWSGiqnkrVtMIkR9T7Ughh3Br2SS3keIgA6O0OK39SNIj+YclOcMlRkM8ulLQaUo/h2x1HFwGbhV4HPgpGIkLYE4F25tPCsFLD+Agof2Nr/bh2V67skHeBUjUo1sYL4+xoMA+bH7FLpzieganEQ+V/RBBQ3msyDquBlWE4staCsdTPtAzWuns8GJKJtw/jQDdUyRYmszxWGmN4CNynxaEr06ARdZkUroKjeDspnOaAoYyqNd749aanVHo9a7ddojMJrKQeEPyN4/EsEO+wZM94guHAaefiO7B6yVJ6jFPmjG4ZqjGQnQ9o1ya1OQNqZ8q7UNm5lWtKl4A3Ccd03u8x3tJtC0jlAp3lNnt1UTzIK+GQ+reC3szeHULLhjZZ+stcFFLdhASH+w2yWPCDhDoIegw7EDpiendUlxtiC6tWSNcevp9UUAPIWUDOllo+9KHdWOxzi7v7f7RsV0NJkjrK+fvHwV7/dP8NnWKqs40tEqIk5jr9W0BMWTW0iT+rgk9Sz4RivcU6U3+krHhnKXRynpRGzgX4/2HIqaLmwsqQMhJiM8fQXOe6SSCKzR8vj5qeig/KYC1gwvgmu415tsGAMkO93UqDUc2KXi7ij/esa0dSrfd04awG4mn84rRpWi1PgRUNbJWMeCWASuuCCGJt7eISr7blj7Eo
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(23010399003)(14060799003)(36860700016)(376014)(7416014)(18002099003)(22082099003)(921020)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YXJdNj1/QTlxWRnwQfr+R2yeVCbxkX48HaqnlyNfPiSGwrzopUJg9UX7IpRpDu0afxOXCX4e7Ut6XzDdapR2/QN896aeTojj8wz2kEkWlUKRIWz5yjYL8+0NRU+ido4gY5yQ0bme9TaZYd/dxicLNs0KJB8f5susEVehPNXu5y1pCFg0DaOwc3XbB0vL19aqIOJPn/Ny/Kt/eP4xnxwvrjh6UxojWmAfQ84wWoueJ+7SpIl/zYV54xVVjg0fA0g7qwQ8hB5+AWjoDK0hlOz89HorhY3oRLJGYRWEXvoI+Za2uxkHM3Cj0xnFfvHfRH/EGykho518dPSmP9e6djoNadPfn1PREOyiI/pExGn3U4ATqT1xDsn1dz/DQrH7pcgr3dG8yrxYsUgRPTleKzZXVtRu4lilQ5LDvKc6np9SnKwUIk9b9ku/iZ1lCOhUxyu+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:21:23.6584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317cca55-8395-46dc-9dcd-08df126b74a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8193
X-purgate-ID: tlsNG-ef75cf/1789395691-A72DCAE4-77274F3B/0/0
X-purgate-type: clean
X-purgate-size: 324

On 11/09/2026 5:59 pm, David Hildenbrand (Arm) wrote:
> On 9/3/26 12:29, Muhammad Usama Anjum wrote:
>> Hi,
> 
> Btw, I was wonder whether the subject would be better as
> 
> "mm: distinguish HW PTE pointers from SW PTE value pointers"
> 
> or sth. like that.
> 

Seems good. I'll update.

-- 
Thanks,
Usama

