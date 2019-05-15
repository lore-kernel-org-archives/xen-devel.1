Return-Path: <SRS0=AokV=TP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B02C04E53
	for <xen-devel@archiver.kernel.org>; Wed, 15 May 2019 14:14:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B13672084E
	for <xen-devel@archiver.kernel.org>; Wed, 15 May 2019 14:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B13672084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQug2-0000H6-NA; Wed, 15 May 2019 14:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P7lW=TP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hQug0-0000Gx-QD
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 14:14:36 +0000
X-Inumbo-ID: c3534738-771b-11e9-8b19-73085430da05
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3534738-771b-11e9-8b19-73085430da05;
 Wed, 15 May 2019 14:14:34 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: OMmdNsXS5w27LCCjE23laE3q3Ark1rddZpVbFqpmHsQFaJJhgltiy5oE/Bt/Z6WB/ZG83DuNLF
 W+xa9bkcqUwpOK9ZdagrZq7vHYk8s4RzgI0WxeJpPzF8GFlfsfTJ2/y+PC52CHEP9xoNTwH+f+
 bTv4/O08EGjDN0pX6GAU8FAcQc6wwynmoD0s44KnjXB0hATvlqNkeH5dEbQl2XCChV+WQLOHTZ
 ipBxFuB8TH27e7lsk6jr8ke9RSmFHBuJ7JqqAVtUyP+oHppeNFlOUGj3D0wvWapJPFhThGMEpT
 DnI=
X-SBRS: 2.7
X-MesageID: 468878
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="468878"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23772.7849.169649.360026@mariner.uk.xensource.com>
Date: Wed, 15 May 2019 15:14:01 +0100
To: Wei Liu <wei.liu2@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190514103030.8393-1-wei.liu2@citrix.com>
References: <20190514103030.8393-1-wei.liu2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 0/2] Drop blktap2 from xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190515141401.IKNJEXKtVITjcU6lsByft8bmZqmFcl41-CgOt5zE7ws@z>

V2VpIExpdSB3cml0ZXMgKCJbWGVuLWRldmVsXSBbUEFUQ0ggMC8yXSBEcm9wIGJsa3RhcDIgZnJv
bSB4ZW4iKToKPiBXZWkgTGl1ICgyKToKPiAgIHRvb2xzOiByZW1vdmUgYmxrdGFwMiByZWxhdGVk
IGNvZGUgYW5kIGRvY3VtZW50YXRpb24KPiAgIERyb3AgYmxrdGFwMgoKQm90aCBwYXRjaGVzOgoK
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
