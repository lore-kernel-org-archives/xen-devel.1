Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA88CDB47E
	for <xen-devel@archiver.kernel.org>; Wed, 18 Oct 2023 15:24:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.618681.962651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8P3-00048l-Ea; Wed, 18 Oct 2023 15:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618681.962651; Wed, 18 Oct 2023 15:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8P3-00048e-Bd; Wed, 18 Oct 2023 15:24:09 +0000
Received: by outflank-mailman (input) for mailman id 618681;
 Wed, 18 Oct 2023 15:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVsY=GA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qt8P2-000474-3y
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:24:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a53383-6dca-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 17:24:07 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 716CE4EE0739;
 Wed, 18 Oct 2023 17:24:06 +0200 (CEST)
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
X-Inumbo-ID: 60a53383-6dca-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 18 Oct 2023 17:24:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/7] x86: add deviations for variables only used in
 asm code
In-Reply-To: <4b96ba28-f2c9-68b5-7c7f-f4ca946022a4@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
 <afbb7307-50e0-047a-807a-1bcf0139f5d3@suse.com>
 <b652c60c8b5179e31b9032c5e65e9498@bugseng.com>
 <4b96ba28-f2c9-68b5-7c7f-f4ca946022a4@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <8fd7b43f886d4728a4220ef35abd3423@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2023 16:56, Jan Beulich wrote:
> On 18.10.2023 16:28, Nicola Vetrini wrote:
>> On 16/10/2023 16:58, Jan Beulich wrote:
>>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>>> These variables are only used by asm code, and therefore
>>>> the lack of a declaration is justified by the corresponding
>>>> deviation comment.
>>> 
>>> Hmm, you say "declaration" here, but according to my understanding 
>>> ...
>>> 
>>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>>   * gets set up by the containing function.
>>>>   */
>>>>  #ifdef CONFIG_FRAME_POINTER
>>>> +/* SAF-1-safe */
>>>>  register unsigned long current_stack_pointer asm("rsp");
>>> 
>>> ... this is a declaration, not a definition.
>>> 
>> 
>> It has automatic storage duration and it's not defined afterwards
> 
> Mind me asking what makes you derive "automatic storage duration"?
> I also don't see how "not defined afterwards" matters here. This is
> a special construct, not covered by the C standard.
> 
> Jan

Oh, you're right. I was fooled by the fact that this is not a standard 
construct.
I see your point now.

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

