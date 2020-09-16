Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C029C43461
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 06:44:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B337C20770
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 06:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="M/8SXgwD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B337C20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRB1-0006iu-NV; Wed, 16 Sep 2020 06:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIRB0-0006ip-5d
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 06:44:22 +0000
X-Inumbo-ID: 91b4c02a-8075-4eac-85de-44e01bb13f32
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91b4c02a-8075-4eac-85de-44e01bb13f32;
 Wed, 16 Sep 2020 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600238658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qvsDQcHLwkmLrJhhd333emIGoAM9fd9Gg45i54mrU74=;
 b=M/8SXgwDb4+E93k1bA/mp6OrRfQKLrGiJh6lfwFF3Zqzc/4t6iE8QgUf
 TuOfUGCGdEKe/SNMQSpD8AIYwSIgizbwhI94KOHyPK2AE9jyOTjP7KW/i
 7+RxCpMAsJYj/5M2PyZIg4hBKXsORo1gyp/FF25mvbB+TJDFd3my9HjtQ c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dWQF7fmbMFHTl2leeIfDlKYVllRd/U0HsiF9KXd9egfmaSjkUma16zAMyycNdcIciIT2ZaY6Vc
 jIB+d2Izwb62SbjVCOYeQIGOZpx8QniyhKrwHkkf/Xs8EIZTuKyVOemFMZuzAMFw+Xp2epErhw
 5xOBq4lPhoevTR4tMjwTIJuf/dJrr8z5/zDtxo2XH8QiW4jNIt+BMO9l42Ez7U3fhm019p5U2p
 TK3RadbQ5gspq5ROJQGmOJglo3Y1j+fcazg/fNGphVMEeDnaKjD37qCLsA5WfKAB06XQN/PKWn
 SUY=
X-SBRS: 2.7
X-MesageID: 26914072
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,431,1592884800"; d="scan'208";a="26914072"
Date: Wed, 16 Sep 2020 08:43:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
 <andrew.cooper3@citrix.com>, <wl@xen.org>
Subject: Re: [PATCH v4 1/4] efi/boot.c: add file.need_to_free
Message-ID: <20200916064358.GP753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-2-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914115013.814079-2-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Mon, Sep 14, 2020 at 07:50:10AM -0400, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  xen/common/efi/boot.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 4022a672c9..7156139174 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -102,6 +102,7 @@ union string {
>  
>  struct file {
>      UINTN size;
> +    bool need_to_free;
>      union {
>          EFI_PHYSICAL_ADDRESS addr;
>          void *ptr;
> @@ -279,13 +280,13 @@ void __init noreturn blexit(const CHAR16 *str)
>      if ( !efi_bs )
>          efi_arch_halt();
>  
> -    if ( cfg.addr )
> +    if ( cfg.addr && cfg.need_to_free )
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.addr )
> +    if ( kernel.addr && kernel.need_to_free )
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.addr )
> +    if ( ramdisk.addr && ramdisk.need_to_free )
>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.addr )
> +    if ( xsm.addr && xsm.need_to_free )
>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
>  
>      efi_arch_blexit();
> @@ -572,6 +573,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                           HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>          ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>                                      PFN_UP(size), &file->addr);
> +        file->need_to_free = true;

Strictly speaking, don't you need to set need_to_free only if
AllocatePages has succeed? I guess it doesn't matter much because addr
would be zapped to 0 if allocation fails.

Thanks, Roger.

