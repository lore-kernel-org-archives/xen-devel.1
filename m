Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE76606A69D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZxxA3m22;
	dkim=fail reason="signature verification failed" header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=/l0jh14F
Received: from list by lists.xenproject.org with outflank-mailman.1500980.1697033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr7N-0000Ye-3L; Tue, 24 Nov 2026 14:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500980.1697033; Tue, 24 Nov 2026 14:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVr7N-0000YX-0A; Tue, 24 Nov 2026 14:03:33 +0000
Received: by outflank-mailman (input) for mailman id 1500980;
 Tue, 24 Nov 2026 14:03:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julian@outer-limits.org>) id 1xVr7L-0000XV-Au
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:03:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVr7K-0021uR-Fd
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:03:30 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julian@outer-limits.org>)
 id 6b059928-e002-0a2a0a5209dd-0a2a4501a4c0-26
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:03:30 +0100
Received: from [81.169.146.164] (helo=mo4-p01-ob.smtp.rzone.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julian@outer-limits.org>)
 id 6b059932-5bcc-0a2a45010019-51a992a4970b-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 15:03:30 +0100
Received: from [IPV6:2a01:e0a:db7:f20:154c:8407:cfb2:3d56]
 by smtp.strato.de (RZmta 55.6.3 AUTH) with ESMTPSA id J82cde2AOE2pxn3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 24 Nov 2026 15:02:51 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=strato-dkim-0002 header.d=outer-limits.org header.i="@outer-limits.org" header.h="In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID"; dkim=permerror header.s=strato-dkim-0003 header.d=outer-limits.org header.i="@outer-limits.org"
ARC-Seal: i=1; a=rsa-sha256; t=1795528971; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Oz3N7EWJm3kQNwAjNRfs1OGIzImvpM1H9oz8IGPTcJDp0GMlbZzJj9a5gk6EzIt5zc
    p7TLNLlWvvJqBkvUIK8W4/6xWYgVNyQBHj16VPoHwPYbfQiSi2vimDipJYPDi2LLUZJz
    AKGnu1thEpigitCJJQd1kPv5QwHFvECR4YTYiBMxf2rhN+hb9p5P3pmQ9Xr0KvNFklAk
    FiJ88Fv6kiZT+a0QNq+F4Qu+QPLUj7HOdom/gyHHz/4zzd7MGG7zmtKw7rvN5uYSMLW+
    CMpJi5SkiJGrmMeW3Z8/Ely6xNIV88QrPvzVcoNly4v4BjhC87Phexf1ZsMVm4ZDIM0J
    /84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795528971;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rK5kfjNFTMBhewZ2Z6PYZ/HR7jF5Lg7srSe2C6WvWcE=;
    b=rLIsgIMvkCA6k5/tGVezAvKSvYthM0dngPI79VfeBUlQ/nmr9JlhyX5JNPgGh0kHm/
    GrLuRIFV3X4VCN/IFT/14BpUWOiMNmw61BpnlNToVZdnFf+EK+bmaCDCGSwDeJDLvo5P
    X80IHusxSkKlqOkFOT40X3AbfTcsgz7Ezrw5cJZofYflvGfOtpZh7tmMB7cSOxKQ20XO
    myZhLV5F2oG75MN8J26oOcRGPxXkTIsN8GGfPZgzuYXG99TTUi0/8w09CJbmhEtivROP
    zS2L48yUOmBNUqZEZLzQ5LPvA5b2u5WQqz+TmmxHlUwl0ZU/tBdOv6wpJMWYPoYkrt4d
    2iLQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795528971;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rK5kfjNFTMBhewZ2Z6PYZ/HR7jF5Lg7srSe2C6WvWcE=;
    b=ZxxA3m22F4pE9tjwwLc5iZb89jspyAzaylnQdnawXPfxLDTiCItJCkGzG9ozz3Blkm
    zJlkpTtzGrI6NxGiGqXEvHhO5dY+LR6RIxeeB0mKzlt2m1RqsZMFUfyZzlhrkgjsTIos
    +q2CugA/L8uPTUXab0DDgkCoaor1XNJ6AMIu2ANHb2F5RECXYEhBnPvpSGEnoruR9Ihy
    FYe8whemkdQGM1oxKqTT0EUWWP4a9FgSXjv09Ls+zBtqQEfGaTL2XpJBWrroB8agQ19B
    7J/FHEZ7MWxmjpgiZTlrCspL/qY8NAEwrg8UavzaI/grHW4XnMKd9c6gCfyeuWwYl3fx
    MIiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795528971;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rK5kfjNFTMBhewZ2Z6PYZ/HR7jF5Lg7srSe2C6WvWcE=;
    b=/l0jh14FUsOWn6v9+bxJCXb76VsoD8nhysKYaiD0xS2EeK/UZocgjuuJ8Sk8kMFCng
    WdqIYt7zT4JER62hluAQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z4tK2c3m3zwosfchN4RSG/U9b98610tRpOA6sK6yiQZk="
Message-ID: <f62e1e86-ae7c-498e-95e8-ec790e734a3c@outer-limits.org>
Date: Tue, 24 Nov 2026 15:02:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM EFI: should bootinfo memory banks be reset before retrying
 ExitBootServices ?
To: Pierre Gondois <pierre.gondois@arm.com>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
Autocrypt: addr=julian@outer-limits.org; keydata=
 xjMEaLvwgxYJKwYBBAHaRw8BAQdA6u9Gv9DAWoEq0Jh+krJQqvgA9crvjYIJ1zL38JLsdOLN
 J0p1bGlhbiBWZXR0ZXIgPGp1bGlhbkBvdXRlci1saW1pdHMub3JnPsKTBBMWCgA7FiEEKsxf
 M6APqlFEwlRheMhx4x8L9BsFAmi78IMCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQeMhx4x8L9Bv4PAEAirijszkHGYvhggZvlSx20Pumm2rCol4OzlxO5BcFRMQBAP+PvG0d
 H4/6nomybCtCDS2rHLv8mA1O4Zn/f073zGUJzjgEaLvwgxIKKwYBBAGXVQEFAQEHQNJXxAh6
 JmVPz+Tw8W+SQ9nMlNV6KD8l0uLlSV/s1f0BAwEIB8J4BBgWCgAgFiEEKsxfM6APqlFEwlRh
 eMhx4x8L9BsFAmi78IMCGwwACgkQeMhx4x8L9BvCRQEA6rFFo2ZiAMR6vT5iJvdWQpkqh1NH
 XmyCC2h0RIqIEJQA/iAKZBD9h6RVoLScco+nlA+mppdkrg5lb2pvJpENMfQJ
In-Reply-To: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1795529010-BE0D55FD-F8293746/0/0
X-purgate-type: clean
X-purgate-size: 2597
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 17:11, Pierre Gondois wrote:
> Hello,

Hello Pierre,
I can reproduce this on QEMU, and the change you suggest fixes it.

My Setup:
- QEMU 11.1.3: -M virt,virtualization=on,acpi=off -cpu cortex-a57 -smp 4 
-m 4G
- Firmware: qemu-efi-aarch64 2026.08+ds-3
- Xen: staging 3b65ff9f372fb85 (debug, early printk on PL011), xen.efi 
started directly from the UEFI shell

Without the change, the first ExitBootServices() call fails, 
efi_exit_boot() retries, and every RAM bank is added a second time, and 
Xen hits the BUG in bootmem_region_add():

(XEN) RAM: 0000000040000000 - 000000004668ffff
(XEN) RAM: 0000000040000000 - 000000004668ffff
(XEN) RAM: 0000000046800000 - 000000004688ffff
(XEN) RAM: 0000000046800000 - 000000004688ffff
...
(XEN) Xen BUG at common/page_alloc.c:308
...
(XEN) Xen call trace:
(XEN)    [<00000a00002cb498>] page_alloc.c#bootmem_region_add+0xd8/0xec (PC)
(XEN)    [<00000a00002cb694>] init_boot_pages+0x44/0x1b0 (LR)
(XEN)    [<00000a00002cb694>] init_boot_pages+0x44/0x1b0
(XEN)    [<00000a00002c54f0>] bootinfo.c#dt_unreserved_regions+0x70/0xac
(XEN)    [<00000a00002c5c50>] populate_boot_allocator+0x124/0x1c8
(XEN)    [<00000a00002e2c84>] setup_mm+0x60/0x84
(XEN)    [<00000a00002e337c>] start_xen+0x118/0x988
(XEN)    [<00000a00002001a4>] 
arch/arm/arm64/head.S#primary_switched+0x4/0x24
...

With your change applied, each bank is listed once and Xen boots through 
to dom0:

...
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000040000000 - 000000004668ffff
(XEN) RAM: 0000000046800000 - 000000004688ffff
(XEN) RAM: 0000000046930000 - 0000000047a4ffff
(XEN) RAM: 0000000047ff4000 - 000000013fffffff
(XEN)
(XEN) MODULE[0]: 0000000045b58000 - 0000000045ccafff Xen
(XEN) MODULE[1]: 0000000045cf1000 - 0000000045df3fff Device Tree
(XEN) MODULE[2]: 000000013dd4d000 - 000000013fffdf13 Ramdisk
(XEN) MODULE[3]: 0000000041bf4000 - 0000000043ffffbf Kernel
...

I see in the x86 that the e820_raw.nr_map in 
efi_arch_process_memory_map() is reset for each loop iteration. On Arm 
the bank is appended to the previous iteration. So, I guess resetting 
the banks is the right call?

Pierre, are you planning to send this fix as a patch to the mailinglist? 
If so, please add my:

Tested-by: Julian Vetter <julian.vetter@vates.tech>

Otherwise I'm happy to post the patch with your Suggested-by.

Thank you,
Julian

> 
> Regards,
> 
> Pierre
> 
> [1] https://github.com/tianocore/edk2/pull/12704
> [2] https://github.com/tianocore/edk2/pull/13261#issuecomment-6774136145
> 
> 
> 
> 


