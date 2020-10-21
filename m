Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A220AC4363A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:20:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2557121741
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MQ/bK8aT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2557121741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10023.26428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVCAQ-0003P2-86; Wed, 21 Oct 2020 11:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10023.26428; Wed, 21 Oct 2020 11:20:30 +0000
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
	id 1kVCAQ-0003Ov-4z; Wed, 21 Oct 2020 11:20:30 +0000
Received: by outflank-mailman (input) for mailman id 10023;
 Wed, 21 Oct 2020 11:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVCAO-0003Oq-Np
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:20:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1977d54b-4c15-44de-9130-f81f93f5c406;
 Wed, 21 Oct 2020 11:20:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2322ACB8;
 Wed, 21 Oct 2020 11:20:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVCAO-0003Oq-Np
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:20:28 +0000
X-Inumbo-ID: 1977d54b-4c15-44de-9130-f81f93f5c406
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1977d54b-4c15-44de-9130-f81f93f5c406;
	Wed, 21 Oct 2020 11:20:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603279226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Or0mI1KPB16g6QgFGEQT367aWfREX95j1EIY3ezxcY=;
	b=MQ/bK8aTFNxCCOXo8dewmNwMiuHdGVlRFYVuCH2Fk2Yd4hEBQ93q4xfmU3GUeroSZwOyXG
	f+r4CUn6ZfmLophlr1RuHUs5asEO3WRgBsf+Mh+gHbte51XRViIz0vbyR0Q8Bg244I7u7Z
	WZYGrzFLe3zYQqCd53mJDBTl4lIomhs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C2322ACB8;
	Wed, 21 Oct 2020 11:20:26 +0000 (UTC)
Subject: Re: [PATCH] pci: cleanup MSI interrupts before removing device from
 IOMMU
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
References: <20201021081945.28425-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3799f954-ca43-98a0-9e86-b100c86ea25b@suse.com>
Date: Wed, 21 Oct 2020 13:20:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021081945.28425-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 10:19, Roger Pau Monne wrote:
> Doing the MSI cleanup after removing the device from the IOMMU leads
> to the following panic on AMD hardware:
> 
> Assertion 'table.ptr && (index < intremap_table_entries(table.ptr, iommu))' failed at iommu_intr.c:172
> ----[ Xen-4.13.1-10.0.3-d  x86_64  debug=y   Not tainted ]----
> CPU:    3
> RIP:    e008:[<ffff82d08026ae3c>] drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
> [...]
> Xen call trace:
>    [<ffff82d08026ae3c>] R drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
>    [<ffff82d08026af25>] F drivers/passthrough/amd/iommu_intr.c#update_intremap_entry_from_msi_msg+0xc0/0x342
>    [<ffff82d08026ba65>] F amd_iommu_msi_msg_update_ire+0x98/0x129
>    [<ffff82d08025dd36>] F iommu_update_ire_from_msi+0x1e/0x21
>    [<ffff82d080286862>] F msi_free_irq+0x55/0x1a0
>    [<ffff82d080286f25>] F pci_cleanup_msi+0x8c/0xb0
>    [<ffff82d08025cf52>] F pci_remove_device+0x1af/0x2da
>    [<ffff82d0802a42d1>] F do_physdev_op+0xd18/0x1187
>    [<ffff82d080383925>] F pv_hypercall+0x1f5/0x567
>    [<ffff82d08038a432>] F lstar_enter+0x112/0x120
> 
> That's because the call to iommu_remove_device on AMD hardware will
> remove the per-device interrupt remapping table, and hence the call to
> pci_cleanup_msi done afterwards will find a null intremap table and
> crash.
> 
> Reorder the calls so that MSI interrupts are torn down before removing
> the device from the IOMMU.

I guess this wants

Fixes: d7cfeb7c13ed ("AMD/IOMMU: don't blindly allocate interrupt remapping tables")

?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I've discussed the issue with Andrew and maybe we should try to avoid
> removing the interrupt remapping table on device removal, but then the
> tables would have to be sized to support the maximum amount of
> interrupts instead of the maximum supported by the device currently
> plugged in.

We've specifically limited allocation sizes not so long ago (the
commit above was the first of two steps in that direction). So
I'd rather not see us go back unless there's truly new information
available now.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -834,10 +834,15 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            /*
> +             * Cleanup MSI interrupts before removing the device from the
> +             * IOMMU, or else the internal IOMMU data used to track the device
> +             * interrupts might be already gone.
> +             */
> +            pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
>                  list_del(&pdev->domain_list);
> -            pci_cleanup_msi(pdev);

To be honest I'm not sure about the comment. It should really have
been this way from the very beginning, and VT-d not being affected
makes me wonder what possible improvements are there waiting to be
noticed and then carried out.

Jan

