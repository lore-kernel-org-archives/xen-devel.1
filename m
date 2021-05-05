Return-Path: <SRS0=B3Pa=KA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DC2C433B4
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 09:58:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0022B613BF
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 09:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0022B613BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122952.231944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEIO-0003w8-LA; Wed, 05 May 2021 09:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122952.231944; Wed, 05 May 2021 09:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEIO-0003w1-Hv; Wed, 05 May 2021 09:58:20 +0000
Received: by outflank-mailman (input) for mailman id 122952;
 Wed, 05 May 2021 09:58:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0003vr-V1; Wed, 05 May 2021 09:58:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0006xE-RD; Wed, 05 May 2021 09:58:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0000Lr-FS; Wed, 05 May 2021 09:58:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1leEIM-0007NK-Ey; Wed, 05 May 2021 09:58:18 +0000
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
	bh=g2pX0JlFalaJ7bXsW3Pd5ggfSXizL2EamAxcDXZuPcE=; b=JIFD+mWnLCDWFACgVDmbiWJRNe
	wB9U8B/Q4ZaIEY0cWlk0M4KeBfty+89XQ47mM/4eygKSVe6FLvarl+m6R3aC18cwtq6dsFGxS3onM
	X852Jmpl9cwNcsPV6yE9pR2zKPk98Ic6i6EuAC5YkYIdxeO7BD+VfhfMufjOWThKj2cg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161786: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8cccd6438e86112ab383e41b433b5a7e73be9621
X-Osstest-Versions-That:
    xen=1f8ee4cb430e5a9da37096574c41632cf69a0bc7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 May 2021 09:58:18 +0000

flight 161786 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8cccd6438e86112ab383e41b433b5a7e73be9621
baseline version:
 xen                  1f8ee4cb430e5a9da37096574c41632cf69a0bc7

Last test of basis   161601  2021-05-02 09:18:26 Z    3 days
Testing same since   161786  2021-05-05 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

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
   1f8ee4cb43..8cccd6438e  8cccd6438e86112ab383e41b433b5a7e73be9621 -> coverity-tested/smoke

