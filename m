Return-Path: <SRS0=BUeu=OV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECB8C433EF
	for <xen-devel@archiver.kernel.org>; Fri,  1 Oct 2021 11:23:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA936103C
	for <xen-devel@archiver.kernel.org>; Fri,  1 Oct 2021 11:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA936103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.200553.355066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGcx-0001Eg-RI; Fri, 01 Oct 2021 11:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200553.355066; Fri, 01 Oct 2021 11:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGcx-0001EZ-NE; Fri, 01 Oct 2021 11:22:55 +0000
Received: by outflank-mailman (input) for mailman id 200553;
 Fri, 01 Oct 2021 11:22:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p9Zs=OV=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1mWGcw-0001ET-Kk
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:22:54 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee288be-ef50-430a-85ba-7a17e9aa2ae8;
 Fri, 01 Oct 2021 11:22:53 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1mWGcu-0009Cq-7O; Fri, 01 Oct 2021 11:22:52 +0000
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
X-Inumbo-ID: 2ee288be-ef50-430a-85ba-7a17e9aa2ae8
Date: Fri, 1 Oct 2021 12:22:52 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: sh_unshadow_for_p2m_change() vs p2m_set_entry()
Message-ID: <YVbvjKU/m8FZtRPX@deinos.phlegethon.org>
References: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
 <YVIo1sR283L/MUeN@deinos.phlegethon.org>
 <59b46317-e0ce-afcb-55d0-90379c4600e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <59b46317-e0ce-afcb-55d0-90379c4600e1@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 07:59 +0200 on 01 Oct (1633075173), Jan Beulich wrote:
> On 27.09.2021 22:25, Tim Deegan wrote:
> > At 13:31 +0200 on 24 Sep (1632490304), Jan Beulich wrote:
> >> The 2M logic also first checks _PAGE_PRESENT (and _PAGE_PSE), while
> >> the 4k logic appears to infer that the old page was present from
> >> p2m_is_{valid,grant}().
> > 
> > I think the p2m_type check is the right one (rather than
> > _PAGE_PRESENT), since that's the one that the p2m lookups will obey
> > when causing things to get shadowed.  But the extra _PAGE_PSE check
> > should stay.
> 
> Actually, having transformed things into patch form, I'm now puzzled
> by you explicitly saying this. Wasn't this check wrong in the first
> place? I don't see anything preventing an L1 page table getting
> zapped (or replaced by a 2M mapping) all in one go.

ISTR that this couldn't happen, but I don't remember exactly exactly
why.  It may just be that the p2m update code didn't have that path,
but it's a bit fragile to rely on that.

> The full range
> of GFNs would need checking in this case as well, just like in the
> opposite case (2M mapping getting replaced by an L1 pt).

Yes.  Any case where we're inserting or removing an L1 table would
need to check all 512 L1Es.

Cheers,

Tim.

