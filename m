Return-Path: <SRS0=Z/pm=NG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4251EC4338F
	for <xen-devel@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFAD6109E
	for <xen-devel@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAFAD6109E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.167064.304938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFDOk-0006rA-Us; Sun, 15 Aug 2021 10:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167064.304938; Sun, 15 Aug 2021 10:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFDOk-0006r3-Ru; Sun, 15 Aug 2021 10:29:46 +0000
Received: by outflank-mailman (input) for mailman id 167064;
 Sun, 15 Aug 2021 10:29:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFDOj-0006qt-F6; Sun, 15 Aug 2021 10:29:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFDOj-0002nE-6T; Sun, 15 Aug 2021 10:29:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mFDOi-0004lU-UB; Sun, 15 Aug 2021 10:29:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mFDOi-0007Nv-Tj; Sun, 15 Aug 2021 10:29:44 +0000
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
	bh=ZhEetUxhW3HcW43zCEMRClLceLods/aSFHfNCFsXv3E=; b=g8B4z0Glr2noQrosMa6Vt1Ovhq
	7cu0ISno4BZbB6SlUCSLzTdp+guBMOq18oUtFMCUEppfQlDDbo/EZXz9QNQGt9tlVqmq1blN+8WHH
	IbFr9I7YUTQJzCyRUr1keQHx4MyYvXqP2yeU6XsnnIrsuKGwktweHDa1feqxeg65C74Q=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164193-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164193: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5c34b9af05b9e5abd25d88efc4fb783136547810
X-Osstest-Versions-That:
    xen=25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Aug 2021 10:29:44 +0000

flight 164193 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164193/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5c34b9af05b9e5abd25d88efc4fb783136547810
baseline version:
 xen                  25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe

Last test of basis   164158  2021-08-11 09:19:40 Z    4 days
Testing same since   164193  2021-08-15 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>

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
   25da9455f1..5c34b9af05  5c34b9af05b9e5abd25d88efc4fb783136547810 -> coverity-tested/smoke

