Return-Path: <SRS0=+ST8=CG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EB6C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 07:52:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643992078A
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643992078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBZAm-0005kE-Cg; Fri, 28 Aug 2020 07:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBZAk-0005k9-Rg
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 07:51:42 +0000
X-Inumbo-ID: 3f41d211-f56a-459e-ab3b-74fe7d69a5d3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f41d211-f56a-459e-ab3b-74fe7d69a5d3;
 Fri, 28 Aug 2020 07:51:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75C61ACC5;
 Fri, 28 Aug 2020 07:52:13 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: indicate firmware tables as ACPI NVS in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1598573599-23792-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f3a5ac9-06aa-65f5-b4e0-1d9ab01adb5a@suse.com>
Date: Fri, 28 Aug 2020 09:51:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598573599-23792-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 28.08.2020 02:13, Igor Druzhinin wrote:
> Guest kernel does need to know in some cases where the tables are located
> to treat these regions properly. One example is kexec process where
> the first kernel needs to pass firmware region locations to the second
> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
> table and count immovable memory regions").
> 
> The memory that hvmloader allocates in the reserved region mostly contains
> these useful tables and could be safely indicated as ACPI without the need
> to designate a sub-region specially for that. Making it non-reclaimable
> (ACPI NVS) would avoid potential reuse of this memory by the guest.
> Swtiching from Reserved to ACPI NVS type for this memory would also mean
> its content is preserved across S4 (which is true for any ACPI type according
> to the spec).

Marking the range as ACPI is certainly fine, but why did you choose NVS?
There's nothing non-volatile there afaict. And the part of the last
sentence in parentheses suggests to me that the "normal" ACPI type is as
suitable for the purpose you're after.

> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>  {
>      unsigned int nr = 0, i, j;
>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
> +    uint32_t firmware_mem_end =
> +        RESERVED_MEMORY_DYNAMIC_START + (mem_mfns_allocated() << PAGE_SHIFT);

Here and elsewhere - please avoid uint32_t and friends when a plain
C type (unsigned int or unsigned long in this case) will do.

> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>      {
>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>  
> -        e820[nr].addr = RESERVED_MEMBASE;
> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
> +        e820[nr].addr = firmware_mem_end;
> +        e820[nr].size = (uint32_t) igd_opregion_base - firmware_mem_end;

Any chance I could talk you into also dropping the pointless cast
at this occasion?

Jan

