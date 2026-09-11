Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40DC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:47:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416176.1645342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xqj-0000m7-LG; Fri, 11 Sep 2026 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416176.1645342; Fri, 11 Sep 2026 09:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xqj-0000m0-HS; Fri, 11 Sep 2026 09:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1416176;
 Fri, 11 Sep 2026 09:47:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1x4xqh-0000j6-Li
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:47:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xqh-000pr3-28
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:47:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce0c-8faa-0a2a0a5109dd-0a2a450be1a4-38
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:11 +0200
Received: from [52.101.229.130]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce1c-b7e8-0a2a450b0019-3465e582a678-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:10 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB5003.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:47:07 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:47:07 +0000
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
 b=fBVd49n9cpD0ldQR84Tsx3NtlocS+jvyessQzvVx1tztiI88/Szn8aJCJARQRhGvYzGstNLie3hxpvXCa1kAim5QmYkjdAKObEU2jABEFtCg2dNW8jpkS3Zsb8+652gHh+9aGbNMhKHQOvoniBmWrYVkZCpV4PuDT1ea8MbbF6/oTfCkk9gwDvWKlcSg8W41W0n7r5hcyfBeR6VoVn4BTAqvAFbKDtAmm/imC8q5OvgjLTHAaRW/bR9e41y3g1sKJcgxEHmEtDCT9wWWupeP+HQ8WKmVg2U87UH2x8F8cqgT/tB4Q+ozWNKXNSFBj9mCRaudag4FAcgYF/LQTEJMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQHSSUv6ukV+BKiUAKLe+m7272BwWIUtvYVDaW9Gcrw=;
 b=PkHjL7ujaBrljlpOR4O2oapevDHRyK8tKlDrUPo12Bhpyanr7ux+jmHsoq2Cohi+owxHl7LXWOBXcEcbs64A558lBXAOYcOkHydw+u6HUbNnCWU8ti+/bIMV0QWEH+mnjSeXmnzUqWfLj3oM6VZWDAZl1p4ycboU018K7LyYBG5W11Cv4EL9m31+BEwPCiQBKEL2t0CkQu5P7xc0k5q5RCXEmT5tTq8nH+Iztputj8sWBcIrXBXoXGrJmTDTSgoE1hQknDnH7GYN4alDlKL6LKhvnXIglwkxPSLsjFOkgmwSq0uuWO1FPaZB07pc4HdDFAST4ZESNnEWIEXJ1A97Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQHSSUv6ukV+BKiUAKLe+m7272BwWIUtvYVDaW9Gcrw=;
 b=l6wawT76zb+mLyCeOQFZgW/m4SakueT7A3qghGZshg1jmsY5R4a7NmU3HNLbEIn8kTXTa963joXLfakyzaFmqBvtR4vrTMCZKU/Wgb6Ycjp8co6zKYH1FWcB8Kmv8RPaqKdOBGaGJTtGS1r+1t/Fq7Rx5VJpIdjnnLKOG9NyBQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v10 3/4] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Fri, 11 Sep 2026 18:42:12 +0900
Message-ID: <20260911094213.79936-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911094213.79936-1-taka@valinux.co.jp>
References: <20260911094213.79936-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: e7638002-16eb-4914-ec58-08df0fe9a48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kbIfBiustNUcmmZB0KTVxRdryOTsZQUVCkGDv+hr1dvviGEWptRU82lv3exuooK2HuRXPZrBKBpU3WMeK/cgWd4FHlh62ci+e9WV4L0dJWi294aok2Jk3ygN4dZDTTHzQrNmDsz4PxjafJDh5Uj79lKzm8q6zK8iaUGRltlmH7j/aLFED851DQkHUqyqMkH2JYKQbnyR5Juw5/lUMFg5WU1i8u23ioyjU2uhn85N/p8OKql/puWk8uAZYgJ5AYSCm865prlNAN4DOmiAgU03JrsKGWVK7cs3hbohHxQtyLXFwE/+D3ia5knSwQ3FdHe/mRvY8gSXGlndEDBjjHDw5ZtNUXinRncwxX5NxWOg7fWSm5+4vmoEGsm8n+zUQCtXK6sKOSqYGyuhIJ3nVynCJYmQ4P6fpEQq6HWREx9wzXz39Jd8nL84anRWVInz+mLS8Ks8mhURyLpA4+43IY5pZK/IKqVqSyzfCGIld0fnUjcTxvR6fgDHnrreAamzAl5HsA7QLhG8DNjBGDSs9MVtzWxsWxyzwcdZYGsQmB47ZwLuvP+N5JE5K3yBgq2lGHjqj3JQ5s9JAXMkR0KDJ/nWIiayNvyE8xdm6f24DPP9oRk71tzkltvp8rjimB8iLqt481VKrotKRcEeDgLD4+sCtInfepcQ4LVFVWYJauCMj0k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n6ob0vr8vgizII/X4nhvWFi3sHEAmeHjKVErqiOnTRgSzGDIEolR8tkphwHE?=
 =?us-ascii?Q?qI2P8E+hZdMCsLnBzwTEndLYj80+/wXFVc2eAh5igJZSBhaeFh3fj/IpxEvD?=
 =?us-ascii?Q?JjHlCsIm9kGsVDPjs0ayRIyXF3IxnVS/7hbFQW1IeT0wcxK4Y9FJ/jEKeyOn?=
 =?us-ascii?Q?SjtiELa0Bbdy7hPQmlJfnz2lo69+WG89RNDFhAG3SRNTCYviNXwhsFE9r+pF?=
 =?us-ascii?Q?LFK2GKMVuY9VyCiFRzb7/IGygc/RjA6gJuo46Y6vgoEO/E483GEr3LjFHWs5?=
 =?us-ascii?Q?ycrzH1upvanbGvEJxoTFnxOebBhqCAQCVS3d92xkewM0IHgMpHU+dGJG/ds7?=
 =?us-ascii?Q?69edOiiigIrOfVCF82PVBhxF0tBavL9OzCFes9PkCALYs34dJJ4S55j6UXnA?=
 =?us-ascii?Q?lQPDGmdJqA3iJ8fS95TmVSh1KroEY0gWwtoKCt5lwCMBtqw7IPwqC7DUFm2N?=
 =?us-ascii?Q?mWD4oYbOqtEfBBODhSsL8xQtC9BZP2amUXnur9OFgmxKHHXWrAp6zZ/ZDJHq?=
 =?us-ascii?Q?MaThrbHtcxojbyydnyd8Am0sea93UEBHqqsExqxUcMMLkX+z4zATtmo9Iftn?=
 =?us-ascii?Q?/AycC+6kbJH6C1N6NSkPGmmKoQVqfL+sA+A4lnNjakOShCYBoBYVfkZhw/0K?=
 =?us-ascii?Q?v03ILVzayZkJvCyUKdeCKfLgKwauc2VgW6/5xKOER/+ncbM63ORXIpYXu8IB?=
 =?us-ascii?Q?fbHFKlz2WTHiPIf5QDEJtRTG4TvmD2VTjlR//2Q8syJK3Es5eAycP4xJudAz?=
 =?us-ascii?Q?oAK9W0xOoqGjMLvswl9FCABYt+0mSsfzMauW2pLj917zqLHdEGzDj3jdPvZS?=
 =?us-ascii?Q?nfRW8iP8AkmK7v7N5axxyl6tdiO+tSZXxIoaWppvobA2mHzf2dwZ9Kntv6px?=
 =?us-ascii?Q?LZEECVUjcxMh49EmZNHKJZD/4mZZhP9yVScgP5Nt4pNvPVu96eNKG7UIb6mF?=
 =?us-ascii?Q?EOCgk1b7GYE3K25Lal8/x6mj+S+rXMFoGxgahUU56jDYYYDJnsy+Ra3iaG+h?=
 =?us-ascii?Q?FJhEPpAldWM4+Ll5S5kIHvH28vuCwaGdwgJkyE1IwF5IzuzfKiXyoCo6JYcZ?=
 =?us-ascii?Q?3fpHRs7A/s6xDJQ8+EzrnoEM9mGj2lRfVRz4Q5vfNxbTXZmloSyKM+fZDsDf?=
 =?us-ascii?Q?iDzJcu0oD2Cz+1Y3/miQhVRSdXjb3D20egspP0BHPwJi6Vn1zijrXVbeQrHD?=
 =?us-ascii?Q?+8iqM1SHbdVlbNgtGsls26EDBg/Za3kn5S7m1l3sLoBZTw9KTbeX4WcnoIBM?=
 =?us-ascii?Q?0e71qd6gmjjVlxd0KrWvCn1+GPNLt8vlYjdFNuJwFuYAm0cmCbAWW/oHvPvl?=
 =?us-ascii?Q?zTdzC2fC26QqbiVROOgcI3NPfyC8A+hKv1RlyucKc4SUfcd/QkWFgaif99RW?=
 =?us-ascii?Q?O18uyp9VW9/YopEVPjzqgkuOt/57rUFFCT+cLA3719PfzE/7/TeBw7uG0KwK?=
 =?us-ascii?Q?DtQ79y96ivDAcROhd1amjCIWUdSqxpSWxCAR0f9/+Q9dpTrnlt9OTkPjWJ3Y?=
 =?us-ascii?Q?zVLmQSEdW0f6X6TOudTkN1aeh8PXu75m3nQwMKyP7vJR32c+k+ebCPZhKXSz?=
 =?us-ascii?Q?hV2sfvdjg/HTs8diFTnW/80eNIMmCfzOa1lkOTV2g/xuR9G9Lq4It+AcX7Vr?=
 =?us-ascii?Q?d3si9wxdBHEBo2QBctKVCWxa+Hi6Y85/W449Jby43AcVznzNXonq9frChAM1?=
 =?us-ascii?Q?VBSl2JJiJEZvW1+8Ejh8BqhHrSfcYkKoGT6UYpSUUCSZOGnd37t4Qu4CBA43?=
 =?us-ascii?Q?hduxsXSYaCNM0MEkNB8d3wIflMhwjimgCJ9mrj13JxjmC3nWc/o0z1WNEgES?=
X-MS-Exchange-AntiSpam-MessageData-1: xUIc6jH/9ggGFQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e7638002-16eb-4914-ec58-08df0fe9a48f
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:47:07.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXskXj8o2elGTSXAj7c9NHeJw5tZlES4dco7FhWRwD3sOMT8j4kL6NexUKDJAhU23gE/qxFlUhTYIDFH3xCdlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5003
X-purgate-ID: tlsNG-42698a/1789120031-186CA9EA-866B678D/0/0
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
index 4b17e13a97..049b917c49 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index eef94528ad..6ede629fd2 100644
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


