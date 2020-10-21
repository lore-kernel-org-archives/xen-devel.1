Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E70C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:34:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A3020872
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QU/k9kr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A3020872
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10041.26452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVCO2-0004es-UJ; Wed, 21 Oct 2020 11:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10041.26452; Wed, 21 Oct 2020 11:34:34 +0000
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
	id 1kVCO2-0004el-QW; Wed, 21 Oct 2020 11:34:34 +0000
Received: by outflank-mailman (input) for mailman id 10041;
 Wed, 21 Oct 2020 11:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVCO1-0004eg-FH
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:34:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 779358ad-6197-4d9c-bef0-312110d0c995;
 Wed, 21 Oct 2020 11:34:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVCO1-0004eg-FH
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:34:33 +0000
X-Inumbo-ID: 779358ad-6197-4d9c-bef0-312110d0c995
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 779358ad-6197-4d9c-bef0-312110d0c995;
	Wed, 21 Oct 2020 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603280072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J9FAwl1Iadl4BWGhOj+igxHGZHD4tORBONzjQO9PtDQ=;
  b=QU/k9kr2SFo61imKYGkGETyf49y+m6G0iiibg6q/WAVs7Lc6FE+SSnOI
   pKyaS7pwJGcarIv/Afsocw+irwLgRXPiD4VRFy2P+RJrWXZuvC0Pzh72J
   WE6OUUKt3RLyrRiuZF2i0Z1MT1no6lq+81Xa7H0yfl8e9ArXJas0uHe9B
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zzHIZr1zb7xQqPtakwZxhbNkxAe6FSNXlECuthiGZWMFc2oWOuLVXZFDBRt2y597h055NQgeow
 hMrDK7ClNvP7/9ZMEARkQZOKUe8ErQUeIuzjq4ik+9SDpgHybY4PO5c9Lj33LlVcZKcwMyQdPE
 5+GuXCGzeQdcK8BLW8j296OXHj83tpuLqt19Q7NRbVF0vKyVWoeeCFVyLQPH7nVeRTtuHUdgh0
 CKG0mgfW/QW2O8Y4JvwWDzmUY+GpoWKnOuTHO49WjZ8xYYBjQO7Iq8gk28uhImJ6NE2no0fUdQ
 RqA=
X-SBRS: 2.5
X-MesageID: 29443929
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29443929"
Date: Wed, 21 Oct 2020 13:34:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] pci: cleanup MSI interrupts before removing device from
 IOMMU
Message-ID: <20201021113417.t3cnbm4hqvmwk2up@Air-de-Roger>
References: <20201021081945.28425-1-roger.pau@citrix.com>
 <3799f954-ca43-98a0-9e86-b100c86ea25b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3799f954-ca43-98a0-9e86-b100c86ea25b@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 21, 2020 at 01:20:27PM +0200, Jan Beulich wrote:
> On 21.10.2020 10:19, Roger Pau Monne wrote:
> > Doing the MSI cleanup after removing the device from the IOMMU leads
> > to the following panic on AMD hardware:
> > 
> > Assertion 'table.ptr && (index < intremap_table_entries(table.ptr, iommu))' failed at iommu_intr.c:172
> > ----[ Xen-4.13.1-10.0.3-d  x86_64  debug=y   Not tainted ]----
> > CPU:    3
> > RIP:    e008:[<ffff82d08026ae3c>] drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
> > [...]
> > Xen call trace:
> >    [<ffff82d08026ae3c>] R drivers/passthrough/amd/iommu_intr.c#get_intremap_entry+0x52/0x7b
> >    [<ffff82d08026af25>] F drivers/passthrough/amd/iommu_intr.c#update_intremap_entry_from_msi_msg+0xc0/0x342
> >    [<ffff82d08026ba65>] F amd_iommu_msi_msg_update_ire+0x98/0x129
> >    [<ffff82d08025dd36>] F iommu_update_ire_from_msi+0x1e/0x21
> >    [<ffff82d080286862>] F msi_free_irq+0x55/0x1a0
> >    [<ffff82d080286f25>] F pci_cleanup_msi+0x8c/0xb0
> >    [<ffff82d08025cf52>] F pci_remove_device+0x1af/0x2da
> >    [<ffff82d0802a42d1>] F do_physdev_op+0xd18/0x1187
> >    [<ffff82d080383925>] F pv_hypercall+0x1f5/0x567
> >    [<ffff82d08038a432>] F lstar_enter+0x112/0x120
> > 
> > That's because the call to iommu_remove_device on AMD hardware will
> > remove the per-device interrupt remapping table, and hence the call to
> > pci_cleanup_msi done afterwards will find a null intremap table and
> > crash.
> > 
> > Reorder the calls so that MSI interrupts are torn down before removing
> > the device from the IOMMU.
> 
> I guess this wants
> 
> Fixes: d7cfeb7c13ed ("AMD/IOMMU: don't blindly allocate interrupt remapping tables")
> 
> ?

Oh yes, I didn't git blame the file to figure out when such allocating
and freeing was added.

> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -834,10 +834,15 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
> >      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> >          if ( pdev->bus == bus && pdev->devfn == devfn )
> >          {
> > +            /*
> > +             * Cleanup MSI interrupts before removing the device from the
> > +             * IOMMU, or else the internal IOMMU data used to track the device
> > +             * interrupts might be already gone.
> > +             */
> > +            pci_cleanup_msi(pdev);
> >              ret = iommu_remove_device(pdev);
> >              if ( pdev->domain )
> >                  list_del(&pdev->domain_list);
> > -            pci_cleanup_msi(pdev);
> 
> To be honest I'm not sure about the comment. It should really have
> been this way from the very beginning, and VT-d not being affected
> makes me wonder what possible improvements are there waiting to be
> noticed and then carried out.

I'm fine with dropping the comment, I would also expect the normal
flow to be to cleanup any interrupt and then remove the device,
instead of the other way around.

Roger.

