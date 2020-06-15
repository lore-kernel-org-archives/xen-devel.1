Return-Path: <SRS0=hCD3=74=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D230C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 10:27:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C8520707
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 10:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C8520707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkmKc-0004Cv-KD; Mon, 15 Jun 2020 10:27:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkmKb-0004Cp-QN
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 10:27:09 +0000
X-Inumbo-ID: c3753888-aef2-11ea-b7ee-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3753888-aef2-11ea-b7ee-12813bfff9fa;
 Mon, 15 Jun 2020 10:27:07 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: krUyUks5c+ci7PGGPG0nm5C+BrXk2ERKKujZibaw4mQQrK+XvvT7UAHzvWW54D+FeeSUBgaRu0
 4QFEY+1nx/HMKckswkDwTDWDhwRE5iPpxOk5Ty6hS7//UHjAKLLZWEF8fn4LKLMbmwiuoJ/85P
 izt7PSCd09n5r4R9eVcep1RRLwWX7atxbsosFrMEk5uRbXPokeYq5szyeq3Z34oKdkZPItiLxV
 zPqsVBiEiZ8Z1zmSzrb12sdvOUCZkiFxDeAoDr+P1LnfuXSRRQTa18cY/c4H1HGjCqQox4du6V
 CQ8=
X-SBRS: 2.7
X-MesageID: 20342262
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20342262"
Date: Mon, 15 Jun 2020 12:26:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH 3/3] tools/libxl: Directly map VBIOS to stubdomain
Message-ID: <20200615102659.GB735@Air-de-Roger>
References: <cover.1592171394.git.gorbak25@gmail.com>
 <9817b73ea628c7ac86903bb9aa7fcfecf4f7b900.1592171394.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9817b73ea628c7ac86903bb9aa7fcfecf4f7b900.1592171394.git.gorbak25@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Anthony PERARD <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jun 14, 2020 at 10:12:03PM +0000, Grzegorz Uriasz wrote:
> When passing through a IGD VGA device qemu needs to copy the host VBIOS
> to the target domain. Right now the current implementation on the qemu side
> is one big undefined behavior as described in my qemu patchset here:
> https://patchew.org/QEMU/20200428062847.7764-1-gorbak25@gmail.com/

I think it would be good to elaborate a bit more here on the issue,
that link could go away and we still need to keep the reasoning behind
this change in the Xen changelog IMO.

> This patch is tied to the linked patchset for qemu but fortunately
> this patch still works without the qemu part merged. When the qemu part
> gets merged then qemu will access the VBIOS using /dev/mem - this is
> required as currently the linux kernel forbids accessing this memory
> region when the VBIOS is corrupted - which will always be the case as
> described in the linked patchset. When qemu is running inside a linux
> based stubdomain then the stubdomain does not have access to the VBIOS.
> This patch maps the VBIOS to the stubdomain so qemu with my fixes may
> create a shadow copy for the target domain.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  tools/libxl/libxl_pci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index 48b1d8073b..9b9564dd73 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -2445,6 +2445,8 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
>      int ret, i;
>      uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
>      uint64_t vga_iomem_npages = 0x20;
> +    uint64_t vga_vbios_start = 0xc0000 >> XC_PAGE_SHIFT;
> +    uint64_t vga_vbios_npages = 0x20;

Is this always 32 pages? Some claim [0] it's 32KiB (so 8 pages).
Wouldn't it be safer to fetch the size from sysfs or some other place
if possible?

>      uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
>      uint64_t vga_ioport_start[] = {0x3B0, 0x3C0};
>      uint64_t vga_ioport_size[] = {0xC, 0x20};
> @@ -2460,6 +2462,7 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
>                vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
>          return ret;
>      }
> +

Stray change?

>      ret = xc_domain_iomem_permission(CTX->xch, domid,
>                                       vga_iomem_start, vga_iomem_npages, 1);
>      if (ret < 0) {
> @@ -2470,6 +2473,13 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
>          return ret;
>      }
>  
> +    /* VGA ROM */
> +    ret = xc_domain_memory_mapping(CTX->xch, stubdom_domid, vga_vbios_start, vga_vbios_start, vga_vbios_npages, DPCI_ADD_MAPPING);

Line is too long, please limit lines to 75 characters (see
libxl/CODING_STYLE).

> +    if (ret < 0) {
> +        LOGED(ERROR, domid, "failed to map VBIOS to stubdom%d", stubdom_domid);

AFAICT you have to use LOGEVD here, since the errno value will be
returned in 'ret'. Ie:

if (ret < 0) {
    LOGED(ERROR, ret, domid, "failed to map VBIOS to stubdom%d",
          stubdom_domid);
    return ERROR_FAIL;
}

Thanks, Roger.

[0] https://wiki.osdev.org/Memory_Map_(x86)#Overview

