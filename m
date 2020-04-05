Return-Path: <SRS0=Gfjm=5V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51ABC2BA19
	for <xen-devel@archiver.kernel.org>; Sun,  5 Apr 2020 10:29:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774CC20675
	for <xen-devel@archiver.kernel.org>; Sun,  5 Apr 2020 10:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="suBFEF7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774CC20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jL2WR-0002bb-Jw; Sun, 05 Apr 2020 10:28:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1oUj=5V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jL2WQ-0002bW-2v
 for xen-devel@lists.xenproject.org; Sun, 05 Apr 2020 10:28:58 +0000
X-Inumbo-ID: 3eb8483a-7728-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3eb8483a-7728-11ea-83d8-bc764e2007e4;
 Sun, 05 Apr 2020 10:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWg+3LSXTVjYqgwMg5UjQxHwl9v/OLDAyCcMCHg8tAo=; b=suBFEF7McRjcYDcOenIz5qG0m
 BdxAb9pPR7WtfFe/+50xU6JQvo19+4ykxKVg/VIDI6+id1RTUhTTOYiDdBet0lcxYDAbk1wvUXd06
 KP7F4EBtGgP7uG4W8oQHBOz4Gc9mlyR/s1mAIG50JeQjD+iK0hfF+QtfrJfOJ1jmKnBDU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jL2WK-0005jH-3G; Sun, 05 Apr 2020 10:28:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jL2WJ-0007Ly-Ed; Sun, 05 Apr 2020 10:28:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jL2WJ-0004aC-Dw; Sun, 05 Apr 2020 10:28:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149438-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149438: all pass - PUSHED
X-Osstest-Versions-This: xen=990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
X-Osstest-Versions-That: xen=5af4698d98d881e786c0909b6308f04696586c49
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Apr 2020 10:28:51 +0000
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

flight 149438 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149438/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
baseline version:
 xen                  5af4698d98d881e786c0909b6308f04696586c49

Last test of basis   149277  2020-04-01 09:29:59 Z    4 days
Testing same since   149438  2020-04-05 09:19:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simran Singhal <singhalsimran0@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   5af4698d98..990b6e38d9  990b6e38d93c6e60f9d81e8b71ddfd209fca00bd -> coverity-tested/smoke

