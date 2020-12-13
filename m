Return-Path: <SRS0=IBzN=FR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C8C4361B
	for <xen-devel@archiver.kernel.org>; Sun, 13 Dec 2020 09:57:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 912012076B
	for <xen-devel@archiver.kernel.org>; Sun, 13 Dec 2020 09:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 912012076B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.51539.90478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koO7s-0004Ve-Oh; Sun, 13 Dec 2020 09:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51539.90478; Sun, 13 Dec 2020 09:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koO7s-0004VX-Ld; Sun, 13 Dec 2020 09:57:12 +0000
Received: by outflank-mailman (input) for mailman id 51539;
 Sun, 13 Dec 2020 09:57:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1koO7q-0004VP-Pb; Sun, 13 Dec 2020 09:57:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1koO7q-0006ez-HI; Sun, 13 Dec 2020 09:57:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1koO7q-0000LA-Am; Sun, 13 Dec 2020 09:57:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1koO7q-0001G8-AI; Sun, 13 Dec 2020 09:57:10 +0000
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
	bh=SqfapOl+wpHecExeXDJruARrhuGLcZddnrOYu5beqZ0=; b=w+oUUI0uIg2kdTVVHbn7Kb5qUR
	l3woCNt8eim+IFoynuIpDsUeBOk2SKgZQnU/+vgWfti7UrFIGhKrin0fbPmHE2Qv5HSA3xhk3LzXI
	R3sMP1GN0gZSu5h58XPCAbgxxu1fRev3V4po7VmbLgMD0LGPjy1iyVy3KABkdta++Fq8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157492-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157492: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8e0fe4fe5fd89d80a362d8a9a46726aded3b49c4
X-Osstest-Versions-That:
    xen=777e3590f154e6a8af560dd318b9465fa168db20
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Dec 2020 09:57:10 +0000

flight 157492 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157492/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8e0fe4fe5fd89d80a362d8a9a46726aded3b49c4
baseline version:
 xen                  777e3590f154e6a8af560dd318b9465fa168db20

Last test of basis   157343  2020-12-09 09:19:25 Z    4 days
Testing same since   157492  2020-12-13 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Wei Liu <wl@xen.org>

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
   777e3590f1..8e0fe4fe5f  8e0fe4fe5fd89d80a362d8a9a46726aded3b49c4 -> coverity-tested/smoke

