Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504CC5AC82
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 11:50:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387433.1628699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtOWP-0005mS-8L; Mon, 10 Aug 2026 11:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387433.1628699; Mon, 10 Aug 2026 11:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtOWP-0005mL-4w; Mon, 10 Aug 2026 11:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1387433;
 Mon, 10 Aug 2026 11:50:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtOWN-0005mF-3y
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 11:50:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtOWM-00Azn7-3N
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:50:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79baea-2eae-0a2a0a5409dd-0a2a4507bcd6-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 13:50:22 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79bafd-b4ea-0a2a45070019-d155da2cd88f-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 13:50:22 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c197e7e4e94so283959966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 04:50:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a1e7d48ce7sm4332394a12.16.2026.08.10.04.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 04:50:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786362621; x=1786967421; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4mNRdlCUxidZFH38/qGNOT5l90EeTySOEWFVi0lnRs=;
        b=fog+lRMEWPtM2qAq/ABYxRkIgCV9Zy5H43B7xo3OVWp1FfRORmSgqzahdov4+zrM+w
         rUkRWvDX3pWhAaTYzMikoxCP9t+K0LV5213vzPMbK93mi8/keVhAgH7LvEnYsIlZnd5A
         JLxWGlYP/3gYU4x9eDBdtKQfFvP7bDzx8NE9OI0VTABWTUkCWbz8YFhcGmwnLY/zJDRk
         iaKg6/IqWapiEgZUqRSrVkmZqKvJ63JKqGx4JbKN1YWuX/lGNN8qeavbwYeThNoktmLj
         yzZAOFACZDB7nr57kyyU82a1krUWA5J7zZUa8+MnTnDhh7XbcpvQpdpvg2JMHnct79Md
         y2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362621; x=1786967421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4mNRdlCUxidZFH38/qGNOT5l90EeTySOEWFVi0lnRs=;
        b=dy5OOmn9zxEyoDURr12b96UkHpFavg5lsRK9K3Pk2TuVcW9IIRei3wGCzJjEHFGb4p
         JAvyNfrsfv9CvC0MmZaKz7DdE0tigvptwqsUgUWv9sQoT27S9dEW8akiiL8HJIIrQ3yN
         9offDw5PEIO/kplN5OrJp/S2xYoVVB+nohJOYtPuFvARl/e1P0m2I5rb5TSDWPRPzN05
         tLzbVog+NLf3873gRDYDp8jpB3s/MSefZeyWgsq4gbszVbhDOJeqDLzkK5XIJ2t5oOUw
         jeo3xOoZqd5Ty229XCi2+9de8n5O2b4M3R46/8fplfDl33QC8hESc2LtqJLUZs0jfHaL
         3+Pg==
X-Gm-Message-State: AOJu0YxsY3MjWBIgdbsgyWtlC2RFnwGw4wt1D86wZJtao5864M61K3h2
	8VPXwzB7EUHG9ixzEVDM+pXOd30P+ykDGoLFeBkuo1KVT5uMVC8gJiJD
X-Gm-Gg: AR+sD13sSoYaDHXWgdiQko7kG1Clnh8Y/5scr8QDbWl+KTFulDGMykbGo9q9JXuLlXB
	wK053kPnF/mFJHtYKkHeEoxBRYLXuFknvlnyB6MyN0D08JcQ7colUcGsnZxQGy9zrf3F9BU2IuU
	9waQ3+u/l1ClH8pmJHOCGlN7tkbtCq7v3NgsDcE9TEnGTiye/FrgbwE/bh7JDkF4D2NF3Z9J0NT
	DrHrVSqwiWj2PzOv892lUX70b7A1xb+H7TLHhaL9SQYbZFwB4p4tjhVwj4XvN6vrirT1OSqq33U
	SVvffumzebp5RhsCAqRP3n8zh/CbpTaktESMDTdCvuXhMgQTwtPzhOUEd80ffE6Ov0wuwDI16wb
	TRjfEVFLf8Hyhke4QaUwa3zFKrDhfkh1zntlw0Sf6jaJJjGqB+RBs84vdUxo83oSH7zErIykArH
	gXqie6fHpTy3cy4w18PJi/Wa4/bWO+Ol4KIo8AHCiMwy+yaRYyokuxCwBmf1qr02GxqUxapGqHV
	8yUA9KPyUMpbfr67ZVCucVJMrE+OaFeUV8iZYLXHzo=
X-Received: by 2002:a17:906:4786:b0:c20:af9d:454a with SMTP id a640c23a62f3a-c20af9d54a7mr449512766b.16.1786362621434;
        Mon, 10 Aug 2026 04:50:21 -0700 (PDT)
Message-ID: <1282e93e-df55-4d22-9327-8454ef181588@gmail.com>
Date: Mon, 10 Aug 2026 13:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/common: add keyhandler to show Xen command
 line
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260803070047.3097846-1-dmukhin@ford.com>
 <20260803070047.3097846-3-dmukhin@ford.com>
 <df43b4f0-9973-b80e-47a9-f0cfa65651aa@kernel.org> <anaWpO/zu5sI4A9u@kraken>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <anaWpO/zu5sI4A9u@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786362622-A4CCFAE4-6DBD73C8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2351



On 8/8/26 4:38 AM, dmukhin@ford.com wrote:
> On Fri, Aug 07, 2026 at 05:44:41PM -0700, Stefano Stabellini wrote:
>> On Mon, 3 Aug 2026, dmukhin@ford.com wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Currently there's no way to print Xen command line on the emergency
>>> console for debugging purposes (e.g. 'xl' is not available in dom0).
>>>
>>> Add new keyhander 'X' to do command line printout.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> v1: https://lore.kernel.org/xen-devel/20260730061459.2702672-2-dmukhin@ford.com/
>>>
>>> Changes since v1:
>>> - moved implementation into kernel.c
>>> ---
>>>   xen/common/kernel.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>>> index d1bef9ac2b2b..9f334c92e3ab 100644
>>> --- a/xen/common/kernel.c
>>> +++ b/xen/common/kernel.c
>>> @@ -5,6 +5,7 @@
>>>    */
>>>   
>>>   #include <xen/init.h>
>>> +#include <xen/keyhandler.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/errno.h>
>>>   #include <xen/param.h>
>>> @@ -505,6 +506,21 @@ static int __init cf_check param_init(void)
>>>   __initcall(param_init);
>>>   #endif
>>>   
>>> +static void cf_check show_hypervisor_info(unsigned char key)
>>> +{
>>> +    printk("'%c' pressed -> showing hypervisor information\n", key);
>>> +    printk("Command line: %s\n", saved_cmdline);
>>
>> if CONFIG_CMDLINE_OVERRIDE is defined, saved_cmdline is empty. We could
>> at least do this:
>>
>> #ifdef CONFIG_CMDLINE_OVERRIDE
>>      printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
>> #else
>>      printk("Command line: %s\n", saved_cmdline);
>> #endif
> 
> Actually, CONFIG_CMDLINE can set the built-in command line which can be
> non-empty.
> 
> Perhaps, something like this:
> 
>      printk("Command line (built-in): %s\n", opt_builtin_cmdline);
> #ifndef CONFIG_CMDLINE_OVERRIDE
>      printk("Command line: %s\n", saved_cmdline);
> #endif
> 
> What do you think?

Considering that opt_builtin_cmdline is declared as __initconst won't it 
be an issue to print it in non-init function (show_hypervisor_info())? 
In other words, I expected that __init section should be freed at some 
point and I expect that it should be data abort here.

~ Oleksii

