Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD13606A32C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nRGEOouJ
Received: from list by lists.xenproject.org with outflank-mailman.1468545.1677611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNwPn-0005cl-F5; Mon, 02 Nov 2026 18:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468545.1677611; Mon, 02 Nov 2026 18:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNwPn-0005ce-Ax; Mon, 02 Nov 2026 18:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1468545;
 Mon, 02 Nov 2026 18:05:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xNwPl-0005cW-PW
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 18:05:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNwPl-000oP8-2V
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 19:05:49 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ae8d0f0-e002-0a2a0a5209dd-0a2a450ca11c-26
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 19:05:48 +0100
Received: from [40.107.200.26]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ae8d0fa-f479-0a2a450c0019-286bc81a7e7c-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 19:05:48 +0100
Received: from CYZPR10CA0015.namprd10.prod.outlook.com (2603:10b6:930:8a::27)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:04:43 +0000
Received: from PH2PEPF00048913.namprd05.prod.outlook.com
 (2603:10b6:930:8a:cafe::33) by CYZPR10CA0015.outlook.office365.com
 (2603:10b6:930:8a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 18:04:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH2PEPF00048913.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 18:04:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 12:04:40 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 12:04:40 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 12:04:38 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSPf8CwJ14b+bfJVDS+yswC1B6E4O0wQHUwC9mdzxly9lEZU8saUfS+5LPWGcgHLXLuEWWvQXBuxBZDz7Dc302HL+QgOCLMjkYnKONhM+Yl61bpudqIKvlgduc/8ATV46SsJAgJrcnrw4V5SsMuNnWMFO+plIZgCWJggSifSJIDrfcJcjWLeknPq1AUmjQ9Ds95iI1U0vJofD4PTi7Q3fi3J52v/9EFPuO7ztxpe43z/oxm/izWoMIzr8GWseUAy4jmjNQiJku2iIH5sg/PDIf+3Q/CyuvBSJGsoHTuDp1PUqakdrM8geNtpnCc1Xjcr06ne6pdo17tIYDicvPeCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwfGYqnkijvtIMMlgewN6ixrvzlJO7kkmINW8GjUNYA=;
 b=GoCR3pL1bk1qrGp8HgPXw7tOvFOtEDu7xzyp+kaGWQ9xMDCHLAHPa8xtW/d+P0vJeOL+Jua2G7v8IjSOeiYlx9tE0Ac9x8fxQIDVcOR2iKuMronOpbkdQz70im/h2XyHM59VI/tRFHIzrJ1Ao5ewHoUmwHt1vDazBuvEGETh5zYUFzXy2a/HCAiI5hX78SeWILhMn/7EeTxCv+Cg2GE4uu77UCTpYU1kLIjA/adLjyPzO+CVvwsaIQlIO1FvNHbBV/aMgzr1GH5GDCm2l1TgAaPLjfPPFiujPM7DitHckUfpGW9tveEqHKvsUdX429zA72LJSo4RqOv10JTet1MfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwfGYqnkijvtIMMlgewN6ixrvzlJO7kkmINW8GjUNYA=;
 b=nRGEOouJ+K8Hxe/SqYJgYtjUWm/cBe2n3MFHfSXEfZFbWma8Giw9yifRNXR9oNVUBSmpPCrSb004SZ+D0QIk6yDnaMjxELwNDlRV3rKTW1r9V6y46EFHkS8qo/uh1WVBgNfkgF9Eck7LXZsv/0RZfCjNx9Yrdpw6/kSl9sJVCcc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <979f3d53-d4b8-411f-bc66-cf487ff76d42@amd.com>
Date: Mon, 2 Nov 2026 12:18:02 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/paravirt: Add ioremap_verify_range hook and implement
 it for Xen PV
To: Borislav Petkov <bp@alien8.de>
CC: Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, "Broadcom internal kernel
 review list" <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Sean Christopherson <seanjc@google.com>, "Ingo
 Molnar" <mingo@kernel.org>, <virtualization@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20261031003309.3751-1-jason.andryuk@amd.com>
 <20261031032009.GIauVeaXTMNHgjYEiM@fat_crate.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261031032009.GIauVeaXTMNHgjYEiM@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048913:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 90bf250a-0a4f-403b-f025-08df390bc477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|10067099003|18002099003|22082099003|261102123227099003|56012099006|5023799004|11063799006|4143699003|261026140227099003|261021121427099003|261022105027099003|261026121527099003|261028144727099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	RD1kxsIcRfhcYM4FXVdxenVuKh9rUWHBiUWDx8roZtgLgqJe4YWyYsmYrCz4hwwB+HRDqyR9lY//PZKsy6eaY0lUfWlvjrtfmFL050FvzfIBSjUE073T9iuiuZJc9c5hcXYnCG9pkHXpVOkPPLsXKqzuAGw6VkSO7A3LDZHsFcRwcy3ePFbImC8LPOnLXlytA3FprcTXkr2zmbeMlS1MDPj0yipRdYDuj05xzVU3gBkLoaWw3WOhQHCoaiv9lczQU2lizR9yFPmU3Zesa3y8Y6+JpjHMmrbpc/xBi6ZlLMmJNw0I+y1tW46mKFfhTGMi5vFNnn8WmL3adcictDVaym1bhp9auyiUKISAecdF9/0z378VZkFXWK5KuPSz02/19TtjIpTCGsyQ861bN2f8OmSoqML/iO32sSJBhaWVmgt9KzvFgATlsCIHvP/v88FUm1Z2aLrYNctb5+DMaq0ZbEjxYSxVfiaoSX+16ZfFbtj9v5vUTr3fcxWe0+WXYs6hdA/1F1492jAiR4HrsoAKhFw/bHQnGs+wAGrs20X+chvUrViaCvxWvNKDa8uSuwHmOfOdboI/tmbWifUUF8oU0ujc8I0gzpU4GBDoISknk9LeIIRJEWsvW+2X5DE9Uzl8AZy4BMKGTiDDaV7RplJcUg00VeaLL9/6XP8T39l2YxO08M6cfB1ZfCrPezjgRB3kLPXQyHE3n8BjraygXCbvIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(5023799004)(11063799006)(4143699003)(261026140227099003)(261021121427099003)(261022105027099003)(261026121527099003)(261028144727099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2/ZH8JOZyC4lsCegZ+e3gHVdOZdlPYNgdPxcEDCOc2ppYPuPHlf/cz5vpeItYr2MTcQvi0jsOzZ70KJKX99CdvXPXD9VM2C5DMmBksqLfLsrkKPqcJf8MXeUcH/byagjWILOHoAMt6uyNhn9luwNYS5fKgfLEfFhOVbZ9buML1GhLBOKNpZy/OYqS3IwvUolGbWglGHp06rC818FiUevzOFDLg0kNlFHvnZYa0q9oLJuXIwF0MPH45mbcrQ3uuXG2fGHmnhhQ6nUpdGzLTtSPAJuvG5k7/Y/lxpfc1FMVhJrJdTLluyfKRhZ0ZcDQvCAFKt2L7wojUekqof9qQBZq+IWVfhb0LUcO8dmtcgYrsE9S4TW4mfCcxJmDoXg0QAceg6MA4Ty4EWNOyGy9D/Sce0x35PfkBj+oIul+W5hbzaV7NVMLiEgUvvKBDb1SJib
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:04:41.2402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bf250a-0a4f-403b-f025-08df390bc477
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048913.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
X-purgate-ID: tlsNG-d25034/1793642748-008CDA5B-7DD20106/0/0
X-purgate-type: clean
X-purgate-size: 2317
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-30 23:20, Borislav Petkov wrote:
> On Fri, Oct 30, 2026 at 08:33:08PM -0400, Jason Andryuk wrote:
>> Xen PV guests update page tables via hypercalls, and Xen refuses to let a
>> domain map machine frames it does not own, such as chipset MMIO in a domU.
>> The set_pte() paths ignore the hypercall result, so ioremap() returns a
>> mapping whose PTEs are not present.  Accessing the virtual address then
>> faults.  This was seen in print_s5_reset_status_mmio() on Xen PV domUs
>> on AMD Zen hosts.  The machine address is not accessible by the domU and
>> faults on access.
>>
>> Add a pv_mmu_ops hook, ioremap_verify_range, which __ioremap_caller()
>> calls after ioremap_page_range().  It defaults to returning success.
>> Xen PV implements it by walking the range with lookup_address() and
>> failing if any entry is not present, making ioremap() return NULL.
>>
>> This also affects a Xen PV dom0: an ioremap() of a range containing any
>> page Xen refuses to map (e.g. MMIO Xen reserves for itself) now fails as
>> a whole, rather than succeeding and faulting only when the refused page
>> is accessed.  Pages Xen forces read-only are still mapped present and
>> are unaffected.
>>
>> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
> 
> That patch is an innocent bystander, if anything - nothing it can do about Xen
> being weird about not mapping host physical addresses not owned by the domain.

Well, the point of Fixes is to link the two seemingly unrelated changes 
together.  This change only exists because of the other one.

> And TBH, all that gymnastics just to prevent this from running on Xen, is not
> something that makes me all happy and so on.
> 
> What is more, we try to get rid of PV ops, not add more.
> 
> I'm sorry if I've misled you with my comment on the previous thread - I didn't
> think someone would even act on it.

Surprise!  :)

> And I know Sean doesn't like X86_FEATURE_HYPERVISOR but sorry, nothing beats
> a oneliner at the beginning of print_s5_reset_status_mmio() vs this overkill.
Sure, I agree and would have gone with the simpler approach.  It's just 
that the previous discussion looked like it was headed to the PV ops 
approach.  I'll rework with the simpler approach.

Regards,
Jason

