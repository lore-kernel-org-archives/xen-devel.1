Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EB0C2D0A8
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 06:50:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3752075F
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 06:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jH+2txXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C3752075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.442.1349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVw2-0001Eo-V2; Wed, 30 Sep 2020 06:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442.1349; Wed, 30 Sep 2020 06:49:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVw2-0001Eh-S5; Wed, 30 Sep 2020 06:49:54 +0000
Received: by outflank-mailman (input) for mailman id 442;
 Wed, 30 Sep 2020 06:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNVw1-0001Ec-Ru
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:49:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5db749e-0e08-4792-99ba-0a7dc8d40d69;
 Wed, 30 Sep 2020 06:49:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 567DBABF4;
 Wed, 30 Sep 2020 06:49:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNVw1-0001Ec-Ru
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:49:53 +0000
X-Inumbo-ID: d5db749e-0e08-4792-99ba-0a7dc8d40d69
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5db749e-0e08-4792-99ba-0a7dc8d40d69;
	Wed, 30 Sep 2020 06:49:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601448592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4CwU4BKG+NG2sdcw+jMZfS3R6au/uaj/8+5QJrDpqk=;
	b=jH+2txXwf4w1oxx4dncWYlsQvsGM6Bz4p9EAOSY56MhT9SL3Wtoq4cBmzL2oMq8mwc2Cfa
	phpYAi/GvgWzGQ9MhJyfaTI0sGX8/39RmQgDeQfRNAwMJDyKRPQLQLn5ZWZhpjFnCCmxXg
	MLU4ywFpJEt1I2hMuAeDA5i4lYyxsyM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 567DBABF4;
	Wed, 30 Sep 2020 06:49:52 +0000 (UTC)
Subject: Re: [PATCH v7 1/5] efi/boot.c: add file.need_to_free
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200929181717.1596965-1-hudson@trmm.net>
 <20200929181717.1596965-2-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25429a64-2b60-19a2-c7d5-987eecd63c56@suse.com>
Date: Wed, 30 Sep 2020 08:49:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929181717.1596965-2-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 20:17, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.  On x86 the ucode, and on
> ARM the dtb, are also marked as need_to_free.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

non-Arm parts:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -546,7 +546,7 @@ static void __init efi_arch_cpu(void)
>  
>  static void __init efi_arch_blexit(void)
>  {
> -    if ( dtbfile.addr && dtbfile.size )
> +    if ( dtbfile.need_to_free )
>          efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
>      if ( memmap )
>          efi_bs->FreePool(memmap);

I'm afraid this isn't enough of a change for Arm, due to what
fdt_increase_size() may do.

Jan

