Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21574C3DA4A
	for <xen-devel@archiver.kernel.org>; Thu,  1 Aug 2024 16:59:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.769901.1180775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZZ8t-0003ie-QI; Thu, 01 Aug 2024 16:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769901.1180775; Thu, 01 Aug 2024 16:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZZ8t-0003iX-Ll; Thu, 01 Aug 2024 16:59:07 +0000
Received: by outflank-mailman (input) for mailman id 769901;
 Thu, 01 Aug 2024 16:59:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZZ8s-0003iN-V9; Thu, 01 Aug 2024 16:59:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZZ8s-00022a-JU; Thu, 01 Aug 2024 16:59:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZZ8s-0008IB-6C; Thu, 01 Aug 2024 16:59:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZZ8s-0002XG-5h; Thu, 01 Aug 2024 16:59:06 +0000
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
	bh=fnwzHwEjSNTNyRv8zOIJ6ACumfAO6HHBqRWu0xl5kqI=; b=PyeBDUZyCIzY0uu8gqM2lR4wDt
	GXiURWaH68DP6VFwXkaM/kz6E3o7FLaINK5r9wNf+UDDsVQB8zYuxcAoeObCIBl4QhU0htf8hvbTG
	YTxuV3LcyTB1JTp4i1j2e3VrltDYvQ3D1gTBdPTDoEgg71ix/HIWxZiM0lIosLOLqe18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187109-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187109: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2d5390053ff934ec1e94b84f5bb67400b3b75841
X-Osstest-Versions-That:
    ovmf=a679ceca974e94a659f9b6b9e7a7900644220ef9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 16:59:06 +0000

flight 187109 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187109/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2d5390053ff934ec1e94b84f5bb67400b3b75841
baseline version:
 ovmf                 a679ceca974e94a659f9b6b9e7a7900644220ef9

Last test of basis   187108  2024-08-01 13:45:09 Z    0 days
Testing same since   187109  2024-08-01 15:41:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   a679ceca97..2d5390053f  2d5390053ff934ec1e94b84f5bb67400b3b75841 -> xen-tested-master

