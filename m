Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D6C44507
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364692.1615734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjx-0006NE-A2; Fri, 17 Jul 2026 07:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364692.1615734; Fri, 17 Jul 2026 07:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjx-0006Lr-4r; Fri, 17 Jul 2026 07:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1364692;
 Fri, 17 Jul 2026 07:12:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjw-0006Fh-2j
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjv-0083h9-FP
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5be-2eae-0a2a0a5409dd-0a2a4507dbc4-18
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:07 +0200
Received: from [52.101.70.127]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c6-b4ea-0a2a45070019-3465467f3013-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:06 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:05 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUc/2qtKQ5ZlnX8XY9KtmUFGA/haDup8GMKT7p/Fn1YHlPR3i7YEcvElRzCTrO4kpJfBmRFRUKa2YNQiop40b5V7gQ2SAcqpeuJ5QLO2VQ/hITRkr1wT6DGaYRvJkdM6cCWgjly4aCzw4I+p1GPo40SORTyk7zexc8/pQvitMP4ULkrgTs1/GaFitVc7q7jE/K0jgyic7rMHptXHa1p+UZyp+AL6TiJ6GLB/iHJuaK3TdDYtM0f691MA51lAK5oYFqYlaemCQp9fEuRMLQDW0HJD0hn03TzhH5WIhjujDi/I0yI2UXo8sJhYS89PwQxoHn6yI5WRnhvTFhNPvJH2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIciFQaFNHypn0GkHYDK8/qC14CWFarWv6ht6FIi8uQ=;
 b=qPT+PUTDy7m493s1nop/LFySYEZK03l6giNDL7mW5C6oofJZQiVaWwxMmRZQhoyvSx7LLUaMdmoPvkb3aaxxp4u6f2+pD8hq9oTzJzZWF3PIoaXRUgmCba0NZI+9LLxmHg6/9HsShaz5HFlrKogc4T85IJt/LLJoAeKgQXR1txfwgdx98ROWV2ppcGm7q+43zKObPXAKEFR5ELJZTBItsQma0zVQn7s/UI837MFcYSwVBhPfuYIIxBu9UqhB/UpLK//NbAqmutSIneLe8O+NphGgqrP5BHCoWBHQvmhMMnpiHP847nwJVniv+NjP/Sug3Hj81LrkP93om548LKSDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIciFQaFNHypn0GkHYDK8/qC14CWFarWv6ht6FIi8uQ=;
 b=PMUkvUp7b52RVb6lef07/n8F3gyhIl0MbLFQqEW4Nhkd9KBlF0k0l3wK5ZTT2OeMneu8lLhlnZE3q9/Oi7k89a8/DvU1kPzHk4g8H9TYi78V3yk7LAAMKWJfoWS0VSeIcTweZ5G1Ef31IstobOTpOgKAVMGP+GEg6KDn0f4CVgCICWpYSTFZGcweRHk+X4v3th2KrGFxKX9quG4hX13rrrc5b/xVaIn+QvAa2wD1wdMF8PUtGHQNjgJpoTobjtVz+UYrt0kdtCp9r+AAX1ioXWrkTXp7gymTNB53HNLt+68QUWyuDMTO3M8QTK4exqd3QNEx4vn7PhTqpGJjYbDC5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 5/6] reqs: add guest vITS requirements
Date: Fri, 17 Jul 2026 10:11:26 +0300
Message-ID: <b593bb50e580ca32247c2ba7e3aa3b412ef360e3.1784272211.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784272211.git.mykola_kvach@epam.com>
References: <cover.1784272211.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef09fd2-55b5-46bc-f819-08dee3d2b509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	wxuvcW1r/sYYWZ7zSAPumUSZPOTJw3hqV3caXFqE+lREK3pQkNRHNj8MpUeDAnX4ilaudkWYJnCrDgzKRsM5Od8QzwjizMApDcjKV/2EmS/4aQMQLkEA+h1+xqhOB98eiHm95f8KsNMFjSEAaYRg88fT/Cgc8A9iUb6X7iZCrSn2dM+bR6pXsgl3Yb5AfAGkl0/MQmeU8D0gwXZQyOu9vXPo959vygfk7gIKa7zCY94LpxlQjHDjjO7fejnz+0M/8C/4AY9+UdwqNUiFKGIHVyl1mzIsHWeeWuS1AzaP+4Wxf1gUh9DDjJNSZuqZFuLyd5OgjcCeaGvJgjvoghGHljS2/v6KrvTSGqSKd+74YGNY7IrrUgSqycZ01xaK+d4SUK3s2p/9aSlDabLIiWyDCgQcorE3ig6BcZwGccA5ANlBaPCm3djip3KHXDZUFc2uqPEvhQIl9VmmR/xou8aNQCN9425FDI17YQnpEC6yLZ3+iOOHUjQ57o1s4E90qDu3V5B2wo646PbB6PD8yYXg3oJ9+1kAJp6+2zNoxjKMK+O8vhiPCAZGDef8FWDgmwrUdAcSWNfANRIF8Uh/Mu7xc94YvqLIvQX2L2YytaPRL+LpjrqjMYwyi5Bzxvtyvnub6Q4by6MpNY9cGAiWv8Q72QxEOjgxnhUBRixsa3Py+0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dl4zlOGJfyesQ+vxuxRfcMWG51HP8SJ3IGmXW1gMfySyRf4+0uxGHv266QBC?=
 =?us-ascii?Q?sEiAcjTmQameAKJ4MATr33LC4AhjufPqbRv3sUudo6h1LALVxeximWAgln30?=
 =?us-ascii?Q?KiFBy71/dSzZwsivUR+/JVrjUJbNekchNCzaowskkif+/hEncwh35vN5lD0Q?=
 =?us-ascii?Q?aPY9E5Y7jpfLDaVwPbjn6OQLnORz4MA1MkNdj2VqCntmpMmJxHM3N+pwCgw7?=
 =?us-ascii?Q?TNihOjfj8rc8HYOmWhTBdwBH53LE3FGfc7QjYQAWd2cry4zvAndGYrUAiY0Y?=
 =?us-ascii?Q?hKd+WJ+s8LNCb/znEzMd3xrhFN4jyD5Hdfzy/WGgmler0tlEaGeroJiWE18z?=
 =?us-ascii?Q?GLZaQRW8q7JOJuhdkr62VEvzLUjxVFWzFaH7YP7FUbH5yM4Fh47ABknCBsi8?=
 =?us-ascii?Q?wD19ZwqQ1crvOA7r9Idb0HahAo1QWUgGa6CJ4SMkp5aybQ2lXTrEhpAaby1j?=
 =?us-ascii?Q?ay0Gjh/tCH9WuF0kAKd+gzogvfiLEYD9u3+uFB+kvTlIB29rrxFyRTUQJ7+w?=
 =?us-ascii?Q?+6CB/cTfFiy78QDsPOBGxdnWyKioJIHw7Fshm24gOXHrqC7x7i0fsNR047mt?=
 =?us-ascii?Q?TywqERus+LWY4m6otuKg8mLuQgQA+g9B7qxUBSE95/NBHuJcIs2dVmDxyghZ?=
 =?us-ascii?Q?ZK+gqVE727zika169ZDKDif0kw+XinoN5riu1Nbl4byimAYVrzxN9/36cTVM?=
 =?us-ascii?Q?R7dJjfXHgerpLUSvRo+yGX8UFBd0jrhSaKvXTViqzVtApjauWMw117BZT07t?=
 =?us-ascii?Q?uhCWcxkxy1FlLgTpObYD6kORZyHSKqrkOxkQC0W5EuSqs7B7UEnT61F3u/2P?=
 =?us-ascii?Q?pdQs6AzSdGIGBpCvn/X4DLTsZJ+VuAjHV4vDUJ4x/cCMRHjyNmhajgF+sCA4?=
 =?us-ascii?Q?0iNacngE+e7qcENqKhSUz4fwCJ85CZDfeFTZnVtAkgs24Y6sj5Uubor08oMm?=
 =?us-ascii?Q?uZxHdPfYv0Ju1mVHxe12+mmNbeJ8AaYca90rXBMo00jCD54ht9f42sDXqhtn?=
 =?us-ascii?Q?ia1kUXbzMpfiAsuRB1rA/plgGtm82VHT5jENifCpObcQIE56rO1sbSAvId8z?=
 =?us-ascii?Q?NlkxzlMYkJN3Dhp6BMLn4uO7QFKzXbiK2OM/R+TNyZ04ONX1e2E2C4GyBiu8?=
 =?us-ascii?Q?l5VSnvLBl5MR/TC9IwTMdZYjB4lKR9Z2okVZn/3xzG6y9TZjggTfm7n/Xv7/?=
 =?us-ascii?Q?ouLNZtzpg7OIf3UzqPD4POurEv5RiLYW2IhY0bG/bDcOmIX9NFXRaBs1sSrW?=
 =?us-ascii?Q?1/LoRl018Ll5g6+pjVEGTs3QWWKJrfg23+4xep7mlV6UX3LbGQvudHdHKY74?=
 =?us-ascii?Q?Zi9M3dNdsdxPBX2E36/lwtz7uGOxLs2enRhDTUr8p8JNq+R4hxKDrfFaolMG?=
 =?us-ascii?Q?jOWcqwc/vZpqqIf6hExwT0h7obmE4/JVM/ipxk8HSnAXpgXZZaQ4Adfa0QbH?=
 =?us-ascii?Q?v10uUi1MeU/AFSz++3sZbZ4ctmocot5wuYZOaV5ETn0H3X27oBe4aCI5NYQ2?=
 =?us-ascii?Q?4+m37fI4S9nGuJOwXzlaYDEXXVGm3B4Ux7oggu3zLjernBGJr2Vx7OtvV069?=
 =?us-ascii?Q?NZPUgzJrIGhUrU+wl5zUZ9ISqMZF91SLGHHecbGuB2FllQpG1AusWD7Chtqo?=
 =?us-ascii?Q?gxdLuyg6694owgoNRvVzWe/EYpLdeUR+lNBTsvKFW8OU54VRS8G9Qk1XzevX?=
 =?us-ascii?Q?3c34G69t8RBt/XiTlKw+htldNnWXPQ6KDA1nbCgrr4/H0ioWbVm95BfGApTo?=
 =?us-ascii?Q?Z2shvdUXMg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef09fd2-55b5-46bc-f819-08dee3d2b509
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:05.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HONH4tvVkR2pCLIsqbipnIN6/kj0lfCuazOs6cOf8fDVfPERtB0Vk1fLq+DVy+4IQERyWWmaeg8YtvksL1s7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-ef75cf/1784272326-3C212AE4-EA0E1285/0/0
X-purgate-type: clean
X-purgate-size: 12315

Add requirements for Xen's guest-visible virtual ITS model.

The requirements cover virtual ITS instance creation, guest-visible ITS
identification and capability registers, guest ITS table base programming,
guest command queue processing, guest command validation, MAPD, MAPC,
MAPTI, MAPI, INT, CLEAR, DISCARD, MOVI, INV and INVALL command semantics,
command failure containment and virtual ITS MMIO access-width handling.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 .../arm64/index.rst                           |   1 +
 .../arm64/its.rst                             | 382 ++++++++++++++++++
 2 files changed, 383 insertions(+)
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/its.rst

diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
index 263fc09..7896770 100644
--- a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/index.rst
@@ -8,5 +8,6 @@ Arm64
 
    generic_timer
    gicv3
+   its
    tee
    viommu
diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/its.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/its.rst
new file mode 100644
index 0000000..5258588
--- /dev/null
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/its.rst
@@ -0,0 +1,382 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+vITS requirements
+=================
+
+The following requirements define Xen's virtual ITS model exposed to the
+hardware domain. Non-hardware domain virtual ITS exposure is outside the scope
+of this requirement group.
+
+Assumption of use
+^^^^^^^^^^^^^^^^^
+
+Guest software virtual ITS command use
+--------------------------------------
+
+`XenAoU~arm64~vits_command_use~1`
+
+Description:
+Guest software using Xen's virtual ITS interface shall be compatible with a
+virtual ITS model where the following guest ITS command behaviours have limited
+guest-visible semantics:
+
+ - ``MOVALL`` is not used to move virtual LPI mappings between collections.
+
+Rationale:
+Xen exposes a virtual ITS ABI, not a complete emulation of every physical ITS
+command side effect.
+
+Xen maintains virtual LPI translation state through Xen's virtual ITS device,
+collection and event mapping state. Guest software is assumed to use the
+supported virtual ITS command subset rather than relying on unsupported command
+semantics or on asynchronous physical ITS command-processing behaviour.
+
+Software Safety Requirements
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Guest ITS instance creation
+---------------------------
+
+`XenSSR~arm64~vits_creation~1`
+
+Description:
+Xen shall create a virtual ITS instance for the hardware domain when the
+hardware domain is configured to observe an ITS.
+
+Rationale:
+A virtual ITS provides the guest-visible ITS register interface and command
+processing model used by the hardware domain to configure LPI translation.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS identification and capability registers
+-------------------------------------------------
+
+`XenSSR~arm64~vits_ident_and_cap_regs~1`
+
+Description:
+Xen shall expose guest ITS identification and capability registers according to
+the virtual ITS model implemented for the hardware domain. This shall include
+use of:
+
+ - ``GITS_IIDR``
+ - ``GITS_TYPER``
+ - ``GITS_PIDR2``
+
+Rationale:
+The hardware domain uses the virtual ITS identification and capability
+registers to discover the virtual ITS interface, DeviceID width, EventID width,
+table entry size and supported translation behaviour.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS control and quiescent state
+-------------------------------------
+
+`XenSSR~arm64~vits_ctlr_and_quiescent_state~1`
+
+Description:
+Xen shall process guest ITS commands and report guest ITS quiescent state
+according to the guest-visible ``GITS_CTLR`` state.
+
+Rationale:
+``GITS_CTLR.Enable`` controls guest-visible ITS command processing.
+``GITS_CTLR.Quiescent`` reports whether virtual ITS command queue processing
+has completed.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS table base programming
+--------------------------------
+
+`XenSSR~arm64~vits_table_base_programming~1`
+
+Description:
+Xen shall apply guest ITS command queue and translation table base updates only
+while the virtual ITS is disabled. This shall include use of:
+
+ - ``GITS_CBASER``
+ - ``GITS_BASER0``
+ - ``GITS_BASER1``
+
+Rationale:
+Guest ``GITS_CBASER`` and ``GITS_BASER<n>`` values define the guest command
+queue and guest translation tables consumed by the virtual ITS model.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS table model
+---------------------
+
+`XenSSR~arm64~vits_table_model~1`
+
+Description:
+Xen shall expose guest Device and Collection tables supported by Xen's virtual
+ITS model. This shall include use of:
+
+ - ``GITS_BASER0`` for the guest Device table
+ - ``GITS_BASER1`` for the guest Collection table
+
+Rationale:
+The virtual ITS uses guest Device and Collection table state to translate guest
+DeviceID, EventID and CollectionID values.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest command queue processing
+------------------------------
+
+`XenSSR~arm64~vits_command_queue_processing~1`
+
+Description:
+Xen shall process guest ITS commands from the command queue range described by
+guest ``GITS_CBASER``, ``GITS_CREADR`` and ``GITS_CWRITER`` and advance
+``GITS_CREADR`` for handled commands.
+
+Rationale:
+The guest command queue is guest memory. The queue base and command queue
+pointers define which commands the hardware domain submitted for processing,
+and ``GITS_CREADR`` is the guest-visible command progress indicator.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS command validation
+----------------------------
+
+`XenSSR~arm64~vits_command_validation~1`
+
+Description:
+Xen shall reject guest ITS commands whose fields do not identify valid virtual
+ITS state visible to the hardware domain before applying the requested mapping
+change.
+
+Rationale:
+Guest ITS commands contain guest-controlled DeviceID, EventID, CollectionID,
+virtual LPI and table fields. Xen validates these fields before applying
+mapping changes so that invalid commands do not create invalid virtual ITS
+translation state.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest MAPD device mapping
+-------------------------
+
+`XenSSR~arm64~vits_mapd_device_mapping~1`
+
+Description:
+Xen shall apply a guest ``MAPD`` command with the valid bit set when the
+DeviceID, ITT address and event range describe a guest Device table entry
+supported by the virtual ITS model.
+
+Rationale:
+``MAPD`` with the valid bit set establishes the guest DeviceID-to-ITT
+relationship used by later event translation.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest MAPD device mapping removal
+---------------------------------
+
+`XenSSR~arm64~vits_mapd_device_mapping_removal~1`
+
+Description:
+Xen shall apply a guest MAPD command with the valid bit clear by removing
+the virtual ITS device mapping and the event mappings associated with that
+DeviceID.
+
+Rationale:
+MAPD with the valid bit clear removes the guest DeviceID-to-ITT
+relationship. Event mappings that depend on the removed device mapping cannot
+remain active after the device mapping has been removed.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest MAPC command
+------------------
+
+`XenSSR~arm64~vits_mapc_command~1`
+
+Description:
+Xen shall apply a guest ``MAPC`` command when the CollectionID is valid and the
+target Redistributor maps to a vCPU of the same hardware domain.
+
+Rationale:
+A collection selects the target vCPU for translated LPIs.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest MAPTI and MAPI commands
+-----------------------------
+
+`XenSSR~arm64~vits_mapti_and_mapi_commands~1`
+
+Description:
+Xen shall apply guest ``MAPTI`` or ``MAPI`` commands when the DeviceID,
+EventID, CollectionID and virtual LPI are valid for the hardware domain.
+
+Rationale:
+``MAPTI`` and ``MAPI`` create the guest event-to-virtual-LPI mapping used by
+later event delivery.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest INT command
+-----------------
+
+`XenSSR~arm64~vits_int_command~1`
+
+Description:
+Xen shall inject a guest ``INT`` command as the virtual LPI selected by the
+command's valid DeviceID and EventID translation.
+
+Rationale:
+``INT`` requests delivery of a translated guest ITS event.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest CLEAR command
+-------------------
+
+`XenSSR~arm64~vits_clear_command~1`
+
+Description:
+Xen shall apply a guest ``CLEAR`` command to the pending state of the virtual
+LPI selected by the command's DeviceID and EventID translation.
+
+Rationale:
+``CLEAR`` removes pending state for a translated LPI.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest DISCARD command
+---------------------
+
+`XenSSR~arm64~vits_discard_command~1`
+
+Description:
+Xen shall apply a guest ``DISCARD`` command by removing the virtual ITS mapping
+for the command's DeviceID and EventID.
+
+Rationale:
+``DISCARD`` makes the selected event unmapped in the guest ITS model and
+removes the associated virtual LPI state from the active event mapping.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest MOVI command
+------------------
+
+`XenSSR~arm64~vits_movi_command~1`
+
+Description:
+Xen shall apply a guest ``MOVI`` command to an existing mapped event when the
+destination CollectionID is valid for the same hardware domain.
+
+Rationale:
+``MOVI`` changes the collection target for a translated event.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest LPI property invalidation
+-------------------------------
+
+`XenSSR~arm64~vits_lpi_property_invalidation~1`
+
+Description:
+Xen shall apply guest LPI property-table changes to virtual LPIs selected by
+guest ``INV`` and ``INVALL`` commands. This shall include use of:
+
+ - ``INV``
+ - ``INVALL``
+
+Rationale:
+The guest LPI property table is the guest-visible source of LPI enable and
+priority state. ``INV`` refreshes one translated LPI and ``INVALL`` refreshes
+LPIs targeted to a selected collection.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
+
+Guest ITS MMIO access width
+---------------------------
+
+`XenSSR~arm64~vits_mmio_access_width~1`
+
+Description:
+Xen shall apply a guest ITS MMIO access to an implemented virtual ITS register
+only when the access width is supported by that register.
+
+Rationale:
+The virtual ITS MMIO interface has register-specific access widths. Xen uses
+the target register definition to decode guest accesses so that unsupported
+byte, halfword or unsupported-width accesses do not update implemented virtual
+ITS register state incorrectly.
+
+Covers:
+ - `XenPRQ~virtual_interrupt_controller~1`
+
+Needs:
+ - XenVerTestCase
-- 
2.43.0


