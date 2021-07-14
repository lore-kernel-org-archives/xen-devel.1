Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0DFC07E9A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 10:08:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F82760FF2
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 10:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F82760FF2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.156010.287925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bo1-0006o5-57; Wed, 14 Jul 2021 10:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156010.287925; Wed, 14 Jul 2021 10:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bo1-0006ny-26; Wed, 14 Jul 2021 10:07:53 +0000
Received: by outflank-mailman (input) for mailman id 156010;
 Wed, 14 Jul 2021 10:07:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bnz-0006no-25; Wed, 14 Jul 2021 10:07:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-0002QJ-RK; Wed, 14 Jul 2021 10:07:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-00051b-Ja; Wed, 14 Jul 2021 10:07:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m3bny-0005PF-J2; Wed, 14 Jul 2021 10:07:50 +0000
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
	bh=in7jPKPNeiVXueRPU0N/OxdohKUNMFXYSbpjM+Cdvdg=; b=x5F2aEMKFY4w1mLYenyKUFPmXV
	R5ShCGvG/S0J5ybpAJ1SJ4wvpnsbYjg6X5TweIJpH2LKpkFqVtg0C9FLuw+2uEN1Zmd2dV2xZYzuT
	wWxZGKR50nm+LrwVEug2K6FZv0AwGBLCYvKIiuxDdit3KM0uLs6edGUvl3YZWOnz2c6A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 163679: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3a98c1a4cec1a302beaddf944ded240b61173f87
X-Osstest-Versions-That:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Jul 2021 10:07:50 +0000

flight 163679 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163679/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3a98c1a4cec1a302beaddf944ded240b61173f87
baseline version:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf

Last test of basis   163562  2021-07-11 09:18:28 Z    3 days
Testing same since   163679  2021-07-14 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
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
   6de3e5fce5..3a98c1a4ce  3a98c1a4cec1a302beaddf944ded240b61173f87 -> coverity-tested/smoke

