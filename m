Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67765C4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 16:08:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367969.1617621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmD0y-0002LO-Dn; Tue, 21 Jul 2026 16:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367969.1617621; Tue, 21 Jul 2026 16:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmD0y-0002LH-Ar; Tue, 21 Jul 2026 16:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1367969;
 Tue, 21 Jul 2026 16:08:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wmD0w-0002K6-S5
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 16:08:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmD0w-000k1c-2h;
 Tue, 21 Jul 2026 16:08:14 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wmD0w-00BQ6B-0m;
 Tue, 21 Jul 2026 16:08:14 +0000
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
	bh=+a6aQGbPZOScWCYb5xrVBtkrB2fST9T41N9UrPExeyw=; b=68eiUV8oKksBQKES+LC72/6lL/
	AF6LTUXJiBqrhj3HG7CRUXrkSwCyDXjnotFzdOZsjU47ge/A/Payg3+N2UWbZ3FHrlivah8AafYJm
	JYbIp8Mu6grFVTxeFFtYzUauamem2R1BSSBaCJhruyBg/rKFu55uHYPgTJHIshXs4aKU=;
Date: Tue, 21 Jul 2026 18:08:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
Message-ID: <al-ZaKel5bSKcTp8@macbook.local>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
 <al-G7l2IM736d-Q6@macbook.local>
 <05425d51-965f-4176-a297-c5e6f966d886@suse.com>
 <al-LGwlNXH5EfsAw@macbook.local>
 <5653aede-dbff-405d-9df7-2edb7d8180d1@suse.com>
 <75581474-8ef4-48c4-8c19-fc0549730552@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75581474-8ef4-48c4-8c19-fc0549730552@suse.com>

On Tue, Jul 21, 2026 at 05:36:37PM +0200, Jan Beulich wrote:
> On 21.07.2026 17:34, Jan Beulich wrote:
> > On 21.07.2026 17:07, Roger Pau Monné wrote:
> >> On Tue, Jul 21, 2026 at 04:57:36PM +0200, Jan Beulich wrote:
> >>> On 21.07.2026 16:49, Roger Pau Monné wrote:
> >>>> On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
> >>>>> Rather than granting permissions when mapping (an operation that DM-s are
> >>>>> allowed to carry out, while they can't invoke ioport-permission), check
> >>>>> whether permissions actually were granted when adding a mapping. This then
> >>>>> also allows relaxing the necessary locking.
> >>>>>
> >>>>> While no longer granting permissions upon mapping is "only" at risk of
> >>>>> breaking guests, no longer revoking permissions upon unmapping strictly
> >>>>> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
> >>>>> else a security issue would arise. In-tree code already does so.
> >>>>>
> >>>>> While there switch to using %pd in the two log messages.
> >>>>>
> >>>>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> It's difficult to not think about someone appearing in 3 or 4 years
> >>>> complaining that this change in behavior has caused them a security
> >>>> issue, but I do agree that the previous behavior was inconsistent at
> >>>> best:
> >>>
> >>> A positive aspect here is that the similar change for MMIO went without
> >>> any fallout, as far as I'm aware.
> >>>
> >>>> Acked-by: Roger Pau Monné <roger@xenproject.org>
> >>>
> >>> Thanks, but ...
> >>>
> >>>> However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
> >>>> change as we are in 4.23 now.
> >>>
> >>> ... there's no interface change here. A bump therefore won't buy us
> >>> anything. I'm hesitant to take your ack as long as we disagree here.
> >>
> >> It's not an interface change, but it's a change in behavior of an
> >> existing hypercall in a security-relevant way, so people would
> >> generally need to be aware of it, just in case.
> > 
> > But the interface version bump won't necessarily make anyone aware. Things
> > will continue to build as before, and there's also no binary incompatibility.
> > The best way of making people aware is the ChangeLog entry that iirc you had
> > asked for (and that's now there).
> 
> I should probably add that bumping the interface version now also wouldn't do
> any harm; there's at least one other series pending which wants to do this
> anyway in this starting release cycle. Yet I still think the bumping doesn't
> quite belong here.

I was going to say - it's very likely the interface will be bumped
anyway.  I'm not going to insist, the text in domctl.h does mention
that the interface should only be bumped "in case the interface is
modified in an incompatible way", and you might argue there's no
interface change here at all, as the interface stays the same, what
changes is the underlying implementation.

Thanks, Roger.

