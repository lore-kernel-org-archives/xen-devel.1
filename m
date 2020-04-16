Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DDAC2BB55
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 16:58:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B562063A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 16:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XfU6Um+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B562063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7qY-0004rj-V4; Thu, 16 Apr 2020 16:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gJ3=6A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jP7qX-0004rd-D2
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:58:37 +0000
X-Inumbo-ID: 81e98fc2-8003-11ea-8bd1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81e98fc2-8003-11ea-8bd1-12813bfff9fa;
 Thu, 16 Apr 2020 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587056314;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+A7o7zIGoVU/FcjMkxo6qjyBi0s/hnC1sRn3hc0hJNk=;
 b=XfU6Um+aABPDD4m47CK3f2uzm3sb3l43FPWdR4N2gjrnNku/NUX2WWuK
 wwGjYsQlmL/VQjYp+R7uz4S0oirR8vNhT2HUrb4WrastaBmAEdECKguXi
 mHrUA+2h7zvZrG+JE/L5Eprwjdhu3vzyBGIsl3H45vne+orPTVnvLKuC4 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: shuKxPwSXk6ubQUn927O1TLTBkZC0MGHX9m4jAArEGQG7C2+DYGn4QmMJK3qQpgszcgCQ9rYz1
 y9jBdboYm2J/XoOvpmaxpSfGpD0t91i3GhiWHMnnKYMS2wMnNP36cRF+cUZvBqIhwnPI6WRpZg
 6ls99KBVDB0ZgETaT5QlV/xZ5soeDKyNonFBSDEF5T3nEqSR7pydWN5l5tdU0M8PBqruY2ZLx4
 /4y2L8o3n8d+IvloqWo95KuTnFJ0XYK6tQ0ajsLQEtOEhmiMe1bMLJruYgbbmCphUCGEX9XO6y
 UTs=
X-SBRS: 2.7
X-MesageID: 15810236
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="15810236"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24216.36520.20579.92616@mariner.uk.xensource.com>
Date: Thu, 16 Apr 2020 17:58:16 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
In-Reply-To: <20200416163607.GO28601@Air-de-Roger>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
 <24215.1729.892903.300149@mariner.uk.xensource.com>
 <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
 <20200416163607.GO28601@Air-de-Roger>
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
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job"):
> On Thu, Apr 16, 2020 at 06:28:33PM +0200, Dario Faggioli wrote:
> > Yep, and that's enough for enabling and starting using ore-scheduling.
> > So, doing like this, core-scheduling should get the same amount and
> > kind of testing that scheduling in general gets.
> 
> Well, we run a lot more tests without 'sched-gran=core', but I don't
> think it's feasible to duplicate the matrix to run all tests with and
> without core-scheduling.

Yes, I agree with Roger.

> > One question, as my OSSTest-fu is a bit rusty... does this create
> > "sched-gran=core" tests for all the schedulers? Or just one of them for
> > th default scheduler?
> 
> Just for the default scheduler ATM, we can expand this if required.
> The test also is very simple, as it just creates a Debian PV guest
> and does some basic life cycle operations, it's exactly like the job
> below but with 'sched-gran=core':
> 
> http://logs.test-lab.xenproject.org/osstest/logs/149667/test-amd64-amd64-xl/info.html

Right.

Thanks,
Ian.

