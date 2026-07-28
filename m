Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A66AC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 05:07:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372050.1619454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1r-0000px-Tn; Tue, 28 Jul 2026 05:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372050.1619454; Tue, 28 Jul 2026 05:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1r-0000nI-Px; Tue, 28 Jul 2026 05:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1372050;
 Tue, 28 Jul 2026 05:06:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1woa1q-0000Z7-Gn
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 05:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woa1p-00Fj7M-Tk
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:06:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ed-bab6-0a2a0a5309dd-0a2a4504d6a2-20
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:57 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ea-b57f-0a2a45040019-34657d4f8021-5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:57 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3277.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:06:53 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:06:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtgKGevNDHKn9+cQqkmEp+3WjzEhP7Y2kTB6VeMBlyMvYjLO24gr8uZ6egyAdIaDUGyoHlmb1PAYOl3/tyZCOal57E5xpGnFs7VmPddiJlsQ8Oc90zWmpUG5qUTXnqrVWlNU5Izx3Ky176/R0bUiEIra6GzuWcEYNKLyY/CH4QQghcljsLfCV8m9gpgtrrId9vlHzMD1xkBy82HKbLBwOuYYX3Gt/HAUuJyx+1A8XDbZwLB3MJiVXiELTqksZZ+qZ5/qgFT0jmkjt3AfdgRlfkSEtM1lfvsf7uQGznJrkYqJK9I+ILwyB2bXxmUfrcq6JFBnKZYGoj85clXPhW479A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMShCBGc4W5KYknagjI2BL0mNG7v+HoatGWhYaSmHkc=;
 b=hESe9Z6yh8FU/OqOyAujnHe/OGUxIZqCUPQSQfGMlVL/OeQB2YXW0AtDA3gkemF2wL12g6th3BDS2wZXwc3Rf5XVYCr5aFjqjEHAo2kIOR61iqWLpNFZKP4cceRrlhBiekkf6HMofVWhx+eFyaVtTAzWVtQoAmBTjKNPmyYlXNA2TT7YZQNZpEJCXbxX+zM3bnb7NJueXhPnDBIbpHBYNCKzJHVT5wPxd965SWSkPyLxVpEHmjMEgKai1XCCZoSEOcedUJ1CLuiIEaCi6xCDzpip/kz4v+v6pCxX8DSYeQ+iiJg9RVjpS8yNNMAnOMM5XLSz9gKiJ0ZBk5ElHhQlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMShCBGc4W5KYknagjI2BL0mNG7v+HoatGWhYaSmHkc=;
 b=LNNDUCEnNY0o5YG2i5F+S+SwJ289F3zO5uhmp4N3jCoy3+WDHJucDjylBgX5oKBNQOXCkpJe3NinuKKLuSl3xLyE9/7nrxVTx5LSi9Wh5vIWyeHXD8wxKxTISZQG7ljtxbl+S9MvhQ0uUREaspc017XhpCyHELTcEeZD00aW7T0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v9 2/4] xen/sched: Link CPU topology to scheduler
Date: Tue, 28 Jul 2026 14:06:40 +0900
Message-ID: <20260728050642.411240-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728050642.411240-1-taka@valinux.co.jp>
References: <20260728050642.411240-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d3b7c3-32b4-4f66-c843-08deec6609fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	YmjEUchs4Vw9I2AE2dzWOjUlEPlvm9JN/J8z1/NJZR5cFmQeujyNZvTiXrr/d99v+TMguA8heo4s8XHtO8bAkCZ9nKw3dSiOeHb85tKTcCnoDgQwvNt78GLPES02NHcdYuwmE+mMdv6UV5iRaD9PS60sc43sAVeTKjZ8kOR6R0Ut06ONTPW0dBktlfC1rHY7B189JsOWDRtffcWA5pz2r64paVreggJA0PnpUZ5/0D2TQ0x0RcW/knCq1x/2D07TsFczvni8CniKrG76hYZdAXkfWasl3W4zGGVoJhgcJbfknEWAl4eVAo95IA9Gv/67IiTHrC5TwW6pIL14D/DJJeozYvecJKTGyANx0/dhIMP3McOOojNudsNWLQpoIFZADcsQ1x/Dd6YY53kklnHq6itd+jYm7k9JSqjB7yzA2v2G+1vFrehweb2yJ7qXX5ea6BaI26OedIefLtcwSUecM2haXgDLJJJfyeR9wcFaq8XiCx5xVgjU2CXwEDIinu48I+I+OFdTQQyd6UUytWmniUXY2B7yYiIbaV4POY02ZmbTDFBozKRuVy4q0bgwn3CMAhvIfEnBoHmlZXoqXblFnFEJHu4r5tQlyQk+c67YlBd6s43acnZZjrIOkxw0ZczMrGvP/2Aklt4AiYxWp4yav++tCPvEjdpTY2k+LAWUwd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHdCs4wDsSWE5D7RtNVpFjmhzIGOMkYeslCB0L96HQ2/IMfNzNcC+FQkwced?=
 =?us-ascii?Q?yxBZD2X4rn3mMDIiECvWz0q5s8/1N0C9uk7uLAgdjU+3pbOWIC/TtliVjvIx?=
 =?us-ascii?Q?HXXKUqGfxdQ4jNwbvpjuStUSpvdvMKhYhro6iaFK4GYT0UTC5e+VRQXQ98Sb?=
 =?us-ascii?Q?TbDMgYSJzeb0yQCuwSJ25SkXYWe+VHyzLcqv+P8iqLElDcyqGSzMAQkFzVMp?=
 =?us-ascii?Q?2CgYU+K3jA8097wtAeLvj51wxj3e/qgysZ61gN2RCMpzGcd8DkE5P6HGdJT1?=
 =?us-ascii?Q?XuOlGhPHzho4o3emn0uII/dtDjPmW0pjuDRnrSBXEANDwRlQn+37crZdtRi3?=
 =?us-ascii?Q?XwsZlaylso0UYTvWSe5mWak+/jyHSXhumtCGe914B1KhZz+aFpC2X0P947Um?=
 =?us-ascii?Q?srIbuw6ZYwz9IKIHkamWVr4QfjYzDxysqaJA2LM6YpemzK5wrxGnQA5/UxZb?=
 =?us-ascii?Q?TCZksKTpJBqFAxsTuyYQgXAXYn4XhiTAtw6TAM0NJdJoUmH08dsfjlw0Hynk?=
 =?us-ascii?Q?kpMCipQThSl3W1b38T5rBQEiaBcaCogdboshORwnorAWg2o0rvaTMt3b0cKQ?=
 =?us-ascii?Q?na31XkOA4TsTIg+WI2q73qM9aUJkxv5WMZWndsoAMxKPx5iFkCCPHfCC6Qps?=
 =?us-ascii?Q?DohnubLcfcBm4FsyFyqtSyei9hOxTsPf/h64tzhBWN4n6q7L1WfL+u/hZCAi?=
 =?us-ascii?Q?CkO2p7K+faZRZhbOqdoG3DPxmuDUU7hFyIpEyVZ+7Yv9aseSYw9Vk9VK4bUd?=
 =?us-ascii?Q?bUAFlaJs+vCaWzB6sA8ecdHP8e6QFXNWNpw3T/GAaS1jRRfU50fRMK9OQ1sO?=
 =?us-ascii?Q?umvHsxl9rRApFe23tPzX+C0lMTfnZqN4G7nMTtobmoHn+cjuDd2AfIjvl7jQ?=
 =?us-ascii?Q?d0OU7Di6v53GBKXr15w5v8e9uA7r7jGOnBNn6YwteyhS/x3jhun1O2jViFpN?=
 =?us-ascii?Q?1J4d15XGHWHBZpJ0C7+OT/KwTxt2e7N8mwDgZabX0Tva5ufbVD49z+E28oGg?=
 =?us-ascii?Q?ag5em5fK1rej/dh6nCOwO0QWVTuD0GBw6EtIBz3T4AG1mwQBDr1SduwtYZcZ?=
 =?us-ascii?Q?jI0KfETIlyu12BE6NergcUR/jpL8naF9TPxVccvfgi3EN3WjD4GVm0YuqKOb?=
 =?us-ascii?Q?gR36TFx8oWgSm4lZomuAZPMK0KopC17Elbo9d15OrOdhWGVhpRsgRL3UTYe6?=
 =?us-ascii?Q?HRQCGWfJdV63PoWtCkulRL5I7iJFYnK0KkZIwl6uaBLrrKK8N62gRf6tz0lN?=
 =?us-ascii?Q?BOQfPzrj7mjibnQZ5mZEsk9buGt8Zlui0YR4JEAUcK2teT/KS90iMhgAKyUr?=
 =?us-ascii?Q?pf2bQdgGZXM7xNgWQQeIAVDZ872zxJlrouXLT/IaP/o8eOmcp4FgminwVAiJ?=
 =?us-ascii?Q?7YOl4B0UWRhZmiGpL62EZ4rPdmjgP8tURjofhB+seV3mDf2pprYgpO1HMseH?=
 =?us-ascii?Q?bTdLZmQS/PDUcoX/woqWRkwiLgFt5+o+syrdmt3ag5mFubbypyz5Yhuz4RVR?=
 =?us-ascii?Q?4ASiToCGg5MVIq+dlPk31PY1fzTCD03quiBgy4JMKj13ODdinHnyfrNmiaCx?=
 =?us-ascii?Q?WrCqKY78s2zvTDlH1oRLusnLP6OiRUYuRqLqTULMAjDYzjeJhxjhZhmmfJVK?=
 =?us-ascii?Q?oHBTAM81h8/iCkRRtEvj3B4AnymkmegP4G4eLRm30wOr/CnGUMX6yVr2dd2q?=
 =?us-ascii?Q?EOd3OWAU+cZDou47xtPImIbrSMy+h5qu5KTcxzkZjaJ8hxHxu7JXuQfLzWsL?=
 =?us-ascii?Q?ruSdDI57BeXBUhO4Nd1LlV9LhuFM9zBgq7VIH1ruhGqnYuMohXRfZU+7hkUL?=
X-MS-Exchange-AntiSpam-MessageData-1: uqhd6jJI+8nxIA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d3b7c3-32b4-4f66-c843-08deec6609fa
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:06:53.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ0d8v4fljutI4aLKD8aKtrDpFFJTjQChQzbDgN0vz4Zt39rvtAhpMxXCJX6C4CgM8EnGWvmt8RG71w+EWGjAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3277
X-purgate-ID: tlsNG-ebf023/1785215217-53EC6B50-2CC5A6A2/0/0
X-purgate-type: clean
X-purgate-size: 9046

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com> # scheduler part
---
 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 |  8 +---
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 65 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  6 +++
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 39 +++++++++++++++-
 9 files changed, 114 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..41fa73cfc4 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index d957553a44..88b01bcfd2 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -92,13 +92,7 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
-     */
-    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    init_cpu_sibling_map(cpu);
 
     return 0;
 }
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 242346cab9..1bf6f6c66c 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -141,10 +141,6 @@
 /* Macro to adjust thread priority for hardware multithreading */
 #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
 
-/* TODO: This isn't correct */
-#define cpu_to_core(cpu)   (0)
-#define cpu_to_socket(cpu) (0)
-
 /*
  * User-accessible registers: most of these need to be saved/restored
  * for every nested Xen invocation.
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d..d478ffb76b 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -54,10 +54,6 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
-/* TODO: need to implement */
-#define cpu_to_core(cpu)   0
-#define cpu_to_socket(cpu) 0
-
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_zihintpause
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index 9259be73bc..36560dc228 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -317,6 +317,67 @@ static int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0;
+    unsigned int next_cluster_id = 0;
+    unsigned int next_socket_id = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        unsigned int first_cpu;
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        first_cpu = cpumask_first(topo->thread_sibling);
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+        {
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+        }
+
+        first_cpu = cpumask_first(topo->cluster_sibling);
+        if ( first_cpu >= nr_cpu_ids )
+        {
+            /* Clustering is not supported */
+            topo->phys_cluster_id = 0;
+        }
+        else
+        {
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+            {
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+            }
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+        {
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 int __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -327,9 +388,13 @@ int __init dt_init_cpu_topology(void)
 
     ret = parse_dt_topology();
     if ( ret == 0 )
+    {
         for_each_possible_cpu(cpu)
             setup_siblings_masks(cpu);
 
+        setup_cpu_topology_ids();
+    }
+
     return ret;
 }
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..b4a3b59601 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -35,6 +36,11 @@
  */
 static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+    if ( cpu_topology )
+        return cpu_topology[cpu].num_siblings;
+#endif
+
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
 #else
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 45d1f2c5be..56fcfa4945 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ int __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
         cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 7cfe3752cd..52ee93d4d0 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -4,22 +4,59 @@
 #define XEN_CPU_TOPOLOGY_H
 
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
 
-#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+#include <asm/processor.h>
+#include <asm/smp.h>
 
 struct cpu_topology {
     cpumask_var_t thread_sibling;
     cpumask_var_t core_sibling;
     cpumask_var_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 extern struct cpu_topology *cpu_topology;
+
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) && cpu_topology )
+    {
+        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
+                     cpu_topology[cpu].thread_sibling);
+        cpumask_copy(per_cpu(cpu_core_mask, cpu),
+                     cpu_topology[cpu].core_sibling);
+    }
+    else
+    {
+        /* Assume all CPUs reside in the same socket and no threading. */
+        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    }
+}
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
 void init_cpu_topology(void);
 
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 static inline void init_cpu_topology(void) {}
 
+#ifndef cpu_to_core
+#define cpu_to_core(cpu)   (0)
+#endif
+
+#ifndef cpu_to_socket
+#define cpu_to_socket(cpu) (0)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


