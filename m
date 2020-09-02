Return-Path: <SRS0=suLm=CL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB49C433E7
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 10:41:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E6020773
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2020 10:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="CMRNcSvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E6020773
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDQCo-0005lo-QA; Wed, 02 Sep 2020 10:41:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eya1=CL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kDQCn-0005lj-K4
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 10:41:29 +0000
X-Inumbo-ID: 08564fde-ac1b-489a-a09a-1eaa8c4887ce
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08564fde-ac1b-489a-a09a-1eaa8c4887ce;
 Wed, 02 Sep 2020 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599043288;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=c4h72ITe0bqOwHcSf/zVtw72kkxQjNtvmAuVCmAu0GM=;
 b=CMRNcSvkUMWmJtJKahMIupglSpVG/+hVzoxnhl4xdV4CnJES0/6YQnUJ
 BhMZTk6GoZs3p0BtxN7No1Fr98oTPZlWn4DVAdMwe/f3MbLi8jsn5PoiD
 loovYoYExp3G5Brdgrlw5YtJc+ncirWw7QfikrkJivREe9pBYx3pn8+ij o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rmwvGwgYDfXB1nccsjM5DTy48M5+bK0LBhCMwOi8Qn6NHJhLwQT+d0Te4SoWf5hoLmAB4FVOdq
 PQlQCfwKapsHQy3cS7xf6Xe+eRyL8d1dZEsTU2EkUuij+EY/SxvgNhUpPFkbsVqY3KuohXifjV
 22CJT60E3FhA3QhaQGSsVpS6Tldh/wE8VP2uktusiFHUv/xke+KLiwtjoaTZlLKu/q2Uu2n1ye
 Y8R8/UCNsZCJfN8nBqfmX+27ByID0GhpMF20tO5alrtyNSffA5FpGvBP58ha1DWT1S/5hU89ZM
 oA4=
X-SBRS: 2.7
X-MesageID: 26148851
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,381,1592884800"; d="scan'208";a="26148851"
Date: Wed, 2 Sep 2020 12:41:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>
Subject: Test mail do not reply (bis)
Message-ID: <20200902104106.GO734@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

Please ignore this email.

