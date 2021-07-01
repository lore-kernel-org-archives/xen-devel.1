Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37311C11F69
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 16:45:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2D4613E8
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 16:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB2D4613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148969.275337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzoa-0006uj-6l; Thu, 01 Jul 2021 16:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148969.275337; Thu, 01 Jul 2021 16:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzoa-0006uc-3o; Thu, 01 Jul 2021 16:45:24 +0000
Received: by outflank-mailman (input) for mailman id 148969;
 Thu, 01 Jul 2021 16:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyzoY-0006uW-Rl
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 16:45:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b923b309-da8b-11eb-834c-12813bfff9fa;
 Thu, 01 Jul 2021 16:45:21 +0000 (UTC)
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
X-Inumbo-ID: b923b309-da8b-11eb-834c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625157921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZwU/kaaaYYYQFi6JKPF0BJjEhDRHt0Zz/RNYp0r6Jw4=;
  b=YwxXfbr4QKaHgKvWV9a4TuXqesXWmEwPPdSrTIsweFH9oBxbrNWAB8iZ
   nth7dk2pkLB/VXOvP9+FJphs1EYLJLJDhSYD0pKPJYH7j5m8B6tlHJhA3
   XulpaWJpp2AQIBPcqvCcTdGSVa/NJwEUIzbfCnhD3G2XEMQNoU8MEHOnC
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: x4UbEOTOCt/EN0W4ahuZCEizoyTjrBKdA67OJj+ehW6gThDWBnpdpnhgEZlyEAXZs/emnv/DO3
 DRLVm7WxKM/FIJVxmH12g+onW/f6oty6E+fEpPBaTe2om5Xr1b13vbykLIMydZtGSXmCGeFUnS
 Mba8I6R63TF0qEdQj9A0D1cxV7h8PsxLeGYceIy3uf8K8dtwyqbiDqStVBscctlYQ2T5K0ZZos
 MJdh4BwKQ8/rAXFj3cSs4n8NOqLnu5fZGbDv8yVo9JRiIaBwiiDOM6vjuMkhMIcr2mwr7wgYH/
 TIo=
X-SBRS: 5.1
X-MesageID: 47392510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c5dWiakvNne2PxP/O1u4kVnY4nDpDfMqiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdO9qXO1z+8X3WBjB8beYOCGghrrEGgG1+ffKlLbakvDH4JmtJ
 uINpIOc+EYbmIKyPoSgjPIaurIqePvmM/HuQ6d9QYUcehEUdAG0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLomSs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlbAkEyzzYPbiJaYfy5wzdk9vfsmrCV+
 O8/ivICv4Ds085uFvF/ScFlTOQjwrGoEWStWNwyUGT3vARAghKT/apzLgpDCfx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE4EYKgKoWgRVkIMIjQa4UqYJa9F5JGJ0AGC789ekcYa
 JTJdCZ4PgTa1+ccnvI+mJm2tPEZAV6Iv6qeDlMhiWu6UkZoJm59Tpv+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPQHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Ws9il0j6IJy4EUhICbfRGrWRQriY+tsv8fCsrUV7
 KoOZpMD/LmJWvqEoBZmxb5R4RTLncXXsETp5IjQFSFrtjQJoCCjJ2uTB/3HsubLd8JYBKMPp
 IzZkm/GCwb1DHZZpbRummlZ5rCQD2OwbtgVLPX5u4J1cwHPpdC9g4IlF+++saHQAcy+JALQA
 ==
X-IronPort-AV: E=Sophos;i="5.83,315,1616472000"; 
   d="scan'208";a="47392510"
Date: Thu, 1 Jul 2021 17:45:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 33/40] tools: change struct precopy_stats to
 precopy_stats_t
Message-ID: <YN3xGNq2vkTXqwZv@perard>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-34-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210701095635.15648-34-olaf@aepfle.de>

On Thu, Jul 01, 2021 at 11:56:28AM +0200, Olaf Hering wrote:
> This will help libxl_save_msgs_gen.pl to copy the struct as a region of memory.
> 
> No change in behavior intented.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/include/xensaverestore.h  | 7 +++----
>  tools/libs/saverestore/common.h | 2 +-
>  tools/libs/saverestore/save.c   | 6 +++---
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/xensaverestore.h b/tools/include/xensaverestore.h
> index 0410f0469e..dca0134605 100644
> --- a/tools/include/xensaverestore.h
> +++ b/tools/include/xensaverestore.h
> @@ -23,18 +23,17 @@
>  #define XCFLAGS_DEBUG     (1 << 1)
>  
>  /* For save's precopy_policy(). */
> -struct precopy_stats

I don't think changing the existing API is a good idea. It's probably ok
to add a typedef. But can't libxl_save_msgs_gen.pl been able to deal with
thing like 'struct precopy_stats' ? It seems to be able to deal with
'unsigned long'.

> -{
> +typedef struct {
>      unsigned int iteration;
>      unsigned long total_written;
>      long dirty_count; /* -1 if unknown */
> -};
> +} precopy_stats_t;
>  

Thanks,

-- 
Anthony PERARD

