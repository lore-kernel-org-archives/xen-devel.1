Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24678C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 10:35:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD3020644
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 10:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD3020644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo2kk-0004jX-HV; Wed, 24 Jun 2020 10:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ja3c=AF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jo2kj-0004jS-UV
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 10:35:37 +0000
X-Inumbo-ID: 7065a90a-b606-11ea-8496-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7065a90a-b606-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 10:35:36 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BSMsCqpUMqBviCsQF6Rld13Ftzteb5PskJVW3gchlDwuDGHxsRaS6YW9RvTkSWQ5m1UW7CAbeT
 N756ZKRmHNDMzuZ5h8yUKgGoY6d0hErfcC1e19PTZZ7EBmByUughjc4k2Xsi7OXZArS1wX11IN
 EC69UqdEbP8B2JZsteePA1qf+F3VggUL+LbieUXGrPliv5KdrtRP36Ztx+EwF6zXnyAfzFODtO
 NGCs9ocmFotRNsA7x1PCj5LO9cXJ739D4Mq2OPFwTO7fAEi3fipKPJqYPIc45vFP7bMNZ4+6BH
 UQ0=
X-SBRS: 2.7
X-MesageID: 21605881
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,275,1589256000"; d="scan'208";a="21605881"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24307.11381.75189.206321@mariner.uk.xensource.com>
Date: Wed, 24 Jun 2020 11:35:33 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [xen-4.11-testing test] 151295: regressions - FAIL
In-Reply-To: <a7f16ab8-4c8b-4cef-e767-162199e1b455@suse.com>
References: <osstest-151295-mainreport@xen.org>
 <a7f16ab8-4c8b-4cef-e767-162199e1b455@suse.com>
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

Jan Beulich writes ("Re: [xen-4.11-testing test] 151295: regressions - FAIL"):
> On 23.06.2020 20:32, osstest service owner wrote:
> > flight 151295 xen-4.11-testing real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/151295/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-amd64-prev              6 xen-build      fail in 151260 REGR. vs. 150040
> >  build-i386-prev               6 xen-build      fail in 151260 REGR. vs. 150040
> > 
> > Tests which are failing intermittently (not blocking):
> >  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail pass in 151260
> > 
> > Tests which did not succeed, but are not blocking:
> 
> I'm once again struggling to see why there was no push here: The
> latter two groups both say "not blocking", and the two build-*-prev
> didn't actually fail here, but in an earlier flight. Without
> understanding the reason here I'm hesitant to suggest a force push,
> though.

osstest is using the earlier flight (151260) to justify considering
pushing despite test-amd64-amd64-xl-qemut-debianhvm-i386-xsm but that
means it wants a justification for all the failures in 151260 too.

Broadly speaking, this logic is necessary because failed tests can
block other tests.

I think this will succeed on the next run.

Ian.

