Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E0EC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 10:56:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB9C20885
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 10:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="1bwzsJft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB9C20885
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5oQ8-0005mY-Qm; Wed, 12 Aug 2020 10:55:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OV9a=BW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k5oQ7-0005mB-Gq
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 10:55:47 +0000
X-Inumbo-ID: 9737c8a1-e8a3-4f22-aa28-bdbb0d572363
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9737c8a1-e8a3-4f22-aa28-bdbb0d572363;
 Wed, 12 Aug 2020 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=md/JGdTbA1vIVfnP7YAP8AouK5o7z5aHYGdRHpqX5PM=; b=1bwzsJftYJKvs8IaQodbFt0XR
 DEZknMY88sgWDODCGsvGoM+PEzL3N1r6vhp2qEIALx/8Luot8Nvn/gteHUzj7T5rhiDGs0e9PZN7W
 GcEElN4CFiZAumeMhld6OwV4gpXJlFFJZVjjjH51SWpXGM+mr2UH0Uw+BKr5wZ5G0jU20=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5oQ0-0002rH-IR; Wed, 12 Aug 2020 10:55:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5oQ0-0004nD-A5; Wed, 12 Aug 2020 10:55:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k5oQ0-00087S-9L; Wed, 12 Aug 2020 10:55:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152570-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152570: all pass - PUSHED
X-Osstest-Versions-This: xen=7a4dd361d10718608ad37f969df0a3cf5bc17b12
X-Osstest-Versions-That: xen=90c7eee53fcc0b48bd51aa3a7d1d0d9980ce1a7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Aug 2020 10:55:40 +0000
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

flight 152570 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152570/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  7a4dd361d10718608ad37f969df0a3cf5bc17b12
baseline version:
 xen                  90c7eee53fcc0b48bd51aa3a7d1d0d9980ce1a7a

Last test of basis   152543  2020-08-09 09:18:28 Z    3 days
Testing same since   152570  2020-08-12 09:22:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   90c7eee53f..7a4dd361d1  7a4dd361d10718608ad37f969df0a3cf5bc17b12 -> coverity-tested/smoke

