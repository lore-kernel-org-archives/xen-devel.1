Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35FC3DA59
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jul 2024 20:07:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.759251.1168888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTRyO-0006aT-Pj; Mon, 15 Jul 2024 20:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759251.1168888; Mon, 15 Jul 2024 20:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTRyO-0006aM-Lr; Mon, 15 Jul 2024 20:07:00 +0000
Received: by outflank-mailman (input) for mailman id 759251;
 Mon, 15 Jul 2024 20:06:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTRyN-0006aC-Iq; Mon, 15 Jul 2024 20:06:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTRyN-0006B8-Dz; Mon, 15 Jul 2024 20:06:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTRyN-0006Um-13; Mon, 15 Jul 2024 20:06:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTRyN-0007Nr-0d; Mon, 15 Jul 2024 20:06:59 +0000
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
	bh=yDO735SY/PbmTAhGpItVJ2fL50FAhgsBm+1nxp6uNpY=; b=rlLsm/cASOPosa2taQpPzH2gF2
	yx6tDDnHrS9TKx4LsdOehPppUg7HO9MROVSdkBe2cUPjFOySuDB2y7lI0yhTzn4KUA6TWghl8Q2h1
	NoR9RV8AVdmlqswYWIXED/Smr1r6GNliygiLgr/uzgFQ+f4pxO5zVv94BeIefpvnQiF8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186810-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186810: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8e6ba0dcae40bfd4c191b2cd47e08f38186513d1
X-Osstest-Versions-That:
    ovmf=5366def8d01d141163a727aeaef61318180deb98
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jul 2024 20:06:59 +0000

flight 186810 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186810/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8e6ba0dcae40bfd4c191b2cd47e08f38186513d1
baseline version:
 ovmf                 5366def8d01d141163a727aeaef61318180deb98

Last test of basis   186808  2024-07-15 13:43:04 Z    0 days
Testing same since   186810  2024-07-15 17:12:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Pop <aaronpop@microsoft.com>
  v-bhavanisu <144935558+v-bhavanisu@users.noreply.github.com>

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
   5366def8d0..8e6ba0dcae  8e6ba0dcae40bfd4c191b2cd47e08f38186513d1 -> xen-tested-master

