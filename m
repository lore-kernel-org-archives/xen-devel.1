Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F85CA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 10:58:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444239.1661182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8Iv-0004wl-BX; Fri, 09 Oct 2026 10:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444239.1661182; Fri, 09 Oct 2026 10:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8Iv-0004we-8K; Fri, 09 Oct 2026 10:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1444239;
 Fri, 09 Oct 2026 10:58:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xF8It-0004wG-Vn
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 10:58:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF8Is-002Mst-U8
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 12:58:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8c8c0-bab6-0a2a0a5309dd-0a2a4502dbdc-46
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 12:58:18 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8c8ca-6ca4-0a2a45020019-d155dd35ec6c-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 12:58:18 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48c6f764f82so1459050f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 03:58:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e2d8fsm3457470f8f.19.2026.10.09.03.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 03:58:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791543498; x=1792148298; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD4D5yQJqIgnvtSJaG+Q546Ka2q0dabYKIwILrlQm/o=;
        b=jtHMW1CnzKVcoI/DEpUq4wa3HAe7t3La5D3OlShtb7mzYwHXkjSYEcBWjD2VM3lmWX
         C+ggFZdvMcURyxg9yE7Dur1wPg4GJLQAGI/HOty+BQaKxwbLTXEX1E+NqOPooTUhqdfq
         vfywDzopUWPUklVFqykNJf141NsnT1QDaaWRjN7SyjUBv2Xct3Qw29c5KzotBTNGIoBG
         +VcckAkwmo8hiiZibTRAOMQnPj/FKlCoL3XTk+/5BW9M3ahUaOF90oEvwRnN+JGlvURD
         UNt3qCeAQmGl58E79+8L4/xW5QuzBNiXkUB4GynfWDOY8cx8p+emMZKvAVn21/aAH8co
         cg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791543498; x=1792148298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD4D5yQJqIgnvtSJaG+Q546Ka2q0dabYKIwILrlQm/o=;
        b=uriKin1zPdAY0iCsl9qmz5B6N04WfugWJunBWOWzAgxbRGl6XiUZcUYikZf5RVSW9R
         hplq47TUi7K5pOs8i8YjIxjWvWZ3xqbGBAXLvOyvJna7cf62EWuo8+hjpliTzXRjDnkW
         fNutEgmLZNbYLW37xyfXGpapxFyB1YNArazEykKZNLSgssy4BE9Gg2uqSk51viDwm6ip
         F06yuOtzDX8MvqdMjCGTzdHeEQItmqOvxda6QzIAOZxSl+CoMcbc/yhX0HimsjxBMRfd
         rPXaQ//Uk+PhsHyipiUYkxQW6Y+fMJYAb9OxkUpImVSlw/fJK+tppWyBTR97f+Vhu8Pa
         cUag==
X-Forwarded-Encrypted: i=1; AKwUvBwBVFKCRZFfD3aIt+Sf0yWJJz6TZree4G1gxlIESM84n0ry/IxpFSg0s/Wl4QFt1ubOA8jcKx0Pag0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKwXRHqFdf1Od2LWTkq/o51iowjhqqDo4fC+8dbbol7Z86Zlm+U
	yAoLjd3QnM4X5ft+eiHIP0GMxSomrmjOin+jg5ovtZCCmUJ4sH3dfvgX
X-Gm-Gg: AYBFou3Q+bQ9Hj+QitWgMs4+SO08e6+KWfvGG/NBC0tDu5+InybHvJN3Z1Qy+U8+9rU
	RkmvMJGZIk6Jb8Ei2gUHpuEdZv7U8cOr8r0HeyiIh+kxubMklPRLCD/NmQmJyi1qcMv+qGcW99d
	iPCc0SodtQpvWpxNhsT6+phUwz7Kxbdujk6Wy/sFc6s3W4uSCLjjZhFJWVZgEUJftIE5x1SJTKw
	jZFYGYiyiT+9+mKWyIw9T4uGyZPu4Dm/hhb+IJjdNaRhhtXq0mEqbrlhuswWZ9+Qi6DrpyzdGGv
	sZ2tzbFE1nb+5Wh+WoKV2Y0tIXiQFWYTFSC2H+dQRz80kmmhY6HUanv9yziAcORdRVJJutf8GSk
	jntN9JMRl+pSMiCG7XsVw22R5WpvqmqeaDpyH7ZFH60txvP10zb0B/JgavYpQQvWzpA4OLMLyE1
	HHUF6sGIM2PcrtcimpWtJQYTyyvvVrTv86E9EI3HiP9hWklDd3soF4B6C9AzN0YsPFs3u9kFF1N
	+oRSEDS3wcNeMKydnLoVMmPOF/DuCna/WtxzXFCVNm46nP8dQ==
X-Received: by 2002:a05:6000:4213:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-48dbaceb5c7mr3201148f8f.51.1791543498116;
        Fri, 09 Oct 2026 03:58:18 -0700 (PDT)
Message-ID: <2dcf7454-9eee-40a9-8a6a-eec0c8e5a696@gmail.com>
Date: Fri, 9 Oct 2026 12:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/device-tree: add a helper to dump an FDT in
 DTS-like format
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
 <20261001111630.112472-2-oleksii.kurochko@gmail.com>
 <e4f83aff-b140-48dc-8858-d60657568fa9@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e4f83aff-b140-48dc-8858-d60657568fa9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791543498-664B62AC-4F6A6E9E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6585



On 10/8/26 1:57 PM, Orzel, Michal wrote:
> 
> 
> On 01-Oct-26 13:16, Oleksii Kurochko wrote:
>> The device tree Xen builds for a dom0less domain is only ever consumed
>> by the guest, so a mistake in it surfaces as an obscure failure inside
>> the domain, far away from the code which produced the tree.
>>
>> Add device_tree_dump(). The output follows dtc's format so that a dump
>> can be diffed against the source DTS or fed back to dtc; the value
>> formatting heuristics are ported from dtc's utilfdt_print_data() for
>> that reason. The walk itself goes through libfdt rather than decoding
>> the tag stream by hand as dtc's fdtdump does.
>>
>> Dumping a whole tree is only useful while debugging and costs both code
>> size and a lot of console output, hence CONFIG_DEVICE_TREE_DEBUG. Mention
>> the dump in the help text of the option.
> We should also dump the DTB for dom0/hwdom in prepare_dtb_hwdom(). Please add
> that to this patch.

It makes sense to me. I will add it.
> 
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/Kconfig.debug                       |   3 +-
>>   xen/common/device-tree/Makefile         |   1 +
>>   xen/common/device-tree/dom0less-build.c |   4 +
>>   xen/common/device-tree/fdt-dump.c       | 180 ++++++++++++++++++++++++
>>   xen/include/xen/bootfdt.h               |  13 ++
>>   5 files changed, 200 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/common/device-tree/fdt-dump.c
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index d900d926c555..664f50bf8a96 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -95,7 +95,8 @@ config DEVICE_TREE_DEBUG
>>   	depends on DEVICE_TREE_PARSE
>>   	help
>>   	  Device tree parsing and DOM0 device tree building messages are
>> -	  logged in the Xen ring buffer.
>> +	  logged in the Xen ring buffer. The device tree generated for each
>> +	  dom0less domU is dumped there as well, in a DTS-like format.
> I think we could have a separate option DEVICE_TREE_DUMP that depends on
> DEVICE_TREE_PARSE. Sometimes all we need is just to see how the generated DTB
> look like without seeing thousands of other DT debug messages. Especially that
> nothing in fdt-dump.c depends on DEVICE_TREE_DEBUG.

Agree, it will be better to have DEVICE_TREE_DUMP. I will introduce the 
following config:

config DEVICE_TREE_DUMP
   bool "Dump generated device trees"
   depends on DEVICE_TREE_PARSE
   help
     The device tree Xen generates for dom0/hwdom and for each om0less
     domain is printed on the Xen console in a DTS-like format.
     The dump is logged at debug level, so on a non-debug build it is
     only shown with "loglvl=all".
     If unsure, say N here.


> 
>>   	  If unsure, say N here.
>>   
>>   config SCRUB_DEBUG
>> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
>> index 9036e455d66a..959dd2a9fd30 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>>   obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
>>   obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
>>   obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>> +obj-$(CONFIG_DEVICE_TREE_DEBUG) += fdt-dump.init.o
>>   obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
>>   obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index fcbeb8adbd73..182201384faf 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bootfdt.h>
>>   #include <xen/bootinfo.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/dom0less-build.h>
>> @@ -587,6 +588,9 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       if ( ret < 0 )
>>           goto err;
>>   
>> +    dt_dprintk("Device tree for %pd:\n", d);
> Move this message to device_tree_dump.
> 

I'll move.

>> +    device_tree_dump(kinfo->fdt);
>> +
>>       return 0;
>>   
>>     err:
>> diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
>> new file mode 100644
>> index 000000000000..fc3d9eca5891
>> --- /dev/null
>> +++ b/xen/common/device-tree/fdt-dump.c
>> @@ -0,0 +1,180 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Dump a flattened device tree blob in a DTS-like format.
>> + *
>> + * is_printable_string() and print_value() are derived from
>> + * util_is_printable_string() and utilfdt_print_data() in the device tree
>> + * compiler (dtc).
>> + *
>> + * Copyright 2011 The Chromium Authors, All Rights Reserved.
>> + * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
>> + * util_is_printable_string contributed by
>> + *      Pantelis Antoniou <pantelis.antoniou AT gmail.com>
>> + */
>> +
>> +#include <xen/bootfdt.h>
>> +#include <xen/ctype.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/types.h>
>> +
>> +/* Deeper nodes are still printed, but not indented any further. */
>> +#define DUMP_MAX_INDENT_DEPTH 32
>> +
>> +/* Indentation, in characters, of a node at depth @depth. */
>> +static int __init indent_of(int depth)
>> +{
>> +    return 2 * min(depth, DUMP_MAX_INDENT_DEPTH);
>> +}
>> +
>> +static bool __init is_printable_string(const void *data, unsigned int len)
>> +{
>> +    const char *s = data;
>> +    const char *se = s + len;
>> +
>> +    /* A zero length property, or one which isn't NUL terminated, isn't one. */
>> +    if ( (len == 0) || (s[len - 1] != '\0') )
>> +        return false;
>> +
>> +    while ( s < se )
>> +    {
>> +        const char *ss = s;
>> +
>> +        while ( (s < se) && *s && isprint(*s) )
> Xen's is_print() behaves differently than what dtc uses. You need to combine it
> with is_ascii. Otherwise 0xff would be marked as printable.

I'll add the is_ascii() before isprint():
      /*
       * Xen's isprint() also accepts the Latin-1 characters 0xa0-0xff,
       * while the one dtc uses only accepts ASCII ones.
       */
      while ( (s < se) && *s && isascii(*s) && isprint(*s) )
         ...

Thanks for review!

~ Oleksii

