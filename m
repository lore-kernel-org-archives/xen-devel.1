Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E2DC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 10:14:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B0720709
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 10:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="C90INUfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11B0720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k54o5-0002WN-6Z; Mon, 10 Aug 2020 10:13:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y2jo=BU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k54o3-0002WI-79
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 10:13:27 +0000
X-Inumbo-ID: c8f285d4-3d7a-471d-a7df-d0081147d8c5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8f285d4-3d7a-471d-a7df-d0081147d8c5;
 Mon, 10 Aug 2020 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597054406;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5G+AFUMcR0ud52AqEaZcrGoU7QxA96sIRzOeUjXAWOY=;
 b=C90INUfBA8DOGSPFONr/NSlbl9B27xFiDpRjhAAXommS9S8icUZZPCBW
 SqB6K2/VOSGW9dBnWbtBA703s+hUuKFYHMrtPtLHzzzWnrCMEcHDUraM4
 SxUUn89ASuTFiocpNjifUeRQtjiGeOeI5wgevAc519Us8z3z5Jk/AMvvZ k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QhQsU6Y7N45Yhr3F1qcl4oTbEOJnlBOcGOTp1h8zDDMYyvSGLkU9JOKijJ7rxs7bXj94nyTDUl
 TITxvN0ZZbr4SJDYfNDvbzIOcQGYDrHg2Zkgq1RqFo3JmWDRDJJ4UIlRU7St6PDCxOybD81NIu
 s/UZNqm4OHfYcB4+riMzE3RUoGbIs1NWoNSqM0CzsutEG0Vm/kcOaMbX13FZznL+4zntY5qGJq
 KpjsDJwYZK3VEVvyldKm72hITkK1IF2AwBoxgvYOnr21/Yd6KPDjugxGXRI6cZ7LwOm6WiANeO
 GYY=
X-SBRS: 2.7
X-MesageID: 24175880
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,457,1589256000"; d="scan'208";a="24175880"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24369.7617.103361.244607@mariner.uk.xensource.com>
Date: Mon, 10 Aug 2020 11:13:21 +0100
To: Jim Fehlig <jfehlig@suse.com>
Subject: Re: [PATCH] OSSTEST: Install libtirpc-dev for libvirt builds
In-Reply-To: <20200723213134.11044-1-jfehlig@suse.com>
References: <20200723213134.11044-1-jfehlig@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jim Fehlig writes ("[PATCH] OSSTEST: Install libtirpc-dev for libvirt builds"):
> The check for XDR support was changed in libvirt commit d7147b3797
> to use libtirpc pkg-config instead of complicated AC_CHECK_LIB,
> AC_COMPILE_IFELSE, et. al. logic. The libvirt OSSTEST has been
> failing since this change hit libvirt.git master. Fix it by adding
> libtirpc-dev to the list of 'extra_packages' installed for libvirt
> builds.
> 
> Signed-off-by: Jim Fehlig <jfehlig@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks!  I will push this to osstest pretest shortly.

Ian.

