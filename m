Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE1C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 19:58:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401421.1637089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzgE8-0003Ox-Lw; Thu, 27 Aug 2026 19:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401421.1637089; Thu, 27 Aug 2026 19:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzgE8-0003Oq-Go; Thu, 27 Aug 2026 19:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1401421;
 Thu, 27 Aug 2026 19:57:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wzgE6-0003Ok-MS
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 19:57:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzgE5-00GDl4-A7
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 21:57:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a90966e-bab6-0a2a0a5309dd-0a2a4508c178-46
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 21:57:28 +0200
Received: from [40.107.209.41]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a9096a5-f659-0a2a45080019-286bd12993bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 21:57:28 +0200
Received: from BN9PR03CA0201.namprd03.prod.outlook.com (2603:10b6:408:f9::26)
 by DM4PR12MB6328.namprd12.prod.outlook.com (2603:10b6:8:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 19:57:19 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::32) by BN9PR03CA0201.outlook.office365.com
 (2603:10b6:408:f9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 19:57:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 19:57:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 14:57:18 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 14:57:16 -0500
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
 b=taA2ubgi1m/FUN0kY92dFrxnvoP1xJRpEonJV4O9ZE07ltoSw+gF7upA35ZHuAAN/y5ro/000yDdXTDX8loWiLptKG7FaRiZBagoDqm7wpoCUSn1fG/UZcKc6CsO0/lqZSdqMlXzoV6uToM8NVPwewKtoitN0oME60ElTylAsOTO9rO4jz+4FnUzwSgZFQhlnEcWqtDM3UHdmMIURMDodcTYYJ22pQKMHppsicCXYyZ8gKgU9fDn5doWxia2AyxZoEawbsC3HCLShTBdrYXTiAjhKPhEsXwj0CVJcJKFYaR60qAMUwhbm8vASxLuYISvbVoy8W67hK2gHOX+RsymYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMfEbo899TzTcpBwUVQqcC0pOsnV+on/UKm8PTsRT/o=;
 b=y6F6g2jMfUxHmM1btBCz3Ye1sizwzniRgtheqcaAHMCg3hY2Zk2i+U2KdNMjzaPMvvN4qFaE1p3up8DwqbXa+DU1P/VQJn3nn3vNbFR1ArQkITcV/B0rnWfaQZ2tRxVGut7aJnujCwd3cNQkKbWlZcRzkV5KBCUucCKPb+0jzUmhD47kdmZCnQPK4dymIMVoKAMFpa0/VEnRB94GRfoFoZUSQZBLP5Fkv6JI9wEdblHqHrQjFQ+I6lprTlcej72EloSvMxNIq0vb4hqSpo/6x89JsRR4yy+49z+zCl0R3w1YXbrogDQ+rN/xHA6Z9r1BHs66MW/lWB4eB8RvxQolZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMfEbo899TzTcpBwUVQqcC0pOsnV+on/UKm8PTsRT/o=;
 b=F+eVfEDlUzMcRyXe3CPjKlTuS5daYtatQnPX/bZhuXCYzQh0Qf+heAPgTWjpLCRTJ+p7D0Uh0W8bN9IqX2ziCZBHD0yDpOO5m2L7FwFi0ugrnkOuqw6+ZQ0ju39m8oefcZKC2rO1FrrEPWhovAb2b2fh+Du5D4faUOeckXJmSxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5ab7244d-66fb-4f06-a88d-5c64d515e760@amd.com>
Date: Thu, 27 Aug 2026 20:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.23] Add GICv3 SGI boot/self tests in Xen
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
 <b1e5ec80-a6be-4339-a06e-a47110349cd4@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <b1e5ec80-a6be-4339-a06e-a47110349cd4@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DM4PR12MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fe74e0-fd7a-45de-1c4b-08df0475667f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|13003099007|11063799006|6133799003|4143699003|5023799004|10067099003|56012099006|18002099003|22082099003|3023799007|10063799003;
X-Microsoft-Antispam-Message-Info:
	oj7urbt/t6W5ct+P6Av998fvRxGZyJvilMRmw5N9G2Iw1Mt4NibKUQleHr9OR5volVOQtJClQUpXJ9UVcy1uRu28atiM/blLQ9o54wybqnnDMK8pYPen4tRccOG0LEKnFFOE17s9ZyxbhdVV32mkDdZPB+2DMN3zRMgqa7lg73AEnUjXvsJJeNJqqaYvI4s6XpBmmITMi/J6sx3y3/UGfvis7eNpCrLN+GEyvWEmsAmORf4GNWhpAF7C7ji4W2ykedpW2mELN1Nyge7Bx7auXkFylUzxyms/VG7pOriWHCC/cIdIa1rZpA86DEykTfo+Q02Kehi21d9ShA4sBQgxODuZFs5uuWNo+kafrcPol0Eh9pzH0t0Waez3wer/4//81iAIGW2EHjjAHvnY8UbvDFhAwl5lJbJdqAU4YmfnkLit7TxZDD/HvJ9FjG1tUbJ4txhCEyvnUOmZJ3n/zq0hqpnI0e0hkxgaPj7rMHLZkM4kQ/VG6niKw2ToFa738nNsbsBUAqZxzgKm/d/5WZAOQ/YU7/kV24J5O23WXjMfjcS3Ibq50VxArjrXbJJrdqdaMXMbuvVEUYo8Thbd/AWr2BjUOX09lYY/zvkIPV97JYJzkkiPPFhwQdWoLO6ZmKH56mUvz5scAuBct1Ek77qk6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(13003099007)(11063799006)(6133799003)(4143699003)(5023799004)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q8vgWheaJ5TASn5fT1e2OWT1lzcJJmW9zIcZ9mDHZgDEDStLSJvcsGmASIBo29d5DWGsXsemTR6/xWIDUzOlH65vfXLC40UUvqj4rwv2if5cQC2HtqKvMpJ+DknD0UTVYBwV80k6TFUEFVqo6rrqTWk8j9eXSkVXxRcpUSLl0yjOmFUomepv6C/mq8c7zaFShgZMtRoH4yxEhKc47LUbXhGSx90XoqPfmrXDPxQJr9C/fXFtXYeEfSI2QOgSfERoKFl5mCmlI5/x8FffFfLR3z0mRJ5GR2Yu3PMApfDr4MD/0sc9Ibq1MuNQTk7zjkpIozsQAOeosJeaJ+i9exGw+2CvmRrdmU+MZXGVJybZI0mQHHER/4WcyrXOVV0igq+ia3IiXuU/S3StseC/aCklRNXYpeyU590opOOwbeDXKUCSJDQ5pgBSkh739na/AgZb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:57:18.6758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fe74e0-fd7a-45de-1c4b-08df0475667f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6328
X-purgate-ID: tlsNG-c1860d/1787860648-D477387B-B8BA7429/0/0
X-purgate-type: clean
X-purgate-size: 22587


On 19/06/2026 22:12, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 29/05/2026 18:09, Ayan Kumar Halder wrote:
>> Boot self-tests (also referred to as boot-time tests or power-on
>> self-tests) are intended to validate internal features of Xen during
>> bring-up. They are meant to be run in a debug / validation environment;
>> Xen is not expected to remain functional for production use after the
>> self-tests have executed.
>
> Looking at the code below, isn't Xen functional even after the self-test?

Yes as discussed on Matrix, I have modified the test so that Xen boots 
normally after running the self-test.

Xen will panic if the self test fails.

>
>> The purpose of these tests is to catch
>> hardware configuration issues early and to confirm that the platform
>> on which Xen has been brought up is sane. The expected flow is:
>> build Xen with the self-tests enabled, boot it, inspect the results,
>> and then reboot into the usual production configuration.
>>
>> Introduce the tests to confirm that:
>> 1. A cpu can send SGI 0 to itself
>> 2. A cpu can send SGI 0 to another specific CPU
>> 3. A cpu can send SGI 0 to all the other CPUs
>> 4. A cpu can send SGI 1 to another CPU
>
> I am not sure what you meant by SGI 0 and SGI 1? Below you seem to be 
> use only a SGI (which is neither 0 or 1) except for one specific test: 
> cpu 0 injecting an SGI to a specific CPU (0).
Yes, I fixed this in v3.
>
>>
>> These tests aim to test Xen has configured the GIC correctly to use 
>> SGIs.
>> Thus, the tests invoke specific APIs of GIC driver.
>>
>> Also, introduce a config CONFIG_BOOT_SELFTEST which enables these tests.
>> The option defaults to N; it should be disabled for production builds 
>> and
>> is intended for the validation pipeline and coverage measurement. The
>> tests run during Xen boot and validate internal interfaces such as Xen's
>> interface with hardware, firmware and the bootloader.
>>
>> Also, introduce an integer command line parameter "gic-test". By 
>> default, it
>> is set to 0 which means no tests are enabled.
>> For running SGI tests, "gic-test" should be set to 1. In future if we 
>> add
>> tests for distributer, ITS, LPI, etc, then we can use different numbers.
>> Thus, each number denotes a functionality of GICv3 which can be tested
>> independently and within a single boot of Xen.
>>
>> In this way, we ensure that the tests to validate SGIs do not impact 
>> any other
>> tests.
>>
>> In order to keep all the boot-time self-tests together in the binary, we
>> have introduced a separate section "initcallboottest". All the tests are
>> registered using __initcallboottest. During the bootup of each core, Xen
>> invokes do_init_boottests() to run the these tests. All these tests are
>> invoked before Xen creates the domains (in case of primary core) or runs
>> the idle loop (in case of secondary core).
>>
>> Note: it was suggested that, once the boot self-tests have run, Xen
>> should call machine_halt() rather than continue booting (since this
>> build is only intended for validation). This is not wired in here
>> because the SGIs are sent from the primary and secondary CPUs and
>> received asynchronously on the target CPUs. There is no definite point
>> in the boot flow at which Xen can know that every send has been
>> observed by its receiver, so "after the tests have completed" has no
>> well-defined moment at which to insert machine_halt().
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Link to v1 (RFC):
>> https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00956.html 
>>
>>
>> Upstream CI run (xen-project/people/ayankuma/xen fork, one commit on
>> top of xen-project/xen staging — all Linux builds + tests including
>> qemu-smoke-boot-selftest-arm64-gcc-debug passed; only the macos jobs
>> sit pending because the personal fork has no macos runner):
>> https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/2561806695 
>>
>>
>> Changes in v2:
>>   - Renamed the patch from "xen/arm: Introduce GICV3 Self Tests" to
>>     "Add GICv3 SGI boot/self tests in Xen", and rewrote the commit
>>     message to explain the intent of boot self-tests (debug /
>>     validation builds only, Xen not expected to remain functional
>>     afterwards).
>>   - Moved the selftest code out of gic-v3.c into a dedicated file
>>     xen/arch/arm/gic-test.c, gated by CONFIG_BOOT_SELFTEST
>>     (Stefano, Grygorii).
>>   - Introduced a generic boot-self-test framework: new section
>>     "initcallboottest", registration macro __initcallboottest, and
>>     do_init_boottests() invoked once per CPU after
>>     local_irq_enable(), so the test runs on every CPU (boot +
>>     secondaries) and no longer collides with the IRQ-enable timing
>>     in gicv3_init() (Julien #1, Julien #3).
>>   - Added Kconfig option CONFIG_BOOT_SELFTEST in
>>     xen/arch/arm/Kconfig (arm-only for now; arch-specific because
>>     the only registered test is GICv3-specific).
>>   - Reserved a dedicated SGI value GIC_SGI_TEST in enum gic_sgi
>>     (xen/arch/arm/include/asm/gic.h), so the selftest never
>>     reuses a functional SGI (Grygorii #3).
>>   - Added a runtime integer command-line parameter "gic-test" so
>>     the selftest binary can be shipped but its execution selected
>>     at boot (gic-test=0 -> no-op; gic-test=1 -> SGI tests). Future
>>     GICv3 features (distributor, ITS, LPI, ...) can claim further
>>     values (Grygorii #2, partial).
>>   - Documented why machine_halt() is not invoked after the tests:
>>     SGI delivery is asynchronous, so there is no well-defined
>>     point after which every send has been observed by its
>>     receiver (Julien #2).
>>   - Wired the tests into upstream GitLab CI: new build job
>>     alpine-3.18-gcc-debug-arm64-boot-selftest, new test job
>>     qemu-smoke-boot-selftest-arm64-gcc-debug, and the runner
>>     script automation/scripts/qemu-boot-selftest-arm64.sh that
>>     dumps the QEMU virt DTB, injects
>>     "gic-test=1 console=dtuart sync_console" into
>>     /chosen/xen,xen-bootargs via fdtput, boots Xen, and checks
>>     for each "Sending GIC_SGI_TEST ..." followed by the matching
>>     "CPU%u: GIC_SGI_TEST received".
>>
>>   automation/gitlab-ci/build.yaml               |  8 ++
>>   automation/gitlab-ci/test.yaml                |  8 ++
>>   .../scripts/qemu-boot-selftest-arm64.sh       | 81 +++++++++++++++++++
>>   xen/arch/arm/Kconfig                          | 15 ++++
>>   xen/arch/arm/Makefile                         |  1 +
>>   xen/arch/arm/gic-test.c                       | 52 ++++++++++++
>>   xen/arch/arm/gic.c                            |  5 ++
>>   xen/arch/arm/include/asm/gic.h                |  3 +
>>   xen/arch/arm/setup.c                          |  2 +
>>   xen/arch/arm/smpboot.c                        |  2 +
>>   xen/arch/arm/xen.lds.S                        |  4 +
>>   xen/common/kernel.c                           | 11 +++
>>   xen/include/xen/init.h                        |  3 +
>>   13 files changed, 195 insertions(+)
>>   create mode 100755 automation/scripts/qemu-boot-selftest-arm64.sh
>>   create mode 100644 xen/arch/arm/gic-test.c
>>
>> diff --git a/automation/gitlab-ci/build.yaml 
>> b/automation/gitlab-ci/build.yaml
>> index 7f5b5938e8..8df45caa86 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -439,6 +439,14 @@ alpine-3.18-gcc-debug-arm64:
>>         CONFIG_UBSAN=y
>>         CONFIG_UBSAN_FATAL=y
>>   +alpine-3.18-gcc-debug-arm64-boot-selftest:
>> +  extends: .gcc-arm64-build-debug
>> +  <<: *build-test
>> +  variables:
>> +    CONTAINER: alpine:3.18-arm64v8
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_BOOT_SELFTEST=y
>> +
>>   alpine-3.18-gcc-arm64-randconfig:
>>     extends: .gcc-arm64-build
>>     variables:
>> diff --git a/automation/gitlab-ci/test.yaml 
>> b/automation/gitlab-ci/test.yaml
>> index 8770c523e2..2398c6299a 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -524,6 +524,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
>>       - *arm64-test-needs
>>       - alpine-3.18-gcc-debug-arm64
>>   +qemu-smoke-boot-selftest-arm64-gcc-debug:
>> +  extends: .qemu-arm64
>> +  script:
>> +    - ./automation/scripts/qemu-boot-selftest-arm64.sh 2>&1 | tee 
>> ${LOGFILE}
>> +  needs:
>> +    - *arm64-test-needs
>> +    - alpine-3.18-gcc-debug-arm64-boot-selftest
>> +
>>   qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>>     extends: .qemu-arm64
>>     script:
>> diff --git a/automation/scripts/qemu-boot-selftest-arm64.sh 
>> b/automation/scripts/qemu-boot-selftest-arm64.sh
>> new file mode 100755
>> index 0000000000..a37dba3e07
>> --- /dev/null
>> +++ b/automation/scripts/qemu-boot-selftest-arm64.sh
>> @@ -0,0 +1,81 @@
>> +#!/bin/bash
>> +
>> +set -ex -o pipefail
>> +
>> +# Boot the prebuilt Xen binary under QEMU with 
>> CONFIG_BOOT_SELFTEST=y enabled
>> +# and gic-test=1 in xen,xen-bootargs, then verify the four GICv3 SGI 
>> self-tests
>> +# pass by inspecting the serial log.
>> +
>> +XEN=binaries/xen
>> +QEMU=./binaries/qemu-system-aarch64
>> +DTB_RAW=binaries/virt.dtb
>> +DTB=binaries/virt-bootselftest.dtb
>> +LOG=smoke.serial
>> +
>> +test -x ${QEMU}
>> +test -f ${XEN}
>> +
>> +# Dump the auto-generated DT from the QEMU virt machine, then inject
>> +# /chosen/xen,xen-bootargs.  The selftest infrastructure invokes
>> +# do_init_boottests() during early boot; gic-test=1 selects the 
>> GICv3 SGI
>> +# tests.
>> +# -net none avoids QEMU's default virtio-net-pci, whose efi-virtio.rom
>> +# is not shipped with the qemu-system-aarch64 artifact used in CI.
>> +${QEMU} \
>> +    -machine 
>> virt,virtualization=true,gic-version=3,dumpdtb=${DTB_RAW} \
>> +    -cpu cortex-a57 -m 1024 -smp 2 -display none -net none
>> +
>> +cp ${DTB_RAW} ${DTB}
>> +fdtput -t s ${DTB} /chosen xen,xen-bootargs \
>> +    "gic-test=1 console=dtuart sync_console"
>> +
>> +rm -f ${LOG}
>> +timeout 60 ${QEMU} \
>> +    -machine virt,virtualization=true,gic-version=3 \
>> +    -cpu cortex-a57 -m 1024 -smp 2 \
>
> This means that there is no much difference between "send an SGI to a 
> specific CPU" and "send an SGI to others CPU". I think it would be 
> more meaningful to use 3 or more pCPUs.
Yes, now I use 4 pCPUs.
>
>> +    -serial file:${LOG} \
>> +    -monitor none -display none -no-reboot -net none \
>> +    -dtb ${DTB} \
>> +    -kernel ${XEN} || true
>> +
>> +# Each "Sending GIC_SGI_TEST ..." line must be followed by the matching
>> +# "CPU%u: GIC_SGI_TEST received".
>> +fail=0
>> +check_pair() {
>> +    local send_pat=$1
>> +    local recv_pat=$2
>> +    local send_line recv_line
>> +
>> +    send_line=$(grep -n -- "${send_pat}" ${LOG} | head -n1 | cut -d: 
>> -f1)
>> +    if [ -z "${send_line}" ]; then
>> +        echo "MISSING: ${send_pat}"
>> +        fail=1
>> +        return
>> +    fi
>> +
>> +    recv_line=$(grep -n -- "${recv_pat}" ${LOG} \
>> +        | awk -v bl="${send_line}" -F: '$1 > bl {print $1; exit}')
>> +    if [ -z "${recv_line}" ]; then
>> +        echo "MISSING (after line ${send_line}): ${recv_pat}"
>> +        fail=1
>> +        return
>> +    fi
>> +
>> +    echo "OK: '${send_pat}' -> '${recv_pat}' (lines ${send_line} -> 
>> ${recv_line})"
>> +}
>> +
>> +# Boot CPU sends SGI to itself
>> +check_pair "Sending GIC_SGI_TEST to self CPU0" "CPU0: GIC_SGI_TEST 
>> received"
>> +# Secondary CPU sends SGI to itself
>> +check_pair "Sending GIC_SGI_TEST to self CPU1" "CPU1: GIC_SGI_TEST 
>> received"
>> +# Secondary CPU sends SGI to primary
>> +check_pair "Sending GIC_SGI_TEST to CPU0 from CPU1" "CPU0: 
>> GIC_SGI_TEST received"
>> +# Send to all-but-self
>> +check_pair "Sending GIC_SGI_TEST to all except CPU1" "CPU0: 
>> GIC_SGI_TEST received"
>> +
>> +if [ ${fail} -ne 0 ]; then
>> +    echo "FAILED"
>> +    exit 1
>> +fi
>> +
>> +echo "PASSED"
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 79622b46a1..0e23bbf20b 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -476,6 +476,21 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>>   config ARM32_HARDEN_BRANCH_PREDICTOR
>>       def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>>   +config BOOT_SELFTEST
>> +    bool "Enable boot-time self-tests"
>> +    default n
>
> Above you said, this is not meant for production. So I was expecting 
> to see a dependency on CONFIG_DEBUG.
yes, I have added this
>
> If the intention is to use it in release build, given the current 
> behavior (e.g. breaking test), I think this should depend on 
> UNSUPPORTED so we don't get security report because Xen is broken 
> after the boot tests.
No, it is disabled in release build.
>
> > +    help> +      This option enables boot-time self-tests that 
> validate Xen's internal
>> +      interfaces with hardware, firmware and the bootloader. The 
>> tests are
>> +      registered with __initcallboottest and executed by 
>> do_init_boottests()
>> +      during early boot, before domains are created.
>> +
>> +      These tests are intended for validation and coverage 
>> measurement, not
>> +      for production builds. With this option enabled, Xen may not be
>> +      functional after the tests have run.
>
> If we know a test break, I think it is best that Xen doesn't continue. 
> Otherwise, it is quite confusing for the user to know what's going on.
>
> My preference is the bootest would act like other self tests and Xen 
> can continue booting normally. So the tests could also be meaningful 
> in non-test setups.
Yes, now Xen is functional even after running the self tests.
>
>> +
>> +      If unsure, say N.
>> +
>>   source "arch/arm/platforms/Kconfig"
>>     source "common/Kconfig"
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 84c4062b30..0090761682 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -24,6 +24,7 @@ obj-y += domctl.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>   obj-y += efi/
>>   obj-y += gic.o
>> +obj-$(CONFIG_BOOT_SELFTEST) += gic-test.init.o
>>   obj-$(CONFIG_GICV2) += gic-v2.o
>>   obj-$(CONFIG_GICV3) += gic-v3.o
>>   obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
>> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
>> new file mode 100644
>> index 0000000000..ca922e5d2a
>> --- /dev/null
>> +++ b/xen/arch/arm/gic-test.c
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/delay.h>
>> +#include <xen/init.h>
>> +#include <xen/param.h>
>> +#include <xen/shutdown.h>
>
> Can you clarify why you need this header?
I have dropped this.
>
>> +#include <asm/gic.h>
>> +
>> +/*
>> + * gic_test: Specifies the gic test to be executed.
>> + * 0 = no tests are executed
>> + * 1 = SGI tests are executed
>> + */
>> +static unsigned int __initdata gic_test = 0;
>> +integer_param("gic-test", gic_test);
>
> Given this is mean to be 0 or 1, why not using "boolean_param"?
Yes, I have this as a boolean param
>
> Also, new command line option should be documented in the docs. That 
> said, I am not really sure about
I have documented it.
>
>> +
>> +/*
>> + * CPU0: GIC_SGI_DUMP_STATE to self
>> + * CPU{0-N}: GIC_SGI_TEST to self
>> + * CPU{1-N}: GIC_SGI_TEST to CPU0
>> + * CPU{N}: GIC_SGI_TEST to all but self
>> + */
>> +static int __init gic_self_sgi_test(void)
>> +{
>> +    if ( !gic_test )
>> +        return 0;
>> +
>> +    printk("Sending GIC_SGI_TEST to self CPU%u\n", smp_processor_id());
>> +    send_SGI_self(GIC_SGI_TEST);
>> +
>> +    if ( smp_processor_id() == 0 )
>> +    {
>> +        printk("Sending GIC_SGI_DUMP_STATE to CPU0\n");
>> +        smp_send_state_dump(0);
>
> OOI, why is this only called for CPU0? You also don't seem to check 
> that smp_send_state_dump() in the CI test.
Ah, I have dropped it.
>> +
>> +        return 0;
>> +    }
>> +
>> +    printk("Sending GIC_SGI_TEST to CPU0 from CPU%u\n", 
>> smp_processor_id());
>> +    send_SGI_one(0, GIC_SGI_TEST);
>> +
>> +    /* Execute this test only from the last core */
>> +    if ( smp_processor_id() == (smp_get_max_cpus() - 1) )
>
> This is relying on how Xen is boot CPUs. Would it be better to check 
> the number of online CPUs at the time of the check? (You might need to 
> re-order some code for that)
yes, I have changed the code. I now check the number of online CPUs.
>
>> +    {
>> +        printk("Sending GIC_SGI_TEST to all except CPU%u\n", 
>> smp_processor_id());
>> +        send_SGI_allbutself(GIC_SGI_TEST);
>> +    }
>> +
>> +    return 0;
>> +
>> +}
>> +__initcallboottest(gic_self_sgi_test);
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index ee75258fc3..9736b0c7df 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -324,6 +324,11 @@ static void do_static_sgi(struct cpu_user_regs 
>> *regs, enum gic_sgi sgi)
>>       case GIC_SGI_CALL_FUNCTION:
>>           smp_call_function_interrupt();
>>           break;
>> +#ifdef CONFIG_BOOT_SELFTEST
>> +    case GIC_SGI_TEST:
>> +        printk("CPU%u: GIC_SGI_TEST received\n", smp_processor_id());
>
> To confirm, we will solely rely on logging? IOW, there is no plan to 
> have Xen self-sufficient (e.g. using a global variable).
yes, I know use a per cpu variable.
>
>
>> +        break;
>> +#endif
>>       default:
>>           panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>>           break;
>> diff --git a/xen/arch/arm/include/asm/gic.h 
>> b/xen/arch/arm/include/asm/gic.h
>> index ff22dea40d..74bdd4ff63 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -306,6 +306,9 @@ enum gic_sgi {
>>       GIC_SGI_EVENT_CHECK,
>>       GIC_SGI_DUMP_STATE,
>>       GIC_SGI_CALL_FUNCTION,
>> +#ifdef CONFIG_BOOT_SELFTEST
>> +    GIC_SGI_TEST,
>> +#endif
>>       GIC_SGI_STATIC_MAX,
>>   };
>>   diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 6310a47d68..4e5db93027 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -470,6 +470,8 @@ void asmlinkage __init noreturn 
>> start_xen(unsigned long fdt_paddr)
>>       enable_errata_workarounds();
>>       enable_cpu_features();
>>   +    do_init_boottests();
>> +
>>       /* Create initial domain 0. */
>>       if ( !is_dom0less_mode() )
>>           create_dom0();
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 7f3cfa812e..a016ff00f5 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -405,6 +405,8 @@ void asmlinkage noreturn start_secondary(void)
>>         printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
>>   +    do_init_boottests();
>> +
>>       startup_cpu_idle_loop();
>>   }
>>   diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index 2d5f1c516d..14f64a856c 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -146,6 +146,10 @@ SECTIONS
>>          *(.initcall1.init)
>>          __initcall_end = .;
>>   +       __initcall_boot_test_start = .;
>> +       *(.initcallboottest.init)
>> +       __initcall_boot_test_end = .;
>> +
>>          . = ALIGN(4);
>>          __alt_instructions = .;
>>          *(.altinstructions)
>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>> index fb45f81399..2047fe2a3f 100644
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -412,6 +412,7 @@ void add_taint(unsigned int taint)
>>     extern const initcall_t __initcall_start[], __presmp_initcall_end[],
>>       __initcall_end[];
>> +extern const initcall_t __initcall_boot_test_start[], 
>> __initcall_boot_test_end[];
>>     void __init do_presmp_initcalls(void)
>>   {
>> @@ -427,6 +428,16 @@ void __init do_initcalls(void)
>>           (*call)();
>>   }
>>   +void __init do_init_boottests(void)
>> +{
>> +#ifdef CONFIG_BOOT_SELFTEST
>
> I think it would be worth printing before and after to indicate the 
> begin/end of the selftest.
yes, I have added the prints in v3.
>
>> +    const initcall_t *call;
>> +    for ( call = __initcall_boot_test_start; call < 
>> __initcall_boot_test_end;
>> +          call++ )
>> +        (*call)();
>> +#endif
>> +}
>> +
>>   #ifdef CONFIG_HYPFS
>>   static unsigned int __read_mostly major_version;
>>   static unsigned int __read_mostly minor_version;
>> diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
>> index 0c921672c1..bd518bcea9 100644
>> --- a/xen/include/xen/init.h
>> +++ b/xen/include/xen/init.h
>> @@ -66,11 +66,14 @@ typedef void (*exitcall_t)(void);
>>       static const initcall_t __initcall_##fn __init_call("presmp") = 
>> (fn)
>>   #define __initcall(fn) \
>>       static const initcall_t __initcall_##fn __init_call("1") = (fn)
>> +#define __initcallboottest(fn) \
>> +    static const initcall_t __initcall_##fn __init_call("boottest") 
>> = (fn)
>>   #define __exitcall(fn) \
>>       static exitcall_t __exitcall_##fn __exit_call = fn
>>     void do_presmp_initcalls(void);
>>   void do_initcalls(void);
>> +void do_init_boottests(void);
>>     #endif /* __ASSEMBLER__ */
>
> Cheers,

Thanks

- Ayan

>
>

