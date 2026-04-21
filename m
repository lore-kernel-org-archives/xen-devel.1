Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436C5F327C9
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 08:44:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1288638.1568888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6hq-000820-VD; Tue, 21 Apr 2026 08:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288638.1568888; Tue, 21 Apr 2026 08:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6hq-00081t-SV; Tue, 21 Apr 2026 08:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1288638;
 Tue, 21 Apr 2026 08:43:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wF6hp-00081n-Sl
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:43:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6hp-00CeXM-1C;
 Tue, 21 Apr 2026 08:43:41 +0000
Received: from [2a02:8012:3a1:0:3d55:1646:9f87:e5f0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wF6hp-00DzCt-0F;
 Tue, 21 Apr 2026 08:43:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/sWBWZ+VL4Uk1olJf5ck2+T6iicOdc+sknJgATHn+ck=; b=zMN4ueF9nud6cSWqkk02h7R2Vr
	ZEwUcW0MMA2V3HzPAWuWQkmQPuGWUZTAMkky24H7ST0iSjKwNpzDF9uhsuazyJ3MSAA9mYaWnnoqN
	OsaPboK5kL7I33ulLkpjiN+1aWinGQd5tAcoQpYhAb8FzIxND9+grC1CrHJ86RynyU9c=;
Message-ID: <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
Date: Tue, 21 Apr 2026 09:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Milan,

On 19/04/2026 18:34, Milan Djokic wrote:
> Hi Julien,
> 
> On 4/14/26 04:17, Julien Grall wrote:
>> Hi Milan,
>>
>> On 24/03/2026 07:51, Milan Djokic wrote:
>>> From: Rahul Singh <rahul.singh@arm.com>
>>>
>>> Xen SMMUv3 driver only supports stage-2 translation. Add support for
>>> Stage-1 translation that is required to support nested stage
>>> translation.
>>>
>>> In true nested mode, both s1_cfg and s2_cfg will coexist.
>>> Let's remove the union. When nested stage translation is setup, both
>>> s1_cfg and s2_cfg are valid.
>>>
>>> We introduce a new smmu_domain abort field that will be set
>>> upon guest stage-1 configuration passing. If no guest stage-1
>>> config has been attached, it is ignored when writing the STE.
>>>
>>> arm_smmu_write_strtab_ent() is modified to write both stage
>>> fields in the STE and deal with the abort field.
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>> ---
>>>    xen/drivers/passthrough/arm/smmu-v3.c | 93 ++++++++++++++++++++++ 
>>> +----
>>>    xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>>>    2 files changed, 91 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/ 
>>> passthrough/arm/smmu-v3.c
>>> index 73cc4ef08f..f9c6837919 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct 
>>> arm_smmu_master *master, u32 sid,
>>>         * 3. Update Config, sync
>>>         */
>>>        u64 val = le64_to_cpu(dst[0]);
>>> -    bool ste_live = false;
>>> +    bool s1_live = false, s2_live = false, ste_live = false;
>>> +    bool abort, translate = false;
>>>        struct arm_smmu_device *smmu = NULL;
>>> +    struct arm_smmu_s1_cfg *s1_cfg = NULL;
>>>        struct arm_smmu_s2_cfg *s2_cfg = NULL;
>>>        struct arm_smmu_domain *smmu_domain = NULL;
>>>        struct arm_smmu_cmdq_ent prefetch_cmd = {
>>> @@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct 
>>> arm_smmu_master *master, u32 sid,
>>>            smmu = master->smmu;
>>>        }
>>> -    if (smmu_domain)
>>> -        s2_cfg = &smmu_domain->s2_cfg;
>>> +    if (smmu_domain) {
>>> +        switch (smmu_domain->stage) {
>>> +        case ARM_SMMU_DOMAIN_NESTED:
>>> +            s1_cfg = &smmu_domain->s1_cfg;
>>> +            fallthrough;
>>> +        case ARM_SMMU_DOMAIN_S2:
>>> +            s2_cfg = &smmu_domain->s2_cfg;
>>> +            break;
>>> +        default:
>>> +            break;
>>> +        }
>>> +        translate = !!s1_cfg || !!s2_cfg;
>>
>> NIT: translate is a bool. So do you actually need the !!?
>>
> 
> No, !! is not necessary here, will fix this.
> 
>>> +    }
>>>        if (val & STRTAB_STE_0_V) {
>>>            switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>>>            case STRTAB_STE_0_CFG_BYPASS:
>>>                break;
>>> +        case STRTAB_STE_0_CFG_S1_TRANS:
>>> +            s1_live = true;
>>> +            break;
>>>            case STRTAB_STE_0_CFG_S2_TRANS:
>>> -            ste_live = true;
>>> +            s2_live = true;
>>> +            break;
>>> +        case STRTAB_STE_0_CFG_NESTED:
>>> +            s1_live = true;
>>> +            s2_live = true;
>>>                break;
>>>            case STRTAB_STE_0_CFG_ABORT:
>>> -            BUG_ON(!disable_bypass);
>>
>> I am not sure I understand why this was removed. Can you clarify?
>>
> 
> Yes. With the stage-1 support, abort is controlled per guest smmu 
> configuration, so abort state is valid and not controlled by the global
> disable_bypass, but with per-config smmu_domain->abort field instead.

Are we ok to allow the guest to control the bit? For instance, what does 
it mean if the guest decide to that no abort is necessary but the region 
is not mapped in stage-2?

[...]

> 
> The original idea was to also allow stage-1-only support. But I'm not 
> sure if stage-1-only usecase is useful or even valid for Xen.. I will 
> update the patch series with the missing parts for stage-1-only support, 
> pointed out by Luca, but the question remains if this is needed at all. 
> If not, I can revert to original state where stage-2 was always required.

By "stage-1 only" support, do you mean Xen would use the stage-1 in 
replacement of the stage-2? Or do you mean the guest will use the 
stage-1 page-table and there will be no isolation from Xen?

If the former, then I believe the page tables don't have the exact same 
format. Today, the page-tables are shared between the CPU and IOMMU, so 
this would need to be duplicated. For now, I am not sure this is worth 
to do.

If the latter, this would require the guest to be directly mapped (i.e. 
IPA == PA) but it would also open a big hole. So I would want to 
understand the exact use case first.

Cheers,

-- 
Julien Grall


