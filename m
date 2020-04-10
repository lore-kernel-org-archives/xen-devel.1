Return-Path: <SRS0=KZFo=52=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E3FC2D0EC
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2020 19:02:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E5A20732
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2020 19:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="6Hh5DPGx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E5A20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMyuL-000254-GN; Fri, 10 Apr 2020 19:01:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fqfT=52=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMyuJ-00024x-Ud
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 19:01:39 +0000
X-Inumbo-ID: b1dffde2-7b5d-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1dffde2-7b5d-11ea-b4f4-bc764e2007e4;
 Fri, 10 Apr 2020 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nMV9uS6Rbhe2sbUYCOfNnqKkkmzVZc7aN/na9X8B4Fg=; b=6Hh5DPGx6JkZ6fuYiO7t12dex
 ad4he52DfgV8aL/t5GjixbtcM7FWVMcztjp/Cq5+Y+/u9dby01/p1/2NpMzIIn1LEz2kLdk7jj7+r
 OEd3Ifh6GZ/NuqBCzXlgu8joOfdI0cOMY0Z270eriPByJP+AAOcwKwGWm95xvVSb0mWk8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyuD-0005tg-8M; Fri, 10 Apr 2020 19:01:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyuC-000420-Vg; Fri, 10 Apr 2020 19:01:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyuC-0007FB-V4; Fri, 10 Apr 2020 19:01:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149594-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149594: all pass - PUSHED
X-Osstest-Versions-This: ovmf=a5d8a399635d86c8155a252874fbf3c0e6613d34
X-Osstest-Versions-That: ovmf=e4004e8e505a9ca697b1d5aaee9b3ae25cdc3b21
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Apr 2020 19:01:32 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149594 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149594/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a5d8a399635d86c8155a252874fbf3c0e6613d34
baseline version:
 ovmf                 e4004e8e505a9ca697b1d5aaee9b3ae25cdc3b21

Last test of basis   149560  2020-04-09 10:09:22 Z    1 days
Testing same since   149594  2020-04-10 07:41:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leendert van Doorn <leendert@microsoft.com>
  Leif Lindholm <leif@nuviainc.com>

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
   e4004e8e50..a5d8a39963  a5d8a399635d86c8155a252874fbf3c0e6613d34 -> xen-tested-master

