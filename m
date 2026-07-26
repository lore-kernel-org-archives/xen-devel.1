Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7011EC531FA
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 00:55:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370882.1618774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9b-0007MU-JC; Sun, 26 Jul 2026 00:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370882.1618774; Sun, 26 Jul 2026 00:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9b-0007MD-FM; Sun, 26 Jul 2026 00:55:43 +0000
Received: by outflank-mailman (input) for mailman id 1370882;
 Sun, 26 Jul 2026 00:55:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnn9a-0007LC-8w
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 00:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnn9Z-0081V3-MD
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:55:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655996-5cb7-0a2a0a5109dd-0a2a4508b87a-26
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:41 +0200
Received: from [40.107.74.120]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655b0b-f659-0a2a45080019-286b4a78f062-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:41 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB5490.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:55:37 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:55:37 +0000
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
 b=tSjRKyKqMDqgH0597bkduhO8Ch9CW0mDor3V9qcu2orsfftkt4Vqn1TaAx+dBR0FTumsCdfDaIoiLKTBIdxXYN2uD8+4Hn+SedI5HYL/1VfzfPIazmlAOh2rkaRtXvgx7uCtwWskZKUeOhljt8l5KKXiAwBVuVhZU0bK9aI6NPmktVpr8z2V/XgtCo3iwfz0sEXblRjV1Rs9E25QL2H4usJ41hCUsk/yhwV8Z9cOfBuweK4DUuKtjC2VD54FGDXMgx7pFWDn6obEm1HjxasnI5fUz9yM3ocBmkqiwTr3rmizObpcushzBJ44qsgoinP12hOhkzBmvsKAwvh5RGt+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK1cLDx6Xq4Pa7KAEXAzG6KDMbfPkr/rPHIGR/XkH3U=;
 b=EtQuP+GmAD6NR+1xMhSaxGjOdgLzJ3aC1VOoPd845KxuwnDtTFEG2uknTg4U9lXCAbFKeEPvNT+mG4Jo9JV9WKoi/vh4cZKza/lhiyFcTVWQMgpW3QHCpGXmcAztbiGhI9sEgJ4kxVTzh2Aia/yYBNPC7K8NGGC8z+0tXgTxZzee0hXSiB2mBVNpyj2zaW3MmEwmhkWAnzTttChygDdikgfchHbPWLtqDR6OPBT/lOAMS0/MbKEA0fclkQHJyNENIqnRNJjaqvV4HEo4XQalOwqurMR003i9UeZmcV759x2m6sVTK19naxkG2haF0qrTzDjVi59Ho657fPDDSs+CzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK1cLDx6Xq4Pa7KAEXAzG6KDMbfPkr/rPHIGR/XkH3U=;
 b=uNhgWhGDgIiPfXFuVYb5+OMGm7w6FP/LNvCRW2YLH56YVppLEqCOOI5lt1QaiLHq8T77zgss3PXYCkpOJW2nOYTnrQ0x322p3UvKAL/Ya4tr8w2VeY1Xp2sMH1xcqnOwxYjrpxhPVYWdDu0oNLhdXZZe4p9HZ8K5vvfzrFvczRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v8 3/4] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Sun, 26 Jul 2026 09:55:16 +0900
Message-ID: <20260726005517.379267-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726005517.379267-1-taka@valinux.co.jp>
References: <20260726005517.379267-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9984e9-eaad-4216-7747-08deeab09b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pG920k+kiZRMv9N9SXdahkt9c4g0ykzQJnbAOHNmRDDRNGFyJaedqOdWYOnHtBNz7i0Lj5T9JuP5KuZrwmxadmVu4HjKl2TUl862BWvpOKXgdjQGK4h8BNEFb4ww7bqj3eFu3ntZzvKE8QRNDeXM3/QSDjd7NiS/xHKc7OilwyEm2vk+P8p/3Mf0D/VH233zXSHFwSObs5GBe0N2Up35KJXhmpqn/33QfstVtd/Imx9wVNEtwmzVrfGqA2HIEokkpaaLln8cPWfEJIGn9XPFybSbnb4KfrXpQ333Mp6SYEEX8RbXqfn7Z4Iascji02MJcSDsiFZnt+bCPS9UE31kvj6NXMMIRO0vjJznu3fw9FknkPFeAspwuy2JtWYOpm70o9idf+V5H8eDkelT5Jn6eF4I57vNlAVzhGs2xg3rws79ADch0qCqQ0pbYxVq7mD6KyV7kzvEwv4Kr4qkBCrxxD0gUmy1uqziouvIhQh7LrZko/sl+93wNKUh50+OJqxGIn6bxEH12wNOmtPAFF4N7lTCpUge3J/KA5w+4bsZ3MkNiL5Od8rdQ1//v18k0PwZQTz6WOeCCxKOQVLlahwMGytvAATiFQecHkz72P7t8bdK/ZrD7uzs31tPVBckLxameV09GEh1DvjcqBw0jWtgwmpK85gQvZx29ioyBJWggcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Fo3gkpCQxCQu+dFya7UU7lt5de2nJMWpkoqI08578oDN4qVfqrMtqNQ0fqg?=
 =?us-ascii?Q?q6pJAR4Qcg1Fc6MiAyUJqQaCQYR3TW5edgRtjWV6aPLzFwHUb8FdoOjn9zlr?=
 =?us-ascii?Q?YOgzRYUIq4WmmVCdRjak85umrv2Yk+RgRzoBn5UD/1Yo0vxt9Z4rkCeGwk2g?=
 =?us-ascii?Q?si/UnOGiL0HhW2aYpndtow2Zzs/Trm6HSwcKLnrmE7kiDmBPLLVhDsnTJaGi?=
 =?us-ascii?Q?C9Pbd6eWST76gVf5By5REV9GCanfMndIpZhiBWfKQin/9T2WzidL3DPALQuJ?=
 =?us-ascii?Q?KoHsYAgzQmPuYJvj02v1NK21xCzg7YtAt+6YkVUBcFNhNkLGaPPe7Y8w7MRB?=
 =?us-ascii?Q?gVNc7VwRNOtA0/CidW70T2EFJAwUdxMQa27cidW9uhxqngt8dZXucrplrUY5?=
 =?us-ascii?Q?e4QSFKruzXKb6AK0MWuC7RZrHXnlhNQXL+h/y/Bh3eQKyUIgbi/R6Fe9Fq5K?=
 =?us-ascii?Q?zPsYQZxiHtilCZ3BL4Vwk7ZxdWp9dqptmqACtSHHJefDCunoSjJS4Nhxim4y?=
 =?us-ascii?Q?PDVOR29k1vwqxM62Xq9uGg9QWKtp33ZK9It1FXkckssrft6s4h848S7F4KM+?=
 =?us-ascii?Q?n/nW5akSffCJOHIHiYTfk+NO/+PnTREa22FV7HR/hwSfIVN1+hSikuhowzVR?=
 =?us-ascii?Q?TXlXhVKnAmHOwth1emchjOAI9/rKEYbdB6hOl16xmfyqTVVKbMY4oJhwidW4?=
 =?us-ascii?Q?wtT4XLWVNK9w0LbWGufI8clDuRF2Dh+mrekNdLIONn3KCUGxNVWdR0XmhEVb?=
 =?us-ascii?Q?SYPTFOc+VnUfPQU5RIkss3vH0HQ/JZBb3Dik14XSpwyJX4RmXxUPyqrkv5Fr?=
 =?us-ascii?Q?W847CjDBmQZlPqPDkh3uKLNMs1ZhWfcx2LVl38/AcV5d10l9zZVaFq280sbw?=
 =?us-ascii?Q?r0jVNpmwhTTPD5WDJqI0z9j8HbdBnwZ9ePizX+xHCgpyLQ7JdP4fuOK3QSQ9?=
 =?us-ascii?Q?6FobdWoL/e0ShZg7EDPpYTwdDOPc4YGqoe5jOV+PfNVyGb3gOtXJxVmgfQJW?=
 =?us-ascii?Q?BaaIfZPUtpwuOEpDtMLDyxtNUdO3klAn2QvVLzcVSeDpos2dSG/vS+eyF1Rg?=
 =?us-ascii?Q?lMy64BYgegrP7F3aMY4GIhXjEr1oGBSflWvp1Oqksy7bQIib/uzhkrliaKhl?=
 =?us-ascii?Q?xrdBmhGn9OcEO50ZqWYP+iPtC4CARzkKxbOZg0kUlGWF9/aDxCvzyZ6yXx1Y?=
 =?us-ascii?Q?+X8c7LntOuLKm7H0FwjJ3pVIPOOVA/0yrToQxgohwfm+I8hMEZ4pUp6a28NK?=
 =?us-ascii?Q?4Y1yMAWmwiY4BKbP0q9LfLPW2szoJq7EtjRhSowiQ+M0fBBoyGvAQEUJFV2k?=
 =?us-ascii?Q?nc8tCdZaeoOrwsaemtOaQcv1Lf35mZEkz/SbGy/+nKSY/O3qZlAvWJlbLLZD?=
 =?us-ascii?Q?FK9f4/8wQKQjIz/kWOzCXmTlhH0XKHNubKCS+xRsexMFvZ741l5qrocclysM?=
 =?us-ascii?Q?oifM/n8cOFhhg0qFc1CyXzqvAn9/EL14MVS7xxJcZmguXhQWnWB7EiDPPbam?=
 =?us-ascii?Q?KnY3QOfwyft5+1QZuGTvwext8fk1fgsDDwRfdNKjHjwbYl+ediC4pUgygxbB?=
 =?us-ascii?Q?TNJZBvaEMi170G43//UtykQe2RL85PrrwDXXI4FPyaDSG1z/bPUe9O0sgDoc?=
 =?us-ascii?Q?DYK/0vGX1kl9Gisf6lC8RxkjFsOBHiyt5CHdOeILekk11AqgO3FkpnGONtiw?=
 =?us-ascii?Q?AmD3pR3pN4t8Xoij3E/3IrU5gOVz5MPAbBdL7Yw0Fg19QRDYHiJsmcCGbJbd?=
 =?us-ascii?Q?A97wbYqv+PmxwymWUjSjHE9QbnBdEzswbCBjDsXQt/Uua65vdCT7GDPg+js2?=
X-MS-Exchange-AntiSpam-MessageData-1: 5ZOdnMH54+Bb1w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9984e9-eaad-4216-7747-08deeab09b13
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:55:37.0558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRs3ZLiHDgktbz/9nVfPPmcUclKnLf7Y9/ytILe7di5nE6a7aAX0r40QDrke7ZkxiLZT1EzHuO7ycMGsV54yhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5490
X-purgate-ID: tlsNG-c1860d/1785027341-D6D4087B-B97BB96C/0/0
X-purgate-type: clean
X-purgate-size: 3435

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com> # scheduler part
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 25 +++----------------------
 xen/include/xen/cpu-topology.h       |  5 +++++
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index b4a3b59601..6c645f0e21 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,25 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
-    if ( cpu_topology )
-        return cpu_topology[cpu].num_siblings;
-#endif
-
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -885,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 52ee93d4d0..fccc9cd316 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -44,6 +44,7 @@ void init_cpu_topology(void);
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
@@ -57,6 +58,10 @@ static inline void init_cpu_topology(void) {}
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


