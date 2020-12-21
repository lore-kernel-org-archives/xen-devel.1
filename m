Return-Path: <SRS0=3GnW=FZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264F7C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 16:50:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B101422525
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 16:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B101422525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57447.100493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOOX-0000vY-CX; Mon, 21 Dec 2020 16:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57447.100493; Mon, 21 Dec 2020 16:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOOX-0000vR-9S; Mon, 21 Dec 2020 16:50:49 +0000
Received: by outflank-mailman (input) for mailman id 57447;
 Mon, 21 Dec 2020 16:50:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krOOW-0000vG-2D
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:50:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krOOU-0001Op-B3; Mon, 21 Dec 2020 16:50:46 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krOOT-0007iL-Ud; Mon, 21 Dec 2020 16:50:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NyT7PwbWg7SJPCgESvezw30YfxJ2Mlua6Wy9aW7UXSc=; b=DyMLC08Sdx/VVvZ5JKkWyJrU8w
	AV8kNctjJsWOYwFMAuf2yLElEGoM3RPFnjgZz2FqB/+HFCFZK2F/FuUELN/2IC7odES4ibE1iIGoZ
	rjuSzdmcNT3hSQprS38zCJbNTuFfTkB3AqsUvh1Nne1S97NhOx0qlTfktzgMNyprFxu0=;
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
 <2ffa6302-5368-61c6-8564-6d3f828e2163@xen.org>
 <26480338-56f4-6a61-e776-78727fce0910@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <93d71f68-c561-6fe0-8433-66745d153217@xen.org>
Date: Mon, 21 Dec 2020 16:50:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <26480338-56f4-6a61-e776-78727fce0910@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 15/12/2020 13:59, Jan Beulich wrote:
> On 15.12.2020 14:39, Julien Grall wrote:
>> On 15/12/2020 09:02, Jan Beulich wrote:
>>> On 15.12.2020 07:33, Juergen Gross wrote:
>>>> --- a/xen/include/asm-arm/bug.h
>>>> +++ b/xen/include/asm-arm/bug.h
>>>> @@ -15,65 +15,62 @@
>>>>    
>>>>    struct bug_frame {
>>>>        signed int loc_disp;    /* Relative address to the bug address */
>>>> -    signed int file_disp;   /* Relative address to the filename */
>>>> +    signed int ptr_disp;    /* Relative address to the filename or function */
>>>>        signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>>        uint16_t line;          /* Line number */
>>>>        uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>>    };
>>>>    
>>>>    #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>>>    #define bug_line(b) ((b)->line)
>>>>    #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>>>    
>>>> -#define BUGFRAME_warn   0
>>>> -#define BUGFRAME_bug    1
>>>> -#define BUGFRAME_assert 2
>>>> +#define BUGFRAME_run_fn 0
>>>> +#define BUGFRAME_warn   1
>>>> +#define BUGFRAME_bug    2
>>>> +#define BUGFRAME_assert 3
>>>>    
>>>> -#define BUGFRAME_NR     3
>>>> +#define BUGFRAME_NR     4
>>>>    
>>>>    /* Many versions of GCC doesn't support the asm %c parameter which would
>>>>     * be preferable to this unpleasantness. We use mergeable string
>>>>     * sections to avoid multiple copies of the string appearing in the
>>>>     * Xen image.
>>>>     */
>>>> -#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
>>>> +#define BUG_FRAME(type, line, ptr, msg) do {                                \
>>>>        BUILD_BUG_ON((line) >> 16);                                             \
>>>>        BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
>>>>        asm ("1:"BUG_INSTR"\n"                                                  \
>>>> -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
>>>> -         "2:\t.asciz " __stringify(file) "\n"                               \
>>>> -         "3:\n"                                                             \
>>>> -         ".if " #has_msg "\n"                                               \
>>>> -         "\t.asciz " #msg "\n"                                              \
>>>> -         ".endif\n"                                                         \
>>>> -         ".popsection\n"                                                    \
>>>> -         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
>>>> -         "4:\n"                                                             \
>>>> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %%progbits\n"\
>>>> +         "2:\n"                                                             \
>>>>             ".p2align 2\n"                                                     \
>>>> -         ".long (1b - 4b)\n"                                                \
>>>> -         ".long (2b - 4b)\n"                                                \
>>>> -         ".long (3b - 4b)\n"                                                \
>>>> +         ".long (1b - 2b)\n"                                                \
>>>> +         ".long (%0 - 2b)\n"                                                \
>>>> +         ".long (%1 - 2b)\n"                                                \
>>>>             ".hword " __stringify(line) ", 0\n"                                \
>>>> -         ".popsection");                                                    \
>>>> +         ".popsection" :: "i" (ptr), "i" (msg));                            \
>>>>    } while (0)
>>>
>>> The comment ahead of the construct now looks to be at best stale, if
>>> not entirely pointless. The reference to %c looks quite strange here
>>> to me anyway - I can only guess it appeared here because on x86 one
>>> has to use %c to output constants as operands for .long and alike,
>>> and this was then tried to use on Arm as well without there really
>>> being a need.
>>
>> Well, %c is one the reason why we can't have a common BUG_FRAME
>> implementation. So I would like to retain this information before
>> someone wants to consolidate the code and missed this issue.
> 
> Fair enough, albeit I guess this then could do with re-wording.

I agree.

> 
>> Regarding the mergeable string section, I agree that the comment in now
>> stale. However,  could someone confirm that "i" will still retain the
>> same behavior as using mergeable string sections?
> 
> That's depend on compiler settings / behavior.

Ok. I wanted to see the difference between before and after but it looks 
like I can't compile Xen after applying the patch:


In file included from 
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:23:0,
                  from 
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/bitmap.h:6,
                  from bitmap.c:10:
bitmap.c: In function ‘bitmap_allocate_region’:
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5: 
error: asm operand 0 probably doesn’t match constraints [-Werror]
      asm ("1:"BUG_INSTR"\n" 
       \
      ^
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5: 
note: in expansion of macro ‘BUG_FRAME’
      BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, "");           \
      ^~~~~~~~~
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: 
note: in expansion of macro ‘BUG’
  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
                                           ^~~
bitmap.c:330:2: note: in expansion of macro ‘BUG_ON’
   BUG_ON(pages > BITS_PER_LONG);
   ^~~~~~
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5: 
error: asm operand 1 probably doesn’t match constraints [-Werror]
      asm ("1:"BUG_INSTR"\n" 
       \
      ^
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5: 
note: in expansion of macro ‘BUG_FRAME’
      BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, "");           \
      ^~~~~~~~~
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: 
note: in expansion of macro ‘BUG’
  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
                                           ^~~
bitmap.c:330:2: note: in expansion of macro ‘BUG_ON’
   BUG_ON(pages > BITS_PER_LONG);
   ^~~~~~
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:44:5: 
error: impossible constraint in ‘asm’
      asm ("1:"BUG_INSTR"\n" 
       \
      ^
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/asm/bug.h:60:5: 
note: in expansion of macro ‘BUG_FRAME’
      BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, "");           \
      ^~~~~~~~~
/home/ANT.AMAZON.COM/jgrall/works/oss/xen/xen/include/xen/lib.h:25:42: 
note: in expansion of macro ‘BUG’
  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
                                           ^~~
bitmap.c:330:2: note: in expansion of macro ‘BUG_ON’
   BUG_ON(pages > BITS_PER_LONG);
   ^~~~~~
cc1: all warnings being treated as errors

I am using GCC 7.5.0 built by Linaro (cross-compiler). Native 
compilation with GCC 10.2.1 leads to the same error.

@Juergen, which compiler did you use?

-- 
Julien Grall

