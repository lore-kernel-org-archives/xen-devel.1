Return-Path: <SRS0=7qAe=KH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42B2C433B4
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 09:49:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3999161263
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 09:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3999161263
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126195.237524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lglUC-0005vr-9H; Wed, 12 May 2021 09:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126195.237524; Wed, 12 May 2021 09:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lglUC-0005vk-6J; Wed, 12 May 2021 09:49:00 +0000
Received: by outflank-mailman (input) for mailman id 126195;
 Wed, 12 May 2021 09:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lglUA-0005va-FX; Wed, 12 May 2021 09:48:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lglUA-00084i-5V; Wed, 12 May 2021 09:48:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lglU9-0001BI-T9; Wed, 12 May 2021 09:48:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lglU9-0001GW-Sf; Wed, 12 May 2021 09:48:57 +0000
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
	bh=ja2GOtKWCe3sTDltDx4Mp+g6rj5ownE4nPzSBjgeizM=; b=1aGCIAGJ4XSYxnHn68By/tfl1D
	fwcvXdYqQaKjGv3j7IaA1VR+ggekLr0xxYb9YSUS2o6PNpKvMVbmNgnGNVZa5trmg7O5oHiUrnlaA
	3ML3+QMQ3vcXMviw0iqHH2xl7R67o3UuBiM/50zoARWI3a2oJ344Pizgk/fpMISYMNGE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161916-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161916: all pass - PUSHED
X-Osstest-Versions-This:
    xen=d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
X-Osstest-Versions-That:
    xen=a7da84c457b05479ab423a2e589c5f46c7da0ed7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 May 2021 09:48:57 +0000

flight 161916 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161916/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
baseline version:
 xen                  a7da84c457b05479ab423a2e589c5f46c7da0ed7

Last test of basis   161877  2021-05-09 09:18:27 Z    3 days
Testing same since   161916  2021-05-12 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   a7da84c457..d4fb5f166c  d4fb5f166c2bfbaf9ba0de69da0d411288f437a9 -> coverity-tested/smoke

