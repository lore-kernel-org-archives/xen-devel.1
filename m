Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D51C44523
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 01:16:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365284.1615840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wktfK-0002Hd-UO; Sat, 18 Jul 2026 01:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365284.1615840; Sat, 18 Jul 2026 01:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wktfK-0002HU-QU; Sat, 18 Jul 2026 01:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1365284;
 Sat, 18 Jul 2026 01:16:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wktfJ-0002HN-D1
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 01:16:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wktfD-00Auux-QB
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 03:16:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a5ad3bf-2eae-0a2a0a5409dd-0a2a4506c4c8-20
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 03:16:23 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a5ad3e6-195a-0a2a45060019-aceafc1fe698-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 03:16:23 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92F414397A;
 Sat, 18 Jul 2026 01:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EFB1F000E9;
 Sat, 18 Jul 2026 01:16:21 +0000 (UTC)
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
	s=k20260515; t=1784337381;
	bh=a+ejCJXZ8E0G5TxHT1XlkLEgo05f1WOmKU9FYIQKbWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=QPanwKEFzZl5ILlVGlSF5y5ZZj/mZLBBaba6Bzu9iuINnqeCJlY/NUz7Z4kUin7Ks
	 GUzkjZmFRNrfCMf24V4ljv3f6ofRNctUcQZxGiPaGMX5sXCfFKvYGDco7XtcbrGOrW
	 hDicv29rwfAAcJsVxLcdS+UmXmTMz6FCVYKef4ptLe8X0ERaHVhr9TYcdWUmMrr7BO
	 aekZH6iZfyM0yJl5UxZ6XvmdWux5DWIdahFejwSckPrx/XcVphtuqVJNknSzyRg0EB
	 L8EDh4u5hXDpXRZP1WzfgqCFFdJdk/ZYAoQtjZFvkK5ExNSxh2Iz1JbnkTc2BxA4UU
	 tRXKJgXTIviVQ==
Date: Fri, 17 Jul 2026 18:16:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
    "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH 2/4] xen-block: Fix inverted error check in
 xen_cdrom_realize()
In-Reply-To: <20260716170923.2125858-3-Mitsuru.Kariya@oss.nttdata.com>
Message-ID: <alpine.DEB.2.22.394.2607171816130.16921@ubuntu-linux-20-04-desktop>
References: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com> <20260716170923.2125858-3-Mitsuru.Kariya@oss.nttdata.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1784337383-FEE7677B-0593FD6C/0/0
X-purgate-type: clean
X-purgate-size: 1635

On Fri, 17 Jul 2026, Mitsuru Kariya wrote:
> xen_cdrom_realize() checks the return value of blk_attach_dev() with
> 
>     if (!rc) {
>         error_setg_errno(errp, -rc, "failed to create drive");
>         return;
>     }
> 
> but blk_attach_dev() returns 0 on success and a negative errno on
> failure.  The condition is inverted: a successful attach (rc == 0) is
> reported as an error and fails realize, while a real failure (rc < 0)
> is silently ignored.
> 
> Here blk_attach_dev() is called on a BlockBackend just created by
> blk_new(), so blk->dev is NULL and its only failure path (-EBUSY)
> cannot be taken.  Replace the bogus check with an assertion, matching
> the other empty-drive realize paths (scsi-disk, ide, fdc, swim).
> 
> Signed-off-by: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  hw/block/xen-block.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 474c12fe4a..abf9df2eee 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -762,10 +762,7 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
>          conf->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
>  
>          rc = blk_attach_dev(conf->blk, DEVICE(blockdev));
> -        if (!rc) {
> -            error_setg_errno(errp, -rc, "failed to create drive");
> -            return;
> -        }
> +        assert(rc == 0);
>      }
>  
>      blockdev->info = VDISK_READONLY | VDISK_CDROM;
> -- 
> 2.43.0
> 

