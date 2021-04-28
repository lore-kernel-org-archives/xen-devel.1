Return-Path: <SRS0=iCHD=JZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677DAC433ED
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 14:06:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F389F61107
	for <xen-devel@archiver.kernel.org>; Wed, 28 Apr 2021 14:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F389F61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119394.225858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkpM-0002lU-68; Wed, 28 Apr 2021 14:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119394.225858; Wed, 28 Apr 2021 14:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkpM-0002lN-2K; Wed, 28 Apr 2021 14:06:08 +0000
Received: by outflank-mailman (input) for mailman id 119394;
 Wed, 28 Apr 2021 14:06:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbkpK-0002lH-Dl
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 14:06:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d08075ab-3c2a-4a77-9ac1-c7e3cd08bda9;
 Wed, 28 Apr 2021 14:06:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16DD0B197;
 Wed, 28 Apr 2021 14:06:04 +0000 (UTC)
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
X-Inumbo-ID: d08075ab-3c2a-4a77-9ac1-c7e3cd08bda9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619618764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4s+PUF2FwuA2cRUZo+p7z3OIOchDLcXVbXHxrJiSVE=;
	b=Geb3MzCzE8rjPufBr/Om8ptdMg9/HVIVvs42RArlUC5y+XMsNuS2qUqd+utXMqizvHWzUd
	gSb9yVmVTZx8DYUSYsljqvNDY8NEK1BHlKQV7SNn77m23glMNaEGbYx+Y+XZdjbGCyOh/Q
	OyeTFj2/UYyX24XKBBKrdcF876ewbFQ=
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69e0f583-3c61-afe9-0710-6531f99e8a2e@suse.com>
Date: Wed, 28 Apr 2021 16:06:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 18:21, Rahul Singh wrote:
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -21,7 +21,7 @@
>  #include <xen/guest_access.h>
>  #include <xen/xenoprof.h>
>  #include <xen/iommu.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>  #include <asm/msi.h>
>  #endif
>  #include <public/xen.h>
> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
>          }
>          return security_irq_sid(irq, sid);
>      }
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>      {
>          struct irq_desc *desc = irq_to_desc(irq);
>          if ( desc->msi_desc && desc->msi_desc->dev ) {
> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
>  static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
>                                   u32 *sid, struct avc_audit_data *ad)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>      const struct msi_info *msi = data;
>      u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>  
> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
>  static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
>                                     u32 *sid, struct avc_audit_data *ad)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>      const struct pci_dev *pdev = data;
>      u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
>  

Is all of this really related to MSI interception? Iirc the code here
has been around for much longer, and hence is more related to MSI
support in Xen in general (as required for PV guests in particular).

Jan

