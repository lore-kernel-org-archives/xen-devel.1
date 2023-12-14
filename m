Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197CAC4332F
	for <xen-devel@archiver.kernel.org>; Thu, 14 Dec 2023 08:49:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.654329.1021118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhOz-0004kV-Qv; Thu, 14 Dec 2023 08:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654329.1021118; Thu, 14 Dec 2023 08:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhOz-0004kO-NH; Thu, 14 Dec 2023 08:49:05 +0000
Received: by outflank-mailman (input) for mailman id 654329;
 Thu, 14 Dec 2023 08:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDhOy-0004kI-F0
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:49:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0fbc7cc-9a5d-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 09:49:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2276A4EE073A;
 Thu, 14 Dec 2023 09:49:01 +0100 (CET)
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
X-Inumbo-ID: a0fbc7cc-9a5d-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 09:49:01 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
Message-ID: <0d7901b9a9cbc7c23514ca977af3a66e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-14 08:53, Jan Beulich wrote:
> On 14.12.2023 03:05, Stefano Stabellini wrote:
>> On Wed, 13 Dec 2023, Jan Beulich wrote:
>>> On 11.12.2023 10:14, Nicola Vetrini wrote:
>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>> @@ -2,8 +2,9 @@
>>>>  #define __ARCH_ARM_NUMA_H
>>>> 
>>>>  #include <xen/mm.h>
>>> 
>>> With this, ...
>>> 
>>>> +#include <xen/types.h>
>>>> 
>>>> -typedef u8 nodeid_t;
>>>> +typedef uint8_t nodeid_t;
>>>> 
>>>>  #ifndef CONFIG_NUMA
>>>> 
>>>> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>>>>  #define node_to_cpumask(node)   (cpu_online_map)
>>>> 
>>>>  /*
>>>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, 
>>>> this
>>>> - * is required because the dummy helpers are using it.
>>>> + * TODO: define here first_valid_mfn as static when NUMA is 
>>>> supported on Arm,
>>>> + * this is required because the dummy helpers are using it.
>>>>   */
>>>> -extern mfn_t first_valid_mfn;
>>> 
>>> ... and this declaration moved to xen/mm.h, how is it going to be 
>>> possible
>>> to do as the adjusted comment says? The compiler will choke on the 
>>> static
>>> after having seen the extern.
>> 
>> Nicola was just following a review comment by Julien. NUMA has been
>> pending for a while and I wouldn't hold this patch back because of it.
>> I suggest we go with Julien's request (this version of the patch).
>> 
>> If you feel strongly about it, please suggest an alternative.
> 
> Leaving a TODO comment which cannot actually be carried out is just 
> wrong
> imo. And I consider in unfair to ask me to suggest an alternative. The
> (imo obvious) alternative is to drop this patch, if no proper change 
> can
> be proposed. There's nothing wrong with leaving a violation in place,
> when that violation is far from causing any kind of harm. The more that
> the place is already accompanied by a (suitable afaict) comment.
> 
> Jan

I have a proposal: deviate first_valid_mfn as a deliberate workaround to 
NUMA not being supported on ARM and PPC. This still supplies a 
justification and does not imply any other code change.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

