Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF65C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:06:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388846.1629820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3yt-0005Ib-NF; Wed, 12 Aug 2026 08:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388846.1629820; Wed, 12 Aug 2026 08:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3yt-0005IU-KV; Wed, 12 Aug 2026 08:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1388846;
 Wed, 12 Aug 2026 08:06:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wu3ys-0005IM-9D
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:06:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wu3yr-000N71-10;
 Wed, 12 Aug 2026 08:06:33 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wu3yq-00A0y3-2Q;
 Wed, 12 Aug 2026 08:06:33 +0000
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
	bh=DNvJgBKv9EcweeG33ndh1gRI6R16bFALRr2RtFjgWPg=; b=FaHNakU0lPRthmb/pyqwxhnCKC
	WCOxssShXRrqhqCjcNGLCTLLnuT/PfrADqgV86vDg4a9poGydzaHe6m1sedSxyTyFzMRFy9HxE7OH
	bQ+/PT72Z4hIFUk60MWzy0jJW2uKvlTIIWQTUX6BvSgFzrPSD3ZM2bC5dkobiUxJsQPQ=;
Date: Wed, 12 Aug 2026 10:06:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/pci: prevent cross-device accesses in
 pci_mmcfg_{read,write}()
Message-ID: <anwpfyZ4PIbd5m4S@macbook.local>
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-2-roger@xenproject.org>
 <c818745e-6f61-4b32-b7f5-ee5b7ff82981@suse.com>
 <anWQ15K8vi3t1sgF@macbook.local>
 <a711a0d1-dbf0-44fb-a419-38abc62480ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a711a0d1-dbf0-44fb-a419-38abc62480ad@suse.com>

On Wed, Aug 12, 2026 at 08:28:50AM +0200, Jan Beulich wrote:
> On 07.08.2026 10:01, Roger Pau Monné wrote:
> > On Fri, Aug 07, 2026 at 08:22:44AM +0200, Jan Beulich wrote:
> >> On 06.08.2026 17:26, Roger Pau Monne wrote:
> >>> Introduce a specific check that prevents an accesses from spilling across
> >>> two devices.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> albeit with a remark:
> >>
> >>> --- a/xen/arch/x86/x86_64/mmconfig_64.c
> >>> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
> >>> @@ -61,7 +61,8 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
> >>>      char __iomem *addr;
> >>>  
> >>>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> >>> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
> >>> +    if (unlikely((bus > 255) || (devfn > 255) ||
> >>> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE))) {
> >>>  err:        *value = -1;
> >>>          return -EINVAL;
> >>>      }
> >>> @@ -91,7 +92,8 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
> >>>      char __iomem *addr;
> >>>  
> >>>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> >>> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095)))
> >>> +    if (unlikely((bus > 255) || (devfn > 255) ||
> >>> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE)))
> >>>          return -EINVAL;
> >>>  
> >>>      addr = pci_dev_base(seg, bus, devfn);
> >>
> >> In both cases the unlikely() uses won't have the intended effect, from all I
> >> know. They would help as used here only if the compiler managed to fold all
> >> three parts of the ||-expression into a single conditional branch, which I
> >> don't think it would end up doing.
> > 
> > I don't mind dropping the unlikely() while changing the line.  I tend
> > to leave those alone if present, even when I'm not sure they are
> > actually helpful.
> 
> I think unlikely() is actually reasonable to have here, yet it would need to
> be four of them, not just one. Unless reachable from a DomU-accessible path,
> converting to BUG_ON() (or ASSERT_UNREACHABLE()) instead would also be an
> option.

Hm, let's do that in a separate patch, I don't want to merge it with
the work here.

> >  The comment ahead of the check is also not very
> > useful IMO, but I've decided to leave it alone.
> 
> Indeed, that's an odd thing to survive over 20 years (I think).

I can also take care of the comment there.

Thanks, Roger.

