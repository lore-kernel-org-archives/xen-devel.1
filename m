Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3CFC433E1
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 08:57:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08E332072D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 08:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cuvdVkdC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08E332072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Ju8-0000rx-SU; Wed, 19 Aug 2020 08:57:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8Ju7-0000rs-J5
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:57:07 +0000
X-Inumbo-ID: 2a67d0a6-19e7-435c-9c8e-e154b4f24ff2
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a67d0a6-19e7-435c-9c8e-e154b4f24ff2;
 Wed, 19 Aug 2020 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597827425;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=rGNKek+e5cQ8lfjsLBK8A/BYM86/uMFMCXAgEwLMyu8=;
 b=cuvdVkdCDWkAi/jPlzzOT6HA0Lzb3bWmgwyODaaspC+Czbk6fREf1snH
 DBmKQ5gbO7fpiEPKc8GZVVvg0FXaDXXB4cqvkSYd/h2MLQBVyokFuAQNX
 ROR18flb/Y8Iz3PoS7dHxaCfiV9t/z4YCiJXj+BG9XvQCILDJmKixvt1G s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lfj6K7JNO0kvCVEWhbiumEYlrzav2/st23MdYtaCVhLIYHZQ9SXaWs6tVEUoOmYqm0q1c8hsaX
 68i8RBE23/ewRn0xd0vmi/PuTOvFOylkxJoht6loCB+rEXRstxIazbW5ijfTtuBK1F8Y9bBwK6
 E6cuAdaJIRvA/3JfkfAnZ3XpJiKmBYbi1YSU6NpM1Mspd9lPgpXh6/rWWF3sYCyVBJu3fw51Ba
 DyavBVHx83bZXbwD7yGR1Urj9/FLEVMCzgRH9Z5SAUfBqBg19Si9WKLWjSCMgLTNYyxCf3QRlQ
 IoU=
X-SBRS: 2.7
X-MesageID: 24825539
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,330,1592884800"; d="scan'208";a="24825539"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24380.59740.291926.170706@mariner.uk.xensource.com>
Date: Wed, 19 Aug 2020 09:57:00 +0100
To: "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Planned osstest outage, around 17th August
In-Reply-To: <24380.3250.48843.989049@mariner.uk.xensource.com>
References: <24371.64746.743317.606471@mariner.uk.xensource.com>
 <24374.49647.650481.677464@mariner.uk.xensource.com>
 <24378.47981.601974.542481@mariner.uk.xensource.com>
 <24380.3250.48843.989049@mariner.uk.xensource.com>
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

The upgrades are now done and I have just restarted osstest.

There are still some loose ends but I think we should be able to deal
with them without another big outage.

Thanks,
Ian.

