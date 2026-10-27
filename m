Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C6606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=GYMz/OuI
Received: from list by lists.xenproject.org with outflank-mailman.1462572.1673539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNA-0004o2-6T; Tue, 27 Oct 2026 21:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462572.1673539; Tue, 27 Oct 2026 21:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNA-0004nl-0v; Tue, 27 Oct 2026 21:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1462572;
 Tue, 27 Oct 2026 21:06:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoN7-0004lD-OW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoN6-000vfm-MQ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:16 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-8faa-0a2a0a5109dd-0a2a450ab3f8-0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:16 +0100
Received: from [52.101.84.103]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-f2d2-0a2a450a0019-346554675b98-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:16 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:13 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtxyPTgZuYl9ql6U1V8Q1cEWYyKMCysnq0Yj9BG7UMqa/yWLrTEnFlIEScww31LWeH9pkJB1X0x/3Ddj0HRwxiPraF0fexanUnTawSBsbt6gHzEtcB8GKV9edAgtZus3ljmitHWt9iD0z7XnB/UDMNEQwUeh8nQ2EY1cnuXBQRIXqZdtwROZJZHFdgVBLD5hxRiyBiD2v+00a6opnOUYzxA6qrBo6DveIgPh1vFbafAQCyYPtEW8dqYC9KUFye+HhqTi1P3yzT/sudwxuY5yqqNIdiOjVLuvZmfnFf474cF9rIgw/IqlZqWb/rQf6aRxJlYaIRNgoHN6IYeb/7DmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa0JMW9G/IqvEMmQqcXGvzM+tli7vKqaDENpOLO8vpQ=;
 b=dfzQ45HFYEDpha7Un1J8FT7h33oPi7r8OK2S6/1ySd5WKoI6ckKBSv3ShWwe5nFInrXmFz1XrtNem1fNXeaAxAeClL+KW57xhbanqyUBN1fDYWbf8mO4/Lx4ik2d2yumT4J0XlvHfwqMbafotl+FKrOSk8mAehthWrIwjYt/WI42fd+Vt31RtuxIKQUC5IZXEG5qE4poVk3F26RWjnxm0rikFQLsV35Y8HdNcQ0ZoMtPvFAOtD4HaEkr/OKBH9HUZ+3nbxG1jzmtF4TUs83yj4xISTVhkZZSj3S4htdrixOleGfQ7OP2SHlxPWozx+aqylr1O5yWpVLLaZSdOubmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wa0JMW9G/IqvEMmQqcXGvzM+tli7vKqaDENpOLO8vpQ=;
 b=GYMz/OuIDQYoGMYJFurkZH47yCScHmW7JafHgyTBvc95poy03CLBR2JnC0RpnWGyRvTgnBqn3rwJJ0UKj2cqzZ4DHcsVpbixKmUBlX6AYRQ/v1crR6BuQZVbuLIVSC7Sie1LojwdL9UCfl3Gfk+U+hp9TNOxJPCtCSvdh3NEW5HcKU+sf11B31CelQG62V74z8u0fsPggO5WupmJhej19lsVBVVCLET62n3/bP8PQ2daZvVr5oRhDvbaopRBc+yW7zhu1yFIX7NlkT1PkM6hsfCKqAudRCQfW7rrRcB9vvrvprE2fo13RV13nCMYsbIN3iTL9IIbu0gMZuEjZDLYUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v13 00/14] Add initial Xen Suspend-to-RAM support on ARM64
Date: Tue, 27 Oct 2026 23:05:49 +0200
Message-ID: <cover.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|VI2PR03MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: 667d5e9d-170a-4d42-29af-08df346e21dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|261009223027099003|261009221227099003|261009223327099003|261022105027099003|261009221727099003|261021121427099003|261009220027099003|261021123027099003|260925021911599003|261021135927099003|261022075727099003|260925021311599003|260925022911599003|10067099003|56012099006|261026121527099003|6133799003|18002099003|5023799004|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	sa/c61pX41Kq6Ui4in0sQazEj/Zp2i97PsLBjjEO2as2ykPnVdalJ1C+91MWuirpFbKmFVIoto/bXjf0nnpa4daG/T9AaB6WwzUaCm3rZFn9cPqohDwLqCKB/VcRGlWUTiGcEgCcerAJcelWXYZYQ2rxHmpn8UITTFBogLlz3HTmblO0Ry25Apaiyi6b2sDT2AP56ZtBw3J+SamG6nIWDTCrkN7q47pieZuYtCVm2SZMZNJz9z7t17gCrcizcOnFip4K2mLQ5c5aO2noo9GH3plXvGZBBxnytcPdcSc2xRxeqgnnan49n/XnPQP6dZOPq8djOXclqWzSchXpDzvWubtPzzxky4XRFCULmXf+WUsyANPXu+jhpcZkOGoTALe8Mug53VCBf1i8PpA2TBDdW47IpebyoUkT4BK9u9UvzTGGMT4qplvzNaUO/f9qC6GHV+p4ZhECo2hJZ3eUbLuXVI7mCADjPyp1lx5/4GpSshSlFDAD0fr3oHW+LsDzMqK8tGpMPiIx2/MMAHsVnd0JIEv3Qrs7cX/1Sg72/4nCKGmbnk35O/7+dJe0ZMvtRDPcIO3wIqbf0NtmJnOxerQSVBvL5VtRkwc+ezF2zq3R7YipiKpVoefY7zf6h7+gGzpt6oFTAepgvcZk72Ef9T3yHg/HpTwq2sGROrFS7sz+8og=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(261009221227099003)(261009223327099003)(261022105027099003)(261009221727099003)(261021121427099003)(261009220027099003)(261021123027099003)(260925021911599003)(261021135927099003)(261022075727099003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(261026121527099003)(6133799003)(18002099003)(5023799004)(11063799006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewgo5DRi1ML8+DLOEDwufqbkNcuZL/UejmEjs8lWIdglD7DmCnSTenpVAVFy?=
 =?us-ascii?Q?KrOxry2TQYTdA6CzYfHVJCrzHA/DGt7/ZVTqiiLi0aZlpP6LGTvnxl3ht+/F?=
 =?us-ascii?Q?aZPgf2A6g1ajxUNWX3yhMHVAk3bzLPeWuwk2ayPiH2+JiNXdHkeo9t3BOPTJ?=
 =?us-ascii?Q?B5ckpxQMEytegn/TNyqI2pVONs1wYgpkMGOE3OkdQLc5gdg2IYoAKgUPMRYs?=
 =?us-ascii?Q?EE7Jy22+hq/4YBA/lwj56SEv6oxyX7Ic96zBHOpvLW7eBhIGWULPRzjDe/AH?=
 =?us-ascii?Q?aNhc1WHUBDyqWrfDa8qJDc/DYh0pQrl5WSH0Cx/t2iyjiI+UGMa9otn+ucu0?=
 =?us-ascii?Q?ZgR2UuZBqJVnV6ZFWfua2sMEsaOfxaw0o+uEhykq4JfHH6v247Elr2U8rEex?=
 =?us-ascii?Q?ZUWLkH5BGxOEw0M347PmjOHypwKikEc66feh9ZFVx2TJdCy+8DsCkCCExQYe?=
 =?us-ascii?Q?KWUf1oeAdXYoxOABkbvKSCI1vXKBdDphdwwmxXTigB62jcrCOaSm5U/QeN+l?=
 =?us-ascii?Q?FhVAJxZMUPi7kScR4zvl9WeL95Am3zbX6HJnshyWh/nXFUIHOLOOGNwhqxig?=
 =?us-ascii?Q?gcDKZI4IheZeIptA6PfAWo8CIohZBWYIdaVufmnAU3eNNnZTezL5dBNzdQJM?=
 =?us-ascii?Q?N9RXkf12VsBdaCczy0a6lJc83yCX6IAORphyz/gR3+MzFyxxYKDjNYvAz+6w?=
 =?us-ascii?Q?8cQ1z/ikzEeH/ESFhDFheNCkVQEm2HEBZSWidLjUIbdYA4W2AK417nM6KXnv?=
 =?us-ascii?Q?t9pZX4cVYHnRCnbk30Xx84nRAXRIhtLdVyg9PalPC0a8XfNTELI8YumlrcbB?=
 =?us-ascii?Q?lMCK+aJCwfOiT5NJi6acXbbQDdLAgn4sHC5yY3TeRmUNu6uS4NzM7kwrcanf?=
 =?us-ascii?Q?eg6jy2xBXStPpdHe/4X6ZF4bL4wShizQPQsivVzFDuUAl3Ln0EA5umP1NJWW?=
 =?us-ascii?Q?byiLgYRdm0nI7TM5DoL7Ua/h5iUewvoNeifVxsbiAmAp8LvVQnNcM1NPQeNm?=
 =?us-ascii?Q?3R8JbyKtiNqs6iVnYXlOadR+8/oW3Fb6ri5jtvMWt9E88t7CwbVSfe9U3/rR?=
 =?us-ascii?Q?tp8yZ31bONh+C2E92QP/yBA/h0lVUiYLPYFBKU3nx/vYLuO5W8f31htm9Rtd?=
 =?us-ascii?Q?BQp3kwTK8uAYAjNGe43/9gJAGk1uCnMD/43i/cw73IrmdO/7SDLlABwAaERT?=
 =?us-ascii?Q?5T2fQq9gG+D14U8eg+pPfc80pwQPl3ErEOZz0DmUHsIwYssfFUOsYQyRd/uF?=
 =?us-ascii?Q?87OGR2/WFyBSwd0dDk0oRfGBOLxeoGYxs/rSr8pIfUbY4xBHZ8vQOeN1lkE1?=
 =?us-ascii?Q?JofEgFIdxFP0ArBrLH2qOVnrrN2wjrSjXvDcpb04CcD4YrOAkJUydy6aYTbN?=
 =?us-ascii?Q?59Vb6pmIrlOq6H4TPaxUm+PbOiXyuRu9oXZ2d/Uej710HEUNFd6EaJceCyTt?=
 =?us-ascii?Q?PgwD2Y1dAjKB5fWvH4tY1wkYCTT4+nJxU6vDHCTWrh5w8Vmv3ffYClISRUW7?=
 =?us-ascii?Q?BUyM7SJpEFs3W1s6qVR4VIbMPnGcobZNIxc1AnylYwmsnpuQzcNE/1vxp0Fq?=
 =?us-ascii?Q?aOU1q8JlsC0dbibsNxa1D5V2XaEg3Fde6jluyQfgNLi5xfX/zw5ucFqg5znU?=
 =?us-ascii?Q?omI+Ak0Nz1nKMcmLEJA9KfcvRfvh/X2CELaZC93mBGLJ65DmQCLyfeTiFeYS?=
 =?us-ascii?Q?lFCp4KJ72MhrO2fvtx8/wkDWLQy7jk+nWURf1QESaKXpxK4RGbCh4NhJS3WW?=
 =?us-ascii?Q?bNYn7nbZ9g=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667d5e9d-170a-4d42-29af-08df346e21dc
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:13.0287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrp/g9juFzqpAyp3QPPDl4gmYcGGFH7Wc2BxM2fJCKG9OsvUjq6tZJyHivh3jxLKJfEYFIWy3BGQ1xgl7FuZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907
X-purgate-ID: tlsNG-4011c0/1793135176-58FC6CFC-89448A69/0/0
X-purgate-type: clean
X-purgate-size: 10684
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is part 2 of the ARM Xen system suspend/resume patch series, based
on earlier work by Mirela Simonovic and Mykyta Poturai.

Part 1, covering guest suspend functionality, is already in mainline.

NOTE: Host-wide suspend/resume support is guarded by CONFIG_SYSTEM_SUSPEND,
which can currently only be selected when UNSUPPORTED is set, and thus the
host suspend backend is neither enabled by default nor built in supported
configurations. The separate HAS_HWDOM_SYSTEM_SUSPEND policy bit only changes
how ARM treats SHUTDOWN_suspend from the hardware domain; it does not enable
the host-wide suspend backend by itself.

This version is ported to Xen master and includes extensive improvements
based on reviewer feedback. The patch series restructures code to improve
robustness and maintainability, and implements initial ARM64 host-wide
Suspend-to-RAM support driven by control-domain PSCI SYSTEM_SUSPEND
requests. vPSCI also exposes SYSTEM_SUSPEND as a domain suspend operation
for all domains; attempt-time host-suspend policy failures are reported as
PSCI_DENIED rather than hidden through PSCI_FEATURES. A non-control domain
needs a control domain to resume it; otherwise its request is denied.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Added vPSCI SYSTEM_SUSPEND policy for domain suspend and host-wide
   control-domain sequencing
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA/SMMUv3 context save/restore
 - Added support for GICv3 eSPI registers context save/restore
 - Added support for ITS registers context save/restore
---

Link to CI: https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2996178037

Tested on H3ULCB (R-Car Gen3) and Orange Pi 5 (Rockchip RK3588S).
---

TODOs:
 - Enable "xl suspend" support on ARM
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - Add PCI suspend/resume and save/restore R-Car Gen4 PCIe OSID state
---

Detailed changelogs can be found in each patch.

Changes in v13:
- Rebase onto current master and update the arm_smccc_smc() call.
  The API update has no functional effect.
- Add a patch to defer freeing per-CPU areas until resume failure cleanup
  is complete. Remove the redundant RCU barrier before restarting CPUs.
- Keep the GICv2 CPU interface and Distributor control state unchanged on
  suspend entry. Document the requirements for preserving pending events.
- Check GICv3 active priorities before disabling the interfaces. Panic if
  the redistributor fails to enter sleep, as suspend cannot safely abort.
- Update SMMUv3 queue and interrupt handling based on the Linux
  suspend/resume fixes. Preserve unread events and check reset errors.
  Panic if rollback fails or if the SMMU cannot be disabled after a probe
  reset failure. The probe and reset fixes also apply with
  CONFIG_SYSTEM_SUSPEND disabled.
- Block host suspend when Xen uses R-Car Gen4 PCIe, since its OSID state
  is not restored.
- Deny SYSTEM_SUSPEND for non-control domains if no control domain exists
  to resume them.
- Fix MISRA issues in GICv2/GICv3/ITS, FF-A, SMMUv3 and the host suspend
  path. Type and name changes, explicit return-value discards and comment
  updates have no functional effect. The SMMUv3 error checks above change
  failure handling.
- Document the LPI pending-table lifetime requirement for CPU hotplug and
  clarify that IPMMU suspend/resume was tested only on H3ULCB (R-Car Gen3).

Changes in v12:
- Rebase onto the latest master.
- Updated patch 12; all other patches are unchanged.
  No functional changes.

Changes in v11:
- Keep SMMUv3 reset helpers in init text when CONFIG_SYSTEM_SUSPEND is
  disabled.
- Update host suspend policy blockers after review: make the runtime gate
  __ro_after_init, log the SMMUv3 MSI blocker only once, and wrap the Arm
  IOMMU blocker in CONFIG_SYSTEM_SUSPEND.

Changes in v10:
- Clarify the vPSCI SYSTEM_SUSPEND policy summary: keep SYSTEM_SUSPEND
  advertised once implemented and return PSCI_DENIED, rather than
  PSCI_NOT_SUPPORTED, for attempt-time host-suspend policy failures.
- Tighten GICv2/GICv3 suspend/resume based on review feedback: avoid
  reserved interrupt register ranges, check visible active-priority state,
  restore configuration before enable state, and re-enable the redistributor
  before restoring CPU/virtual interface state on abort paths.
- Refine ITS resume so MAPC is replayed only for ITS-backed collections and
  clarify the collection-ID assumptions.
- Rework IPMMU and SMMUv3 resume/suspend handling, including root-before-cache
  IPMMU restore ordering and disabling SMMU interrupt generation before
  suspend.
- Save and restore CNTHCTL_EL2 in the arm64 CPU resume context and simplify
  the resume trampoline/context hand-off.
- Re-apply boot CPU errata/workaround handling after SYSTEM_SUSPEND and move
  set_init_ttbr() declaration to asm/mmu/mm.h.
- Update patch 12 details: shorten SYSTEM_SUSPEND blocker logs, use %pd for
  control-domain logging, mark serial_suspend_available as __ro_after_init,
  and mention the xen/suspend.h struct domain forward declaration.

Changes in v9:
- Split the control-domain SYSTEM_SUSPEND flow so host availability,
  runtime blockers and domain-readiness checks are handled separately from
  the host suspend backend.
- Gate vPSCI SYSTEM_SUSPEND on cached host PSCI support and Xen runtime
  suspend blockers, and log firmware support during initialization.
- Fold the arm64 resume trampoline into the CPU context save/restore patch
  and use asm-offsets-generated RESUME_CTX_* definitions for the assembly
  save/restore path.
- Tighten the GICv2/GICv3/ITS/IPMMU/SMMUv3 suspend/resume paths based on
  review feedback, including state-save/restore fixes and safer failure
  handling.
- Reorder the host suspend/resume phases so timer and GIC state are
  handled with local IRQs disabled and restored before console/IOMMU
  resume.

Changes in v8:
- Rebased to latest master and refreshed the series accordingly.
- Added a new GICv3 patch to tolerate retained redistributor LPI state
  across CPU_OFF/CPU_ON.
- GICv2 suspend now disables the CPU interface and distributor before
  saving state.
- GICv3 suspend/resume fixes the redistributor base used for LPI state.
- ITS and SMMUv3 suspend/resume paths were tightened, with safer
  restore/rollback handling and stricter fatal-error handling.
- System suspend now checks that all domains are already in
  SHUTDOWN_suspend before proceeding, and renames the hardware-domain
  suspend capability/helper for clearer semantics.
- Fixed alignment/cleanup issues in the low-level suspend/resume code.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (5):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add host system suspend backend

Mykola Kvach (8):
  xen/arm: gic-v3: tolerate retained redistributor LPI state across
    CPU_OFF
  xen/percpu: defer freeing per-CPU areas after resume failures
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  xen/arm: smmu-v3: add suspend/resume handlers
  xen/arm: Add vPSCI SYSTEM_SUSPEND policy

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   2 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/asm-offsets.c         |  21 +
 xen/arch/arm/arm64/head.S                | 122 ++++++
 xen/arch/arm/cpuerrata.c                 |   7 +-
 xen/arch/arm/gic-v2.c                    | 232 ++++++++++-
 xen/arch/arm/gic-v3-its.c                | 146 ++++++-
 xen/arch/arm/gic-v3-lpi.c                |  87 +++-
 xen/arch/arm/gic-v3.c                    | 484 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  35 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpuerrata.h     |   1 +
 xen/arch/arm/include/asm/gic.h           |  16 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  28 ++
 xen/arch/arm/include/asm/mmu/mm.h        |   2 +
 xen/arch/arm/include/asm/psci.h          |   4 +
 xen/arch/arm/include/asm/suspend.h       |  37 ++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c        |   4 +
 xen/arch/arm/psci.c                      |  39 +-
 xen/arch/arm/suspend.c                   | 203 ++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 ++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     | 125 +++++-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/common/percpu.c                      |   9 +
 xen/drivers/char/serial.c                |  12 +
 xen/drivers/passthrough/arm/iommu.c      |   6 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 ++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 317 ++++++++++++---
 xen/drivers/passthrough/arm/smmu-v3.h    |   1 +
 xen/include/xen/list.h                   |  14 +
 xen/include/xen/serial.h                 |   1 +
 xen/include/xen/suspend.h                |   2 +
 38 files changed, 2295 insertions(+), 120 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.53.0


