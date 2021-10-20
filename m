Return-Path: <SRS0=07bM=PI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81571C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 20 Oct 2021 13:13:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4991E60EB1
	for <xen-devel@archiver.kernel.org>; Wed, 20 Oct 2021 13:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4991E60EB1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.213912.372274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBOe-0000tz-Qq; Wed, 20 Oct 2021 13:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213912.372274; Wed, 20 Oct 2021 13:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBOe-0000ts-N9; Wed, 20 Oct 2021 13:12:44 +0000
Received: by outflank-mailman (input) for mailman id 213912;
 Wed, 20 Oct 2021 13:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdBOd-0000ti-6B; Wed, 20 Oct 2021 13:12:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdBOc-0005ah-VJ; Wed, 20 Oct 2021 13:12:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mdBOc-0004gt-MN; Wed, 20 Oct 2021 13:12:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mdBOc-0006OK-Ls; Wed, 20 Oct 2021 13:12:42 +0000
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
	bh=IW9ceqUEg2h6EZBfuKfd2kFJmpv7AS6cZUWEsZcUzAA=; b=vcNKkcJ2Z1UBq4s02ulB/xRlsS
	nPN+xNuLE9e+cLQHtcqLw9/b/MOvk7I620P0Ix3I1F+r1CiSqjZJIEpBnVKWtE47ARlIFuHn5EKAM
	ReyQeqV4BWDvPptVej+ymZAOGIbwBKvCKR7ojQ3U2JjKeu4HBYOdjWerFj7b+BLzrF+c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165688-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165688: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4fdf843c75d297fe892f989009b3d3e397ccfd55
X-Osstest-Versions-That:
    ovmf=37a33f02aa1ab89f392da7d06ec3578fda1b6182
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Oct 2021 13:12:42 +0000

flight 165688 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165688/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4fdf843c75d297fe892f989009b3d3e397ccfd55
baseline version:
 ovmf                 37a33f02aa1ab89f392da7d06ec3578fda1b6182

Last test of basis   165685  2021-10-20 07:11:17 Z    0 days
Testing same since   165688  2021-10-20 10:13:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Moritz Fischer <moritzf@google.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   37a33f02aa..4fdf843c75  4fdf843c75d297fe892f989009b3d3e397ccfd55 -> xen-tested-master

