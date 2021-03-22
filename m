Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FD8C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 14:32:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D2106186A
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 14:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D2106186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100243.190878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLb6-0007k9-Pr; Mon, 22 Mar 2021 14:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100243.190878; Mon, 22 Mar 2021 14:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLb6-0007k2-MU; Mon, 22 Mar 2021 14:32:00 +0000
Received: by outflank-mailman (input) for mailman id 100243;
 Mon, 22 Mar 2021 14:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdHa=IU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lOLb5-0007jx-HE
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:31:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c617306-5602-4f18-80db-d6aabc99ed3c;
 Mon, 22 Mar 2021 14:31:58 +0000 (UTC)
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
X-Inumbo-ID: 1c617306-5602-4f18-80db-d6aabc99ed3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616423518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nyr8KSk+KDPShgitquX43mntR61x5GxDgHO+N7oBzic=;
  b=BLRTbuXsOVOdkB+wKvHbSQgEshXRjxx7BrKpBTJVfp1KjeZlbYEctuuC
   lqrGK+81uwJUsVNPzMBiWNoT+gGpgyw2teePuGk0wbYjppPZM/2QvNPoZ
   476GfCndxL+gbUiB8ooU1ez95/ZFqNm9mq0vLToRTA1Ziwk49377Gf7zz
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YVWbBJuBGOAQTWgyEqclvkf4VOJr4eJz3KJSkuniw0VkBeBN7px9XY5p504LvHluUxBhdTehuV
 KjDHwF3WBcrfdo1Qr7ySAEUI/l8H3hl8Y+nW2htupQqOOGmLbazAJtSkklQ0A9bIhMR1T4Cmpy
 tvtUM/K6v5f8qdcH7kC0X7c8xU+mfnOl3SK5zAd8rcad4mr/4InKcks+XwS/6xONHrRCpHFYUT
 BDrIfJrkesy+727zF0QB5ruwUG82YhASU8hV4KmBzb6N5PjxIn0fhLCFJFuU7nBin9NQBAkfc/
 u+g=
X-SBRS: 5.1
X-MesageID: 39812241
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qTNpx66woxGi2m+VigPXweaEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBxh8ri/U2cG9Ev3NGI/MmT9J3j5l1GJDsaCZ1IxQF/FwqdDwlSTA5JGZI2GP
 Onl7d6jhCnfmkaadn+O2kdU4H41pD2vb/vfBJuPW9A1CCgljWtgYSbLzG52VMkXypL0fMe9w
 H+4nfEz4GCl93+9RPGzW/U6P1t6Zfc4/9OHtaFhMRQChiEsHfQWK1bV7ePvC84rYiUgT5A+r
 esnz4aM8t+8H/XdG2uyCGdozXI6zoy92TkjWaRnHqLm728eBsBF8FDiYhFGyGpjnYIgdBm3K
 pHm0KfupZHZCmw+xjV2tnSWxlm0nezuHop+NRj60B3bI12Us4zkaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzsONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4ErRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9FIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104D2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6FuqVH/+iB3YQGjsZUT74JJ1HMHhjqgu4blIErcJnhkeiFy/6M3OFCZLtbYuel
 BiZJn9lLmgmGWw9WHUzmlgNxZHFHxJ6LH4X34in35OD2rENZI4//SWYyR7wWaOLB4XdbKrLC
 dv43BMvZ+RA7PV7yY4EN6jOn+dlBIo1Q23ZqZZvLaC68fjco4/FbA8VsVKZEL2PhRohAdnr3
 pCYgcYRknZUijjk7mhkYZ8PpCgS/BsxAisOsJasnTZqAGVotwuXGISW3q0XdeQmhtGfUseun
 Rht6seiqGHgzChNC82h/k5KkRFbA2scft7JRXAYIVfgbbwfg5sCW+MmDyBkhk2Pm7n7V8biG
 CkLSqaf5jwcxJgk2Ed1qbh61VvcGqBO0p2d3BhqIV4UX3cpWwb657+WoOjl2+KLlcSyOAUNz
 /IJTMUPwN13tiykBqYgiyLG3kqzognV9atRogLYvXWwDegOYeInaYJE7tP8JFpOMvnv+ULXe
 icEjXlWg/QGqcswUiYt3wlMC57pD04ivvuwgTi93X903glA/beSW4WMo0zMpWZ9SzjSPmJ2p
 ki0o5wsuu0L2nratmJjavQdCVOLxvPoWiwC+EkwKokzp4apf92Bd3cVzCNyXRMmBM5J83wnF
 kFQKt67KvaU7UfCPA6amZc5B4xiN+LLEE3qQT4De81YEE1gxbgTqO0yquNraBqH1aIqwTxM0
 SO6iFR///KWC2YyL4RYphAU1h+eQw783Rt/OSLao3WBkGrboh4jSuHDkM=
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="39812241"
Date: Mon, 22 Mar 2021 14:31:54 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YFiqWsUC2q+01xQD@perard>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>

Hi Paul, Stefano,

Could one of you could give a Ack to this patch?

Thanks,


On Mon, Mar 08, 2021 at 02:32:32PM +0000, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>     qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.
> ---
>  hw/block/xen-block.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>  
>      object_unparent(OBJECT(xendev));
>  
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with
> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>      if (iothread) {
>          xen_block_iothread_destroy(iothread, errp);
>          if (*errp) {
> -- 
> Anthony PERARD
> 

-- 
Anthony PERARD

