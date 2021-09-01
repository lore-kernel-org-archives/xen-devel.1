Return-Path: <SRS0=KClV=NX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1734CC432BE
	for <xen-devel@archiver.kernel.org>; Wed,  1 Sep 2021 10:06:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C893F60234
	for <xen-devel@archiver.kernel.org>; Wed,  1 Sep 2021 10:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C893F60234
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.176268.320748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLN7w-0000Ee-Cc; Wed, 01 Sep 2021 10:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176268.320748; Wed, 01 Sep 2021 10:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLN7w-0000EX-9g; Wed, 01 Sep 2021 10:05:52 +0000
Received: by outflank-mailman (input) for mailman id 176268;
 Wed, 01 Sep 2021 10:05:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLN7u-0000EN-Uy; Wed, 01 Sep 2021 10:05:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLN7u-0007jP-Py; Wed, 01 Sep 2021 10:05:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLN7u-0003Qd-I2; Wed, 01 Sep 2021 10:05:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLN7u-0004H0-Ha; Wed, 01 Sep 2021 10:05:50 +0000
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
	bh=j24VJPcwVdYQa9uXurFdKSllutLiT6F+ExzgVYTfIp4=; b=5ThjvdKqEVYCOp9dDeFj3Gamh6
	acyoEzYMhEZ5sUiiCkLYI/y5AKu6StXQ/cxEkMuatfIBD90ESXPTBzeiBNmE0d4z++H0NXeetWFfu
	e5FiZZ4Uxv8FTHJpRMZacknwWJ+ETqOQ2Q8gmFFrmzh3Pdby16lzv353IKPyBTqgDyzE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164692-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164692: all pass - PUSHED
X-Osstest-Versions-This:
    xen=96607a8e680e7f965ca868d11f8b0636317d2618
X-Osstest-Versions-That:
    xen=8064488062641ae505b2a7369611c38057a7788b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 10:05:50 +0000

flight 164692 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164692/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  96607a8e680e7f965ca868d11f8b0636317d2618
baseline version:
 xen                  8064488062641ae505b2a7369611c38057a7788b

Last test of basis   164595  2021-08-29 09:18:29 Z    3 days
Testing same since   164692  2021-09-01 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien@xen.org>

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
   8064488062..96607a8e68  96607a8e680e7f965ca868d11f8b0636317d2618 -> coverity-tested/smoke

