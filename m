Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD77CC61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 01:30:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403717.1637700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qqp-0003wM-CY; Mon, 31 Aug 2026 01:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403717.1637700; Mon, 31 Aug 2026 01:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0qqp-0003wF-9F; Mon, 31 Aug 2026 01:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1403717;
 Mon, 31 Aug 2026 01:30:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x0qqo-0003w9-8t
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 01:30:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0qqk-0082bO-Sd
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 03:30:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d8b4-e002-0a2a0a5209dd-0a2a4507e2c8-36
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:30:14 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a94d925-b4ea-0a2a45070019-aceafc1fa8be-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 03:30:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DF64432CA;
 Mon, 31 Aug 2026 01:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6C91F000E9;
 Mon, 31 Aug 2026 01:30:10 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788139812;
	bh=gYGfnGFJTXbEfakCk51c5TR3KJNtqIiI6ujZwN+xW6I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ZJ+pCqUiD4a/m4yvv8rzEP5BGRoxWi0TR4GIV7j0bo929AfV/5psDDhv3GPmf3gMt
	 j4J+JDS88F2G86e2Z5RXlLKHSk0b74q/9VxZaX6tKRlRrNMKjargzoj6e3d5Zu8h0E
	 Tw5PeMSMhtMFILJBCuGAVekv4n97tUdaMrlcb4Dok6uxJMBZ3eVm82e8SVgv7gR5/C
	 DRajpcwtkHeD6P6MnlqoBbXf94bqH7DQW7qXI/YgCwoalA15FU9kGAJQLib5b6fTPg
	 119QmCFFs4jBod4pDwMuyNbVB+HWssiPKqnh3Z5WrCf4FI3ZSfWB98y7Ah0U7iOyg/
	 J12EBAifWObUg==
Date: Sun, 30 Aug 2026 18:30:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 10/12] PCI/physdev: address Misra 2.1 rule violation
In-Reply-To: <de8eb6ec-b830-47c2-95e7-e0b689f05cad@suse.com>
Message-ID: <b338dc69-d94f-415c-07c2-4b4b7731dab1@kernel.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com> <de8eb6ec-b830-47c2-95e7-e0b689f05cad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1788139814-364DBAE4-319494C6/0/0
X-purgate-type: clean
X-purgate-size: 759

On Fri, 28 Aug 2026, Jan Beulich wrote:
> Cases 0..3 are handled, and a 2-bit mask is applied to the switch()
> expression. Therefore the default: case is reported unreachable by Eclair.
> Insert BUILD_ERROR() to annotate this for Eclair.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -114,7 +114,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_
>              break;
>  
>          default:
> -            ret = -EINVAL;
> +            BUILD_ERROR("PCI_DEVICE_RESET_* inconsistency");
>              break;
>          }
>          write_unlock(&pdev->domain->pci_lock);
> 

