Return-Path: <SRS0=exI2=BB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7706EC433E3
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 11:38:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493CC20792
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2020 11:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eQsAzxoo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493CC20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyD4y-0001D6-KG; Wed, 22 Jul 2020 11:38:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yOZ1=BB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jyD4x-0001Cp-1T
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:38:31 +0000
X-Inumbo-ID: dd590448-cc0f-11ea-a196-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd590448-cc0f-11ea-a196-12813bfff9fa;
 Wed, 22 Jul 2020 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595417910;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rzSFlW3z1WhVH1s2HOv3/cvhHo2ouO98o7Ju+GOiKno=;
 b=eQsAzxoozNeswbfrjM1hWi6lEfk39KQiRlfDWGgRDRyq21s1T5GTxp7u
 M63AnTMcaJx80XEdc9EteAHhp79asyOJQlYQ3So8e5r4m7hhXZbBNkvnU
 KYYLchhjlCQxxWGNQxOsSLrRcLQ1fClStvH3CfuYaKw+9T0LRbrcXOwuf U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3FTV9IGtXD/SOKIH4RL8X3Vp2lyd15ChPJ0S9+RRgPyR0KBDgohKXMhlj7kDUsttGOp0fudb7h
 c8Iz3z3nYNuwi/zf94Zl12mhKth+jPcijeYdjNnZZsZx6PzwS3pvB6+Fj4ED7gT49FnymKpzo5
 KbB37HKnnPzbgZi8iavgchAa9rrgywaBAM035ZIgQCCxV8snT4rPNyATT554Yg5AEAqD1wkfrI
 8Y/jRZdX6cyG0eyX/oopofILQLxHEAHID98+XiqxaK7u9UW/T1E8rHXYZf7N/cKjmcQn7gEHOJ
 9FY=
X-SBRS: 2.7
X-MesageID: 23123604
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23123604"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24344.9513.638028.351008@mariner.uk.xensource.com>
Date: Wed, 22 Jul 2020 12:38:17 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [osstest PATCH] freebsd: remove freebsd- hostflags request from
 guest tests
In-Reply-To: <20200721112016.30133-1-roger.pau@citrix.com>
References: <20200721112016.30133-1-roger.pau@citrix.com>
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

Roger Pau Monne writes ("[osstest PATCH] freebsd: remove freebsd- hostflags request from guest tests"):
> Guest tests shouldn't care about the capabilities or firmware of the
> underlying hosts, so drop the request of specific freebsd-<version>
> hostflags for FreeBSD guest tests.
> 
> While there request the presence of the hvm hostflag since the FreeBSD
> guest tests are run in HVM mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I have queued this for the next push to pretest which I hope to do
some time today.

Thanks,
Ian.

