Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8602AC5516F
	for <xen-devel@archiver.kernel.org>; Sat,  1 Aug 2026 02:17:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379779.1624192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpzHd-0003EN-NL; Sat, 01 Aug 2026 02:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379779.1624192; Sat, 01 Aug 2026 02:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpzHd-0003EF-IR; Sat, 01 Aug 2026 02:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1379779;
 Sat, 01 Aug 2026 02:17:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ziy@nvidia.com>) id 1wpzHc-0003E8-Ds
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 02:17:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpzHb-00Aunc-NM
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 04:17:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ziy@nvidia.com>)
 id 6a6d56d1-e002-0a2a0a5209dd-0a2a4501e050-26
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 04:17:03 +0200
Received: from [52.101.201.44]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ziy@nvidia.com>)
 id 6a6d571d-5984-0a2a45010019-3465c92c65c2-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 04:17:02 +0200
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 02:16:57 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0270.015; Sat, 1 Aug 2026
 02:16:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=selector2 header.d=Nvidia.com header.i="@Nvidia.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u44/GoQAKEfhaTFN0cACyRuDUN/qFmU5KeNVe6H4h01LG6EoPe6fnBbXHMpvBNCKR52tlotyqMT1TD+lPynBXR7ecEjwk9SwoKLVYcpaosIDc3Lle0tXrynJpIK5XMVquvSoVXzKBgMRiAioSWi1+iRpJWbhwvOlk1cL6tMUJWO1yxS3fYGbhJPSRk7accS5G0CpIoZmpF3syHO/VbBkMGuA4/8iNx0iOU0QdbDUtOkYbKMMuUGe0XZCPBphpGdWG/oPchow0KvvOymP03pXnUH488q+GcGkdbCmmqiCjYUBV4qFMl0kKjjo8/v2T0ILSe5qr1KuaNr3lS/v7Rf0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rDyjehUqENheZn7IayeoBu38MNxc8V2l1+M+P1R5Kk=;
 b=hwVTZ+ZIjCwu3z85up7B78kt4GgN1SRYJ4xJQBqvlw09N6Wglz5dChzfwRxpQqoTp7FM3aZJQtI2bzzxGXyz/3D+koJsURiylUVybKgN8FLaLR5SISJPjx6rQVPujnnul2Q8RVnfeUs4ztAKbicL/xDLFDDoBzC7g1jAwHYVWYygHtXxJPbImAb/86Fe+WqZUoKJC7f7MQcPVwj/MZrj127Wo5Gpt/52C2Zt08Qe6cDjNrsGfk8UwPmZNAaX3e5U3SfBEDsHCQdQPBDDaexxDAwR9YmegDaFSk83NBV7ts1q11N7iFtizZROOnUZo//tuHsyE6ItZ5lnvPBPs6OVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rDyjehUqENheZn7IayeoBu38MNxc8V2l1+M+P1R5Kk=;
 b=ePN9dqmfoYRJWyt+gF6Y5HNX/2lKdq/3QAwQGnIf1SuYpRtE+2818HFICgLZOh55zQgQTBPJqmUGxUi+H3HTnAeoRuNIhTs/jW+23ZCRLBO3VozrMONGv/22ouJTIjTgX/tMDZvLVgfYPgx5Pta7xjaNt/IELhyG1gZ22FBg8AzVWlMnnKBO89zlcqtCYmaflDHjUTMExcMiwJ+QEw5pLigscriXqhULeqgV36s1134mntTwKv3qXhIr1X6nRn0gWJFlPYGyxCTsBH2qwPmXvv/YK0ihraVvrqbccSlb2pvjP4+522DVyksA5wm3ebQrfYwNoEYfTxi9LUyGBzOU6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 31 Jul 2026 22:13:26 -0400
Subject: [PATCH RFC 03/14] xen/grant-table: stop setting PG_private on
 pages for grant mapping
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-remove-pg_private-v1-3-142c97ba3562@nvidia.com>
References: <20260731-remove-pg_private-v1-0-142c97ba3562@nvidia.com>
In-Reply-To: <20260731-remove-pg_private-v1-0-142c97ba3562@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 xen-devel@lists.xenproject.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BL1PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:208:2be::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 223addd4-bae0-41ab-437c-08deef72f65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	ScYFd10qX5KaVaxBZiEZeesmoY/e1LTIdd+/y8YBpOBMf9QvAl1vdS9Q/+G1U4IRvoHJ6DrxRAKPmOTw6YTWWYVC9x1QfPVLI3U820TfHWdxwQDgEbeIUonNa5lXhCYqZ3ap0EJsOS2wuz3xf119PDTJdKJvFjktQXZUWAthEpZ3bUYXkzaAIqEdaM+8LoCMnXh1uF5QDXpHYHIHUEM+qiiWagwFth0NjBSAFuw8U0eLpn8AnSwIyZ/J8vJUuyL1tG4e7jWVgPDgYPHz/k0cxUpF2Xwj0fIWtQnAEATw4TnzCS90UCFnSH3fykkBQbqz3E6ehvfvsWMrkFjWJAqn9cXRST3IBXOFqBI0H34Z9D7jmLUXGyFPRFSaUj6qlgoBx66DmcHYqLXJo2FW4/WNcdkRRI7ugwvo7fWm0QPbEVV/zN79nPw/vJw5OADRYOoRsC/P8GJDodWiva3y/n+zAkv4Dyo8R7FQwZ4yuHJjSlhTiuY8OXtfXuZkSWFxTu/qCnpheTNxYDJXyBnOZkFenmpLxtoh2idPUog7PQyhHcb5Jf89LlOtcngAZxlceBI5aKXsx4tRLm33pDCCZPjqArSUZj7HnyDjM74734bJQs2m2tXIV2T5OfhBayjiAylA72D8l6+1lchkNDDNC3DddJgFDkXeeKHFEB46sxE6NfshlqoWesXTsBy9X2sFPwsrcQrD35UhG5kZOik+VQavYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnc3RzZqWExLeER3a0R2VGJvZXB1a21Kb3kzTXN0a1F2RUF6elFjRzhrRXBQ?=
 =?utf-8?B?M0pGUEFRRzRRVmZka1Z5YytZL01mSU9ka1QyZ0VsYjdPWWxVTVRzZ005dnl0?=
 =?utf-8?B?L015NlZuVm1PeXN0ajhVdW9SM0hieEViYjd3THcyL29mcVE3UmhFTWl1MzVU?=
 =?utf-8?B?ajMxQWM5dFZ4bXVlcFNCTEx6MEtIS0diSElkVWlhM3MvOFV3UE9zY3BWcWtr?=
 =?utf-8?B?czkxQ1VWVVptZUU5UnZ5UkVpYWw3SUtXSmtWYlhGaitzbVhtWTFxeTE4cmlh?=
 =?utf-8?B?cGVJd1pXM3h1T2tnSDYwN3VFbkt6MTlBMzlnSTdOeHV0RVNUTll3MGh1eGJu?=
 =?utf-8?B?d0NlV3VvSWhOS0xKTG5SWnE0cmNRTk1IUGYwZnhyb1M5MHBYcjRGMytHU0hG?=
 =?utf-8?B?UkkzK1R5NWZWRU0rRDgxeks4MzFncmMxRUJkTE1xQTJCTkczMUlyNTNWb3NB?=
 =?utf-8?B?WGpvTkk5OG5KQWtRaXI2cUI1cXk2NXBWS1hZN1NUakd0Rnp3YTU4K1d1SE5O?=
 =?utf-8?B?dldRZmJtRHllRldnalFyY3JWV1lwdnVnZGJnN01rNEJWWllxV2Z5Rnp5L1ZG?=
 =?utf-8?B?ajBLcS9aanYzTHA3V1VPWXVoYjBUYkpYbEVWMzVhTlNzV1B1SEZkdmx3V2Ni?=
 =?utf-8?B?ZzNiNjFYYWloektvK2hqWE8yMjMxTW96RURjWmdnUXBUVUo4REgwS3dCQ1dX?=
 =?utf-8?B?WWVFVG9IK0tqWWFkNUlMMFUwenJmZ3hFNitNUU5JdngvbUN2eGxXY2RQTUd4?=
 =?utf-8?B?dlo0VUlNWnBYRVlTdFgwcDJaZHJtaWQ1d1ZteU9zbVhtaWJlMnY1cU9haUhy?=
 =?utf-8?B?RHNDSmpJK3gvbW4xQXJyamZPeUxzMWRmSXVHTG9nUU5STkNqelhZYS9GOUdS?=
 =?utf-8?B?SWJ1cmdvKzkvT0pDaE1BYkNxL3ByMmc5RDg5c3owQlc3NmZBUS9HRHFvbEkv?=
 =?utf-8?B?dGpZQ3lKSjFyc0p0a2E0b2JxWXdyUXFNTkNXQW5XN2k2WDgvdXFXN2p1YU5E?=
 =?utf-8?B?TnNRbC9hWjdmUWlkeGJhYWY5bXRXSzZZR2hXTSthdlJrUHdaQVRpTlQyOFli?=
 =?utf-8?B?YXAvS3NIQlRhN3ZxK3ZqVVY4WkRxcEYzTnlORXRQOVdaRG15QVNqbFFZWUtw?=
 =?utf-8?B?eFExaHREbVl1Z3BKaVZacHVUS3dBb0RKSFhtVUFTNWRBSjQ2UXBHbEV6WVo3?=
 =?utf-8?B?YjA3YVg5VnZvakJsMjdsQWZ1azlaVGl1K05YWVRoVWp3ckJuaCtIR0hFVjQv?=
 =?utf-8?B?RWhjNkgySExPeVVpYlJNcXQxdlZiOVU2cHZONmZHdDF6VmVsM1pXNGVuNFF2?=
 =?utf-8?B?MlNHQVNCYUkvOEExc2R2VWxyTmJJOHNMdlJkb2M2VEFhdWdWbkxyUTR6UXVW?=
 =?utf-8?B?RFhiTmtNOHJ0NjZyWUFMbW1DVWdkc0FScmZjWmdFbzlGeXBzNzFtM2ZlQ2VV?=
 =?utf-8?B?RDBqek8wVkdZZ3NUWWVmbDZqNDNiRU1TeHM4WTRRWTIxbGlaN1UzM1RlRTZL?=
 =?utf-8?B?bWFNQ0pBdFZlb0NBSWFpMEtoa2pjNEZxeXBUWU81eGlPT0ZkaWhJTmwyK1V0?=
 =?utf-8?B?di9BRzJrY3RqbkZZc0pWdGZFRytReGRPeU0wdjJ2RThIQlZVMnlKZTFtelhr?=
 =?utf-8?B?eVQxaU41UnVZREY1ZENqVG9qdTVWcjJVTE16NUN0RFBUZ2JGQ25yZXFhQnFP?=
 =?utf-8?B?d2NLU1pweWp6OWFRaEF5UW9FdFdlbHBTeHJWdUZha2tZWjJyVDNVNGVXSVEv?=
 =?utf-8?B?WjNWd2VDNlE5bkcyb3VSRFpEQVdGQlBkUjJDSXNWY0o5NEFCNVVCVnBjZVV4?=
 =?utf-8?B?OVhra3p1ODlvbTlBeWsrd1VVNklaaWdackQrL2RZcXpxNm1OeWVXSGUxVFND?=
 =?utf-8?B?Znh5ZjhsVmsrTFh1eWt2b2JtVmpiTjd5WjhMQTkxSVZ1ZWxwWE8yOWpKdE92?=
 =?utf-8?B?N0xIYllFVWMzUVFqTHlZU0d6YXZFSkdRZ1JieC9Gb0pCelRpaUsxTFljQzhi?=
 =?utf-8?B?bjZaNXpxQTgrOEthMjZjVmdUbWlKcXlPa1FGUU83Qi9nbXIxakpUclB6RHEx?=
 =?utf-8?B?b1RDUVlHN2xqL05qaG9DY3Y1K3R2SFd0Vkd0MUs4M2Vtbi95eWYwRnZiWTZJ?=
 =?utf-8?B?OXVmVUs0M21Cc3NVVnc4ZExaN3RISWg3MEpFNDhnVjNjaHNaYUVqbjRWNDkx?=
 =?utf-8?B?Q2JvYTg1aE9zaGxrYmo5bzd4RHlubUtiem9JTGZFdHlhWStsMTl2QWlod2wy?=
 =?utf-8?B?K1gvaElhOE43UjgramV3L0lPaDlrWjJEeXRnWkhJWml6WGhlRjBhQmpxYmk2?=
 =?utf-8?Q?ITaq4Fubij1f0izSo5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223addd4-bae0-41ab-437c-08deef72f65e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:16:57.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0Am5J63xefsnsrMlCk7fC0Wd3OeYNH67IOGu5z5PLPygKkzgKEkQimaGrjMNeEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
X-purgate-ID: tlsNG-d62444/1785550623-BF46D757-6BC18A1D/0/0
X-purgate-type: clean
X-purgate-size: 2244

gnttab_alloc_pages() stores xen_page_foreign in allocated page->private.
On 32-bit, a pointer to xen_page_foreign is stored; on 64-bit,
xen_page_foreign is stored inline. Checking page->private != NULL is enough
to tell whether a xen_page_foreign needs to be freed on 32-bit and
page->private is zeroed unconditionally on 64-bit.

It prepares for a future commit that remove PG_private.

No funtional change intended.

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5
Signed-off-by: Zi Yan <ziy@nvidia.com>
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/xen/balloon.c     | 5 +++++
 drivers/xen/grant-table.c | 7 +++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index e7f1d4ca6d753..7f47b0ad05607 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -182,6 +182,11 @@ static struct page *balloon_retrieve(bool require_lowmem)
 
 	__ClearPageOffline(page);
 	dec_node_page_state(page, NR_BALLOON_PAGES);
+	/*
+	 * clear page->private before giving it out, since it might be used to
+	 * store xen_page_foreign info.
+	 */
+	set_page_private(page, 0);
 
 	return page;
 }
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 35f879dc5dfb8..cc348ba2e0786 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -875,7 +875,7 @@ int gnttab_pages_set_private(int nr_pages, struct page **pages)
 
 		set_page_private(pages[i], (unsigned long)foreign);
 #endif
-		SetPagePrivate(pages[i]);
+		/* Data is stored in page->private on 64-bit */
 	}
 
 	return 0;
@@ -1031,12 +1031,11 @@ void gnttab_pages_clear_private(int nr_pages, struct page **pages)
 	int i;
 
 	for (i = 0; i < nr_pages; i++) {
-		if (PagePrivate(pages[i])) {
 #if BITS_PER_LONG < 64
+		if (page_private(pages[i]))
 			kfree((void *)page_private(pages[i]));
 #endif
-			ClearPagePrivate(pages[i]);
-		}
+		set_page_private(pages[i], 0);
 	}
 }
 EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);

-- 
2.53.0


