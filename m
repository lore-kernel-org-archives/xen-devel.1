Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17B0C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:15:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408561.1641056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhc-0001vp-AA; Fri, 04 Sep 2026 14:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408561.1641056; Fri, 04 Sep 2026 14:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhc-0001vi-6l; Fri, 04 Sep 2026 14:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1408561;
 Fri, 04 Sep 2026 14:15:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2Uhb-0001vO-5X
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:15:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Uha-00Ehtu-IU
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:15:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad276-e002-0a2a0a5209dd-0a2a4501d956-48
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:34 +0200
Received: from [40.107.208.31]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad284-5984-0a2a45010019-286bd01fbc01-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:34 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:15:31 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 14:15:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoUugHMxOf6kIbWoNQFPCSvhopmfSpF7maR+rCot5xxSMWR/LxhEKDDr/19352ACE9TA/y2MRIunoflOELasi2YGaD0/3YwwAbDPhmeCoOw0gR3Na/54Gk6dz7zPFoHEEka4DQV4ZiapzU1BA1th/HItvzO9ykipPvw7/YRjwOl2UIuHisKXbNEO8ZdKxsnanTl+7fed+9rzV7ZOxyD9RWaCeV1HuvsDgKA7N1oyigWT3PzAEceV+xR1EJGssaOT+5nwZzK7+owV1w0LfS1vVpZZtomOSJz6ZALJMKJy5nZwn9o4ytApV1s48i+Q+nKuu6lUii0EAikoHClQ1KyBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAWojgnc1PX0meqiqPkIfh9aSER1BfswxCr1QfPRO50=;
 b=XWRbd8I9we6rpB0G8VsRD4ULdf5jX7k6RSDRYc+ld6AA6ET3jHLxE6ayk2qye0cv0PLluJWESFDRfAifqpFs6/iue/Ow8CDgLddQeIGHgoX6oDsNPYTUo1C9OV2GYUtXVb+4AqijVHhqwH7nVqzOTea3bKkeGB3pw8SmfZsp+NaM091sY2ohDFa96GXbjEfB8qWLoIXKzlOIHiMq37LL+Ovba6dLFUBCmHDDE+BwSNfEJVaobOnCFLjqJSFfRuH+1isPuxA1mL2LGXuBD9OoeqTU1ziZTNiBqyPqU9cKW9omdZ32JNjZEuhM4jXb9D3rmReEqKgWkwwMu462/cKQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAWojgnc1PX0meqiqPkIfh9aSER1BfswxCr1QfPRO50=;
 b=kh9iNkr3Vr8EPpuu+svjHH9U/0okjVD4EUZTipV2PKymqWPVUTEulmBCoOccq3cejn2Pwl24Uh2OZ9BJ+yKjTZRZ0devOgMKV10q2mYdrRHR6T+WgTAUUOrZ5AsbXmNYxJzN2f0eaCCWBMi2C9agokJIE1uigZ/K08PJG89wkHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/3] x86/viridian: Workaround Hyper-V GP fault writing to MSR
Date: Fri,  4 Sep 2026 15:15:14 +0100
Message-ID: <20260904141516.367862-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904141516.367862-1-ross.lagerwall@citrix.com>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7638cc-e6ea-4c72-0b85-08df0a8efa57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Wp56Qn7AXtTqcy3g/hppy2hwg8RH+qoyD55zbnsybpVPXd8q0+vR3osIgJLu8bTUr4itkRtFJSePTAWSYj0O71b6ljrV16FnG+9n2AD5fkNcPr05G/kmRsfGXf7pc4gwbSwU99tH1eKzlpwt8KC9bg55ZN2CPnAz8E5XEwDgkEoPK7fH7sUuJ5HTPQSG0PWiTakCBK9wXV92mvIJWSFzalMy0mmHxYQJdVtTZQnwb3huUAI/W0n8EfH0P7Fv+r/xI+jblyjSdVgvF+wrUH98vLvIQEdn7TaG6GHai4+kG7PNZyX+u+dqadynEcA6M8lOnfOiNTHdUzBhtc4W+t5jcXQ1nev7JJXaZoYXQa8ZpYd52UOfE3DZHpBLOLC1ZoGg0TbnUGuPtcXO+OlzYWD6fDR+LG9ydZmtqkEjIoWO0zNjp1Xl1VRXOGvOc4yIDA4WqzAC5P4ujzF7mwu2fdOLtWeJjZkkyD4eEjLgMqFxrBHHXtWL8lIZgAVKhxHsP7hzYuwol49KT/oGE48lvrRnS9Z7a9e5I/5Bn6I9J5Yu8sDW8mszco6AHMQW32M9Gy1PcQ6TygxhhIGuT6BONeZ6jbKTOW/N242PVia0t54Zmud/Q+XLPlsVlsOunVEcIkvBHxVWTE2EUIhNugVc7/EAKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zybOA+dlOxhx7Qfak18Li3Sd2IsL2Jg09Q5S/E+J9uQbCSfRkIC9ZgOkbxti?=
 =?us-ascii?Q?OTNw2zhFhX4ehxGGYLqz2YbTFVj7787UiLtyve0KXDIYZZDbPg1waDuR6cLr?=
 =?us-ascii?Q?2BJYCf3gENXF+daWXbUbYW1o+HcGt5Jti1Rk29yJQr351cSwLmRLxC+iZ7ts?=
 =?us-ascii?Q?wowFj6GxbMra/SNufthEKWZPs05AHclV+ITti24/9nV3q89INgN+3rc5taMr?=
 =?us-ascii?Q?2e4St4ApIlrqv3hQU+kTeTiZ2ftpaGjN5QRYu6ElTWMThGKQvs9vmbMU24fD?=
 =?us-ascii?Q?RbweZj70nfGztkr6UL9pVHfGfmS8KoEJMqpszuegp2KjnnnEBfYI/tYDcviF?=
 =?us-ascii?Q?h5zxUSE5A+a1MjUEkmgNxRFsaWqd0C6G7gWxhTwJFTXg05t2e8Pt3jZZW1Id?=
 =?us-ascii?Q?505aPXO0rPo7NsDZ7PtTVBsrxXww3wgXfXqqTZ783UBHqSb6H8M7Q8U8vyJw?=
 =?us-ascii?Q?kgQxz68t89Atio5ZH1cNe9SNCkz0t1U/5u5mAa6pwN+SXThETAiA3q2GSJ+L?=
 =?us-ascii?Q?XF7wZQReuRl52AAdFGNDdiCGCqxwLVXbn9dbVqOxGEvamAKA9JWbb6YpE4Tq?=
 =?us-ascii?Q?yre7FDdWxWpPmJzaNvWH2Bj8AGsBDj7eMHghf/EnNbTSQRSBmnvhQDP+qKBT?=
 =?us-ascii?Q?tzmc4iaJQBI9HjV9s7PbuhUqGQkal0nb+OyKiXerIrSocJyFCjapPUNatyCA?=
 =?us-ascii?Q?HaiRAdb3OMqcZWmPdGN1TY5cubfra/tq390rq7JRPb63vyjKZ4rAfQn0m4gD?=
 =?us-ascii?Q?3DWrFf3JOSZaeNNxPx9Tjil06LMOXpILKCT7BK6gwHNxJitPi6vt+UfptE5T?=
 =?us-ascii?Q?22SlhrlcMEtc6AcF7Mn8/eZhnwpwX0tGfSEMN/jWjSCklFhDJxHyHybyzHoU?=
 =?us-ascii?Q?FOu5eGduVZtE1A+wnIgwnRwcnvUkwiiUzaR6UfSGu2KWDmVxTUXDsw9ULiOT?=
 =?us-ascii?Q?gzxXENs6dga78g8Y5+h05SVTijVFi7M2jdGpeqwfQsjDYvUVuB3/2qEkY1Iq?=
 =?us-ascii?Q?Rki12QFt8+Ifu1TYz/m8uBcqdg4UI3rbLmHISv1dFT5DM0zbwJpfgmZAs/qj?=
 =?us-ascii?Q?JG4tzFQ9+PJKP4awsc54o/KaOxhPgdI14YILopzzBZQOz11kDfEfyc1dCI13?=
 =?us-ascii?Q?pzDTbQXLKo2u9jhP31xsfiqPPppNdxURMJ9hkShbkA8jhwxYbdCQPyRpH3ue?=
 =?us-ascii?Q?dMNT8nji9ZNqreU5B48XOqJ7l0I+/LK9tspCO3G8N+SrRSIuBmIWmvBePvS1?=
 =?us-ascii?Q?jgiwa0lJcMpJcOXs2uBio8CEAOlrbUnOHrE7Wy9W2vDhp7NfOfmc59aIQzxx?=
 =?us-ascii?Q?a3pDN4iQZIh2FWhxI142aAUkIo1BVnmn/M0zZdwcICJThOROCE+3u6m0yfPq?=
 =?us-ascii?Q?FS7+cjfk9BMCvfkqeXjDMTF5FNEuGbeWnW1Qb28s2RR8yRsX2sp3tLuKMWlJ?=
 =?us-ascii?Q?GTOiWv9W7GjN50ElWB/Iz8hGa5opFBuv4Iz3yL9gp2rQRPRv23DpNnUFWC7y?=
 =?us-ascii?Q?NiyBEnHrDs+8jBQfBBcGYCeqRAlZHPhcekAMQsARaLZTcs301/nt1ZmTPHav?=
 =?us-ascii?Q?j7YHDExjk7i6eoPPVXwWyxCjZr1oh9BgErEF75Mtrjk7vJP07HfDP13MJa/G?=
 =?us-ascii?Q?0tL6LxZ+gOMCCqQQYrjtOPugJF4RN5+Zblg9pFq97kkd5ZOSJzK4WNeMA6HD?=
 =?us-ascii?Q?dGhCMdX0rmHZkewncsLhXvEvvWcskIBjo31MHLGsL2MfPjUdCS+nZocLY5xr?=
 =?us-ascii?Q?f8aUtjvmtfHaaFH1nCJcnyMXVe+cmmc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7638cc-e6ea-4c72-0b85-08df0a8efa57
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:15:31.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKYq1HfChJAnnYtW8FHf5mStycObAPL9nCMEXdjgYE8Ka2AyuKs4DBAYBbZzJE6QhfOClg1yxKRnBeGawUerUjt3sGsWjb/yxouikLMJFzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957
X-purgate-ID: tlsNG-d62444/1788531334-1D87F757-12D9F311/0/0
X-purgate-type: clean
X-purgate-size: 1490

The Viridian spec requires the vector to be >= 0x10 when writing to the
SINTx MSR, otherwise it should #GP fault.
The spec-defined initial value is 0x0000000000010000, i.e. the vector is
0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
the spec-defined initial value and since the vector is 0, it GP faults.
To workaround this, treat the write as a no-op if the value is
unchanged.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

In v2: Added a comment to clarify

 xen/arch/x86/hvm/viridian/synic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index e6cba7548f1b..75b004440e58 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -157,6 +157,14 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_synic) )
             return X86EMUL_EXCEPTION;
 
+        /*
+         * Windows 11 Hyper-V (26H1) has been seen to write this MSR to
+         * its default value, despite not being a spec compliant value.
+         * Tolerate writes which have no change in value.
+         */
+        if ( val == vs->as_uint64 )
+            break;
+
         /* Vectors must be in the range 0x10-0xff inclusive */
         new.as_uint64 = val;
         if ( new.vector < 0x10 )
-- 
2.53.0


