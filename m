Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B905C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:43:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D442054F
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D442054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71953.129240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WUh-0001pZ-VE; Thu, 21 Jan 2021 09:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71953.129240; Thu, 21 Jan 2021 09:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WUh-0001pS-Qx; Thu, 21 Jan 2021 09:43:11 +0000
Received: by outflank-mailman (input) for mailman id 71953;
 Thu, 21 Jan 2021 09:43:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2WUg-0001pN-7w
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:43:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff34c22f-d475-4b2f-8f6a-0625bd24a407;
 Thu, 21 Jan 2021 09:43:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CC48AB7A;
 Thu, 21 Jan 2021 09:43:08 +0000 (UTC)
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
X-Inumbo-ID: ff34c22f-d475-4b2f-8f6a-0625bd24a407
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611222188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJoqnNFSfE9LeFWLsBFVcFlMYap9vDFTB9JPp0FBMZw=;
	b=VLdynddlfsQ5QPAv2V+FIYmm7pv0EDUhk5Y84WSrOvg4jauE3byOefeu7UQYiBL2+IydLa
	UZCK3Jkcmd3ECMab+ChCM/fhnVCDYcqw+Cxxgj/oroTNdhQkx5qSc9n9oKYEZOHm25YOAH
	gVbhOngcNjCOvk4J+Fv1xcJriaAW9Pg=
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com, wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210121093041.21537-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f317514-110a-9c5c-8732-60c0a1f58d31@suse.com>
Date: Thu, 21 Jan 2021 10:43:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121093041.21537-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 10:30, Michal Orzel wrote:
> Fix compilation error when enabling early printk, introduced
> by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
> ```
> debug.S: Assembler messages:
> debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> ```
> 
> The fix is to include header <xen/page-size.h> which now contains
> definitions for page/size/mask etc.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

I'm sorry for the breakage, but I wonder how I should have noticed
the issue. In all the Arm .config-s I'm routinely building I can't
even see ...

> --- a/xen/include/asm-arm/early_printk.h
> +++ b/xen/include/asm-arm/early_printk.h
> @@ -10,6 +10,7 @@
>  #ifndef __ARM_EARLY_PRINTK_H__
>  #define __ARM_EARLY_PRINTK_H__
>  
> +#include <xen/page-size.h>
>  
>  #ifdef CONFIG_EARLY_PRINTK

... a respective Kconfig setting, i.e. it's not like I simply
failed to enable it.

Jan

