Return-Path: <SRS0=Vvkq=MD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB88C07E96
	for <xen-devel@archiver.kernel.org>; Sun, 11 Jul 2021 10:23:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF71661156
	for <xen-devel@archiver.kernel.org>; Sun, 11 Jul 2021 10:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF71661156
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154217.284982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2WcC-0004hN-Qj; Sun, 11 Jul 2021 10:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154217.284982; Sun, 11 Jul 2021 10:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2WcC-0004hG-N4; Sun, 11 Jul 2021 10:23:12 +0000
Received: by outflank-mailman (input) for mailman id 154217;
 Sun, 11 Jul 2021 10:23:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2WcB-0004h6-1R; Sun, 11 Jul 2021 10:23:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2WcA-00020y-QY; Sun, 11 Jul 2021 10:23:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2WcA-0003jR-Ex; Sun, 11 Jul 2021 10:23:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m2WcA-0003Ky-EV; Sun, 11 Jul 2021 10:23:10 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=WenS3ESgwqmMdSN95aSEPzDzZ+cC4Vs7TKmAQ6RSpcM=; b=wbyKjKGAwgzEvwdhF2Ck+pHUDA
	t+e+D2VlC1HCDejvYHeFJAHT7P+1+Y5OEMr8wN5+n0us/gsjrAqfD/hDANM+AwKfjfSRNdXI6orVp
	ukFiclSqd0qi3aml1QmiaEHnTjameS6dn4NAJkh+COjDIe1bkFJ+8N09+tkdhqCx8qDw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163562-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163562: all pass - PUSHED
X-Osstest-Versions-This:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
X-Osstest-Versions-That:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Jul 2021 10:23:10 +0000

flight 163562 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163562/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
baseline version:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a

Last test of basis   163396  2021-07-07 09:23:02 Z    4 days
Testing same since   163562  2021-07-11 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christopher Clark <christopher.clark@starlab.io>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Rahul Singh <rahul.singh@arm.com>
  Richard Kojedzinszky <richard@kojedz.in>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   4473f36010..6de3e5fce5  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf -> coverity-tested/smoke

