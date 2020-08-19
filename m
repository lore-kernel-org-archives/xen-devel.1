Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ADEC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 10:32:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D552076E
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 10:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="WK4UfuyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D552076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8LNr-0001su-Rs; Wed, 19 Aug 2020 10:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8LNq-0001sk-8f
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 10:31:54 +0000
X-Inumbo-ID: e62ed67c-37d2-4533-8dd7-13cae789eb11
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e62ed67c-37d2-4533-8dd7-13cae789eb11;
 Wed, 19 Aug 2020 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597833113;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=kI3tYAd/ormFSqd2M04V7UvqQImI9Xpbk/LZv4Bco3E=;
 b=WK4UfuyW2lQIc8dUz22gYhLjpcmkp7U0djR2QT8rpnP7FNKHeUo7oVDW
 /BBO8Y9FWZh4IUmdGUwpc2jcOq+uJ3yKltUF4AhKfyCRmCoOS1qXkV4Ly
 3fCj+G1cLW2BBbqb2o21dO3SmsSBqoVk/pY3aWFUyPrAaB3nsqBAW7Qhr c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: h85FN4YJ7R1yXJbHrwzw9maVb4BP5n+F+3mm7EokYrppIjQEBWq61wvmUHZQg6a0kX0fPu7dnB
 uDBCfyI7m50+twe7U1+NZq2UqIXXqGjk3YRTNh/Z5PFKX+HWDV6uAlIlRekZXwsTHuekQC8SNA
 EHnq9Sf/tseS+Il6tg7JGuoPOmD+KmOQ+ytYPWLSfiU8mfmyI7k0FngJaSs+zFdUEunnLXp67r
 ekmf8C7TwGZAq1PQRcIJ4BGyDnTHl88mXSsoPfxzpfujitraFZa4RciugWAhaImV7woIxMTSKQ
 5xE=
X-SBRS: 2.7
X-MesageID: 25157725
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="25157725"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24380.65427.975310.515324@mariner.uk.xensource.com>
Date: Wed, 19 Aug 2020 11:31:47 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Wei
 Liu" <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] libxl: workaround gcc 10.2 maybe-uninitialized warning
In-Reply-To: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Marek Marczykowski-Górecki writes ("[PATCH 1/2] libxl: workaround gcc 10.2 maybe-uninitialized warning"):
> It seems xlu_pci_parse_bdf has a state machine that is too complex for
> gcc to understand. The build fails with:

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

