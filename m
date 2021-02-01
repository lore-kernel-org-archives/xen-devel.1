Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC270C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 14:56:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D16164DF5
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 14:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D16164DF5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79930.145788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6adE-00025f-Ds; Mon, 01 Feb 2021 14:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79930.145788; Mon, 01 Feb 2021 14:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6adE-00025Y-Ar; Mon, 01 Feb 2021 14:56:48 +0000
Received: by outflank-mailman (input) for mailman id 79930;
 Mon, 01 Feb 2021 14:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6adC-00025S-AG
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6adC-00042e-9R
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:56:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6adC-0003NF-7Y
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:56:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6ad9-0007fT-0k; Mon, 01 Feb 2021 14:56:43 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=MgBV62szT89Tk4OKE4cEbWfTA81OWdN7qE+5TyGn8Q0=; b=3kZBEqVkrJ0MnOBBTemHQexHDE
	Lo5uFJs+X764kHC6k/S0mCMmVACSdgLX0FvLT1KS/hEHwhp8QpH0ADRCYR3GaGl12skHdBCiRzPsw
	a1iYBWXLslhnkOyWIoHP0l7N4yFFu19nnURfUxjXCgtd0H7QBY/e0rMWertFKeYRDeoY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24600.5802.791792.705035@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 14:56:42 +0000
To: Manuel Bouyer <bouyer@netbsd.org>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Roger Pau =?utf-8?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] libs/light: pass some infos to qemu
In-Reply-To: <20210130230300.11664-1-bouyer@netbsd.org>
References: <20210130230300.11664-1-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH v3 1/2] libs/light: pass some infos to qemu"):
> Pass bridge name to qemu as command line option
> When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> to be used by qemu helper scripts
> The only functional difference of using the br parameter is that the
> bridge name gets passed to the QEMU script.
> NetBSD doesn't have the ioctl to rename network interfaces implemented, and
> thus cannot rename the interface from tapX to vifX.Y-emu. Only qemu knowns
> the tap interface name, so we need to use the qemu script from qemu itself.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think this is a bugfix but it has implications for non-NetBSD
systems and I think it would be best for it to get (or not get) an
explicit release-ack.

I think it is sufficiently low risk to take it now.  We don't think
this will cause trouble for other platforms but if it proves to, that
should be fairly obvious and caught in our testing.  So:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

