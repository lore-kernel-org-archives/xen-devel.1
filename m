Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0DAC2BB55
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 17:11:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E9E2078E
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 17:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="gPFevS3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E9E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP82C-0006Qa-56; Thu, 16 Apr 2020 17:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gJ3=6A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jP82B-0006QV-9m
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 17:10:39 +0000
X-Inumbo-ID: 315c653c-8005-11ea-83d8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 315c653c-8005-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587057038;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qfkSq7URKpvXjF7lnJTFYslcRpwMyj8W2lwX2JJDTYQ=;
 b=gPFevS3bLIoEU5EHfyYXnEtcpCDk9pxbSru9O2GSFwNfp0KwUAojosKZ
 vKpbqDEoAmysJpo8qqcTSDP/dfIxx9whw8B4DGR+ct5clnLUzmNrA1Wvw
 7olgE5g0Eq/HSvUXsV7qWDp0VVVf+Q6j+v6TIKlB2yOErSPcI0JO7myG/ Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NpvzHCUBFzCkdF2r9vzy0co5kUkHtjY9NtEeobzKYtXkfKVg+HU46L2uDkCHqvl/kCXHEc4ORS
 uPA4eQfCXmLEIGrNTR8XWAZzcP9WyQbroK0CsApgO/vVVOb9oA/qK/zmTpasllvwJ0bQ+etQp3
 0VIdrHSJGPLXoYGNrWJ+Ye+GK0MZF0DrSNsXUde4bL6wIpcQsAd80pfeT9qvL8CI5vCtTUDIGd
 WGS8cWSnnxj58C4LE0SPdkn5MTKa/ayUw/e8vLyodj3bdJLGQd98vK2feNfZJ4+0vo7z/9CZA/
 2hQ=
X-SBRS: 2.7
X-MesageID: 16472943
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16472943"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24216.37252.294936.717519@mariner.uk.xensource.com>
Date: Thu, 16 Apr 2020 18:10:28 +0100
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
In-Reply-To: <96263bbd41717d68bb35f14163973267a29ef0e4.camel@suse.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
 <24215.1729.892903.300149@mariner.uk.xensource.com>
 <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
 <20200416163607.GO28601@Air-de-Roger>
 <96263bbd41717d68bb35f14163973267a29ef0e4.camel@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Dario Faggioli writes ("Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job"):
> Ok, sure. Maybe it would make sense to add just another one for Credit,
> sooner rather than later, as I guess there may be people wanting to
> continue use Credit, but they may want to try it with core-scheduling.

Maybe in return we could delete the rtds test which has been marked
nonblocking forever and which no-one seems to be fixing ? :-)

Patches welcome...

Ian.

