Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7C2C11F64
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:30:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EE2D6140B
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EE2D6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148863.275170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxiA-0002IQ-MA; Thu, 01 Jul 2021 14:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148863.275170; Thu, 01 Jul 2021 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxiA-0002IJ-Hv; Thu, 01 Jul 2021 14:30:38 +0000
Received: by outflank-mailman (input) for mailman id 148863;
 Thu, 01 Jul 2021 14:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxiA-0002ID-74
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:30:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8620c3ba-85d4-4967-a97b-25e717a56970;
 Thu, 01 Jul 2021 14:30:37 +0000 (UTC)
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
X-Inumbo-ID: 8620c3ba-85d4-4967-a97b-25e717a56970
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625149837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8P7vlfIkLcqeQmKRDzO/5KvCw9VoEUvvaKYjxrs4Lwg=;
  b=HqWMkZ4DwZIO3z2jfbbQCGH8zhWO9uBSQDWntAngR08PQpgD+pA2qrFI
   i/v/5RaomjdQcQ1e9BJpurJbAY75kiemE6S+ndYh+mvrcfPeZEsW33Gc9
   ri+a3pk2ohFDQkIv3Zh71VKwKFrfPzvI14DbrJJGtIuRLUG75rWQQ6Q80
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0U1C1McnJVqImh+3s74LGBKcPf1DBgdVWaCmAN72OFr7ip3r/fvcZatKZRncr3nBw86BL6sK4Z
 MXEMr9upMFzYfh673TZttU3Rzq8Cx7WIbOcwBU5MlHu9RBWFws3F7hC4tlZBfSifwOKJBbwCz2
 J6810PWChACoESqdR7fxf8PUvL5ZyQJZkTOWjCIhHfFKP2wdqu67XumFbzU3nIswprHq5sNxva
 7GFqVGyC6ULkLUiD8g1iwFzKrOmSFw9ViPIuEn5+po7BchG13I11D8fgMAF9C4SinVdLhA0nJG
 Ils=
X-SBRS: 5.1
X-MesageID: 47448780
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ojxwZqP58v8aVsBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47448780"
Date: Thu, 1 Jul 2021 15:30:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Message-ID: <YN3RidqHX3fvzAUO@perard>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-4-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210701095635.15648-4-olaf@aepfle.de>

On Thu, Jul 01, 2021 at 11:55:58AM +0200, Olaf Hering wrote:
> xl migrate --debug used to track every pfn in every batch of pages.
> But these times are gone. The code in xc_domain_save is the consumer
> of this knob, but it considers it only for the remus and colo case.
> 
> Adjust the help text to tell what --debug does today: Nothing.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> v02:
> - the option has no effect anymore

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

