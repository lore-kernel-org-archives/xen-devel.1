Return-Path: <SRS0=ian9=NQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2437BC4338F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 10:26:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CD8610C7
	for <xen-devel@archiver.kernel.org>; Wed, 25 Aug 2021 10:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3CD8610C7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171875.313615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIq6e-0003ZS-B5; Wed, 25 Aug 2021 10:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171875.313615; Wed, 25 Aug 2021 10:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIq6e-0003ZL-89; Wed, 25 Aug 2021 10:26:04 +0000
Received: by outflank-mailman (input) for mailman id 171875;
 Wed, 25 Aug 2021 10:26:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIq6d-0003ZB-Ak; Wed, 25 Aug 2021 10:26:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIq6d-0001lE-5D; Wed, 25 Aug 2021 10:26:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIq6c-0002zI-Sl; Wed, 25 Aug 2021 10:26:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mIq6c-0003j9-SF; Wed, 25 Aug 2021 10:26:02 +0000
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
	bh=IbVdtZ04dC/awqSy7iCwQTEfQkzO4/ZTKVgog+OWKcc=; b=G9DEEhYviSfQIpajCoLgzh887k
	zv6Q9Ydj1XvdcLF7ck8/P0q+CEIyRw1BzMl23EaT92HcTL0z1VrFceDAMCwgrAPqUavPI1Cupu9dN
	l37XC7rG4NRND0/6cFVTI5F2jo9jsOrlIs/tqaH20ubEm6/5cq6QIj0yBMdBDnbsbtmo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164478-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164478: all pass - PUSHED
X-Osstest-Versions-This:
    xen=a931e8e64af07bd333a31f3b71a3f8f3e7910857
X-Osstest-Versions-That:
    xen=93713f444b3f29d6848527506db69cf78976b32d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Aug 2021 10:26:02 +0000

flight 164478 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164478/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  a931e8e64af07bd333a31f3b71a3f8f3e7910857
baseline version:
 xen                  93713f444b3f29d6848527506db69cf78976b32d

Last test of basis   164344  2021-08-22 09:18:28 Z    3 days
Testing same since   164478  2021-08-25 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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
   93713f444b..a931e8e64a  a931e8e64af07bd333a31f3b71a3f8f3e7910857 -> coverity-tested/smoke

