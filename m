Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15219C44507
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 10:20:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357893.1612219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlrb-0000mc-G5; Thu, 09 Jul 2026 10:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357893.1612219; Thu, 09 Jul 2026 10:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlrb-0000mV-DX; Thu, 09 Jul 2026 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1357893;
 Thu, 09 Jul 2026 10:20:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whlra-0000mP-FF
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:20:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlrZ-00EV8p-OP
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:20:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f75c2-e002-0a2a0a5209dd-0a2a4502abd2-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:20:13 +0200
Received: from [52.101.46.34]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f75db-5a27-0a2a45020019-34652e224711-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:20:12 +0200
Received: from BYAPR21CA0009.namprd21.prod.outlook.com (2603:10b6:a03:114::19)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:20:07 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::8) by BYAPR21CA0009.outlook.office365.com
 (2603:10b6:a03:114::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 10:20:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 10:20:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 05:20:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 05:20:06 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 05:20:05 -0500
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
 b=JDOBwc9+KsW5ioX4XVL76AS4y7gkfcOVbgeJO510Y0Lh3MDmUhQrPe9whbriZi5ZKaAlEhgZlNQF1KcKUqKtyx48Xijq7klF6Nq9/P808O88kc1uUPzW9+OpInVln8YK1jkkmECUylCjWXcdK2G/41k3ggIyQ8rHcbe6ekviwx/YFkVOi9M/rpF4z7mayTx3n9OLWJ++QhmkKddwDpeeb8jYyvqoUSM8HPRpVoO2yGsiC4BtCv9topIyBE1qHKrJROwlGf3xBHD8P9P2d3ekr/enQVbzhEI/mSEFcFgzqgKVaqHpUmqiwVRepOYRhVpQblC5Tt6bcjnA/byCSHzRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v82VQi2zsWs1smqpm2d1J8tsk+5mCBf0zr/djHvbhGc=;
 b=pZ677d5kDrZB/L7IB/t+LTYWlzAe/j8qSXC/WMQz1W1/I8b2pvkzHSY5WV7XRTfWgnU1YaUClGoLVQDHImi2aebK1AVYioU6lcON8f6y8PHgyxjYAyHMphL3wI/75k1TDP0RzPK8AVtnQ9Jnk7+9oFvWFaLcnSScwFutnYe5rZ4P2sqVU3tI39IqNYDUeCSvp8EUaCdreWidSfWhcRUVq4usBo4dHQ/xKl2k3LCOugCS9PgbxZOmL5OqQ4qBdoP2ncKCOmBi4oVyyD6h5QpPnW2O7bdOeq9nQgcRxpiQkHbYve9bOnPxiXZKuUEipI4qfAr4hj5FhVirU+ln6f8ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v82VQi2zsWs1smqpm2d1J8tsk+5mCBf0zr/djHvbhGc=;
 b=tgNoA67povDa7Zxd3Rkp3HT4AVDJ++jViZHfM9ryUZuSYQuQAOzvlyx1L7Gz9xKRue2H4FQmk01WGrTDqQ/k/TSeY3DZJFaPaT3P4WcIhoHj7fLdsWpbjJT2GQa/iv1UaKrDCOflvZfgufx2MbsL+xwemE/zA9d+USVfZQt72Ew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <be6755d1-8d40-455d-b320-9d26a0443e69@amd.com>
Date: Thu, 9 Jul 2026 12:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Jan Beulich <jbeulich@suse.com>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
 <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <19771234-d108-4ddc-9517-ae420aa70e93@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2432437c-277a-4a72-9678-08dedda3a638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o3gK/9Re9jzghNgIRrcAMXansyOo5IT+kji4MIPvhL46V4dFnwGUom5RJ/DG4adIUBC+1or/mMEMeFJreD1ALiBDy8ulNRE9qBWb/qerxQuhU3Ayg+U7zptRfoXdn1gHwOO7TmjK1XI0u+ZmW9KH2BA1UvP0OsAZCjebUNvFmQic6xmIaZny1We7pOTVm91UWPn1sSzc6no9oFUncOsb2AGJ33zZcocPHguLym1yHXuplYZ1GmTz2vBYKhgB2N4R5X+bBOStjvDus40l7FNN6KgR8vbC+oWBr2NPkK/ozbBIv6z44FAjiv4deUdIFP366JyMrW7dzNBO9Cu8a2aAalpnCk/l6olwzOL8H7T8CZ7HIITJaBd2KAjeYsYGPjbytVimul2yd6arJNopK6KGV0cSr1qwrLXgepajbNnp9HhEhQmzledv2SRt04pxXXLc4tRstlnAWLnalmRCl3PpYrInyCx7KZ5d73wmk4hBjdqgzq+bdByVP1PZJUdom6BFiYBfmujog1+VAgDlmIweQsHrx4asMvLre2pksBcsN6D536aEEO0iTZdO86Ord99HFmp1m2IOE+bbexDGmy0NE4NrxAw24rhmqQRk+QrJgB/F6TC3m2SND49/k/kLPrsGI8K6+PtHBPAHpp7fZDLd12pM0mBCBzeD0s/wKeKgQw7f3VkRF7nWb3ZD5wFtWvQKPAUvC/9Qbom6uNx/xen7hA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1JK7FtKjO7l8ToLN3Sqg2PuFRWEaCUT9iWkDvix5zSQyi+80WXMBfB+0GQDA1ITR7Hd1nVyUXuPJf6x30POk21+28qqrDKmPIGILv5PVqC7rLgLrksN98k8RUzoMvPNFvGPum822TrKjtPK9jRnI/dS7yIqVVrw40wvu7hNoabQMIkBvLU6HlxaXUSajmjR8IsHBymsDy14wM8f0BWoTVAohDls4SGHDT5Yj33Y/SBi5CmW6GOFMgeoX0ebDGjsiQy34PnD9rDuiIZkUcvSl5KQQX0vj26Q+zpEa7koGYfES0MBmQMibGeM/AVQfAOMQly+cPo1LSD0jnq/uEJnSDVeOwuiY8dgRh9kvIfPN6k8WiWKCrmAqZ8dKyRsHDvDAXyG2dv/ST8JO9ztIbU43dvDkB9zDj5iw3rFaAk44gfjIVZvNtnk1FxeaEvuujK+v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:20:07.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2432437c-277a-4a72-9678-08dedda3a638
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
X-purgate-ID: tlsNG-720697/1783592413-77B1F7C5-E9529874/0/0
X-purgate-type: clean
X-purgate-size: 2793



On 09-Jul-26 11:50, Jan Beulich wrote:
> On 09.07.2026 11:44, Dmytro Prokopchuk1 wrote:
>> A malformed partial DTB specifying both '#address-cells = <0>' and
>> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
>> evaluate to 0. This sum is subsequently used as a divisor when
>> calculating the number of regions in the 'xen,reg' property inside
>> handle_passthrough_prop():
>>
>>     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>                                         sizeof(uint32_t));
>>
>> This leads to a division by zero exception in the Xen hypervisor during
>> boot, causing a hypervisor panic/crash.
>>
>> Fix this by validating that both 'address_cells' and 'size_cells'
>> are within the valid range of [1, 2] at the read side in scan_pfdt_node()
>> immediately after they are parsed. Any invalid cell size combination is
>> safely rejected early with an error message and return -EINVAL.
>>
>> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Changes in v3:
>>  - use Michal's idea for placing that check into other place
>>  - reword commit message
>> ---
>>  xen/common/device-tree/dom0less-build.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index eacfd93087..179a2b88aa 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>>      size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>>                                       DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>>  
>> +    if ( address_cells < 1 || address_cells > 2 ||
>> +         size_cells < 1 || size_cells > 2 )
>> +    {
>> +        dprintk(XENLOG_ERR "Invalid address/size cells combination\n");
> 
> Perhaps just for my own education: Is it really "invalid", or merely
> "unsupported" / "unrecognized"? (I can see 0 being possibly invalid, but
> it looks less clear for values above 2.)
AFAIR the DT spec does not mention the limit other than the type limit.
The libfdt defines limit as 4 (see `FDT_MAX_NCELLS` macro).
I've only seen #address-cells being 3 for PCI buses, where the first cell
defines the space type). For me, personally invalid vs unsupported is blurry
because if something is unsupported from Xen PoV, it is also invalid from Xen
PoV, so I tend not to comment on such details (though I'm not a native speaker).

@Dmytro, to prevent back and forth discussions:
 - add brackets
 - improve the message as Andrew suggested

~Michal


