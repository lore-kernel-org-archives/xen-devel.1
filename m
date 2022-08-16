Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D05C28B2B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.388261.624875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNv6d-0002lN-Gx; Tue, 16 Aug 2022 11:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388261.624875; Tue, 16 Aug 2022 11:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNv6d-0002lG-ES; Tue, 16 Aug 2022 11:51:35 +0000
Received: by outflank-mailman (input) for mailman id 388261;
 Tue, 16 Aug 2022 11:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DWYI=YU=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1oNv6c-0002lA-Ap
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 11:51:34 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c554d504-1d59-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 13:51:32 +0200 (CEST)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1oNv6Y-0002Dl-0N; Tue, 16 Aug 2022 11:51:30 +0000
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
X-Inumbo-ID: c554d504-1d59-11ed-bd2e-47488cf2e6aa
Date: Tue, 16 Aug 2022 12:51:29 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 0/4] x86/P2M: allow 2M superpage use for shadowed
 guests
Message-ID: <YvuEwQRRwqbndTgM@deinos.phlegethon.org>
References: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 09:43 +0200 on 12 Aug (1660297391), Jan Beulich wrote:
> I did notice this anomaly in the context of IOMMU side work.
> 
> 1: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part I)
> 2: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part II)
> 3: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part III)
> 4: P2M: allow 2M superpage use for shadowed guests


Acked-by: Tim Deegan <tim@xen.org>

FWIW I think that adding some kind of mfn_mask() opreration  would
be neater and more understandable than subtracting the PSE flag.

Cheers,

Tim.

