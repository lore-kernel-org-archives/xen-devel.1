Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F1CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:34:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442442.1660012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESiq-00007X-Oz; Wed, 07 Oct 2026 14:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442442.1660012; Wed, 07 Oct 2026 14:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESiq-00007Q-Kk; Wed, 07 Oct 2026 14:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1442442;
 Wed, 07 Oct 2026 14:34:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xESip-00007H-Hl
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESio-009cPk-NC
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:34:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65867-8faa-0a2a0a5109dd-0a2a4502a79c-18
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:34:17 +0200
Received: from [52.101.62.41]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65868-6ca4-0a2a45020019-34653e29e1cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:34:17 +0200
Received: from CY5PR18CA0009.namprd18.prod.outlook.com (2603:10b6:930:5::24)
 by BN7PPF28614436A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:31:16 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:930:5:cafe::17) by CY5PR18CA0009.outlook.office365.com
 (2603:10b6:930:5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 14:31:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:31:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:31:15 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 09:31:12 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGWXs07FFdjc6jE/ct6UTMsb+DkpMU9K7SEfaxxzvYIxOE4PRWUIKxBQkpPYbWFRDQo29E2nwcUxramWGTN1HQfiw60eb5IbizHX6z6i5XgLRatsE+M+euaHX3TS3IDcgrRytbR8AOdaXDTJO+YqD6/rbcZfFDE6mFlByek7e3tn2S8GE9znOXTb5lqubTQ96mYiMj7/cp6Z3/JpfZPipRwHVa8Yn1abyffws42rCxj9u7HdGq+iVI1r31Pau1cGH8Gf6+XNUsXHnzUGzCwnOi6aw25CZonMNcr7a0p8WmwEYoAxc5+DuPH2lS+XyQE80OpXD2hTnj7CnG03QNnpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMvEvt3PmEvvo8Z2rYykP2WCm+Odx1Ex0pKl+fqumhU=;
 b=KLVrMzlzHnznzLdpNV5YDUXxf89I4itIaeLXiUwkJL0nkfEIPzS2CuYmn+hKxb/AqzoECw99qFFmI3cRfrojokvWLIRJ1+3kQw+w0PlGJdFzM9esHVv8tK6q2W6LNibdc1COSpPK8GabuhNecmuXLrZcO/jiykZSCLkZ/EOhK5pJ4xmkbJlVHGF+LGVKb9lblqNztrKATQwy0xkWtpQmsOC+4E7HL/Cpj/49YchtbGqzHhfqbprLnrJKa6bEnN3g9tHE+629xkrZ1/FkzUNM3x1zZaYX8uCxuYk5yz8PGMv+cbswaJyNg6AYKUs1ZXDref/gTke93ZJYYxSFKZL5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMvEvt3PmEvvo8Z2rYykP2WCm+Odx1Ex0pKl+fqumhU=;
 b=c5ZZzJHVC5rKHCKNgl0SuHEidizFCnXw7SPpWE6NSnQv9+JT7YUhPxklVlVwHgdZZDZmxpvAZ04YWDezTZ1JLmEMT8mmDs2ADWkMGDZCHPDOHj6SVtj3QGTucmofpwEw+qvjgvFlQYgcHfBCKiMKHt8d+gzqDadN3PwiODqf184=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9600e1ea-d85c-4c59-abf9-bb90b1e8cd72@amd.com>
Date: Wed, 7 Oct 2026 16:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Sanity test specified domain's memory for being
 a multiple of a page size
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261007124813.177940-1-michal.orzel@amd.com>
 <DLYNCSBJ3FOE.IQ4BMB5FFYGL@amd.com>
 <45cb2679-c79e-4d67-abaf-a4fe8e5ddc51@amd.com>
 <DLYO8NTSYU10.23RIZURXYV9ME@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DLYO8NTSYU10.23RIZURXYV9ME@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: fab24775-6379-4367-0d99-08df247fa53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mSnjQd8XW1Z/O1raCckqQwt5cIXM0RyuAnNoykiEz09KeaIhJP59nVV/O3VBkVaaiyCcszSr1JLGN7p/M8oL1TZK2zNFLRmkBS92i1pmYlo+kRPXmg9ErMyF0PLLhYs84qLehqB2rf5kE3VCTlVHP/QfWsNazqPBG/w6g/rdZzJ9Ll3rX/PfVa5gI5bTXpuOIGK6dhf5ge2xC/hkMzzTrYHy1sYvgNpIBtw+yASvofFTyKePrMbJIAoWRQG/SsZtBQ77D/fsMfPif+sSVWNUP4Wmd1EN6Y+pcEjhxvX0psLlJPn21osw2ZZjtco78VEk/MUzaXJO0IrrAGGLBbGK+oseBgulrpZrpDRAz+wB/rZnHoc7VS7dGpo+ykw2BTJWeagi8vBKUCNNEOOqHqhNBKS+zVQY1WUZObwWdWEHU4xCe4w1ustLtAlkIi6hx8uqANrm6Ch2I/xOSeWWWCsTmWl3OepEfEh0oAZ0h2ZCHua8bghwxq+Pw/3S/WUs2A5RDxTQuhhCjalNwsqMerLy4Ovs8sG6bX4gPFyaBo2cOtjmlYzZg29zubazeKZHtRRUx9pl0GzWQqNKIOZ8MdAlKdUK4KQlGebaDM0YxhyDRH6hwHhsUAqcbk20pSunEi361dO7N3L+7DH7vpDanbCOvCH3qVPfDr9oDfMqA5U9Qoah/0/6vZPcx1Rmi5esYvMFq02JG1o7BOVbFixAWopkxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	COPot5bHIyiHHeATst8isjFwwx3okB2QHc4X+nBnNDMpBDxOvGZsYyiN/TPq12LheFGKTCXckvy/yQkXiBeVZcFGfXYY+cP2ZxEyLV0kSEGxUrcMtJFtG/B8nlPwn2OlFr+v1D4vv+hQZHa4T8+/l+Ls2mocF1sOm/elbUDJSrB8oqP2Xc+sLjYDXSvEVl/QTyvYV9AowEWcLZObHbKY7ogg5CjYFYteigljQ/vdomdMoptvZu/RaXKtRrB/T3bw1WflpAzXA9ZQKsBZDlt0CEzjuQwnVEgTXcCskm2NNmGmUes5ZVRF68Gxm5Ao8cLfkkxqhdYBaJHKnya7oCZfV1fPy1rx+/MTjcfX+zriCRgHwoxqPlcCcFJRGy97mqGw9bLFAse4AE6vp5408CGC3hZjKcUbGDIqVjKD5bAbczNpdtgngw72BoGl8e6vpGPe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:31:16.0794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab24775-6379-4367-0d99-08df247fa53e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A
X-purgate-ID: tlsNG-720697/1791383657-F02992AC-0AFF0A73/0/0
X-purgate-type: clean
X-purgate-size: 3072



On 07-Oct-26 16:21, Alejandro Vallejo wrote:
> On Wed Oct 7, 2026 at 4:11 PM CEST, Orzel, Michal wrote:
>>
>>
>> On 07-Oct-26 15:40, Alejandro Vallejo wrote:
>>> On Wed Oct 7, 2026 at 2:48 PM CEST, Michal Orzel wrote:
>>>> We require memory to allocate for a domain as RAM to be a multiple of a
>>>> page size. However, we neither document this nor sanity test. Specifying
>>>> memory size that does not conform to this requirement fails the domain
>>>> memory allocation in the non-obvious way that is difficult to parse for
>>>> the user (printing over-allocation messages followed by the panic that Xen
>>>> could not allocate the requested amount of memory).
>>>>
>>>> While there, fix indentation from tabs to spaces for "memory" parameter in
>>>> booting.txt.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>  docs/misc/arm/device-tree/booting.txt   | 4 ++--
>>>>  docs/misc/xen-command-line.pandoc       | 5 +++--
>>>>  xen/arch/arm/domain_build.c             | 6 ++++++
>>>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>>>>  4 files changed, 18 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>>>> index bcb06bc796bf..7dfac2062a37 100644
>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>> @@ -155,8 +155,8 @@ with the following properties:
>>>>  
>>>>  - memory
>>>>  
>>>> -	A 64-bit integer specifying the amount of kilobytes of RAM to
>>>> -    allocate to the guest.
>>>> +    A 64-bit integer specifying the amount of kilobytes of RAM to
>>>> +    allocate to the guest. Must be a multiple of 4KB (the page size).
>>>
>>> nit: s/KB/KiB
>> Is it? I don't think it matters at all seeing the number of occurrences in the code.
>>
>>>
>>> But page size isn't always 4KiB on all ports. PowerPC has 64KiB pages.
>>> IMO, 4KB shouldn't be here or elsewhere in documentation.
>> This is Arm doc and on Arm we only support 4KB at the moment. User should not
>> need to dig into the code to check what is the page size. It's better imo to
>> give this information right away and change in the future when we add support
>> for 16 and 64KB pages on Arm.
> 
> This is already the only reference the other ports have for dom0less.
> The document shouldn't be here since the movement of dom0less to common
> code, but the side effect of it is that this no longer an arm-only reference.
> 
> I won't be annoying about moving the doc on this patch because that's a
> separate matter, but not adding more easily avoidable debt seems
> warranted.
I don't quite understand your reasoning. If you worry about dom0less != Arm,
then on that basis HAS_DOM0LESS is selected only for Arm and RISCV where
PAGE_SIZE is 4KB. I don't think I'm introducing any doubt here. I can remove the
4KB mentioning from the docs if you really insist but at least for me it's
clearer for the user to know right away what's the requirement for the size.

~Michal


