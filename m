Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDCC2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 12:58:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A821B2068E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 12:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="WgZLefso"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A821B2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsj1-00022w-T8; Mon, 28 Sep 2020 12:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPfX=DF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kMsj0-00022r-OB
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:57:50 +0000
X-Inumbo-ID: bae5c5c7-01c8-4f76-bad7-6a8ebd916554
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bae5c5c7-01c8-4f76-bad7-6a8ebd916554;
 Mon, 28 Sep 2020 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601297869;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GV4YafrH2oJutyvYb5GQHndepDcjN54unLyZk55VVZY=;
 b=WgZLefsoMcm314vByExJbCFAwYO07x/jil52ooqAyOBPSoz3JQ42/qST
 dEH3gWJWMQ+poj2Wkuh1FIJACYXs8yC/P6AvVyL7yATCaWzKYMlbaM2QA
 R56wmhc2JfdR7zPisRQdkWi3f+Z3B9szD9XziABoFmufFZyz4McqI/UhR 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CslbePiIO81BVd0Rjcrf255i0uExM9DowUiu4u/fPrYuCuNA0CspAO4lQYq31zsQpz/oINrPcR
 sOZ7gM3IXrGbvoozzFaOxtDITTXBBEl1HLK9pGIwX5FgHWIHZg9O9r9xHvRQfdkUO5A2TlDSmr
 HZ19lEV7/7yic/AlzWVMIMNp+68m/XFsJoLR3oWT8IJoHIQjOIjfEig0/ipuFueutLQQBmXIv5
 CqQYe0pti52TUuYKSObWKoM2qFfvNpmaCmjw4Z67OdmVgqCc/Iot4ez0MbAM3K0AoD9u/QvNoL
 0GI=
X-SBRS: None
X-MesageID: 27846183
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="27846183"
Subject: Re: [PATCH 2/5] x86/ELF: don't open-code read_sreg()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <e15d4ed7-4a42-33ac-79ed-171851548a1b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1bd25aa1-7217-9bbe-6225-5a763b971695@citrix.com>
Date: Mon, 28 Sep 2020 13:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e15d4ed7-4a42-33ac-79ed-171851548a1b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/09/2020 13:05, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/asm-x86/x86_64/elf.h
> +++ b/xen/include/asm-x86/x86_64/elf.h
> @@ -1,6 +1,8 @@
>  #ifndef __X86_64_ELF_H__
>  #define __X86_64_ELF_H__
>  
> +#include <asm/regs.h>
> +
>  typedef struct {
>      unsigned long r15;
>      unsigned long r14;
> @@ -53,16 +55,16 @@ static inline void elf_core_save_regs(EL
>      asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
>      /* orig_rax not filled in for now */
>      core_regs->rip = (unsigned long)elf_core_save_regs;
> -    asm volatile("movl %%cs, %%eax;" :"=a"(core_regs->cs));
> +    core_regs->cs = read_sreg(cs);
>      asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
>      asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
>      asm volatile("movl %%ss, %%eax;" :"=a"(core_regs->ss));

Another one here.

With that fixed, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>      /* thread_fs not filled in for now */
>      /* thread_gs not filled in for now */
> -    asm volatile("movl %%ds, %%eax;" :"=a"(core_regs->ds));
> -    asm volatile("movl %%es, %%eax;" :"=a"(core_regs->es));
> -    asm volatile("movl %%fs, %%eax;" :"=a"(core_regs->fs));
> -    asm volatile("movl %%gs, %%eax;" :"=a"(core_regs->gs));
> +    core_regs->ds = read_sreg(ds);
> +    core_regs->es = read_sreg(es);
> +    core_regs->fs = read_sreg(fs);
> +    core_regs->gs = read_sreg(gs);
>  
>      asm volatile("mov %%cr0, %0" : "=r" (tmp) : );
>      xen_core_regs->cr0 = tmp;


