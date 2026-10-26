Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73707606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=uIT0i8Mv
Received: from list by lists.xenproject.org with outflank-mailman.1460785.1671634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyJ-0003ia-Jy; Mon, 26 Oct 2026 07:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460785.1671634; Mon, 26 Oct 2026 07:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyJ-0003iT-H1; Mon, 26 Oct 2026 07:18:19 +0000
Received: by outflank-mailman (input) for mailman id 1460785;
 Mon, 26 Oct 2026 07:18:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEyI-0003i1-2w
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:18:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEyH-003Mc1-Fm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:18:17 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeb3-bab6-0a2a0a5309dd-0a2a4505e26e-30
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:17 +0100
Received: from [40.107.201.53]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeb8-4cb1-0a2a45050019-286bc93529fb-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:17 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS6PR03MB235817.namprd03.prod.outlook.com
 (2603:10b6:8:418::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:14 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRz+n1fV4FdueZ28Yy0I71M0wplELay1oFsFAdUYtKm9e8s4ZJG92gvBjQzs8Ldt3fERlX1+kFpGu/p9TWNa/1XZ5F0OpnsSXxgXJzYajfdACkJB2OoXJ7kH4sgbKL4qcVcR5lASvr9X8lh/cYiJ1H9+cNIiY1YTTqWjtDHZDvy0/HuzHGyVK2vm8DOoce/S+EZSPZo3ztirlOquBvqF42qRs34N3oEL28l19TW4xucFSAo9k9uG+oBjkxwxTYXSdQd+PnGYqqXPt6mmo/mHv1HsIGbOJxt+QiHxBmKituhrhd8PnjBBp/GN9v1McT51+dE/0MIS0Yoir36Q1HJf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOROdr3Lsj2WWcWL/9pNfOId1Ctpk0JV6ASZ1lvZtqo=;
 b=q8cSowPU6HZvURRCNWe3aIV+Rtj8Ih5TnB1UqtAEAMuhmkPYvuMiaHs96E6p1gdrZhQBlsa8A0fA8K4SImML+VPJBEFEPA8C9WUGDWgEwlP9Ubukuzt0TkyYI25BvhNFSiINzoZKaKhnBtah4UZEo0Rdw6WTwDCw/ReF2rBGHN4rhJbeBmYMDRpJLRbzMY8EUQzDLuXUNmuMxOiLslL90RTAlucPnWfXf+1uvMpoxdTHrCVFRGDeTdXJYtSmwc2V8K4zndNV2rKE5B/aJHbKGsVGzIFuqdMNnSQoXJr1yCcx11KHljqcnA1h1J74i86RJ6q7q6a7XqKHPSEIA9vX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOROdr3Lsj2WWcWL/9pNfOId1Ctpk0JV6ASZ1lvZtqo=;
 b=uIT0i8MvSbEIQF12wpvg/bbHYtNpGTyPErsfqdv0kNJz+NDtXGPTVYOklWtF5+m/lA1abAQcSmzXVsmZbzd+tqNtW5+VUSoeGRT+EnMY59zCKrDBSi0dU0VFfJBwxoRKW9vJRfHj2XEJuFTaR0P6rs6jBsKalIfZnC8tAt52E4c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 1/8] x86/nestedvmx: Preserve hardware access bits in reflected EPT violations
Date: Mon, 26 Oct 2026 15:17:47 +0800
Message-Id: <50dc000032bd10afa369f9ce83fcfa237aba957a.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS6PR03MB235817:EE_
X-MS-Office365-Filtering-Correlation-Id: bef12410-81c7-4a15-325d-08df33314c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022105027099003|261021121427099003|261021123027099003|10067099003|56012099006|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5n9jwZcN62MZ6FjMkC5Is4C3FldMWDH0ZSb9E0bwGLjcmNHrkSNjlFZkhB50+wqFJkav7+gN2wUjPi6DlMG0chT/wxSSHUKi64grbQu77dhCoGHxHHRUn7ojMFQL4oE91mdYexY5qpJgVPVoHAtQziIHoE0W7f8bbobdLzdSdq2DAZ6jx616fuI7pXg1XZex2Amhq/VBMKBa6/3ZqbZLyMylGktAPXgIA1Z1ulHAg/qO6rR43cvIrXE/clnunZT6JHD4rURsOGX1ncIvWQOij3kAVkBWtTpKZBF2kzNNliJA4VTbdN+elhowjJM/lOsRGL8A/4je8gQjC23GM9CvTHLz+9CzLX7F6goQiu0gqx1Fu6NaHgFSvu6vfpy2KU4mRLzct0Qk11//qJ0iEi9X5rSoS7k0yRqZYhdZnas2L5x30GkNHgRrmKKovHaJrCVV3DoqudKDchcuG2D/h2hJhSIHqAerjXfNB1j9QvytuI1Z35W56wsu6mN/nsGBQo9SqRC+lMGAkFuW27AKwb2OzhE/3ay9YbKsay44zeJxJDz3YnhcTtXW0njBOtiSS5JimOSzF/InvMW+dT6eFiLyqkAHo0GLIxX96AJMqzpxJqR5q2TFfxrrRY1Sg88Z5jyr/nSFGaSZmLlUezRJmu0ejmKLB+2FPD3M/PXog758K9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l9w5yx8ga3VUqt1QFZ4CLLl8pmAkmvcfOtVU+8YLUS9kUyCNNsdzYIIYT+M7?=
 =?us-ascii?Q?PcRdgbJL2ArAXL62U7UVCFbRopbrKCaC27fMv4KeNHgum8/qWMNaQmsrMVMq?=
 =?us-ascii?Q?Qd87EF34ImaWlMrXWUJeIsTlkTgAq7zHVurLC7w9tSy8xbdO93binsVcUF+N?=
 =?us-ascii?Q?+76qq/V0/zJ/R2wLK01mIr6C+KhH5mG0A9lmckzVRdWJVMmXV5hf6kuNf0Wt?=
 =?us-ascii?Q?qbTtKZdjm9h7cfALH7ZqigjEnGU6G4c+NQMfIXAJfWbiDJ3ZIo+lI1GJ7vya?=
 =?us-ascii?Q?U9EXXzJt85+GmXSrWi72FrBeauVhtkJ4NCAqM3mkTwD+XheW4TWWsl1gpy+p?=
 =?us-ascii?Q?Vleqdix74Vr9tJtcAJzQcIemqkQKpMKqJhg68G4WhVeI7fvf4bUEHLOf8AN2?=
 =?us-ascii?Q?vJutDBtseXpChp7JlCB36wFM5p3edpehkzRhKXWuy31Mqz1H3G94EcTk8D8G?=
 =?us-ascii?Q?rmBkFC/OORoOULB633iZuA8LP77rfBUqfSEe2c0f/9Q5e/Gb23iwBoW2U//y?=
 =?us-ascii?Q?yP1ZkX/eonSP1oso05zGesXgHGO8TqQNjVx7cozlMQJ3XIk0WV0rZzEPtWSK?=
 =?us-ascii?Q?KvmSw0Ur38agbsbz3VYKToFmXVRgVA52YjXdpPVtxd6Hex686wCp4FbMgSV+?=
 =?us-ascii?Q?MgVd0tRj1YggvrLrVDeSllCGWiYQAwq0aj1X44dt4vVd++yo5OApDmgwjnci?=
 =?us-ascii?Q?migrrYC3lRLcNqy5ZCfrCdXBKzSY+RwQDYnfIaAtE85OufDBXeZRV9RVb34k?=
 =?us-ascii?Q?L/0bbq6dP56o1PovRa3kJvx6/C0CndroLux2UAFWnD+q+8Sj1Bj5tipeIoFy?=
 =?us-ascii?Q?ZwtCO9rktpZ7cmFyx9P6rG9LpeOtTwva++UlAW6Od2PkYqQoeieVWecCR+qR?=
 =?us-ascii?Q?nBKKX3cI1jUOAs693HiwPp9C6aST3Nj9S/AplvlYCqOOZ7/6RrlRMZWVppsy?=
 =?us-ascii?Q?TmfvwtSmLYNxaSEHImiujfHkf6a4W8co/uV0AjzofAwZRZJ9rh/NhUCdRDll?=
 =?us-ascii?Q?W5zb+ZM/nUxDQO2stmO5VDA3QchWONVAfQgXKoCwXo9k7zKSSdAfVAEkg3ui?=
 =?us-ascii?Q?CWQeSTNDPKY5IhXkzx61Z04gDONhKQyLhECGOw7iLOm/J3spfDAYKcQqg9WP?=
 =?us-ascii?Q?2XMJebG6TXwdwoRlnM/H6iX+rY70EMpwaZ7VoTJObxWcgPTSH3MasN7Pf0VJ?=
 =?us-ascii?Q?7F9YSm4TCnX3t5mjSU/cPCsUwrBraDkw6RsGNHtPrewVHkPRGBeM2vmsPBhV?=
 =?us-ascii?Q?5MWERJuQBVS0IZoVw3sWvd/nLsEthOZcgefgxlNWq/vUE1YRwgBs7ct6hxeK?=
 =?us-ascii?Q?vYzceaBRtdsEXbtKpRNYiZ7vTzo+Q0dxmvtnJc7somiIxyHfRLwmcFw7wuYl?=
 =?us-ascii?Q?TwqJynZyNG6S3oxMwIBFBO0Ts7S72MFW2ioo5Z8REHHcEmMfpAH3alchMSoy?=
 =?us-ascii?Q?ZC6DwNSqLp5Ewatigk4m7e8UbDV7FqNtk8Z65tPQBag36VtS2k9YOAQ2tuOD?=
 =?us-ascii?Q?i4gOoFEgbgPwTzj7gg5xRPnZZbCavj6VULR/Hj78dnxWdv3nL7i2g8YlGhKp?=
 =?us-ascii?Q?rHVbQGKhzubOBehRAevtIjbxk2LT7urGNcifB+/GfH9kwSirEfQP49Ua/YE/?=
 =?us-ascii?Q?cDDEkBXVnCzHPSWnYZk9XzERaTGNl7wv9970EwEoyXKGaY3YOHZWeF6x7Qs3?=
 =?us-ascii?Q?QZX3+mHf0P/vrB8FlY9anU/zJNU38Ht3dMZWCqkSzuuwIgd1/5vttdU4tRg+?=
 =?us-ascii?Q?KZBUJ78Gmw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef12410-81c7-4a15-325d-08df33314c20
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:13.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUE350QmjjjI15w5XZlCZomHfnlDqpyiB76rHbEoagehlyowHRdg7QSnH7qVjvkEE8a2aUkhN2WQVsDecuF4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB235817
X-purgate-ID: tlsNG-c201ff/1792999097-F60AA2A1-7D3E4CEB/0/0
X-purgate-type: clean
X-purgate-size: 1909
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nept_translate_l2ga() rebuilds the exit qualification handed to L1 from
rwx_acc, which is derived from the npfec set up by ept_handle_violation().
That function deliberately treats every write violation as a read as well
(read_access = q.read || q.write), because the SDM leaves bit 0 undefined
for read-modify-write accesses.

As a result, a plain write by L2 that violates L1's EPT is reflected to L1
with bits 0 and 1 both set, whereas bare metal reports only bit 1 (data
write).  The widened access bits are an L0 implementation detail for its
own permission checks and should not leak into L1's view.

Keep bits 0-2 of the qualification as reported by hardware, and only
replace the GPA permission bits (3-5) with those from L1's EPT entries.
rwx_acc is still used for the permission check itself.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/hap/nested_ept.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index d88d677825f1..e116d8254824 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -255,7 +255,12 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
         rc = EPT_TRANSLATE_VIOLATION;
     /* Fall through to EPT violation if permission check fails. */
     case EPT_TRANSLATE_VIOLATION:
-        *exit_qual = (*exit_qual & 0xffffffc0) | (rwx_bits << 3) | rwx_acc;
+        /*
+         * Keep the access bits (0-2) as the hardware reported them.  rwx_acc
+         * treats every write as a read too, which is not what L1 would see
+         * on bare metal for a plain write.
+         */
+        *exit_qual = (*exit_qual & 0xffffffc7) | (rwx_bits << 3);
         *exit_reason = EXIT_REASON_EPT_VIOLATION;
         break;
 
-- 
2.34.1


