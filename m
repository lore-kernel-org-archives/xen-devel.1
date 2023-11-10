Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D771C4332F
	for <xen-devel@archiver.kernel.org>; Fri, 10 Nov 2023 16:54:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.630679.983780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UmB-0004sZ-TY; Fri, 10 Nov 2023 16:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630679.983780; Fri, 10 Nov 2023 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UmB-0004sS-Pv; Fri, 10 Nov 2023 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 630679;
 Fri, 10 Nov 2023 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0j=GX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r1UmA-0004r9-8V
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:54:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c5b749-7fe9-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:54:32 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5F25F4EE073A;
 Fri, 10 Nov 2023 17:54:26 +0100 (CET)
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
X-Inumbo-ID: d1c5b749-7fe9-11ee-9b0e-b553b5be7939
Message-ID: <1d1baf90-d21f-49b0-91c1-219653aa99ee@bugseng.com>
Date: Fri, 10 Nov 2023 17:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add a deviation for MISRA C:2012
 Rule 8.6
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <4de6c01f8af987750e578b3d5733dcd4ca536a9b.1699615143.git.federico.serafini@bugseng.com>
 <bd82d5d8-5bff-cbfa-2014-8be866892a8e@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <bd82d5d8-5bff-cbfa-2014-8be866892a8e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/23 13:41, Jan Beulich wrote:
> On 10.11.2023 12:23, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -214,6 +214,15 @@ definition is compiled-out or optimized-out by the compiler)"
>>   -config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
>>   -doc_end
>>   
>> +-doc_begin="For functions memcpy(), memmove() and memset(), if there are
>> +multiple definitions, those belong to different archives and the behavior of
>> +linking is well defined by the toolchain: only one of the definitions will be
>> +linked in (the first that is encountered searching the archives in the order
>> +they appear on the command line)."
>> +-config=MC3R1.R8.6,declarations+={deliberate, "name(memcpy||memmove||memset)"}
>> +-doc_end
> 
> Why would this be limited to mem*()? Anything put into lib.a is going to
> be treated like that.

If one day another arch-specific definition for a function will be
introduced, a violation will appear but that is not necessarily a bad
thing because it will lead to another check of the compilation scripts
to ensure objects and archives are linked in the right order.
However, if in your opinion this will be a waste of time,
I can propose another deviation based on "xen/lib/*".


> The description also isn't quite accurate: Per-arch mem*() won't be put
> in archives, but in .o files. Those are always linked in. Anything not
> otherwise resolved may then be resolved by picking objects from
> archives (appearing later on the command line, unless specially grouped).

What do you think of the following as justification:

The search procedure for Unix linkers is well defined, see ld(1) manual:
"The linker will search an archive only once, at the location where it
is specified on the command line. If the archive defines a symbol which
was undefined in some object which appeared before the archive on the
command line, the linker will include the appropriate file(s) from the
archive."
In Xen, thanks to the order in which file names appear in the build
commands, if arch-specific definitions are present, they get always 
linked in before searching in the lib.a archive resulting from
"xen/lib".

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

