Return-Path: <SRS0=ZtLg=IN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B846C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 15:05:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 003EC64E04
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 15:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 003EC64E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98076.185927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLomc-0004f3-IT; Mon, 15 Mar 2021 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98076.185927; Mon, 15 Mar 2021 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLomc-0004ew-ET; Mon, 15 Mar 2021 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 98076;
 Mon, 15 Mar 2021 15:05:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLomb-0004er-F0
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 15:05:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dd6a88d-618d-482f-bd47-6dca50e50ff6;
 Mon, 15 Mar 2021 15:05:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62860AC17;
 Mon, 15 Mar 2021 15:05:22 +0000 (UTC)
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
X-Inumbo-ID: 6dd6a88d-618d-482f-bd47-6dca50e50ff6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615820722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMjeCiwUpSUpApoVmciAPnZR/b20VgGEjDPEJRHbIF8=;
	b=jWNnzTu+UWgcvgjeaMpAuqJ2PKFznh7g212OP6e28pzkNCl2rjkYhOmwkuotyh5OMZS2Mi
	ibGliumQJOW6GrIUrQj6cR0wlOdUVVrm7i3JhVnr9HIdjtJh7Y1lqDiLjQT8ZHaLdRSTU3
	TNJ9T4sv5U8Meq26fqVpHDM9y9HfDEo=
Subject: Re: [PATCH v3 3/5] xen/x86: add some addresses to the Multiboot
 header
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <0b05bedc32833a2022d2698d4c116cb867a9119c.1611273359.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ded9fa4b-0dc3-ee45-00a1-0e493f5f4231@suse.com>
Date: Mon, 15 Mar 2021 16:05:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0b05bedc32833a2022d2698d4c116cb867a9119c.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 01:51, Bobby Eshleman wrote:
> From: Daniel Kiper <daniel.kiper@oracle.com>
> 
> In comparison to ELF the PE format is not supported by the Multiboot
> protocol. So, if we wish to load xen.mb.efi using this protocol we
> have to put header_addr, load_addr, load_end_addr, bss_end_addr and
> entry_addr data into Multiboot header.
> 
> The Multiboot protocol spec can be found at
>   https://www.gnu.org/software/grub/manual/multiboot/

And because of this spec saying "the boot loader should use them
instead of the fields in the actual executable header to calculate
where to load the OS image" this change will affect the ELF image
as well. For example ...

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -50,13 +50,24 @@ ENTRY(start)
>          .balign 4
>  multiboot1_header:             /*** MULTIBOOT1 HEADER ****/
>  #define MULTIBOOT_HEADER_FLAGS (MULTIBOOT_HEADER_MODS_ALIGNED | \
> -                                MULTIBOOT_HEADER_WANT_MEMORY)
> +                                MULTIBOOT_HEADER_WANT_MEMORY | \
> +                                MULTIBOOT_HEADER_HAS_ADDR)
>          /* Magic number indicating a Multiboot header. */
>          .long   MULTIBOOT_HEADER_MAGIC
>          /* Flags to bootloader (see Multiboot spec). */
>          .long   MULTIBOOT_HEADER_FLAGS
>          /* Checksum: must be the negated sum of the first two fields. */
>          .long   -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
> +        /* header_addr */
> +        .long   sym_offs(multiboot1_header)
> +        /* load_addr */
> +        .long   sym_offs(start)
> +        /* load_end_addr */
> +        .long   sym_offs(__bss_start)
> +        /* bss_end_addr */
> +        .long   sym_offs(__2M_rwdata_end)

... the ELF image end at _end, not at __2M_rwdata_end. I realize
that with 2M alignment in use, this may actually be a problem, as
one of the modules (the initrd in particular) could be placed
overlapping the (_end, __2M_rwdata_end) range. Nevertheless I
think you want to specify _end (or __bss_end) here.

As to the initial point made - would it be possible to leave the
flag unset in the EFL image and force it set only in xen.mb.efi?
Yes, this may require yet another post-processing step.

Jan

> +        /* entry_addr */
> +        .long   sym_offs(__start)
>  
>          .size multiboot1_header, . - multiboot1_header
>          .type multiboot1_header, @object
> 


