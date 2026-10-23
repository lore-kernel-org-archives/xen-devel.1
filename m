Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E3606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OSYYbRpw
Received: from list by lists.xenproject.org with outflank-mailman.1459555.1671401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKJ2o-0003dc-0P; Fri, 23 Oct 2026 17:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459555.1671401; Fri, 23 Oct 2026 17:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKJ2n-0003dV-TO; Fri, 23 Oct 2026 17:27:05 +0000
Received: by outflank-mailman (input) for mailman id 1459555;
 Fri, 23 Oct 2026 17:27:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xKJ2l-0003dP-Tu
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 17:27:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKJ2k-00HTf9-Vm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 19:27:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6adb98cb-e002-0a2a0a5209dd-0a2a4501d3d2-46
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 19:27:02 +0200
Received: from [40.93.196.61]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6adb98e4-5984-0a2a45010019-285dc43d1df2-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 19:27:01 +0200
Received: from PH8P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::20)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 17:26:56 +0000
Received: from MW3PEPF00001655.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::7) by PH8P220CA0024.outlook.office365.com
 (2603:10b6:510:345::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 17:26:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW3PEPF00001655.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 23 Oct 2026 17:26:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 12:26:32 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 12:26:32 -0500
Received: from [192.168.1.21] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 12:26:31 -0500
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
 b=FDJn27jVAIo40x3rKuD3X+DoTJBcsKoNo5zGGq4yF0mDh7RFMlT0IjC9jMgE5aCUADUuk/UOm2x5wyijd8+/39e4RB9+4GQ1Pdod3cuDCUbDYiL+BgvefFAysqMhSDew79VntBPX9bqazHUOV8t1oWxQ252a9h+ldYG2pB5iO43OntBhEvcDDdOaUswb4h/3xtWt0znOg3V0Aq1sAEqBtTQO/uyHVtbEL8o33xvM6cibt9pokAJTWDxjpNC0OnCeh5jYqejGW/rbUT14KvN3xssB0C82elscz0PscWp4ScA1wQamdMJ560XxpjuVfLXxKtvjCld5xQmJN15qOcBtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPSeXa+w24OvLipdyhvOs0Qo1zbsPLzxXW5BfqOpr4k=;
 b=ExOI4STwihMHpbNFsgayNMuOwkuvAOlJ/YOxntHT3inBhbpz9IhzJuiv0wELiNdVzcioVF+yK9u7pb4/K+LfNklIKLkar4kQqpfagxm06ASIBtT4jsHL7S2Wul7PhQlUcO1sC6WUH7Np2HMwpcKOqaMZkjA7EHVh9LjJTeAheu2DW68pomKWdzcMfKgNHN0AcPcyJ6vbAUcrmzIX7iwnMBQ2xgw2SjmiivuFtSZOwI7c2YRDrb146KoUmqk999G2aEcxT+m6EGokE5vR/4BMa8lAl4IJq8obg4xM+GkufjUcdAmcq6/pETgySG7MbyUp+uXtvH21KifbeX2SlDf19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPSeXa+w24OvLipdyhvOs0Qo1zbsPLzxXW5BfqOpr4k=;
 b=OSYYbRpwKGSwCC5u9Hp0tFxqEyxllZy8rtQ12q7RTwpbnDxjPChziDtzQVK77rEHHgwA8SWaNd6uYde+WMQNc2gUO0ofv9eVqDVpHBfPvsd7TEw2tvwSUr7jlnFojd96N42fwyolx5kzSILQcYRyTGn3FRVWRy0UyHc5nU+CJh8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2a597c4d-9ff6-461b-9a29-8d9feb76f827@amd.com>
Date: Fri, 23 Oct 2026 18:26:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: psci: Do not keep a rejected PSCI version in
 psci_ver
To: "Orzel, Michal" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261021132640.599126-1-ayan.kumar.halder@amd.com>
 <8e4131b5-18e7-484a-bc4f-f9e6f279606e@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <8e4131b5-18e7-484a-bc4f-f9e6f279606e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001655:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f8c2d9-62ae-432e-37be-08df312ad5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099006|4143699003|11063799006|261022105027099003|261021121427099003|10067099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	CmvvWXmnbt216juuw89k3yDsPtJ1d6Z80lH9bnaqHmvz2Mg8OR/Vgo0ZGR7v31YAohm57DZ8OuT0xp7Mc6CI7IUbACeIVigHv8rNXGy1zSwBapJ5bW3KRqgRvwL0hypKUGPYXqsQhMjQdFyQeJksqMd3eokkW1QMx0umwF24chhPKz1V51zODhcOVlXSL2xWpDGIV/x1C9ifY9gmVl98rMKwzAhcyxamGDs84wn9PeDCERouLH0NuowzlD1zaXtyzbrqkXzE9rf8tMqNgFz6kU+bQE4SLkGuMgMVtEnD9dzrbZBJO0+a0EDFwwvz98BYAmL/tUD7wtxtKUxVqxlz/C/oq8asoc2XU5mREECIelsc6sdxNTcurNAcSSeXDt43L1MrZ0ehLbsaTg0DlCA7f1M6oJ6SDxXKOam3WTH+bm97jD0ae07LiDi4l9NqcUhpdPk2wtrLfo77fovNrsRnIIQogHV8giebjRGFAEhKvy05PoWeAr61frB+NiJREpeaniS30xh07jw684DS/hhfGeyv8RHiBL2vdA0Q8l+WgNFY6TBNzUXx9tDHsgAN5rDKDNIVk31++4wVVxck0aQu43ybnzzW7ScLrlnMMXd5PP7Dk23uLYNUjDT9tadSm7v1IL1MwUNK+5rONu/fyhFgY81zB3AxxzEWEpn5GzYqHb/a5dh2++ot7X9ZVN46aTkiXx3ux/DR/VHbSQmB0ejGfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JznNzjTzlKice+T0m3wlFgvCX6fdY6DNga5Pk5Yv1yGczOAEmJJuye7qGWfQis+Ah+plclaZuMYV7gxdYkeeqeanA/Hi1qEAAprmNqk3uIe8A3TQD4YDIJNUD9u6kVQmm5MPpzB04f+SplefIOOHD1gn3D1hdW2NjzH40xZvXAKyRBnlytiRcrjlirmxfkJgj1ot1nM7HiYP4DfqAfqalQVAFbvbTLnWp1CB7rlUn3+sctkfyjdbaDoghRY2ewMRrDEJXl8+ZImvGXzUsUJz+zu38tSbxZyncf9NP7BpYaKbiNt6OReOGadTCVtDKQRzzBiPqt32fIKxkwNfLPpBtQJgDy4luXYRg7YczTECIljwyZN716GAbFTPHeUJl31n2o9U10O+EWlGR41VLJkPFom8ADaIJ9mXqrJlKdS7b3qClojY37+MMmD1UAx/JsNc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 17:26:55.2736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f8c2d9-62ae-432e-37be-08df312ad5bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001655.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
X-purgate-ID: tlsNG-d62444/1792776421-1D272757-61B6EAF2/0/0
X-purgate-type: clean
X-purgate-size: 3689
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

On 23/10/2026 07:42, Orzel, Michal wrote:
>
> On 21-Oct-26 15:26, Ayan Kumar Halder wrote:
>> psci_init_0_2() stores the value returned by PSCI_VERSION in the global
>> psci_ver before checking that Xen supports it. When the firmware reports
>> a version other than 0.2 or 1.x, the function prints "Unrecognized PSCI
>> version" and returns -EOPNOTSUPP, but psci_ver keeps the rejected value
>> and psci_cpu_on_nr stays 0.
>>
>> psci_init() then tries the PSCI 0.1 fallback, which overwrites psci_ver
>> on success. When the fallback fails as well (the /psci node is not
>> compatible with "arm,psci", it has no "cpu_on" property, or Xen boots
>> with ACPI), psci_init() returns an error that smp_init_cpus() ignores,
>> and psci_ver still holds the rejected version. All the users of
>> psci_ver then consider PSCI as available:
>>   - on arm64, smp_psci_init() installs call_psci_cpu_on() as the method
>>     to bring up the secondary CPUs;
>>   - on arm32, platform_cpu_up() calls call_psci_cpu_on() instead of the
>>     platform specific cpu_up() callback;
>>   - call_psci_cpu_off(), call_psci_system_off() and
>>     call_psci_system_reset() issue their PSCI calls.
>>
>> As a result, Xen brings up each secondary CPU with an SMC using function
>> ID 0. An SMCCC compliant firmware refuses it, and Xen reports "Failed to
>> bring up CPU<n> (error -1)" for each secondary CPU.
>>
>> Only set psci_ver once the version has been accepted, so that a rejected
>> version leaves psci_ver at 0 and Xen behaves as if PSCI was not
>> available. In the case above, Xen no longer issues any other PSCI call:
>> on arm64 the secondary CPUs using the "psci" enable-method are rejected
>> by smp_psci_init() and Xen boots on the boot CPU only; on arm32
>> platform_cpu_up() uses the platform cpu_up() callback, if any. CPU_OFF,
>> SYSTEM_OFF and SYSTEM_RESET are not issued either, as when the PSCI 0.1
>> fallback is used.
>>
>> Fixes: 4d3d72c01467 ("xen/arm: Initial support for PSCI-0.2")
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/psci.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>> index 634d0d7467..a720cf8d41 100644
>> --- a/xen/arch/arm/psci.c
>> +++ b/xen/arch/arm/psci.c
>> @@ -169,6 +169,7 @@ static int __init psci_init_0_2(void)
>>       };
>>       int ret;
>>       struct arm_smccc_res res;
>> +    uint32_t ver;
>>   
>>       if ( acpi_disabled )
>>       {
>> @@ -191,16 +192,17 @@ static int __init psci_init_0_2(void)
>>       }
>>   
>>       res = arm_smccc_smc(PSCI_0_2_FN32_PSCI_VERSION);
>> -    psci_ver = PSCI_RET(res);
>> +    ver = PSCI_RET(res);
>>   
>>       /* For the moment, we only support PSCI 0.2 and PSCI 1.x */
>> -    if ( psci_ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(psci_ver) != 1 )
>> +    if ( ver != PSCI_VERSION(0, 2) && PSCI_VERSION_MAJOR(ver) != 1 )
>>       {
>>           printk("Error: Unrecognized PSCI version %u.%u\n",
>> -               PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
>> +               PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
>>           return -EOPNOTSUPP;
>>       }
>>   
>> +    psci_ver = ver;
>>       psci_cpu_on_nr = PSCI_0_2_FN_NATIVE(CPU_ON);
>>   
>>       return 0;
> The patch would be simpler if you just set psci_ver = 0 right before
> returning -EOPNOTSUPP. No need for the new local variable then. If you agree, I
> can change on commit. With that:
yes I agree with that.
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

- Ayan


