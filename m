Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C13C61DD3
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 02:13:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402571.1637600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x08ZP-0003Ew-2u; Sat, 29 Aug 2026 02:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402571.1637600; Sat, 29 Aug 2026 02:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x08ZP-0003Ep-0A; Sat, 29 Aug 2026 02:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1402571;
 Sat, 29 Aug 2026 02:13:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jan.SetjeEilers@oracle.com>) id 1x08ZN-0003ES-KH
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 02:13:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x08ZM-00BlBR-Gc
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 04:13:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a923fd5-2eae-0a2a0a5409dd-0a2a450ca416-36
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 04:13:20 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a92403e-f479-0a2a450c0019-cddca520b78a-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 04:13:20 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67T2A1mf389496; Sat, 29 Aug 2026 02:13:06 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbar02q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 02:13:05 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67T22JER028154; Sat, 29 Aug 2026 02:13:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4gbnvmgghk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 02:13:04 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67T2D0Ex013633;
 Sat, 29 Aug 2026 02:13:04 GMT
Received: from setje-aarch64-ol9-builds.osdevelopmeniad.oraclevcn.com
 (setje-aarch64-ol9-builds.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.248.24])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4gbnvmgggn-2; Sat, 29 Aug 2026 02:13:04 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=rb5Ul
	RZBuyNBkOiWOQDXJQblEyMkdYvtbNX049BzWC0=; b=HcZ9Dj7ypmEJzO6fWJkpW
	JiSyqdg8CGoVmqiX/QtyTr+JDDJWaBkNtjkhfwlug/G6WAJC0kNR1OsZwcyP5aDt
	PcmWLSWxekPuISBUovUUF6TdT+O3ZhAn/ynnEgHIA4JQiFYDQOYkqlN/ooA/q7Wj
	76hvaFZ9H8eXNK9JoVfsEimepcVnOHWqFX14HfFsNmSQN7Y5xWPa4cs/sM4WR6+7
	dPU/UhBPN8AcG1RZCajaQ4r4kCUp/Wd79o99gSoqDXapptVEl1sTJ6PT6C0BpggZ
	EXbAQ7VLnbbNJX7+1P0B54Ok5vXN2K9cmI1jTOJ5GyAYJr4786Fix5YSliypJYA5
	Q==
From: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: [RFC PATCH 1/1] xen/arm: smccc: preserve arguments before register setup
Date: Sat, 29 Aug 2026 02:12:56 +0000
Message-ID: <20260829021257.3310112-2-Jan.SetjeEilers@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
References: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxlogscore=978 lowpriorityscore=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290015
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAxNyBTYWx0ZWRfX3KW6cElt9A6K
 xUDLhI9SFwekAgpUmCCfSj0m7vdVeCOf0ZtQMKELMGSTvEHPCiw6sun5s9ER4Ibo7AcvAWAmftt
 lGzXfki8GTdCeph9ufnuyAuIeq8uvYEVDSg7vLdO/7coK8oWD1SK
X-Proofpoint-ORIG-GUID: FGMoogbrzpaAlnsrNqh5FY-3d9YN49Gi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAxNyBTYWx0ZWRfX0xNJ2krWRnt6
 /OEgD4exTlkJumvdRgLsAmxYJomH/UnDHLAbjmTL5Fzctp+ANKop4rW1fbkBDhds5MpOz1eXaxo
 a+stN1MD/ZscSyL4M65HgGJkCWFlZGcTpJMG1TPBibe9FSfwfzDsMyVN94QVXip4U9Sn5aUkYed
 EeqlipHWK4WbDjy0PbPNyrJJ8giTsgSOqA5CDsUdoDigu1x9YHAkVVVcopTMkcA3s3SdulbThqd
 yPHhXwSR/hyKTHxinmaaHuA/ssKvsJ+sUiBkZZqpOsRXMRyY3S21/mHiTE8PkVXEO87zBcs0YiE
 lp/Gi4XviLdAQnGUOJU5fFq5jvnk81J0dVoQd2MuJPW/vEcsxxZ3axHx/0ESt2/S38fPj/qsefi
 Xk+lbHh2a9B+fr9zoXfVmoNoZMFzCCJtqsfWw2iFnnnyBYVTCgQhgR4rk0sRoTy3TuVEvflzcw6
 8IPJFlPnsTcf3BDX3XmTQyZWof+kKVddNyICQkaA=
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a924032 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=wusNpQs0DAacjZ9UpgIA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-GUID: FGMoogbrzpaAlnsrNqh5FY-3d9YN49Gi
X-purgate-ID: tlsNG-d25034/1787969600-010C9A5B-15A0C065/0/0
X-purgate-type: clean
X-purgate-size: 3908

Some callers of arm_smccc_1_1_smc() pass get_user_reg() calls as
arguments. These include the SCMI, ZynqMP EEMI, and i.MX forwarding
paths.

The argument macros currently put each value into its SMC register as
the expression is evaluated. A later function call can overwrite a
register prepared for an earlier argument. Firmware then receives the
wrong values.

Restore temporary variables for a1-a7. Because the macros are nested,
this lets every function call finish before x0-x7 are prepared for the
SMC instruction. It also keeps the inferred type of each argument.

Fixes: 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")
Backport: 4.22+
Assisted-by: Codex:GPT-5
Signed-off-by: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
---
 xen/arch/arm/include/asm/smccc.h | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 62c6985e73..a153042cc5 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -108,37 +108,49 @@ struct arm_smccc_res {
 #define __constraint_read_6 __constraint_read_5, "r" (arg6)
 #define __constraint_read_7 __constraint_read_6, "r" (arg7)
 
+/*
+ * Save a1-a7 in temporary variables before assigning the SMC argument
+ * registers.  A later argument may call a function and overwrite a register
+ * assigned earlier.
+ */
 #define __declare_arg_0(a0, res)                            \
     struct arm_smccc_res    *___res = (res);                \
     register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
 
 #define __declare_arg_1(a0, a1, res)                        \
+    auto __a1 = (a1);                                       \
     __declare_arg_0(a0, res);                               \
-    register auto           arg1 ASM_REG(1) = (a1)
+    register auto           arg1 ASM_REG(1) = __a1
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
+    auto __a2 = (a2);                                       \
     __declare_arg_1(a0, a1, res);                           \
-    register auto           arg2 ASM_REG(2) = (a2)
+    register auto           arg2 ASM_REG(2) = __a2
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
+    auto __a3 = (a3);                                       \
     __declare_arg_2(a0, a1, a2, res);                       \
-    register auto           arg3 ASM_REG(3) = (a3)
+    register auto           arg3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
+    auto __a4 = (a4);                                   \
     __declare_arg_3(a0, a1, a2, a3, res);               \
-    register auto           arg4 ASM_REG(4) = (a4)
+    register auto           arg4 ASM_REG(4) = __a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
+    auto __a5 = (a5);                                   \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
-    register auto           arg5 ASM_REG(5) = (a5)
+    register auto           arg5 ASM_REG(5) = __a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
+    auto __a6 = (a6);                                        \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
-    register auto           arg6 ASM_REG(6) = (a6)
+    register auto           arg6 ASM_REG(6) = __a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
+    auto __a7 = (a7);                                            \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
-    register auto           arg7 ASM_REG(7) = (a7)
+    register auto           arg7 ASM_REG(7) = __a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
-- 
2.47.3


