Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E062C2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 16:16:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CC1A2065D
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 16:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QpLkQl9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CC1A2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMvog-0005HP-Oh; Mon, 28 Sep 2020 16:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymH5=DF=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kMvof-0005HK-OO
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 16:15:53 +0000
X-Inumbo-ID: bb4f3159-209a-4aa5-9a98-7ec314880bc2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb4f3159-209a-4aa5-9a98-7ec314880bc2;
 Mon, 28 Sep 2020 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1601309752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O2a4ggHVMxGwkIgX1SKbGKPbKeHPULf2/iNWYkEGc5U=;
 b=QpLkQl9c8/e2TL9QEBLpcD8dLrDRu9XwFMWGRGm1d7YZ/MpwqiElp+uw
 DUNPLExgz9tVrfi4bmE9S8x3dFd033wQd87nzCILcM3YrkAr9lWa9C9Yl
 M7br8kF0tPhl1TAtbhQ6iFU495BtvV4XElk3+MZqJ6ssjfS4RQ+i1331Z Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 590Te1h7Btz9nxkIFUyekaYheUsFx4Szo+tL8YggzFwIy28azrsEqy/XOPVCqw8gdhoha1t1ER
 uLJT2NUJBhyGSPzU06B4e7AGHpIkrGWR9uedN6Tb+9Q9D2tU1VrHMlbDPfno/sg3UW8+RV2Rpj
 H5p2yPV/fMgP8mxUQqh7ewpelxfx38Ba9xpJ+Y8+KXqvQh/AmH9OoeIpm8m2P66XyWvNRJUP+w
 SmG1VqaUjxmYvwfBpIIzC4Y2dfqeuT9Xc9RL4PaOx9ZWVB62iisLD3EDyIcxNspWNdehaxeRSI
 cNE=
X-SBRS: None
X-MesageID: 28052147
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,313,1596513600"; d="scan'208";a="28052147"
Date: Mon, 28 Sep 2020 17:15:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Eduardo Habkost <ehabkost@redhat.com>
CC: <qemu-devel@nongnu.org>, <berrange@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 57/63] xen: Rename XENBACKEND_DEVICE to XENBACKEND
Message-ID: <20200928161547.GJ2024@perard.uk.xensource.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-58-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200902224311.1321159-58-ehabkost@redhat.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 02, 2020 at 06:43:05PM -0400, Eduardo Habkost wrote:
> Make the type checking macro name consistent with the TYPE_*
> constant.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

