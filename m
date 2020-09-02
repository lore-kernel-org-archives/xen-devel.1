Return-Path: <SRS0=suLm=CL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB72BC433E2
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 10:54:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BFAE20678
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 10:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Ikbjs6lJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BFAE20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDQP9-00074H-SX; Wed, 02 Sep 2020 10:54:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=514T=CL=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kDQP8-00074C-T3
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 10:54:14 +0000
X-Inumbo-ID: 2bc21218-7a3d-44f9-b138-64e3fbe45115
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bc21218-7a3d-44f9-b138-64e3fbe45115;
 Wed, 02 Sep 2020 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599044054;
 h=mime-version:content-transfer-encoding:message-id:date:
 from:to:cc:subject;
 bh=h3tnAaIIto/nzokAomZYc+LpDWntndAcRUvzg14aFeg=;
 b=Ikbjs6lJSt0KU5xZQsmhji4cvFASFikXT9z6RQ5jdwQlq5LxtvihlUmO
 HfnNjo7b/NkKEcqYc7Xi+s5RODWXRI/l+1PbZxG/6NTADjBPhQh7vmWhl
 0vk7HWI2EOCOFdfuyt/uoqXHB6S251qZobVakctPRzoTKb95/ey6w2vnW o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6czO1VgVnKlad4R2OwsMtGcVLcz85hP7K6E2BPV/i/dlJRIVDnujwwi9tTIzug2D9tu8JZRSvk
 bLFJC2enmR0BGUMV0SZMdKQkc7jFV0z/LeSkBwuw9JUrMHDJ1svb4/THz7F7/sT5nEiUh4bdLy
 SB6wxr2O6/WztnrMLiAh9Q07zn9tRv83buopuNQGTuxdA2SVGvGtEvCq886/ou4Gt5UT3FG94k
 MapVa5Ey/Sxpcccte9MED2EdZTO5KhqDhAi9D+VKVsB1Xf+5HWExJp2NeBb4+77rdkMI1BmFK/
 SqA=
X-SBRS: 2.7
X-MesageID: 25802840
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,381,1592884800"; d="scan'208";a="25802840"
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24399.31186.566277.384823@mariner.uk.xensource.com>
Date: Wed, 2 Sep 2020 11:54:10 +0100
From: Ian Jackson <ian.jackson@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>
Subject: Test mail do not reply (ter)
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

Please ignore this message.


