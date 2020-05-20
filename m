Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B74DC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:50:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F362072C
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F362072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQ2p-0002Ve-Tl; Wed, 20 May 2020 14:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWk/=7C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jbQ2o-0002S1-Pj
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:50:06 +0000
X-Inumbo-ID: 30a97440-9aa9-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30a97440-9aa9-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 14:50:05 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Z9Y9y88xAnxg57My9pEQR+PfbEdb7JKaUhhBfu5OWwXLjqx4JP9yQwH7SiSyfbfHfgaiaZ7jEp
 5IM0RJ7LqubvuFkknKBHuzVLoHsiEooPkhyIZWzbfl42TMsH41NJzEiAk/0PywaM7Ss6Siv27o
 jejkRoQUc7n+ho3lAEiwI6Z375EmweYxM0lVMgCMtmjvJu7kmV4PJP729DIiJ5XdLLUQwBuCZ7
 3Qlo6pEP8z/5WtWtOOvO7lqRqsOXnOMG72hg+2vGeNxBmyCLTVuT48vKf0mvQGuljZRTMaUfrx
 tm0=
X-SBRS: 2.7
X-MesageID: 18022566
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18022566"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24261.17303.413916.29534@mariner.uk.xensource.com>
Date: Wed, 20 May 2020 15:49:59 +0100
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
In-Reply-To: <20200520083501.31704-1-jgross@suse.com>
References: <20200520083501.31704-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of allocated memory"):
> The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
> ioctl() parameters is calculated wrong, which results in too much
> memory allocated.

Added Roger to CC.

Firstly,

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thank you.


But, looking at this code, why on earth what the ?

The FreeBSD code checks to see if it's less than a page and if so uses
malloc and otherwise uses mmap !  Why not unconditionally use malloc ?

Likewise, the Linux code has its own mmap-based memory-obtainer.  ISTM
that malloc is probably going to be better.  Often it will be able to
give out even a substantial amount without making a syscall.

Essentially, we have two (similar but not identical) tiny custom
memory allocators here.  Also, the Linux and FreeBSD code are
remarkably similar which bothers me.

Anyway, these observations are no criticism of Juergen's patch.

Regards,
Ian.

