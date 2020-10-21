Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E385C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 10:52:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6CB2080C
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 10:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Otk9t4Kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6CB2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10008.26380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBin-0000H0-3v; Wed, 21 Oct 2020 10:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10008.26380; Wed, 21 Oct 2020 10:51:57 +0000
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
	id 1kVBin-0000Gt-0V; Wed, 21 Oct 2020 10:51:57 +0000
Received: by outflank-mailman (input) for mailman id 10008;
 Wed, 21 Oct 2020 10:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVBim-0000Gm-0Q
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:51:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e991aee-1363-4b07-a967-0ddd7ef02b28;
 Wed, 21 Oct 2020 10:51:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVBim-0000Gm-0Q
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:51:56 +0000
X-Inumbo-ID: 8e991aee-1363-4b07-a967-0ddd7ef02b28
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8e991aee-1363-4b07-a967-0ddd7ef02b28;
	Wed, 21 Oct 2020 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603277515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c/6PNeJMbMhVj9+L62PuhzsK96Dd1mycxD6opnCaWi4=;
  b=Otk9t4KqHIo+V8YszIM1mXI5M9en/Q/S36FOuV3FOmOSb8HQtH5vguVi
   /XDNcQFEJ8KFBV2FKzXzO3VuEz2gKnA6aDsSHulJxrS29ztgZoHT2m90M
   fbb997cagB4+2GXnMtkeYY7plW42TeXl6eoB68ZBi847YqvkDoNYdrsfr
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X/9pofebGbC3SRGOQ0k4b7miJU30ivGMOuKXiblO+/Q4ptsCuoRB0kCcx/bA11VMpJeXnYF9IN
 qbEVdA1UDdxhEOXi/TCf7/Pg78e5bKuYA+HVsDQRs9InfJeO8jUNSvli05givy+ICEu7kClzQZ
 4uUKg/l0zvwtTQVlMG5Achlzyr8OcBEpiigCdHkBlvRJzuYL3H8E+ecpaHvF3BsYt5xKvCN2Ie
 tKb3o0r01YZOsbdRn9Ld7S8VrPnljIs+cMSBp3H5bUUldPjozjtT6wMCpgk/O249BnQEOpEN8/
 9ro=
X-SBRS: 2.5
X-MesageID: 29471648
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29471648"
Date: Wed, 21 Oct 2020 12:51:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <intel-gfx@lists.freedesktop.org>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: i915 dma faults on Xen
Message-ID: <20201021105110.w3nyd4xod363kp4d@Air-de-Roger>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger>
 <a855e542-4e12-14e2-b663-75e2efceb937@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a855e542-4e12-14e2-b663-75e2efceb937@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 21, 2020 at 12:33:05PM +0200, Jan Beulich wrote:
> On 21.10.2020 11:58, Roger Pau Monné wrote:
> > On Fri, Oct 16, 2020 at 12:23:22PM -0400, Jason Andryuk wrote:
> >> The RMRRs are:
> >> (XEN) [VT-D]Host address width 39
> >> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> >> (XEN) [VT-D]  dmaru->address = fed90000
> >> (XEN) [VT-D]drhd->address = fed90000 iommu->reg = ffff82c00021d000
> >> (XEN) [VT-D]cap = 1c0000c40660462 ecap = 19e2ff0505e
> >> (XEN) [VT-D] endpoint: 0000:00:02.0
> >> (XEN) [VT-D]found ACPI_DMAR_DRHD:
> >> (XEN) [VT-D]  dmaru->address = fed91000
> >> (XEN) [VT-D]drhd->address = fed91000 iommu->reg = ffff82c00021f000
> >> (XEN) [VT-D]cap = d2008c40660462 ecap = f050da
> >> (XEN) [VT-D] IOAPIC: 0000:00:1e.7
> >> (XEN) [VT-D] MSI HPET: 0000:00:1e.6
> >> (XEN) [VT-D]  flags: INCLUDE_ALL
> >> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> >> (XEN) [VT-D] endpoint: 0000:00:14.0
> >> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 78863000 end_addr 78882fff
> >> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> >> (XEN) [VT-D] endpoint: 0000:00:02.0
> >> (XEN) [VT-D]dmar.c:615:   RMRR region: base_addr 7d000000 end_addr 7f7fffff
> >> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> >> (XEN) [VT-D] endpoint: 0000:00:16.7
> >> (XEN) [VT-D]dmar.c:581:  Non-existent device (0000:00:16.7) is
> >> reported in RMRR (78907000, 78986fff)'s scope!
> >> (XEN) [VT-D]dmar.c:596:   Ignore the RMRR (78907000, 78986fff) due to
> > 
> > This is also part of a reserved region, so should be added to the
> > iommu page tables anyway regardless of this message.
> 
> Could you clarify why you think so? RMRRs are tied to devices, so
> if a device in reality doesn't exist (and no other one uses the
> same range), I don't see why an IOMMU mapping would be needed
> (unless to work around some related firmware bug). Plus aiui none
> of the IOMMU faults actually report this range as having got
> accessed.

Since it's the hardware domain that gets the gfx card assigned here it
will get any reserved regions added to the IOMMU page tables in
arch_iommu_hwdom_init. I agree it's not relevant here, since those are
not the regions reported in the IOMMU faults.

Roger.

