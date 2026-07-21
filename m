Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AFDC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:07:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367863.1617524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmC3v-0001qp-QK; Tue, 21 Jul 2026 15:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367863.1617524; Tue, 21 Jul 2026 15:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmC3v-0001qi-MJ; Tue, 21 Jul 2026 15:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1367863;
 Tue, 21 Jul 2026 15:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wmC3u-0001qc-ES
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:07:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmC3u-000i82-1M;
 Tue, 21 Jul 2026 15:07:14 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmC3t-009QPb-2b;
 Tue, 21 Jul 2026 15:07:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=PJMqu48BtdTgv+HhhyUlOBtI507Dky17kRTyGV4Joq0=; b=5ANmsMQHUZvqXCpbvuU/FopxEA
	GooVlxVcLslPoZejZn+rHfv1xVF876IrmMEmdmkCwNfuxZckl/R3BS5k0KQ1P2WW+Y2m9OG4flAj4
	ir3wrMaRA5ROEeR1dyTrgEwBY+S5gCpHPvde2jpqahb1jAP+7dHJL5UyWBOXXx+ppcUk=;
Date: Tue, 21 Jul 2026 17:07:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
Message-ID: <al-LGwlNXH5EfsAw@macbook.local>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
 <al-G7l2IM736d-Q6@macbook.local>
 <05425d51-965f-4176-a297-c5e6f966d886@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05425d51-965f-4176-a297-c5e6f966d886@suse.com>

On Tue, Jul 21, 2026 at 04:57:36PM +0200, Jan Beulich wrote:
> On 21.07.2026 16:49, Roger Pau Monné wrote:
> > On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
> >> Rather than granting permissions when mapping (an operation that DM-s are
> >> allowed to carry out, while they can't invoke ioport-permission), check
> >> whether permissions actually were granted when adding a mapping. This then
> >> also allows relaxing the necessary locking.
> >>
> >> While no longer granting permissions upon mapping is "only" at risk of
> >> breaking guests, no longer revoking permissions upon unmapping strictly
> >> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> >> else a security issue would arise. In-tree code already does so.
> >>
> >> While there switch to using %pd in the two log messages.
> >>
> >> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > It's difficult to not think about someone appearing in 3 or 4 years
> > complaining that this change in behavior has caused them a security
> > issue, but I do agree that the previous behavior was inconsistent at
> > best:
> 
> A positive aspect here is that the similar change for MMIO went without
> any fallout, as far as I'm aware.
> 
> > Acked-by: Roger Pau Monné <roger@xenproject.org>
> 
> Thanks, but ...
> 
> > However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
> > change as we are in 4.23 now.
> 
> ... there's no interface change here. A bump therefore won't buy us
> anything. I'm hesitant to take your ack as long as we disagree here.

It's not an interface change, but it's a change in behavior of an
existing hypercall in a security-relevant way, so people would
generally need to be aware of it, just in case.

Thanks, Roger.

