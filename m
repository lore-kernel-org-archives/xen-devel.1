Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3DEC4451B
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 01:16:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365286.1615849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wktfQ-0002Uk-4F; Sat, 18 Jul 2026 01:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365286.1615849; Sat, 18 Jul 2026 01:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wktfQ-0002Ud-1M; Sat, 18 Jul 2026 01:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1365286;
 Sat, 18 Jul 2026 01:16:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wktfP-0002UO-Cb
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 01:16:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wktfO-00Auux-Pq
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 03:16:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a5ad3bf-2eae-0a2a0a5409dd-0a2a4506c4c8-26
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 03:16:34 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a5ad3f1-195a-0a2a45060019-aceafc1fcb78-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 03:16:34 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 19D9B402FC;
 Sat, 18 Jul 2026 01:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D611F000E9;
 Sat, 18 Jul 2026 01:16:32 +0000 (UTC)
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
	s=k20260515; t=1784337393;
	bh=KHg02DIbUTKS6NQg6D6XkUWG8UnTwJZwxWKhXo5hQLk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LYWC45lYYN0mRmDAhGncgqU9iboDLKoEJHUDS+I/ueC+P5Eah3qyrUIk0elcjec4D
	 XZ5uD0efly5O8vAN5X5fEXxxi3VWNwzSv/o8JeW5T82YdtYI2o1TwPCp2HoU8+fQyM
	 hq+JOFj9YWW+1NtzJns10L/npkBFj1jtEM/1lFxuYbGx2VPibh7/yNP6xBfUKr4U+u
	 XJ9fRGFnoN5rBWGo2X85qeHYLYdSTt84Ldd+mnD20nQOeSZigs16kWdCEPg1WB9rbS
	 6pcbrnIu3ojR5XAOXyOwrTJYRKkK7hM7O1OTTB7R27KphM1ODYz4sulYVnDdyBJXvS
	 18xpprJ3+GNIQ==
Date: Fri, 17 Jul 2026 18:16:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
    "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH 3/4] xen-block: Fix BlockBackend leak on unplug of empty
 CD-ROM
In-Reply-To: <20260716170923.2125858-4-Mitsuru.Kariya@oss.nttdata.com>
Message-ID: <alpine.DEB.2.22.394.2607171816240.16921@ubuntu-linux-20-04-desktop>
References: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com> <20260716170923.2125858-4-Mitsuru.Kariya@oss.nttdata.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1784337394-FCA0477B-7319D7B6/0/0
X-purgate-type: clean
X-purgate-size: 1521

On Fri, 17 Jul 2026, Mitsuru Kariya wrote:
> When a Xen CD-ROM is created without a backing drive (an empty CD-ROM),
> xen_cdrom_realize() allocates an anonymous BlockBackend for the empty
> drive with blk_new() and attaches it to the device using
> blk_attach_dev().
> 
> blk_new() returns the backend with refcnt == 1 (the creation reference
> owned by the caller) and blk_attach_dev() takes an additional reference
> for the device.  The creation reference was never released, so on
> unplug blk_detach_dev() only drops the device's reference and the
> BlockBackend is leaked.
> 
> Release the creation reference with blk_unref() right after
> blk_attach_dev(), matching the idiom already used in set_drive_helper()
> in hw/core/qdev-properties-system.c ("If we need to keep a reference,
> blk_attach_dev() took it").
> 
> Signed-off-by: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/block/xen-block.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index abf9df2eee..e5e14e47ee 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -763,6 +763,7 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
>  
>          rc = blk_attach_dev(conf->blk, DEVICE(blockdev));
>          assert(rc == 0);
> +        blk_unref(conf->blk);
>      }
>  
>      blockdev->info = VDISK_READONLY | VDISK_CDROM;
> -- 
> 2.43.0
> 

