Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4266FF53D92
	for <xen-devel@archiver.kernel.org>; Mon, 16 Mar 2026 20:04:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1255742.1550580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2EAr-0002Ls-AY; Mon, 16 Mar 2026 20:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255742.1550580; Mon, 16 Mar 2026 20:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2EAr-0002Ll-7C; Mon, 16 Mar 2026 20:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1255742;
 Mon, 16 Mar 2026 20:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QYmb=BQ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1w2EAq-0002La-Hh
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 20:04:24 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510a60ff-2173-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 21:04:20 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 62GK3bl6095401
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 16 Mar 2026 16:03:43 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 62GK3bFC095400;
 Mon, 16 Mar 2026 13:03:37 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 510a60ff-2173-11f1-9ccf-f158ae23cfc8
Date: Mon, 16 Mar 2026 13:03:37 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: David Thomson <dt@linux-mail.net>
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, olekstysh@gmail.com,
        tglx@linutronix.de, jbeulich@suse.com, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen/acpi-processor: fix _CST detection using
 undersized evaluation buffer
Message-ID: <abhiGd_AOyR45ZyN@mattapan.m5p.com>
References: <20260224093707.19679-1-dt@linux-mail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224093707.19679-1-dt@linux-mail.net>

On Tue, Feb 24, 2026 at 09:37:11AM +0000, David Thomson wrote:
> 
> On a system with dom0_max_vcpus=2 and 8 physical CPUs, only PCPUs 0-1
> receive C-state data. PCPUs 2-7 are stuck in C0/C1 idle, unable to
> enter C2/C3. This costs measurable wall power (4W observed on an Intel
> Core Ultra 7 265K with Xen 4.20).
> 
> The function never uses the _CST return value -- it only needs to know
> whether _CST exists. Replace the broken acpi_evaluate_object() call with
> acpi_has_method(), which correctly detects _CST presence using
> acpi_get_handle() without any buffer allocation. This brings C-state
> detection to parity with the P-state path, which already works correctly
> for Phase 2 CPUs.
> 
> Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
> Signed-off-by: David Thomson <dt@linux-mail.net>

Tested-by: Elliott Mitchell <ehem+xen@m5p.com>

The window of opportunity happened and I confirmed it fixed the issue for
me.  I don't know whether this already got in though.

> -	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
> -	if (ACPI_FAILURE(status)) {
> -		if (!pblk)
> -			return AE_OK;
> -	}
> +	if (!pblk && !acpi_has_method(handle, "_CST"))
> +		return AE_OK;
>  	/* .. and it has a C-state */
>  	__set_bit(acpi_id, acpi_id_cst_present);

I had traced the problem to this spot a while back, but I didn't know
what an appropriate change was.  Since I had a workaround this wasn't
urgent.  I do know this effects many others, I don't know how urgent this
bug is for everyone else.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



