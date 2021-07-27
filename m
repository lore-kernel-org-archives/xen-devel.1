Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B161AC4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 10:37:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7347E61881
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 10:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7347E61881
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161110.295820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8KSf-0002f3-Hw; Tue, 27 Jul 2021 10:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161110.295820; Tue, 27 Jul 2021 10:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8KSf-0002ew-Eq; Tue, 27 Jul 2021 10:37:21 +0000
Received: by outflank-mailman (input) for mailman id 161110;
 Tue, 27 Jul 2021 10:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o+S4=MT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m8KSd-0002eq-MR
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 10:37:19 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c1f7dba-eec6-11eb-96e1-12813bfff9fa;
 Tue, 27 Jul 2021 10:37:16 +0000 (UTC)
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
X-Inumbo-ID: 9c1f7dba-eec6-11eb-96e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627382235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgmXpbcizeDU4qnGZ5z/IZpuzSteQAPG8N/hxlwq+xk=;
  b=WmFlxxHoK747u5j8uUzybEbjc8VDulk2uHNapz8u7un85EZwiEkCz16h
   gGq/DNBaNJOQrhilWhxMoojJbfKKXebRUMJyqPE2AjskiMMI/Za9j8jzD
   b0bGBf1fxafwliZWc53hWHZJANeyYBejQtlFXOc4ZwVzZvcMCdZLTSwF/
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: trqrXvuzcF2UKepUZfHcvBn7m6xDtU8s8ZPk1oYCy+sQNNYAGXCSxB89Kfa523LvxO6VLpbknH
 AE9BA95EPncGjCKM0rAvoLuVMmyuMCvyChd7Sf3PtPXEnu1Yrg9qRDvZ9Qog42MqHmP4dAyb1u
 +hLrmjpM7irqFygGpzhvP/uYQXvYQfPq0rN8Ls2J2lrLWtQo1EVZokTyGcAbWy1os1aCJRK3aY
 oNXQKB/dSrKnLs+goVL3fnwrEpXB8mIJ1AYLLIB/ujW2TMz3vxK2IjzkePJj2+MvlJHz/rFluI
 B07PRI3Tvc/3YjMwHoCCHnzg
X-SBRS: 5.1
X-MesageID: 49167891
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lUrvy6HJNidVVkg3pLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="49167891"
Date: Tue, 27 Jul 2021 11:37:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Scott Davis <scottwd@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, "Juergen
 Gross" <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg
Message-ID: <YP/h1ySgvfEhArVN@perard>
References: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>

On Thu, Jul 22, 2021 at 12:54:30PM -0400, Scott Davis wrote:
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.
> 
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index ae7fe27c1f..b9ba16d698 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1030,6 +1030,18 @@ typedef struct libxl__ctx libxl_ctx;
>   */
>  #define LIBXL_HAVE_BUILDINFO_KERNEL 1
>  
> +/*
> + * LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN
> + *
> + * If this is defined, then the libxl_domain_build_info structure will contain
> + * the following fields that specify options for device model stubdomains:
> + *  - stubdomain_memkb:   integer indicating stubdomain RAM size
> + *  - stubdomain_kernel:  string indicating stubdomain kernel image location
> + *  - stubdomain_cmdline: string of parameters to pass to the stubdomain kernel
> + *  - stubdomain_ramdisk: string indicating stubdomain ramdisk location
> + */
> +#define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN 1

Looks like a LIBXL_HAVE_ macro was missing in the original addition of
all other stubdomain_*, so it's probably fine to add a macro now for all
of them:

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index f45adddab0..e782e15cf2 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -523,6 +523,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("device_model_stubdomain", libxl_defbool),
>      ("stubdomain_memkb",   MemKB),
>      ("stubdomain_kernel",  string),
> +    ("stubdomain_cmdline", string),
>      ("stubdomain_ramdisk", string),

Thanks,

-- 
Anthony PERARD

