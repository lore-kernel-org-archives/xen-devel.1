Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214ABC54E58
	for <xen-devel@archiver.kernel.org>; Thu, 21 Mar 2024 17:37:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.696550.1087555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMLi-0006Af-Tw; Thu, 21 Mar 2024 17:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696550.1087555; Thu, 21 Mar 2024 17:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMLi-0006AY-RA; Thu, 21 Mar 2024 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 696550;
 Thu, 21 Mar 2024 17:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMLh-0006AS-2J
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:37:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMLg-0006ml-Kr; Thu, 21 Mar 2024 17:37:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMLg-0007Jw-Dz; Thu, 21 Mar 2024 17:37:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=8fziIsojyxAkAl9v5/6QiksQgxPJ93MzEwjPXDXxJBQ=; b=h4kL0Ma5I+XJ7AoP/i4Rwcdjh3
	iM3pmPR5HQvm+BCd52qY4az4x9WPva6T3ljS2yMKBeJSgMWW/BETgpWfhuk0qr1jPK41I7Z/ito1O
	88vbSz5B1LU5dhOgIvrcPVKOafiaMDZm6h64tB94Clom6UPOeV1/mHi1/LZyBtL3MCH0=;
Message-ID: <5126dec1-e416-4aef-a4cf-cff031569328@xen.org>
Date: Thu, 21 Mar 2024 17:37:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/ppc: Update setup.h with required definitions
 for bootfdt
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 14/03/2024 22:15, Shawn Anastasio wrote:
> Add the definitions used by ARM's bootfdt.c, which will be moved into
> xen/common in a later patch, to PPC's setup.h

This read as the definition should be in include/xen/... rather than per 
arch. In particular, ...

> +/*
> + * bootinfo.c
> + */
> +bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
> +struct bootmodule *add_boot_module(bootmodule_kind kind,
> +                                   paddr_t start, paddr_t size, bool domU);
> +void add_boot_cmdline(const char *name, const char *cmdline,
> +                      bootmodule_kind kind, paddr_t start, bool domU);
> +const char *boot_module_kind_as_string(bootmodule_kind kind);
> +struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
> +void populate_boot_allocator(void);

... will be defined in common/*/bootfdt.c.

Cheers,

-- 
Julien Grall

