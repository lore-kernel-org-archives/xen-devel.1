Return-Path: <SRS0=CsTU=77=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFDEC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 16:06:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7F620776
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 16:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7F620776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlx3F-0004Cb-Q3; Thu, 18 Jun 2020 16:06:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlx3E-0004BQ-QL
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:06:04 +0000
X-Inumbo-ID: 9b483c42-b17d-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b483c42-b17d-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 16:06:02 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Hl0G3fsw5f+xJIThZPjqGLn0DtiChGDUUw9SiCEejxDWYA+0BlPSeHrMYkSKthx5oDbhEROmX6
 8yFNS2qyCwgxlAFsAilmg0uXLkWnJXUoB/xOg4JQnyv3bmHr/j39DNU3NfxJY9/tvVOw+oblop
 VLMYS9JQQck2sKWivv5JPSX1uBsMHe5YM4A4eEfrI//RtCv39dnDYwvyRSogHUEIKNt4X3gbv2
 lUlMM7Vj/1jkf62D/VFRP1SiK8Ne6df2lWKcXmexL6QvuEOrsjxJtXgXjP3bPWZHlKU/TKIRIW
 oNA=
X-SBRS: 2.7
X-MesageID: 20389157
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20389157"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.37089.975405.523661@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 17:05:53 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [XEN PATCH for-4.14 v1] stubdom/vtpm: add extern to function
 declarations
In-Reply-To: <006901d64589$c593c440$50bb4cc0$@xen.org>
References: <20200617060841.7241-1-olaf@aepfle.de>
 <CAKf6xptxO0cVUGzfLw2gEHuzvRZsnQFwhbO9XAzijFRXUq1F5g@mail.gmail.com>
 <20200617134025.2tdrjxslnh66dmng@function>
 <24299.36521.246994.731819@mariner.uk.xensource.com>
 <006901d64589$c593c440$50bb4cc0$@xen.org>
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
Cc: 'Olaf Hering' <olaf@aepfle.de>, 'Wei Liu' <wl@xen.org>,
 'Jason Andryuk' <jandryuk@gmail.com>, 'Paul Durrant' <xadimgnik@gmail.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Samuel Thibault' <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [XEN PATCH for-4.14 v1] stubdom/vtpm: add extern to function declarations"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
...
> > I think this is 4.14 material.  Paul ?
> 
> Agreed.
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks, pushed.

Ian.

