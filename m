Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BD606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=I2NwlvB8
Received: from list by lists.xenproject.org with outflank-mailman.1460845.1671707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLFAs-0003Dr-RM; Mon, 26 Oct 2026 07:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460845.1671707; Mon, 26 Oct 2026 07:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLFAs-0003Dk-N6; Mon, 26 Oct 2026 07:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1460845;
 Mon, 26 Oct 2026 07:31:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xLFAr-0003Db-8n
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:31:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLFAp-00C9Yk-7t
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:31:15 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adf01ba-2eae-0a2a0a5409dd-0a2a4507dd16-26
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:31:14 +0100
Received: from [52.101.229.86]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adf01b6-b4ea-0a2a45070019-3465e5564c31-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:31:05 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TY7P286MB7251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:363::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:31:00 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:31:00 +0000
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
 b=UM0EvOJZZk0cWyC9VQDYYZDx2nrTmaCw7p/gOaKveUN7kPQcYIOupbsAMTJmbHrcWGQ8Pe8mNKV8bzcAzRyZyD4orgdRl0j0UaTYZiExDUCsEU3t4rH2SQh/2ERqBq53mUpZa+tOt/UGjnWi59/3NN6DEDyWzg80DjXjC2Tgpslf5+eOuYaiaau96YSFS5/E3jWvmEoyEegbwgf1ueY4cwpm9Vabxiy2h6p18lNqE8s3C+kQetHkwmCju8STc1+U4HWQhwT95rHVuMVxga1EMcwXRMKMXsY/1c58tT/Tn+hQdKOEZ98oLpfkowuSv/LTHHfJ4OF1rZcnvZ+94OfjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0fqivY6ZI1eL/B17AbOGNjXYhEJdhi/nBwLdhFJg9M=;
 b=vRcjbhpveX2ibalUjnYjhqa3l5+vBeY4cEOjBmMClNtWcWPD0PPmZ6b/623qvB9IxW2Dlilvi2xegsARJLY2ZIKqENtVkIAAe3zRo5d+hb6zgevuLCKWkFJJ1q3DyGRbJnyjSP9YoKu0ETjShBo8fCNekrJF4nkGkQVnuRWsjcSPkHx7A5xw43wR3nxai3+afVP7aYII+ce4mB7zerqBCpXBosEfXU0q8f4LC3+14VBIPXGp1zH5v4x9+XVE1YM6nEVYxdX5/4soE4NsRv6dtxDUefPj1KGXkx8mNXAMtNhkWa9iWvSnr/XTUNaLf/30h0OyBxw6S9prJJ++DyvV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0fqivY6ZI1eL/B17AbOGNjXYhEJdhi/nBwLdhFJg9M=;
 b=I2NwlvB8VcRJAVazRER0Zzve6Im4neCGQ2EsUCyp6xnjLNAsNCIUhdRTq+Dg3V9kX/W8y2AoilBI/AplU9NMx9GHHm34pYtMuB2UIbA41Mtnb1iOdWIiFv7fnjb2AYk3Khk5h8GV4eRGSkGyphx+iJrOjRRDQLpJEBXoghqc32U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: bernhard.kaindl@citrix.com
Cc: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com
Subject: Re: [RFC 1/5] xen/arm64: livepatch: enable attaching callbacks
Date: Mon, 26 Oct 2026 16:30:22 +0900
Message-Id: <20261026073022.110170-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179284608595.1706038.12585790247811677658.b4-review@b4>
References: <179284608595.1706038.12585790247811677658.b4-review@b4>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::11) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TY7P286MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 815b5655-5853-4487-d7b1-08df3333157c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|6133799003|22082099003|3023799007|56012099006|5023799004|261021123027099003|10067099003|261009223027099003|261022105027099003|261021133027099003|261021135927099003|261021130227099003|261022113327099003|261021121427099003|261022075727099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	X6LDRQryRinXZrPjfpsHHudEqkIToMc3JWiQnAMqqyH8P6ueptfx+5807CISfbrNAZyZXESG3WoDJTpwcbOVlyLYXyPVJM5iWCpcXkFgvzc6MCDHHjVzeTcHYFs3J7OXMcjVbPTPDCyyX+r6Gb9QKyHQ1NkgCNrnz0egZjDg8Wlkgb64AESm2SktyJ/k7AmN9XAcPSFTv5F4pCe1gOaNqDonKmIM6XRrsaFFNuGix/UUs+LurYMY+hO/OuhbrbfSQBbZS42xCU7i8mLvfQfmzCuS6tVfzg9UZSkRMCqSGuV+hZFUm8kuFsyHp0gL7q5ZPxzAsuyGtHJZS3Zy1b7GQxmHrUAs2jWG4UzM0vC18eJF1e7aHA4B1XCsEfQ9vh9GK9El9b2+lcO1YgXVTgbzxLaGgs+Thabt6Tsg8dtotXyEHzWzgeLLrZl/nkexqNdBUgauzc9JcfPLolix7B0Z0KWWXx6c/q9ymTyGWULIUPZfeqb/8VESVW/W21CamEz4wF3yRtHGafjVQWCm1OcrNoLFELAOBsjE1vf1JkIYlZnKN5WO3Pe83yHZZ1jp5NQyOCMfrmOaGpmuGHvSJEK0DWt6Si6qd6l9AaOoKj0kTQ457QJy3q4W9RF2K/VFRzZ8Up2Ofx0gIfTagOTpU91tITDEyaYRVi4gZrH8x9rNPXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(6133799003)(22082099003)(3023799007)(56012099006)(5023799004)(261021123027099003)(10067099003)(261009223027099003)(261022105027099003)(261021133027099003)(261021135927099003)(261021130227099003)(261022113327099003)(261021121427099003)(261022075727099003)(261022115727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?64KnRX2lfNrqRDqQE6VeoY5SiupiJOTdSCnitcj6lpPD2komZ+HW3ouBKz0N?=
 =?us-ascii?Q?l0LRaKT23Thxzuw4jys4kUqbfpqdOm/sbECj2OcclnfLi4siB+7jNvDQUfKO?=
 =?us-ascii?Q?RWv2n1qvC26oa2u4FoE+b5bapRd7FEGS5eC2Ml0f5eCxJakiCmJDob85bpTb?=
 =?us-ascii?Q?+tmDuwdidLpoiP1Qkwo/MNFiNTqb5ezW3t7mjGa63PX5ptc6msPMv+hmheV+?=
 =?us-ascii?Q?zRWgQmH5CHUwAxTpRHpt6H3s8SIHybHT0VokTiWdmcRCBFptNw55ZgcBjA81?=
 =?us-ascii?Q?S0bdYYQIejjF5ho/3Emc+NSrvoMHETtTqk8TffA1NdKyHDc8hRebu/ulIOio?=
 =?us-ascii?Q?hIMdzh3tMPx+h1dLcsMW2g7lq755EotL50g4us0yMl8kxGMZfnLHhqff4HxM?=
 =?us-ascii?Q?tMZBk+Z9VFiFQvtgpW4hGad3gAn8rX5hYDXcNxddOET03b00iSnulE1YDHCy?=
 =?us-ascii?Q?HhuiLW2jGZ7knkdUlQG94tWc7TWVaXedBFq9istIaAxeP1Gy4cPhRqrr/oGL?=
 =?us-ascii?Q?b3u1oql5jYcoQLYzp2/Z5K5yCRQUiZCto2udUQPrWCbrZiTrTn5rZ1m28Anl?=
 =?us-ascii?Q?RqnN3IQSYJAgvB4aEB4TvKHNtLQaxU+cDR3EbkYgaCuH0gTgWpadffhnHO55?=
 =?us-ascii?Q?iVGMocfcUVr/O4lwqV44Vq0IxJAT/Ple09QaGc2kfS3t7zSAUTnDVY8ADeMd?=
 =?us-ascii?Q?nsAspHds87SS4m4j+uHISCMXcQkjJyAFX97qVkhPlYVqG+RwYq9wbtCjUpiW?=
 =?us-ascii?Q?qzsziQ4sOIrqO7U09BhxwsWgujzdOVF2USbJ8jsBJGvwWDv1Mxjj+oqC4RdT?=
 =?us-ascii?Q?zbDeQ8pfgU9Z/N0QZvkWoyUtufgJECJlJlJYwNfnzL2z3vmWFqFxoeN6pRlt?=
 =?us-ascii?Q?f7ea2gigHZTIzVi0mtGCP0fJnFPGnowpVpRdR7Zk1djZ4k+PdRq2giR7T2HU?=
 =?us-ascii?Q?y/IzTEz0vnfQXLB31n/obS6Ks0pHzSXVFe29EzfZw/Tqr+IP+uuiupO5emGG?=
 =?us-ascii?Q?AGJQ427bVSlAfDuVipVFsn0Q7mTvBz7LNrJA9naFMbv4gonPPHY6JYh/mU/h?=
 =?us-ascii?Q?pyhTYhQ6DmGSPz+0+CQVs3RmnAtsU8EVMh9VAilGqEvG8bCWOHVQ48qdXjfo?=
 =?us-ascii?Q?1VeYxDyVi2P1EY1QRsV4SLycP5L+/raduDOVOY7pLMdj9YENqJVEo0YgC4UE?=
 =?us-ascii?Q?2GCYmiuBXK0QQiLSwjbjShptupzHA2Q+AcqcU4g09Y9LpdjtRgG+l/rRCf8E?=
 =?us-ascii?Q?YUqE7rxjZj7f9jnyQAdB1eKTNCwIirXdynDW7nM5+mXi/HnP+A8f+ezG5ncj?=
 =?us-ascii?Q?IZWrRVJHk+/kDKWF7m2q5JsjeyI4LHv/FkOw6eCW0N1XWlHmwJFy5pRRKYEE?=
 =?us-ascii?Q?Ap+ZqlA5sjT6ssDjVjAsbSGWVwfdpcvnjBpXgS7ThvT7ckA0mvWVZKaDmrKP?=
 =?us-ascii?Q?ADU3pUxwHIJoZGJak8XbgZWmvtv8Uw+MjgjryCAbAhLVxL7OezajgdAGE5lE?=
 =?us-ascii?Q?opg9eRjiaCdzHCMvxS8jJjUqXzau0U/r36tBadlGEX1yfio7afN4J0ACpKQQ?=
 =?us-ascii?Q?mY7MAvdiLhJxt7likPrpXjcqfIy9Q+ig7Y0SrQulT1pfxuMNEz2vLWwP2uDC?=
 =?us-ascii?Q?cpCxAgQKAw/crziZM72h4BqYRN60/J8VQM/Hp8+WiUVybcSGFt4nOSpq1YD+?=
 =?us-ascii?Q?3mL2P5oz2+vi5zcTi/g8vGMOAuARBLLOM1yQas4BiZLaR5NZUgiCwAEOm6wG?=
 =?us-ascii?Q?e7qDSXi7ag=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 815b5655-5853-4487-d7b1-08df3333157c
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:31:00.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLe7+bgSH64Ed6EUnmEhrAFF4tJtngztJqAUY3gcVzryu5iJSj1Dx+ihHnJOC8tN9inlBIesTbtRbRjlPrWHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB7251
X-purgate-ID: tlsNG-ef75cf/1792999870-A66DAAE4-197AA972/0/0
X-purgate-type: clean
X-purgate-size: 5037
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernhard!

Thank you for your feedback. I'm still going through your comments on
the other patches. I'll reply as I work through them.

On Sat, 24 Oct 2026 14:48:05 +0200 Bernhard Kaindl wrote:
>--- a/xen/arch/arm/arm64/livepatch.c
>+++ b/xen/arch/arm/arm64/livepatch.c
>@@ -492,6 +496,36 @@
>> +#ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
>> +void arch_livepatch_apply_trace(const struct livepatch_func *trace)
>> +{
>> +    uint32_t *new_ptr;
>> +    uint32_t insns[2];
>> +
>> +    new_ptr = trace->old_addr - (void *)_start + vmap_of_xen_text;
>> [...]
>> +    memcpy(new_ptr, insns, sizeof(insns));
>
>This copies eight bytes from the two-element instruction array, while
>uploaded trace descriptors still use the ordinary Arm livepatch verifier?
>
>For reference, the existing arch_livepatch_verify_func() in
>xen/arch/arm/livepatch.c contains this size check (not added by this patch):
>
>>     if ( func->old_size < ARCH_PATCH_INSN_SIZE )
>>         return -EINVAL;
>>
>>     return 0;

Thank you for pointing this out.
Yes, the check is insufficient.

>With ARCH_PATCH_INSN_SIZE equal to four bytes, doesn't this accept a
>four-byte function without establishing that two reserved tracing NOPs
>are present? Is there another check on this path that I have overlooked?

No, I didn't add any other check.

>Could an assembly entry or another uninstrumented function consequently
>have executable instructions overwritten? If reverting then installs
>two NOPs, could that lose the original instructions rather than restore
>them?

Yes, I think both could happen.

>Would it make sense to validate the complete reserved tracing entry,
>including the actual branch destination and any conflicting livepatch,
>before allowing the write? Could the expected entry also be checked at
>application time, so that a modification after upload is not missed?

Thanks you for the suggestion.

How about adding a helper on the upload/apply/revert paths
that checks if the function's entry is in the expected state?

---- BEGIN IDEA ----
/*
 * Make sure the patch site is in the expected state.
 *
 * patched = false: expect NOP + NOP.
 * patched = true:  expect MOV + BL.
 */
static int arch_livepatch_verify_entry(unsigned long addr,
                                            bool patched)
{
    const uint32_t *entry = (const uint32_t *)addr;
    uint32_t expected[2];
    uint32_t branch;

    /*
     * Assembly functions and C functions excluded from instrumentation
     * lack reserved NOPs.
     */
    if ( !is_patchable_function_entry(addr) )
        return -EINVAL;

    /*
     * Generate the expected BL instruction with its destination
     * set to the trampoline.
     */
    branch = aarch64_insn_gen_branch_imm(addr + ARCH_PATCH_INSN_SIZE,
                                         (unsigned long)xen_livepatch_trace_caller,
                                         AARCH64_INSN_BRANCH_LINK);

    /* Make sure the destination is within the branch range */
    if ( branch == AARCH64_BREAK_FAULT )
        return -EINVAL;

    if ( patched )
    {
        /*
         * Before reverting, make sure the site is as we patched:
         *  mov x9, lr
         *  bl  xen_livepatch_trace_caller
         */
        expected[0] = aarch64_insn_gen_move_reg(9, 30);
        expected[1] = branch;
    }
    else
    {
        /*
         * Before applying, make sure the site is as we reserved:
         *  nop
         *  nop
         */
        expected[0] = aarch64_insn_gen_nop();
        expected[1] = aarch64_insn_gen_nop();
    }

    /* Reject the (un)patching if the site is not as we expected */
    if ( entry[0] != expected[0] || entry[1] != expected[1] )
        return -EINVAL;

    return 0;
}
---- END IDEA ----

Note that is_patchable_function_entry() was introduced in patch 3/5
for checking whether the function at the given address is traceable.
I'll move the function to this patch.

>Separately, could a callback or one of its helpers call the traced
>function again before the first callback returns?
>
>> +  ASSERT(f->new_addr);
>> +  ((livepatch_trace_func_t)f->new_addr)((unsigned long)f->old_addr, 
>> parent_ip);
>
>What would contain a recursion before Xen runs out of stack? Would a
>guard covering the pre-callback dispatcher work as well as the callback
>itself help, or is there an existing restriction on callback targets
>that would rule this out?

There is no restriction preventing the recursion right now.

>I think marking the dispatcher itself non-patchable does not protect
>its callees or the callback's callees, so they should be protected too?

I see that marking the dispatcher alone is insufficient.
I'll add a guard that covers the dispatcher and callback following your suggestion.

>Thanks for taking a look, and apologies if I have missed an existing
>safeguard.

Thank you for pointing this out as well.

Sincerely,
Ryo Takakura

