Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5EEC61DB9
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 02:13:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402570.1637592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x08ZH-00031i-Qa; Sat, 29 Aug 2026 02:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402570.1637592; Sat, 29 Aug 2026 02:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x08ZH-00031S-LP; Sat, 29 Aug 2026 02:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1402570;
 Sat, 29 Aug 2026 02:13:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jan.SetjeEilers@oracle.com>) id 1x08ZG-00031M-9m
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 02:13:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x08ZF-00G622-53
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 04:13:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a924007-e002-0a2a0a5209dd-0a2a4503b782-20
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 04:13:13 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jan.SetjeEilers@oracle.com>)
 id 6a924037-fae8-0a2a45030019-cddca5208f62-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 04:13:12 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67T25XFQ382123; Sat, 29 Aug 2026 02:13:02 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbar02n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 02:13:01 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 67T22JAZ028134; Sat, 29 Aug 2026 02:13:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4gbnvmgggs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Aug 2026 02:13:00 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67T2D0Ev013633;
 Sat, 29 Aug 2026 02:13:00 GMT
Received: from setje-aarch64-ol9-builds.osdevelopmeniad.oraclevcn.com
 (setje-aarch64-ol9-builds.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.248.24])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4gbnvmgggn-1; Sat, 29 Aug 2026 02:12:59 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=corp-2025-04-25 header.d=oracle.com header.i="@oracle.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=qF+3gXGiekZSYkCx8LstiKWoFra3C
	VghXhf5TxrLnQ8=; b=HYTRbUtMPT4MQgTn8a3xhWfNUtOMMc0h9pZlMSwx3ezna
	OU5OsTTXowck1jJKKdNdJPhDLe/e9G3MdZ13fPL3gJdR93dQe20zxgCr7NiWgnk5
	sPdPdLCzJVMEssnKPIwdkxdSvbqMsiQ+dPauuGJkTUCLpxOMV5fOW3FmOuA9MD9/
	dt2uGdbhWk4K5Jd5VyMkMbYutHa6bwfuSLGXzmljdP7AH7miA2sDr3+Mvhuhix5e
	IAlG4k3m2AeWhUOqF++RSYYxJndPCf1HeGIpkhhmqiQVw7kyap3bKc2/irSgIKCF
	Wt5+4kepwZiYDP1Yu/B7fH1KJV/SF3e4kz/yavLqA==
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
Subject: [RFC PATCH 0/1] xen/arm: smccc: preserve arguments before register setup
Date: Sat, 29 Aug 2026 02:12:55 +0000
Message-ID: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290015
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDAxNyBTYWx0ZWRfXwkESnBJuJQly
 ZdUm4zPcviLLN5D5pM/CdFZXmKn8Q2YbCaPyReOwhJ3LuH5XXpGCoNrRZ5V153M+sJMWpHMcGwd
 6JE6mKWdU0UmMzhh4XUt/d4Ss01jir8V7lYKf8pbZs9msUDYAQH6
X-Proofpoint-ORIG-GUID: UR_JyuotfNkodCLBPwsVSg6P3WVQa3j6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDAxNyBTYWx0ZWRfX29h5qklK9cXF
 7JrF1H7t2r07J7PNCjxvTpS6IDF40xSRcBiQdqvqCB7BZohLwDAQb9tY7TJa9+v9XGGDFeBfs4f
 2PwH/B+/DQRT3WmTRETDK8EYEb3k5LeIXyvLW4llKTaddTeD2667pbODXnax/ROqaFN01SVzE8P
 rGsZR0NEz86NDO9wj64Q6XL1foPFoUok/Hqig9GIlrUXgLAv2PLgpF1DJKmPBtMnHi6HvBdSSoa
 WD/50NND+WXtjA2jUqj4uLT9YAV77nSd8HDkd4qrrgwJ8c4BGE+xl0kmifRlw5dm7gEDohtBMwF
 gzGl3XRXzyCqXqUtLAe+Gc86+9WAQZUPmXqaNOksMDWdbcdauOd4sMCNWdP07B1ZKjkfC1TCWbG
 9leGCDAKzqPKPOZp1wv/FfrMgfUvFb9Lcw8jgMhRnoBkfaxUTXiGA+koNHX8x+JpwKlzSeVaTjs
 OKuemaVPW9C7O5sG+0B5XHAEMYgVoSHkYv754p1Y=
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a92402d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=tqg_bQgt9-K5weYeX30A:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13521
X-Proofpoint-GUID: UR_JyuotfNkodCLBPwsVSg6P3WVQa3j6
X-purgate-ID: tlsNG-33051d/1787969592-770F64E9-AD0BBA13/0/0
X-purgate-type: clean
X-purgate-size: 1892

Hi Andrew,

While investigating an SMC forwarding failure after updating to Xen 4.22,
I found that firmware could receive different values from those passed to
arm_smccc_1_1_smc().

Several public Xen callers pass get_user_reg() calls directly to this
helper.  This includes the SCMI, ZynqMP EEMI, and i.MX forwarding paths.
The helper puts each value into its SMC argument register as the
expression is evaluated.  A later get_user_reg() call can then overwrite a
register prepared for an earlier argument.

The change in generated code appears after:

67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")

I am not sure which behavior the helper is intended to provide. Should
arm_smccc_1_1_smc() continue to accept arguments such as get_user_reg()
calls, or should callers save those values in local variables first?

The attached patch is a candidate for the first option. It restores
temporary variables inside the helper, allowing all calls to finish before
x0-x7 are prepared for the SMC instruction. I am not able to validate the
public SCMI and ZynqMP paths on hardware, but their generated code now
finishes every get_user_reg() call before the final register setup and
smc. With this change, SMCs also work as intended on the device I'm
using.

If the intent is not to accept function calls as arguments, we should
probably fix the SCMI, ZynqMP EEMI, and i.MX callers.

Given the existing use cases, this seems like a bug, but your patch looks
intentional. It's very possible I'm missing the intended design. I would
appreciate your view on the intended contract.

Thanks for any advice or help with this.

Jan Setje-Eilers (1):
  xen/arm: smccc: preserve arguments before register setup

 xen/arch/arm/include/asm/smccc.h | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.47.3

