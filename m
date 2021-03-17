Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188D4C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 00:05:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4F564F8F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 00:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4F564F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98511.186905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJgK-0004ry-2N; Wed, 17 Mar 2021 00:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98511.186905; Wed, 17 Mar 2021 00:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJgJ-0004rr-Uq; Wed, 17 Mar 2021 00:04:59 +0000
Received: by outflank-mailman (input) for mailman id 98511;
 Wed, 17 Mar 2021 00:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PmVw=IP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lMJgI-0004rm-Dz
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 00:04:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44b7673d-d745-40cc-8663-734e1f22fe6e;
 Wed, 17 Mar 2021 00:04:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BC0E64F8F;
 Wed, 17 Mar 2021 00:04:56 +0000 (UTC)
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
X-Inumbo-ID: 44b7673d-d745-40cc-8663-734e1f22fe6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615939496;
	bh=MLQeIxWmuOOSLEldExy57QoNjB2H7psugvKU3Qv2uFc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m2YPxi5XFjgfd4Vp6vFggYOV1lxm1wheRPQcUPpMJcydEzW7r5c4XXsCd2RJ/gbr+
	 uDePLcW2XvPh2axQSe++64MiUaX3iQQD5cDiySXrwNuE6iF4QJT0iRRZCST4i13rRA
	 Uqw4a2LpivrZgZ2bI6dPzBD9jPfg7EHcGGaq0R1tRbO2VTNqM8ZQLjjjJIHnB4mDkY
	 SyAjyEQ4BFJflHT+KgCXjnDwPWI/YS6nHE5f1JIKi8UiDiO363jphOfO01AfM31tDV
	 wo8bHLBU/hqQVAFH6+KjEoTwR2uy8fb5rnH44e/EmKNaJ3h0fYQFwS4ImCUT5mh/gp
	 QP0dKplBuLtlw==
Date: Tue, 16 Mar 2021 17:04:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <48a7ea93-06b4-21f1-5db2-0104058a2446@suse.com>
Message-ID: <alpine.DEB.2.21.2103161704040.439@sstabellini-ThinkPad-T480s>
References: <20210312231632.5666-1-sstabellini@kernel.org> <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com> <alpine.DEB.2.21.2103151259550.5325@sstabellini-ThinkPad-T480s> <48a7ea93-06b4-21f1-5db2-0104058a2446@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Mar 2021, Jan Beulich wrote:
> On 15.03.2021 21:01, Stefano Stabellini wrote:
> > On Mon, 15 Mar 2021, Jan Beulich wrote:
> >> On 13.03.2021 00:16, Stefano Stabellini wrote:
> >>> Introduce two feature flags to tell the domain whether it is
> >>> direct-mapped or not. It allows the guest kernel to make informed
> >>> decisions on things such as swiotlb-xen enablement.
> >>>
> >>> The introduction of both flags (XENFEAT_direct_mapped and
> >>> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> >>> guesswork if one of the two is present, or fallback to the current
> >>> checks if neither of them is present.
> >>>
> >>> XENFEAT_direct_mapped is always set for not auto-translated guests.
> >>>
> >>> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> >>> see is_domain_direct_mapped() which refers to auto-translated guests:
> >>> xen/include/asm-arm/domain.h:is_domain_direct_mapped
> >>> xen/include/asm-x86/domain.h:is_domain_direct_mapped
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>> CC: jbeulich@suse.com
> >>> CC: andrew.cooper3@citrix.com
> >>> CC: julien@xen.org
> >>
> >> Any particular reason my previously given R-b isn't here?
> > 
> > I reworded part of the comment in the public header, and I decided to
> > err on the side of caution and not add your R-b given this change
> > compared to the previous version.
> 
> I see. FAOD, despite me not being overly happy with the "older
> Xen assumptions" part of the comment, feel free to add it back.

Thank you!

Julien, please go ahead and commit it to your for-next/4.16 branch when
it is convenient.

