Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C19C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:12:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405650.1639109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1itI-0008Al-TN; Wed, 02 Sep 2026 11:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405650.1639109; Wed, 02 Sep 2026 11:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1itI-0008Ae-Pj; Wed, 02 Sep 2026 11:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1405650;
 Wed, 02 Sep 2026 11:12:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1itH-0008AY-Ne
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:12:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1itH-009Im7-4A
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:12:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980493-e002-0a2a0a5209dd-0a2a450cc4b4-12
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:12:26 +0200
Received: from [52.101.61.56]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980497-f479-0a2a450c0019-34653d38cb9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:12:26 +0200
Received: from DS2PEPF0000455D.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::515) by SN7PR12MB6959.namprd12.prod.outlook.com
 (2603:10b6:806:261::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 11:12:20 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:f:fc00::214) by DS2PEPF0000455D.outlook.office365.com
 (2603:10b6:f:fc00::515) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 11:12:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 11:12:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:12:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:12:19 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 06:12:18 -0500
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
 b=Qk6WeogNW+h+nayx9Iuuq0ZrDWgdrg1KWQr6GZpnu8kJIuYeo9yIWKOOIFwdoyQvmO4Tod/5rNrloSAtbmPnCjJ9+5rE2dICeSCJh3k7JOk7vi6lJWSwMbD0Dith6IvRfws0T3eRX8/S5JKYXqeCmPrqqBYQA+FngGvGudNhmGssQTe/u2x6QJ2faBHXo8zG8JbqFUdpvM7ifPuUZeJyjsuTziwPhOX0b7Xqq/myW6qBDcM447PMnkH2kJM+cFQVi02niaJ4yZn9pdvnEKMDtO5GzhPtpjH99eX5DaRTg7EfPijwAaW3sWXs234EvyKwMHdHOAKGtxoRsew3yIjHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZbdSDvhE8avk4BPKgNip2kR3pLCvmN2CAqV1gLtg6A=;
 b=uDaNloaL9Y9UCNd64lvTxA3E2VZjFfhWUYLnSfopEFcFz759Lfn9ulZYXexAGbH7M1U5j2UxIOyKCWogNF1i2pn8tFI6Ar8+k0iPEiPBOOhaRAbe3Q9dJDkPG6O4EQm75hygb4ksL37RGnzaffS/+Ynnnz+byzoA1lgo457tVzoJibH5AAmRzcEr5II26QW3PeOLpjyUaHVCPDNItolumJTWw9b+qhMkM1eMz04QFOSiScCWvUpaScakmtu4ReBZMSmLLA/6w0NGdP3IG2lzZXkknKFpkusLgPp8zri/B86yxbyrrCn7YbyEhGGG3OgcI87N12NE8R/2YViaXTnUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZbdSDvhE8avk4BPKgNip2kR3pLCvmN2CAqV1gLtg6A=;
 b=gQE6Uqa4i6UojUsZ8IvR+aQ0s7/YE3X0f5UzoPpn1+VTF15b300eLThgHTmgBeBXjBHaBG40+1WHGEZYp6Ixvl7jz0DFVs0KDNQTM52iT6tvcFRomFF46MT47MVJ6oEoaYpDg9OxWTCcLrpEFjoGD1/JMXBQUupo94Y5vBSjdtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <37875a01-a4fd-4c2a-8ae0-df88c769b9f1@amd.com>
Date: Wed, 2 Sep 2026 13:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cmdline: Document console=dtuart option
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20260902073606.61062-1-michal.orzel@amd.com>
 <20260902073606.61062-2-michal.orzel@amd.com>
 <37872f45-8078-44ef-9db8-a9868c9b79aa@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <37872f45-8078-44ef-9db8-a9868c9b79aa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: d34792b1-9972-4d80-7789-08df08e30e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hMWZFUnERi4Ph4GCfvOJLdVRLnPBNmOHtgo0tk/tsEJ97H9qzcOJNSv9zXHy1k8VElrBqhXBCUVALNg0tTxWIHr+VpmFc1YI11JsLDxQy4LI5hr8qRI4LAtM2UnpRIB+GaUCOSMlpa9erI/HnaA8kaMnqtBi6H7pZq6H5Yyn9L5kQfUZsaPi2iRuXfeLnSLWj25OZUmqqqdinvSwNWqFbRJZArK00eSCZh7NO6jt3JrRYDtzjgSxVNqvXJ6EmK1EB4f41+u8Yv+PGpoFR7JMBssdY0o14cH5Q5JBM7kSA09jpZYN7Ya6INT40pjldGxOVG8AtscPkh7gr1RcO3if4OqIDmOkcVwiqr+vYvbL6/4QqTYsRxuz+6PS7ZTMWQx1Q7OYLEML0Kj+7zgj0J1IErRNmZms1dotCalqkG8X1/Vr0v/BVTUFeTGRCpnVnk+HZRq10YYl4XUFPR8E3gA0wYYEd56kPqUS295ZfdtmSmglSfp8Xv1xggwOcXytXpaQVovchCkKekK03aCsEBFg3a3N6VFSIVUqSXEIBd+Adq+GfpgZV7OO1Qx5shRQfmePvooMhPR1HOAnmKLz5Mtj5LirFvGiCLwNv7C/2QGjYCeFBNfF2fJh/FA2lEJPaBlmSVwDq+NMc1kziZY2CGLWfpx28yP0MaErWakcF/dn4TjLs3LUGhSymL9fWbCgWoHo9BUmckDBP/zpKFemWUebpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t0fyY8b12igT8U91W5tT5TnnwSGdmSbX0VZpM91qEVZ681EBzhhidwS0usgEvtUeWOuxiCG5KxjUUqCksVh9tIqdayV7eQ4lbIVeyx9zTS+Ag32bH3QWRP/3/B6JBFFpSYU3xBVhrSF2mpTpgHQfPH8UYaqyth89Db4KUyS5zV13U8do4lV4CHz9KPSeVKceFGMyl73Au+o6hmtCCPpvWYzXsNpZrIUkFWyoYNdEO3BAD7x5uMydc1UyTUqfhcN4BIAsuIfJwOGzVm/ps7E2d8Wkcyy80MGa7XDPaSgUiYa00aSElZ0Z61GET9zKmgLeJJkw2XYOOkpenvr+n9yn2y8X6gAicyNdXXB4yulS1L/jZ0k68WFCPDc+MKnXGVXwwELOHy4Ewj0Mihcm81SM4Vvs1sAmpHYnljqjZxreCHAdQIbJxgE7TfYDdWEJ3GzH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:12:20.2810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d34792b1-9972-4d80-7789-08df08e30e78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
X-purgate-ID: tlsNG-d25034/1788347546-030D9A5B-5CD740A6/0/0
X-purgate-type: clean
X-purgate-size: 1647



On 02-Sep-26 10:55, Jan Beulich wrote:
> On 02.09.2026 09:36, Michal Orzel wrote:
>> Document the default console= option on Arm and RISC-V that is
>> "dtuart" indicating a generic UART parsed from a device tree or
>> ACPI SPCR table. This serial utilizes SERHND_DTUART handle.
>>
>> Take the opportunity to:
>>  - fix documented x86 default to vga to match OPT_CONSOLE_STR,
> 
> I first wanted to object to this part, as I was sure this used to be
> "com1,vga". Yet indeed it's been almost 19 years ago when this was
> changed (92877a1f9ab2 ["x86: Auto-probe the serial port baud rate if
> 'com1' or 'com2' is"]).
> 
>>  - mark dtuart option as available on RISC-V,
>>  - document fall back to /chosen/stdout-path.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -430,9 +430,10 @@ The following are examples of correct specifications:
>>  Specify the size of the console ring buffer.
>>  
>>  ### console
>> -> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
>> +> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | dtuart | none ]`
>>  
>> -> Default: `console=com1,vga`
>> +> Default (x86): `console=vga`
>> +> Default (Arm, RISC-V): `console=dtuart`
> 
> Any reason to not also cover PPC here?
While PPC sets OPT_CONSOLE_STR to "dtuart", it does not select
CONFIG_GENERIC_UART_INIT that compiles in the uart-init.c which is what really
matters to decide whether dtuart is supported or not.

~Michal


