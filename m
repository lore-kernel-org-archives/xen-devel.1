Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4AC4332F
	for <xen-devel@archiver.kernel.org>; Wed, 13 Dec 2023 11:09:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.653922.1020555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDN6o-0003dJ-Ue; Wed, 13 Dec 2023 11:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653922.1020555; Wed, 13 Dec 2023 11:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDN6o-0003dC-RZ; Wed, 13 Dec 2023 11:08:58 +0000
Received: by outflank-mailman (input) for mailman id 653922;
 Wed, 13 Dec 2023 11:08:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDN6n-0003cy-6e; Wed, 13 Dec 2023 11:08:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDN6n-0007JR-4o; Wed, 13 Dec 2023 11:08:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDN6m-0007u3-O2; Wed, 13 Dec 2023 11:08:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDN6m-0001yA-NM; Wed, 13 Dec 2023 11:08:56 +0000
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
	bh=87bg8N4vdh/bBulC15uRvCBjb+ZfuDC70XiSHacxWhI=; b=SZeWFQHsjadwadA8c0dR5cWbvB
	DZrc8t5pYlOtdfwkswD2XscLEarusimPPYMmIQA/c4qjEPDY638ckKv9++WPOLGLmu8ci4CYkMRag
	AvnfWguGsEFZCwVsmD9L+iYA8wFQIJ8z1cVtkoSZVTLw83k0k+oVJXGGhjd7m+TrdMXo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184118-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184118: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b8a3eec88cc74bbfe7fb389d026cc7d1d8a989c8
X-Osstest-Versions-That:
    ovmf=cee7ba349c0c1ce489001a338a4e28555728b573
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Dec 2023 11:08:56 +0000

flight 184118 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184118/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b8a3eec88cc74bbfe7fb389d026cc7d1d8a989c8
baseline version:
 ovmf                 cee7ba349c0c1ce489001a338a4e28555728b573

Last test of basis   184103  2023-12-12 11:11:06 Z    0 days
Testing same since   184118  2023-12-13 03:14:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   cee7ba349c..b8a3eec88c  b8a3eec88cc74bbfe7fb389d026cc7d1d8a989c8 -> xen-tested-master

