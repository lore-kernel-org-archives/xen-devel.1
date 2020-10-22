Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C739C4363A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 00:20:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E1C2417F
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 00:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqIhVxU5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E1C2417F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10159.26883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVOKu-0002NZ-FR; Thu, 22 Oct 2020 00:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10159.26883; Thu, 22 Oct 2020 00:20:08 +0000
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
	id 1kVOKu-0002NS-CN; Thu, 22 Oct 2020 00:20:08 +0000
Received: by outflank-mailman (input) for mailman id 10159;
 Thu, 22 Oct 2020 00:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kVOKt-0002NN-Lr
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 00:20:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f725dc5b-7d78-486c-a20d-642730a1b244;
 Thu, 22 Oct 2020 00:20:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7E502417F;
 Thu, 22 Oct 2020 00:20:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WvX7=D5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kVOKt-0002NN-Lr
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 00:20:07 +0000
X-Inumbo-ID: f725dc5b-7d78-486c-a20d-642730a1b244
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f725dc5b-7d78-486c-a20d-642730a1b244;
	Thu, 22 Oct 2020 00:20:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C7E502417F;
	Thu, 22 Oct 2020 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603326006;
	bh=lPzxm99+i5rO/lsk5iXuDzwjGK/Ff+ttH2/6pmLFRw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iqIhVxU5P4ndtg5ZXp1gLFvY41C+i9WB+M9RKTfLh86Q0WEK1EreOcucYnygh0Ye1
	 DKNOoFbDTQaV10fy2TddY0EAc5qedBFwCZfgmp8ttZUDsRqQum9EfQ7wXmQtEZq9Qw
	 vlPRzysmUVJXSFjflYJ/NTrUApxZV6HoZM+qlyfM=
Date: Wed, 21 Oct 2020 17:20:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
In-Reply-To: <20201021221253.GA73207@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2010211718150.12247@sstabellini-ThinkPad-T480s>
References: <20201021221253.GA73207@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Oct 2020, Elliott Mitchell wrote:
> Absence of a SPCR table likely means the console is a framebuffer.  In
> such case acpi_iomem_deny_access() should NOT fail.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/acpi/domain_build.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 1b1cfabb00..bbdc90f92c 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>      status = acpi_get_table(ACPI_SIG_SPCR, 0,
>                              (struct acpi_table_header **)&spcr);
>  
> -    if ( ACPI_FAILURE(status) )
> +    if ( ACPI_SUCCESS(status) )
>      {
> -        printk("Failed to get SPCR table\n");
> -        return -EINVAL;
> +        mfn = spcr->serial_port.address >> PAGE_SHIFT;
> +        /* Deny MMIO access for UART */
> +        rc = iomem_deny_access(d, mfn, mfn + 1);
> +        if ( rc )
> +            return rc;
> +    }
> +    else
> +    {
> +        printk("Failed to get SPCR table, Xen console may be unavailable\n");
>      }
> -
> -    mfn = spcr->serial_port.address >> PAGE_SHIFT;
> -    /* Deny MMIO access for UART */
> -    rc = iomem_deny_access(d, mfn, mfn + 1);
> -    if ( rc )
> -        return rc;
>  
>      /* Deny MMIO access for GIC regions */
>      return gic_iomem_deny_access(d);

