Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A92C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:48:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394780.1633432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb1r-00040V-3J; Wed, 19 Aug 2026 07:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394780.1633432; Wed, 19 Aug 2026 07:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb1q-00040O-Vv; Wed, 19 Aug 2026 07:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1394780;
 Wed, 19 Aug 2026 07:48:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwb1p-00040I-Vk
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:48:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwb1p-00HV6h-CF
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:48:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a855fb2-bab6-0a2a0a5309dd-0a2a4502a734-12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:48:05 +0200
Received: from [40.93.201.29]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a855fb3-6ca4-0a2a45020019-285dc91d9029-4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:48:04 +0200
Received: from BL1PR13CA0167.namprd13.prod.outlook.com (2603:10b6:208:2bd::22)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 19 Aug
 2026 07:47:59 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::61) by BL1PR13CA0167.outlook.office365.com
 (2603:10b6:208:2bd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:47:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:47:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:47:59 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 02:47:58 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ9nGPITrwLyhvDia8TIEVe1RQBuOaKZvaBT48EmUDCRTBpqtCS2f+cWArLoUhbaqnRSS85yT0UpKJmT7gAtDTD6k2DBsoFdh25D5OKat/waERi8G4UzTAMEWpV0mvy05oFEolcGtT1UkfQwq+k+Df8x8tUNJUAlG8dozOAffONBmZr+UsnK3VXx1SMpOxEOjK+sKoeG4EPfL/1PkxymxjBNmCD5AmV/pWiclaKX1G16XlAAyCJ726GrsA8NHZpe5CyJ2iOOuYH1kPfqBMcFHN1QFfFaZb6FTpjZR+7WLkWdebqpRtedIL+AxqufRz0DxZ3PfMu1UsIkxAT2He+cHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr/R1bH16Z1lchxKYimZiKXPqs5gtPksoeyzxN1bjNo=;
 b=ckMAyeM/Z7Ht+Z+XKuP020zNRiuk7Ek61El68CTyZ5Msw+pXuJv4J+C9AnerOGDDbH6ElDTaRBNnFmGSa3G1d9V+Bhj0T5M8weENojWhNxXpP5AX56ZJTMz4yBd3JsPbGegLlqRnGnakyDfjWp4Ni6ieuIErQ0YvEyx8DDwrj7+0u19AaTqWahpuYWpXR7BcVbjxNffaXUs7xX0JghFnbf8KZUl04yzPu74x0BWkMiE2IhowB4xJULrsquJjkxpfivGLbRVhtCWhKy3SPTk4AQCnvNLKQESeXfULyOpGY0XrEjnCWaKFMdRg7SSvxtuxP+v8gITmFe+lL7JRPuWffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr/R1bH16Z1lchxKYimZiKXPqs5gtPksoeyzxN1bjNo=;
 b=Yj/C2jZgqKOuXI9usFTfpo3GnUGY5odfMERhm+2QKmMDQSgwOzYhomuWJnZhL5nMfWOrLmIWmDSqp0TkqHR50JqznYxxqeoJZnZqu9ieJOZpPNQmgWxi7Rvb2fh+qG6rmI2n3SsRreWY3VZMUAjOQgSMRI83IHZCqhU2uGy3lu4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bb5a2a10-39ae-429f-a414-631b89d0bc89@amd.com>
Date: Wed, 19 Aug 2026 09:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
References: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a19d2e-71ec-4f0a-7889-08defdc630ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	tN6QHwM8e2q8jba0YrU0XfxNBXx6yk+m9rQut29DsHwtAi0ji6UwwgALHpO0KXlNivdFNRhm7ryCb6cQpo2zn1Bj6Ym459xD1CALyzM33e4WdzGXe/hbuPqk/y1UbhnG9CJX/GnoajQ+i+MgXHAuP+vRqur8G6gaZvRZbXJkY9hPDRqd+42TQhF26/wFRpHOb+Eo7VwGYee6dG1fYAMNh8WhoH/mssR/JEGZGT6b8xiXZl5UYuA/+uWVvYwoEsuSxZIGzt3DWwSQIjpJPQhXUNM7o4SxblssnqWCjVDOk89K1N3r+xfGmi0GJ1MMmRrzHdF504p/LJD2KlM1WZq3KTCXxZWf0BIvyuRkzpclvA4kCQ04hwSZVm3BgcGFX7E4LpG2idXD3GJMTzt1jkd0hVdMtCbZEKQhHUkht06v1SijEMggjR/zUx6zBitgAudONqfneNNnrmLhe0yhBJzsr2kqPT33sDuIPP0yTTwu7GQES7zAvijOgDpp2cQPA3NNSwlksn358q0Mq/QQ8OHTV7miEtjzqq4vUiZuOoRX7IFUo/DOxYrZ6VdY5Q6wJX1KPKEpKm7JRu2851jbTnkFCG82bMtJdG2IPyKB5icEEmSVQAxS1/5ofLTRpA1VVHct6Ol6B/sV9LEFcYSuciV2/Yv++FpreHzBiXjDtOITg4imLE6SarUFAEyfETatyFFT/hpcC6Hv+bLdP8MM2a3L0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Eq/z1jH6ugaP97fFpDEMb2ocgnWnQX6nn5OvmUg6j7FS4sIYoMgJnUW3g8X+iPAF2CHok8AhKXSfw7QyqJLYjPfnaJsp1g43kdr/VG98+clfw/3/MLLb3oH/BBnQssyKpyv/fH7GzoG/sPKpz7nFYbQJtbBmxVFpM6kI+hqeRVthvSQdu2XzJxK6RNRYAWMoTFp/h0bls9yBEfc9t2cfgTnf8nG6u4niiLKZi2w9+p8Xj4yjHACnHMxuKhuJJBigX+0zdyCZZvb67pnKtUPw6tFihstlRiz6Bon11uh75curz++xyjTjCAlxexRchmVSPwwZlVQ2FM0tl9Doc8vTFA2i7PuecMmo+FBa0rGC1AMsMXNtDxSq9bPk+hWREsbOjRxjAy/I2SSlouAxKEfGoi+Bt/Wk5qFOpZz9Oc6FyBJtI2LMSl/iAB3FwP0j59ur
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:47:59.6687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a19d2e-71ec-4f0a-7889-08defdc630ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
X-purgate-ID: tlsNG-720697/1787125685-319CB2AC-8B26068D/0/0
X-purgate-type: clean
X-purgate-size: 2285



On 18-Aug-26 14:16, Bertrand Marquis wrote:
> Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
> possible vulnerability.
> 
> ffa_handle_msg_send2() copies the message header from the guest-writable
> TX buffer before validating and using its fields. A plain structure copy
> does not prevent the compiler from re-deriving later field accesses from
> the live TX mapping.
> 
> For VM-to-VM messages, msg_offset and msg_size are validated against the
> source and destination buffers, then used to copy the payload. If a
> sibling vCPU changes the header and the compiler reloads either field,
> the checked and used values can differ. This can cause an out-of-bounds
> read from the sender's TX buffer or an out-of-bounds write into the
> receiver's RX buffer.
> 
> The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
> default. The audit ranks the likelihood of such a reload as low, but the
> C semantics do not guarantee that later accesses use the stack copy.
> 
> Add a compiler barrier immediately after copying the header so that
> validation and use consume the same snapshot.
> 
> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
> Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_msg.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 1eadc62870f2..39f561c8237f 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
>  
>      /* create a copy of the message header */
>      memcpy(&src_msg, tx_buf, sizeof(src_msg));
> +    /*
> +     * Make sure that "tx_buf" which is shared with the guest isn't accessed
> +     * again after this point.
This is a bit misleading because it *is* accessed in ffa_msg_send2_vm. The
comment should say what you wrote as the last paragraph in the commit msg.

With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


