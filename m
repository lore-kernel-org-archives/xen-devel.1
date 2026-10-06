Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4EFCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 17:01:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441685.1659269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8XD-00037l-NC; Tue, 06 Oct 2026 17:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441685.1659269; Tue, 06 Oct 2026 17:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE8XD-00037e-KK; Tue, 06 Oct 2026 17:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1441685;
 Tue, 06 Oct 2026 17:00:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xE8XC-00037Y-DS
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE8XB-00BEu4-9R
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 19:00:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac52929-2eae-0a2a0a5409dd-0a2a45059f7a-40
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 19:00:56 +0200
Received: from [52.101.48.60]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac52946-4cb1-0a2a45050019-3465303c4f89-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 19:00:56 +0200
Received: from CY5PR19CA0015.namprd19.prod.outlook.com (2603:10b6:930:15::12)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 6 Oct
 2026 17:00:50 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::79) by CY5PR19CA0015.outlook.office365.com
 (2603:10b6:930:15::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 17:00:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 17:00:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 12:00:49 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 12:00:48 -0500
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
 b=aLP3CvU5c28llY55pgkw+ZraPZm4mgxZ4we+Nk9awcNu6I55lqLzy+jdHvKm+XFqrMgWq58mWvuJ1iTENN49j1vl0rQyPNolK0yJMBzzS3i40QNHtZCNeBbOO67O7Ef7JGXzHqcjnNDqAfNqRmQGvDVbGhLrW8/lYEfVZ17DGlEqv9hqb9xXAA+USPUQnQDhdVpmQzMkokQGLgtx4qZEJbrgzbfWEZUjt3qtH41Mmd4k2zfsWNvtGWzsPNo6iZVHHCKbjw1UIozWc4dwz0uCBcXRTiLWNKWLje8ie+TYmIGO9YsYiU6P7Jxco0IB4INGhBlh/GxmVWUuW5oLeqp8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWLsZvlZX7pSxYLD31SMhUpsra19H0qFDFuj1hVn+6M=;
 b=gVdFqIYzQTOKX0nmeKvQzw15NcVkiLSVZRGkUPksAu7vXt8KNJ4h9rIAaZMiwtDZ0VyA8dxnIuW7o536KKxLrR0duJJ256PJudh/5DNBP1WW75PplXxv3nEWaErDvHwlARI3+j/buq8T2RuDmdaOIdXrY5/bBuVs9+6o6Hk8yaVnS8M1bnMVNUZa6w4ITpZQCmFrEWbEmULTa9Gtk8Tabq05yXg9Jt0Jk6ERiMjPxVJ6rv72I16fbCY7rGNeXEqtLhUGV8HNSeHY+C2SLJ1hRHGb5AYzcbD/eIzVdJffCiWVqR4yFvkh8W0Bt7/8TGKKmc2cc3ByywgtHYH9Rtf1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWLsZvlZX7pSxYLD31SMhUpsra19H0qFDFuj1hVn+6M=;
 b=TXJcCC5TSfcPSN8NIO95Z4k44VYjxaJZiP1D0qNCV65OKhV/fCViVNi2+KGxxgFf1j7hTkh6hPcyAesf4nHNV5Fq6P/RaiLyDOnguEOldNN8MZA7JUffScncUBUYbFmkUqYM1tFT1AQwsK0JWLMB+vv4eUVXQGHeI2teuC++SoI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <39b13edf-1280-4821-beed-615fbc4915f6@amd.com>
Date: Tue, 6 Oct 2026 12:23:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Don't clear clean bits on every context switch
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20261006144805.2575991-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261006144805.2575991-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e768ec-eb4d-4fa0-d343-08df23cb6003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|10067099003|6133799003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jm0I4Z7hMIk3noa3wjJcn6SYw0PkQE6NQM9YZ4I8U7vdALRriYFtax+GgOW96SJtQv0F6NzDJbyRYPlweZwCIPe1+PL59ynQmTkoaUP4LGxad4J2prHNnjtz1U8LJLVO//yhd7i89vQPFNK9rBEGHF9+9f95VYz6mEjfXyrg2TX7gyzNUDg6Xm3GS6zBWQTkakgrlK69aCJ+urEWOyGaVJgKGgjhN/tBoh/xstr/6SibJ66aqcbmZZP9l9D+u9L5OVXO7L2M2gxZ6MVzgNlb4xd9kPkLqkCRSAVuOyN8kfxmgvU3f/ngfmgBmeKuoNY2HYAFY1DddxHSKFJ4uIMB8ZiFSCCXWiNRoifILYtEFkuwh24+h0lxmAwgwmh0mVlfCn6MbloDsRVEUEZGK1v/WOMJqbqlYEKYFNkxL9B2ZZ9kL8rm9MK7rIMnE0fgFhVAjyhohuE9xOZ8aWdVW3/V22TzAuW8UKOnG4MIZoAzN9zQsWTckl8yR4X0im2LS+/tkjPszJaxlbUDm4nwpkQQGaEHhzeuqgsZvrgz2Tm1kEYk3r7MPDZEv5m8SaMa9U+PFLG5NCDahj4vQK6Ajb40Su83GiLNH/+pawi76FBF40xDfYYX4AcISgzxb5ERfZMRCElmNOqYB8MF8wWBx0P1BiYiz962gfrnkTcl6DkBZA237g7XZvOvb4VR5eF1jCI4OXgP/0RR9ACg3uAyHat44g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cTv6K4KBH/tCS+gOgQ5xLHb135n/xGGSpjJZL3/Bh2XSR5y7b/QyWgMDZq775LI/gOqCBtFBxRrXZDQjlhimUgizaRtsnSLqqwrNXkIegOONliuFqzXyYAavA1rckAO2Cl0dMCu+VyZssk5egCs+QcggDaTS5DPf85lsgxnXy7hel6mT78sv3se6XTKjbOIxOyjDwFh4lqg+HXt0tn3iNwI9XbsaQ1xxJ6Jp8uSLP/I++yHjK+xskFsJ+dxGm2bXBSfFvclbL5xeDjmf+dW5O5lW5MbXU3Vx72m+GQ3u8XF5I0MccaOiZYCZcC6u8+itZ7bndTqzeNBooYOAPuqkStnfU5IYkPvDE7OA6017yvC/5mZbI8XIDylo87maLYkKoKYOi9ou+tXje6LKUcefbL6vFi4mnMWbqUdhsVUChx8ydUyiGZY5dEkq72kfBTvK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 17:00:50.5190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e768ec-eb4d-4fa0-d343-08df23cb6003
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
X-purgate-ID: tlsNG-c201ff/1791306056-6BEB92A1-63FDDF49/0/0
X-purgate-type: clean
X-purgate-size: 759

On 2026-10-06 10:48, Ross Lagerwall wrote:
> Clear the cleanbits only when the VMCB is used on a different pCPU
> rather than on every context switch to the vCPU. This follows the APM
> guideline for when to clear the cleanbits:
> 
> "The hypervisor executes the guest on a different CPU core than one used
> the last time that guest was executed."
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

The other times are:
"This is the first time a particular guest is run."

The vmcb page is zeroed in alloc_vmcb().

"The hypervisor has moved the guest's VMCB to a different physical page 
since the last time that guest was executed."

VMCBs aren't moved.

Regards,
Jason

