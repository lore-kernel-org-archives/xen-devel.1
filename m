Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16981C4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 14:00:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D351224B8
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 14:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D351224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54255.94190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpArq-0002lm-7t; Tue, 15 Dec 2020 13:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54255.94190; Tue, 15 Dec 2020 13:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpArq-0002lf-4s; Tue, 15 Dec 2020 13:59:54 +0000
Received: by outflank-mailman (input) for mailman id 54255;
 Tue, 15 Dec 2020 13:59:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpArp-0002la-Dv
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 13:59:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8b385bf-66f2-45b6-8067-c2eda0b25ed4;
 Tue, 15 Dec 2020 13:59:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75DE2AD4D;
 Tue, 15 Dec 2020 13:59:51 +0000 (UTC)
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
X-Inumbo-ID: d8b385bf-66f2-45b6-8067-c2eda0b25ed4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608040791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is3OGq1b6d264WC4SSSaFqG1DWJIMc+mXDDv+1Rw8R4=;
	b=IpluHQLsutV1UwLyQRGMkwdSNOZ6ekeKWXucfmz3zwOCNU2BIH6GNCOiJbKPC3SN0QDIhy
	JfRTAXIaiQnWl86GAjuXnqdMPAo1tNkl4/FB6L9W8MbfR+WTVZizvpLDpfKbxy9/3KDx15
	mMJggKL3oHY+wdblN+3PPEAwfFuhKic=
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26480338-56f4-6a61-e776-78727fce0910@suse.com>
Date: Tue, 15 Dec 2020 14:59:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2ffa6302-5368-61c6-8564-6d3f828e2163@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.12.2020 14:39, Julien Grall wrote:
> On 15/12/2020 09:02, Jan Beulich wrote:
>> On 15.12.2020 07:33, Juergen Gross wrote:
>>> --- a/xen/include/asm-arm/bug.h
>>> +++ b/xen/include/asm-arm/bug.h
>>> @@ -15,65 +15,62 @@
>>>   
>>>   struct bug_frame {
>>>       signed int loc_disp;    /* Relative address to the bug address */
>>> -    signed int file_disp;   /* Relative address to the filename */
>>> +    signed int ptr_disp;    /* Relative address to the filename or function */
>>>       signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>       uint16_t line;          /* Line number */
>>>       uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>   };
>>>   
>>>   #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>>   #define bug_line(b) ((b)->line)
>>>   #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>>   
>>> -#define BUGFRAME_warn   0
>>> -#define BUGFRAME_bug    1
>>> -#define BUGFRAME_assert 2
>>> +#define BUGFRAME_run_fn 0
>>> +#define BUGFRAME_warn   1
>>> +#define BUGFRAME_bug    2
>>> +#define BUGFRAME_assert 3
>>>   
>>> -#define BUGFRAME_NR     3
>>> +#define BUGFRAME_NR     4
>>>   
>>>   /* Many versions of GCC doesn't support the asm %c parameter which would
>>>    * be preferable to this unpleasantness. We use mergeable string
>>>    * sections to avoid multiple copies of the string appearing in the
>>>    * Xen image.
>>>    */
>>> -#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
>>> +#define BUG_FRAME(type, line, ptr, msg) do {                                \
>>>       BUILD_BUG_ON((line) >> 16);                                             \
>>>       BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
>>>       asm ("1:"BUG_INSTR"\n"                                                  \
>>> -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
>>> -         "2:\t.asciz " __stringify(file) "\n"                               \
>>> -         "3:\n"                                                             \
>>> -         ".if " #has_msg "\n"                                               \
>>> -         "\t.asciz " #msg "\n"                                              \
>>> -         ".endif\n"                                                         \
>>> -         ".popsection\n"                                                    \
>>> -         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
>>> -         "4:\n"                                                             \
>>> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %%progbits\n"\
>>> +         "2:\n"                                                             \
>>>            ".p2align 2\n"                                                     \
>>> -         ".long (1b - 4b)\n"                                                \
>>> -         ".long (2b - 4b)\n"                                                \
>>> -         ".long (3b - 4b)\n"                                                \
>>> +         ".long (1b - 2b)\n"                                                \
>>> +         ".long (%0 - 2b)\n"                                                \
>>> +         ".long (%1 - 2b)\n"                                                \
>>>            ".hword " __stringify(line) ", 0\n"                                \
>>> -         ".popsection");                                                    \
>>> +         ".popsection" :: "i" (ptr), "i" (msg));                            \
>>>   } while (0)
>>
>> The comment ahead of the construct now looks to be at best stale, if
>> not entirely pointless. The reference to %c looks quite strange here
>> to me anyway - I can only guess it appeared here because on x86 one
>> has to use %c to output constants as operands for .long and alike,
>> and this was then tried to use on Arm as well without there really
>> being a need.
> 
> Well, %c is one the reason why we can't have a common BUG_FRAME 
> implementation. So I would like to retain this information before 
> someone wants to consolidate the code and missed this issue.

Fair enough, albeit I guess this then could do with re-wording.

> Regarding the mergeable string section, I agree that the comment in now 
> stale. However,  could someone confirm that "i" will still retain the 
> same behavior as using mergeable string sections?

That's depend on compiler settings / behavior.

Jan

