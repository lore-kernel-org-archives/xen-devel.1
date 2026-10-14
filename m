Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA34CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:23:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449225.1665130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0pP-0007vg-Hd; Wed, 14 Oct 2026 15:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449225.1665130; Wed, 14 Oct 2026 15:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0pP-0007vZ-Ej; Wed, 14 Oct 2026 15:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1449225;
 Wed, 14 Oct 2026 15:23:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH0pN-0007vL-DC
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:23:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0pM-00Dp37-Pv
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 17:23:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9e64-8faa-0a2a0a5109dd-0a2a4504beae-46
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:23:36 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9e78-b57f-0a2a45040019-d1558029d182-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:23:36 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so37173085e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:23:36 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs377965.centertel.pl. [37.47.107.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc4ec6sm12496103f8f.48.2026.10.14.08.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 08:23:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991416; x=1792596216; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHN1tRzj5hLAdzFo9vaN09pjb/mHMfirHqgNxfKsO3M=;
        b=FHGti8ns60xV4g1LtTpr+9qS3OiveO5+uzgAR7rSa/FihnA21LtYDAN4FQ90AFE85n
         lP7b4wrtqjT0Ae8FZlBHdJNtQK7574buBLy055vjxvD3TuWza1jEsg99eufHKKdfufvg
         DdaH0K6MEyOmt7Tn4swK3d9Z9RBNFqP/3lyP3tRwWddR3M43IhkuxbI3VxBA2bQUr/ss
         ByyeTiFdXLk4pg84fAJEU/Ed8Ok6T+B4NQaR7rLBDAHV2c3mmaV4ZySXiZ18CTzMCI3h
         4bdMG5aKO2sg2q2AYQFHKnd6WFdbWFuO8cKTEr9yjSViA850YmRP7C25pid02mKt/Krj
         mKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991416; x=1792596216;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHN1tRzj5hLAdzFo9vaN09pjb/mHMfirHqgNxfKsO3M=;
        b=c2FmB6TKrQFZXht1X/3mUbf3CTUEg6ihg4Eh2/gRAuUx5vzP0oXm4Rj7xZkluw3dnM
         P5EBgZ92s2krQVOozo2zBGY9IV3VsfqqaZYpnDVhwgaLENLkY2smneixgWhIdBEnS46R
         27qyFwJQbdc7ziaXA3S5fPM/bN0l9KDJyWgRs2rlRhdqK2HwMz2tFsV830pZfbDt6We4
         s/OFz99x5VhI4scH20+vh8hfiMwhX8jUskUwbQjShms5ixP75wxNZd5dOCDyNTLQfA5c
         lN+xAJzG8lEszNMKf4blTONZHJnTrVA8GC0eAb/p6cYBH/ckK5FXRmae63boM6kuFMdE
         UV9Q==
X-Gm-Message-State: AFq9FYJIkX6EhNWWY7i306D1wGtSSSSZi5VTj+opkkXFUUGHIN/vRuGA
	8Pgn2xYKnmgv4fZHPykeT7bd0tPMeL0LJSmT05E0a+7ylFLc9KaqIaE9
X-Gm-Gg: AYBFou2Kx68mz0pwMRcDsADlLFU6wn2BV7JpklVjzoOhuq8ULTSfNPxleH7WPRxExjA
	23lQSJF51x/BVaAoIzFTXzAkWJS08R7KLlXKUCEQOzjdmgp1hqEQ+KKrOp78Kq2V9rBlzDky6im
	42mf9N9BwJwz4jK2n3g5cqrX+WrdH5BIu5keAjy++XwTGbT59Wxu9gfFLRN/A7nxzHE/yNXAHMi
	tBFQh46sFEcS7vPIeLcbbtHfGoXSeZyUPylV4SOirdOzl2dLqOy86Z6kbMp8kBD3pdM3CfXvU/l
	PbkUYZMXqNPTG1ky47uF1LLBp15nA1OXlvZaYURifyttdSGzzixBVMlfqYEe6ZLEsh+euLBVfYX
	EvhMsgo+d8zw+5Z3Cz+QsxI9Alyyfb3P6+yk2fB6V61K/fg7Zj9YZSjs40FA3fbZUSEDFay3edC
	v8TQT1Xb77R9Givl1wyuL5j9hgHYov2t+ZCydov79yGTzgJKovyYvPzyOMprCLasyskUcHQBRVy
	6igyQgXZiGWHvrWNBDxlQkxV+z2PqZrKUV8r1qJvGGc61LWqsw=
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr316262695e9.24.1791991415910;
        Wed, 14 Oct 2026 08:23:35 -0700 (PDT)
Message-ID: <a534d189-4390-4d0d-9fec-b46151cafed6@gmail.com>
Date: Wed, 14 Oct 2026 17:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/device-tree: add a helper to dump an FDT in
 DTS-like format
To: "Orzel, Michal" <michal.orzel@amd.com>
References: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
 <20261012073442.15819-3-oleksii.kurochko@gmail.com>
 <4e820fd2-6ed3-49bc-a41b-58af36790f62@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <4e820fd2-6ed3-49bc-a41b-58af36790f62@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791991416-53EC6B50-CF226F87/10/73395122804
X-purgate-type: spam
X-purgate-size: 7523



On 10/14/26 1:13 PM, Orzel, Michal wrote:
> 
> 
> On 12-Oct-26 09:34, Oleksii Kurochko wrote:
>> The device tree Xen builds for dom0/hwdom or for a dom0less domain is
>> only ever consumed by the guest, so a mistake in it surfaces as an
>> obscure failure inside the domain, far away from the code which
>> produced the tree.
>>
>> Add device_tree_dump(). The output follows dtc's format so that a dump
>> can be diffed against the source DTS or fed back to dtc; the value
>> formatting heuristics are ported from dtc's utilfdt_print_data() for
>> that reason. The walk itself goes through libfdt rather than decoding
>> the tag stream by hand as dtc's fdtdump does.
>>
>> Dumping a whole tree is only useful while debugging and costs both code
>> size and a lot of console output, so it is put under its own option,
>> CONFIG_DEVICE_TREE_DUMP. It is separate from CONFIG_DEVICE_TREE_DEBUG
>> because the generated tree is often all that is needed, without the rest
>> of the device tree debug messages.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Dump the device tree generated for dom0/hwdom as well.
>>   - Put the dump under its own CONFIG_DEVICE_TREE_DUMP instead of
>>     CONFIG_DEVICE_TREE_DEBUG.
>>   - Pass the domain to device_tree_dump() and print the "Device tree for"
>>     header from it.
>>   - Combine isprint() with isascii(), as Xen's isprint() also accepts
>>     the characters 0xa0-0xff, unlike the one dtc uses.
>>   - Update the commit message.
>> ---
>> ---
>>   xen/Kconfig.debug                       |  10 ++
>>   xen/arch/arm/domain_build.c             |   2 +
>>   xen/common/device-tree/Makefile         |   1 +
>>   xen/common/device-tree/dom0less-build.c |   3 +
>>   xen/common/device-tree/fdt-dump.c       | 185 ++++++++++++++++++++++++
>>   xen/include/xen/bootfdt.h               |  16 ++
>>   6 files changed, 217 insertions(+)
>>   create mode 100644 xen/common/device-tree/fdt-dump.c
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index d900d926c555..45cff9dbc467 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -98,6 +98,16 @@ config DEVICE_TREE_DEBUG
>>   	  logged in the Xen ring buffer.
>>   	  If unsure, say N here.
>>   
>> +config DEVICE_TREE_DUMP
>> +	bool "Dump generated device trees"
>> +	depends on DEVICE_TREE_PARSE
>> +	help
>> +	  The device tree Xen generates for dom0/hwdom and for each dom0less
>> +	  domain is printed on the Xen console in a DTS-like format.
>> +	  The dump is logged at debug level, so on a non-debug build it is
>> +	  only shown with "loglvl=all".
> That's not correct. loglvl="debug" is enough. That said, I don't find it
> particularly necessary for the second part of the sentence to be part of the
> help message. If you want to keep it, fix the loglvl.

I am okay to drop the second part of the sentence to be part of the
help message.

> 
>> +	  If unsure, say N here.
>> +
>>   config SCRUB_DEBUG
>>   	bool "Page scrubbing test"
>>   	default DEBUG
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 72d531618045..6a20af23e1bb 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1705,6 +1705,8 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
>>       if ( ret < 0 )
>>           goto err;
>>   
>> +    device_tree_dump(d, kinfo->fdt);
>> +
>>       return 0;
>>   
>>     err:
>> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
>> index 9036e455d66a..730d202349eb 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>>   obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
>>   obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
>>   obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>> +obj-$(CONFIG_DEVICE_TREE_DUMP) += fdt-dump.init.o
>>   obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
>>   obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index fcbeb8adbd73..24a9c6b1e3e1 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bootfdt.h>
>>   #include <xen/bootinfo.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/dom0less-build.h>
>> @@ -587,6 +588,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       if ( ret < 0 )
>>           goto err;
>>   
>> +    device_tree_dump(d, kinfo->fdt);
>> +
>>       return 0;
>>   
>>     err:
>> diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
>> new file mode 100644
>> index 000000000000..296ae0d90d12
>> --- /dev/null
>> +++ b/xen/common/device-tree/fdt-dump.c
>> @@ -0,0 +1,185 @@
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
> Can we use 4 spaces instead of 2 here and in print_properties() call. It does
> look more readable IMO and matches the indentation (1 tab = 4 spaces) of dtc
> when converting dtb to dts.

Fair enough.

I will introduce then DUMP_IDENT_WIDTH and use it in the correspondent 
places:

--- a/xen/common/device-tree/fdt-dump.c
+++ b/xen/common/device-tree/fdt-dump.c
@@ -22,10 +22,13 @@
  /* Deeper nodes are still printed, but not indented any further. */
  #define DUMP_MAX_INDENT_DEPTH 32

+/* Spaces per nesting level. */
+#define DUMP_INDENT_WIDTH 4
+
  /* Indentation, in characters, of a node at depth @depth. */
  static int __init indent_of(int depth)
  {
-    return 2 * min(depth, DUMP_MAX_INDENT_DEPTH);
+    return DUMP_INDENT_WIDTH * min(depth, DUMP_MAX_INDENT_DEPTH);
  }
@@ -161,7 +164,7 @@ void __init device_tree_dump(const struct domain *d, 
const void *fdt)

          printk(XENLOG_DEBUG "%*s%s {\n", indent_of(depth), "",
                 (depth == 0) ? "/" : (name ?: "<unknown>"));
-        print_properties(fdt, node, indent_of(depth) + 2);
+        print_properties(fdt, node, indent_of(depth) + DUMP_INDENT_WIDTH);

> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

~ Oleksii

