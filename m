Return-Path: <SRS0=NF3d=M7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE315C4338F
	for <xen-devel@archiver.kernel.org>; Sun,  8 Aug 2021 10:07:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F59660F02
	for <xen-devel@archiver.kernel.org>; Sun,  8 Aug 2021 10:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F59660F02
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.164912.301345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mCfhv-0004PJ-7t; Sun, 08 Aug 2021 10:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164912.301345; Sun, 08 Aug 2021 10:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mCfhv-0004PC-4x; Sun, 08 Aug 2021 10:07:03 +0000
Received: by outflank-mailman (input) for mailman id 164912;
 Sun, 08 Aug 2021 10:07:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mCfhs-0004P2-W0; Sun, 08 Aug 2021 10:07:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mCfhs-0000XQ-Pd; Sun, 08 Aug 2021 10:07:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mCfhs-0003nD-Ge; Sun, 08 Aug 2021 10:07:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mCfhs-0001Dd-GB; Sun, 08 Aug 2021 10:07:00 +0000
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
	bh=UCJ66hlYDgYJNFLCjMnWj6NDfnifiXmSxg6bJZs8v8E=; b=lTNUbXUO/Vkm3kh1uOJMXfpH+I
	mxAdq34ibb7DU9jVKvTAKAjmT6CyS1sbNsWPpU3IwEtZmg+O2bTifVmOCGlW29nivaSYlBQ/LsbYM
	SUWuJVZv1Xkf1BRbcCrL/Wmje6etARrtF5OVt8MH2Z8bL+tWrhY+pu1jBLGCQ2QCDLho=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164133-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164133: all pass - PUSHED
X-Osstest-Versions-This:
    xen=2b45ff60301a988badec526846e77b538383ae63
X-Osstest-Versions-That:
    xen=2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 08 Aug 2021 10:07:00 +0000

flight 164133 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164133/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  2b45ff60301a988badec526846e77b538383ae63
baseline version:
 xen                  2278d2cbb0b7c1b48b298c6c4c6a7de2271ac928

Last test of basis   164101  2021-08-04 09:19:40 Z    4 days
Testing same since   164133  2021-08-08 09:19:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   2278d2cbb0..2b45ff6030  2b45ff60301a988badec526846e77b538383ae63 -> coverity-tested/smoke

