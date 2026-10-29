Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732E606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=sk5ex2kB
Received: from list by lists.xenproject.org with outflank-mailman.1464132.1674869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMI1H-00085F-Qy; Thu, 29 Oct 2026 04:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464132.1674869; Thu, 29 Oct 2026 04:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMI1H-000858-O4; Thu, 29 Oct 2026 04:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1464132;
 Thu, 29 Oct 2026 04:45:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xMI1F-000852-G0
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 04:45:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMI1E-009aqD-A1
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 05:45:40 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae2cf69-e002-0a2a0a5209dd-0a2a450ad126-8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 05:45:39 +0100
Received: from [40.107.74.79]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae2cf71-f2d2-0a2a450a0019-286b4a4f67f7-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 05:45:39 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TY4P286MB7152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:344::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 04:45:34 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 04:45:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrioarnpFLre8SxxRdpTAaL27V+rqN6EckKwTkskrSkscN1La1Dnv9sfzAElZBwnzvxbszeYmc9ZSPZkfQANDXetRw5h9dqGxGtPB08g7DBZmrjLsx3tws4llLJtTP7ook/QVdqnWw94eP0M0tWVidRsh5fOYaANwUFd+4qO/dfGJwrCWwkxr6zc4fLpNiZe55258oliSnhvYFOzsGOQrBffwyj6UGYO4myRl0PwZaTqe0Z/Tu8HwJsuGTzNsIMAlFIFiFYWSY6sEzJhaI8h44DhkUwXMrme7WaxlPX/OF1kEgctdYsKPFYJIPnxr6iJi9eu9sgCJNRUkz5yRHcpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EssaoHrsC91iDaQNMtVRO+SV6Rtzd2FHY/4yt5E0LM=;
 b=Bd1u7UE0P06myobq+g90rmtqkzHopSZi2QdMl6v/Er2zEj5N72zV75xefm7FjUu554gHlAbSxjMnnZP7LzH/jkQ06+9KjUAWE5PmZYgm2n6KMt8tM/lw66oRqJrc8a89dt3YQekoKzNOxeHEFUP98IR57bBM5hLlv3ajuTuNmy0r8r0c/XfLPz45LEq+nNBazQ3NnGrUdymebdGpOoTA/lc2/EBm+q3dnv7uiGS0Q083q5XktHoxrD0ZDZSVU/GuxI3cbdkva+JCbyBjtUC1zJUYKgEDuPyJQN5vxoNoW443oZS+aZyG/jzOSQCWRSGSo0pYv4vaXHIzqw+MHmcabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EssaoHrsC91iDaQNMtVRO+SV6Rtzd2FHY/4yt5E0LM=;
 b=sk5ex2kBECXmuZ82/lmn0hKlCdZF7mc8uwPWmIgfh7XAEGz00J+mjDGIUKUgusg+yLTkv9/iazvtQ1Kcn/qF1Ct43PAUoFw+0qtb5Qpd00uBECJlJoMV5l2Th7P5BpOcyLmssRRc2SGgnWyV+BMyURwZ7xbBbousr+/p/NdUW5g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
Date: Thu, 29 Oct 2026 13:45:11 +0900
Message-Id: <20261029044511.28285-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <290dd295-bd1c-442a-874c-de4565932da9@citrix.com>
References: <290dd295-bd1c-442a-874c-de4565932da9@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0177.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::20) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TY4P286MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1182fab0-09cc-4347-fe9b-08df3577786c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|260925022911599003|260925021911599003|260925021311599003|56012099006|261009223027099003|261026121527099003|261026140227099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cfgcoXGCkU6mbv8E98tbNhT9dC15a7wcmg4yv+TXKszaWfdxhYuGKBfUxR2Htq/7wS+Hy+mrSdoacgW6HgBtvtBSf20Dl/a9aImG+VpMOhhXJG0JUUpjZ1BmraHdebAyKxpnOZ7uOICzdc2fqpMkgTRBaZBrg2vD2h7UH8Yyhhn6cHrNJ1/Bqg2CePEKmq31LRRe1Qd89o9dru2LQCAhECjF3xYcv0jGgaeSdzoH4i80LevJI4e9h6UPtZozyRCGXolnIUZiTXaLd+gh482t/kfIZzX54r46BHq81MMHMZLn60q9yoPcpKZXuyVYIHxDE5ggSX65p1dKfAUEUMMQ2Ye8uZLb5Ur0paraKUvqCbDp3O9GoWvgWZwpppzye7OhmSgPrBPJKebE37ybmoeRpDgQ3RGMGfDe0+tw3yyCDw5T9GtxK9blvXPDys7QsH6KGQTgF7vQ5XKF/nyTI/icxNFGOxBixvIvS8AD29erBixZqi6kv3x0ghWEhb+ut5EQxHplEh2W8KhVmYFM2H9KiiDxi92AucLJ604WYRbRLnfv99gnKUiIfJYc5FHMDggrTBk2+Inq5iKTr3uyiL5zGjfj6IEJ9AOkHGEIwsCWefgEZxapMO5i0lw4qbVkHwo+Vi7MnbvTUEXg7HJrE9EY/tsUaPUBEPqk2rjFg2EO+9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bWDF1Qn8Ulziw83J7CAgVWhV+e+y3JAmb9fvy0AbUBxdKme63mt9CZ0KkZtc?=
 =?us-ascii?Q?wWEz93jJquDqc9wCmx2Z3GGOeY8zW6Je3XkczqVFVTTdKpb0mAuz63W98WLk?=
 =?us-ascii?Q?ifd+7OUy02CQg7Mnw7K4kKPQ3oBpm0WhKyWtYqYPRsQGcV+lFtDtlsxGsVcX?=
 =?us-ascii?Q?l1FKP6PRLlW8JJN6vQmuKSMGrpX04JMKmuQxOOpUsJZ0oyKTJnRLAXz3pkU3?=
 =?us-ascii?Q?p6H6WrU4u7QqhR3XfDVjWOUETy52M4IoURCzX8VkHaDktEvcCn09o3JhSg7h?=
 =?us-ascii?Q?ifH5/TVi9EyQLy2AitA9KH5oN/1tZBsnzWssfqICH8vtrFd3arkIbOybPw8h?=
 =?us-ascii?Q?KxCgXVd+gTUtPq6XbR7VYCFrYYl9PuSNsWSW/dNl7aC4W9YOTO04xLHeDyb9?=
 =?us-ascii?Q?D12nPCAIOcCxnaHKh8TZqyicFbcuxNRpTDNJfSzUwkGgCanq4wkbs/nPy97Y?=
 =?us-ascii?Q?6q1RIItw+qT/m6mhswJo8MeRZ4wNuDEDwwuN+16gH8jGGZW2vEm5f4SWRixJ?=
 =?us-ascii?Q?n/WfX/mvd+Q4crgMzdGOFACXh4AHe6IZIOp67n94k7wx45/m3RExb9WD7bva?=
 =?us-ascii?Q?GwrRYL+2WcorqMMOIFp56BxfbwGXnfu1aWZix5gH+tK7Dhc4wnDyvAL/NxVr?=
 =?us-ascii?Q?upNoCOpPKHSNvDP8yKLvTuRCpLbTF1Ovf5xJS/w08CptJi+cbRUpd7lvgKsP?=
 =?us-ascii?Q?QPOq6IMh3wPZ7Ldk77Nl1eAEHov5Ia0GqnKU74bVRCewRavBO3fiRw9s0DFy?=
 =?us-ascii?Q?mQ4pAZyNepDLB7aO2weMY0JWayhX6M3WEPuWoeGblywe9e1fytOVrEiZlS0z?=
 =?us-ascii?Q?41V7ZVT7m9n2rxQv/KGgKKQ/7oDq7dZsz3/MCIY4xuuwdMvzG58gP3xq+/nQ?=
 =?us-ascii?Q?Wsz4FgraR3OXOFtRGEUGgU0oz94dtrNVWZfNSHkR5P4fxvl+AV6zwMulSGvx?=
 =?us-ascii?Q?qRj4sK9fL0+xVp5v34wjEGxcdDuL3PjKRYJ9EUM5t+bvAtuxefNdi0WMdpSq?=
 =?us-ascii?Q?qcgnI1UUVcxzz7zy4goPyaodrQ4KBj8FuXwu6dHoNgzJDM15e3PwmeOVOmQd?=
 =?us-ascii?Q?+30692cd4N97IJPekk7OT2MICNsQI/KIRFwoD2gSN5sX8jzhsPpdmSQMNyAD?=
 =?us-ascii?Q?OcBfCFWegclBl5j4OA8W/k0Di0ArzNpQTvcKcUHBCmA1xWW/xNm0tP9LefIM?=
 =?us-ascii?Q?42+8AiL4wUoNgd/QJJLUZhS3IoSNpIoQte58C0KtJjaBBVNVronzC6w/Ww+w?=
 =?us-ascii?Q?dxpJ67wKQQ2GeMPc1jCtudyC6sd2jUY51aAnyXB/SRDflixvFPOB56N5L9i3?=
 =?us-ascii?Q?EMhXJA8432bo12FpB+7MHFfnp/j0A2F6LAzADYY3Kt2xcuYoIuUNesViuwj4?=
 =?us-ascii?Q?2izJdg7X1bHUInx9BMjik7PNRrgiLXWWdJ01aP+/OyzCdhW3n7SrUHcdo6EB?=
 =?us-ascii?Q?jHKIy9m6AG0rQPgDY9iMFXXFQNYDlWKKQXcb3r6jOWWarxVx80zzkyvz7xSE?=
 =?us-ascii?Q?07pIWG5IAW72cQbt35zIfmKs87Lo1WavVNkX0Pgy07YSCF5xykE3HYEGfrEm?=
 =?us-ascii?Q?wC0bTXdMoNqW04VXW29yT7Cqm56wdjCZGaGKqX4qH4UBPVGjGoqzkhByr7cp?=
 =?us-ascii?Q?ooXddJhlB3nR1TPGzc8yiLGOt7r73mOQbxSPYMXlV9BOqn7LqfxhxzaWEfW5?=
 =?us-ascii?Q?jlSDGlyHZOWRbU7l4ZyzzZHtx/fU6vqIrwRO5nGXXHNSKLIjZ3X18AVXlXRn?=
 =?us-ascii?Q?P90PoNtSgg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1182fab0-09cc-4347-fe9b-08df3577786c
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:45:34.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /T4r8YVuzCbKhQi8yEe1AIoQolVuO4+ZhZeJK8NWnf8j5BMNhf3XpbSkwz/oGTov9fY4Lx0IL8ucpt/Rhvg2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7152
X-purgate-ID: tlsNG-4011c0/1793249139-4B8D5CFC-14BA37C0/0/0
X-purgate-type: clean
X-purgate-size: 1695
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 18:22:21 +0000, Andrew Cooper wrote:
>On 28/10/2026 8:08 am, Ryo Takakura wrote:
>> On Tue, 27 Oct 2026 10:18:44 +0000, Andrew Cooper wrote:
>>>
>>>>> Separately, you have a number of MISRA violations which you're
>>>>> introducing in your series.  I see you've got cf_check, which suggests
>>>>> you have built in GitlabCI.  Have you also run Eclair?
>>>> Thank you for pointing this out.
>>>> My apologies for the violations. I wasn't aware of the tests
>>>> and haven't run either of them. I added the cf_check following
>>>> the existing code that I referred to when preparing this series.
>>>> I'll make sure to run those tests before sending next version.
>>> Do you have an account on Gitlab to run the CI testing?  If not, reach
>>> out on Matrix.
>> I don't have an account yet.
>> Ok, I'll ask on Matrix.
>
>To get you started, I put this series through:
>
>  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/3000384733
>
>There's one Eclair failure on ARM.

Thank you for running the test.
I see the report saying its violating MC3A2.R1.1.
I'll fix the issue and make sure it passes the test.

>Interestingly, it's not the failure I was expecting to see.  I was
>expecting it to complain about
>
>+    uint32_t insns[2] = {
>+        aarch64_insn_gen_nop(),
>+        aarch64_insn_gen_nop(),
>+    };
>
>because of the order those function calls being undefined.
>
>I was also expecting to see some failures due to arithmetic on pointers
>of different types, but maybe we've not made those rules enforcing yet.

I see.
I'll make sure to address them as well in the next version.

Sincerely,
Ryo Takakura

