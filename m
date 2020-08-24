Return-Path: <SRS0=i2DS=CC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F84C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 11:06:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6906206BE
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 11:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="M9c5iljd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6906206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAAIS-0004HY-5m; Mon, 24 Aug 2020 11:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2P5=CC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAAIQ-0004HS-KZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 11:05:50 +0000
X-Inumbo-ID: 9d3f5e75-21a2-4e16-bd67-53043b65f366
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d3f5e75-21a2-4e16-bd67-53043b65f366;
 Mon, 24 Aug 2020 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=4xf8Qw1FXo+T1xqzO2QE1ldlys9Sh6emnqSo2ajLAYI=; b=M9c5iljdY39TUwCH1JliynxEJw
 2Rv3aMhWvqwnuFOmW6nGAUjNTYWg4DofpCEFiR0U7NzYl57W6Gov2gRrWmu5srKRGqqRa0pd3Igfw
 TAHvaxeWBfjncB6yKDqk7IlfYs58G5aE7H1nNaxhzIQSUAS9u/ux0k6q9vsBvgQr1s/I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAAIO-0008GE-TQ; Mon, 24 Aug 2020 11:05:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAAIO-0003oF-M3; Mon, 24 Aug 2020 11:05:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAAIO-0000LD-LZ; Mon, 24 Aug 2020 11:05:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 152718: all pass - PUSHED
X-Osstest-Versions-This: ovmf=d4e0b9607c9a64a8eff20724b2e35ea2cd5bd33f
X-Osstest-Versions-That: ovmf=5a6d764e1d073d28e8f398289ccb5592bf9a72ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Aug 2020 11:05:48 +0000
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

flight 152718 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152718/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d4e0b9607c9a64a8eff20724b2e35ea2cd5bd33f
baseline version:
 ovmf                 5a6d764e1d073d28e8f398289ccb5592bf9a72ba

Last test of basis   152627  2020-08-20 03:50:23 Z    4 days
Testing same since   152718  2020-08-24 03:09:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shenglei Zhang <shenglei.zhang@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   5a6d764e1d..d4e0b9607c  d4e0b9607c9a64a8eff20724b2e35ea2cd5bd33f -> xen-tested-master

