Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30DDC25B70
	for <xen-devel@archiver.kernel.org>; Sat, 28 Oct 2023 02:10:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.624719.973335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwYlz-00017D-Bz; Sat, 28 Oct 2023 02:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624719.973335; Sat, 28 Oct 2023 02:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwYlz-000176-8d; Sat, 28 Oct 2023 02:09:59 +0000
Received: by outflank-mailman (input) for mailman id 624719;
 Sat, 28 Oct 2023 02:09:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwYlx-00016w-D5; Sat, 28 Oct 2023 02:09:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwYlx-0007ak-7o; Sat, 28 Oct 2023 02:09:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwYlw-0006hg-Nu; Sat, 28 Oct 2023 02:09:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwYlw-0004Vl-MY; Sat, 28 Oct 2023 02:09:56 +0000
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
	bh=Ky1hpV2LPNxdLkxlk4LZQFCh2/NShs4UtdbNpUPPEoM=; b=1zW+fg1hqIDblNvnrvcWX78y6G
	yfjkR5ibKhgtU4lWes1fBeXR1EY8GakOwtrvo9kANuUIc7zUDxir/+QPT0WVXe/TlwvYFTVOEjQt/
	8eCVzHigLLFNd/gWQLa6Flioi15zSN+22SLC1JUJi2QwjPgZavtpRI8DxNBtSoIlLsSM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183565-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183565: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7ff6ab2b3e09ee7ec0d698398001295b7867b08c
X-Osstest-Versions-That:
    ovmf=7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Oct 2023 02:09:56 +0000

flight 183565 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183565/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7ff6ab2b3e09ee7ec0d698398001295b7867b08c
baseline version:
 ovmf                 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad

Last test of basis   183548  2023-10-27 03:17:33 Z    0 days
Testing same since   183565  2023-10-27 23:41:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BruceX Wang <brucex.wang@intel.com>

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
   7e08d17a4a..7ff6ab2b3e  7ff6ab2b3e09ee7ec0d698398001295b7867b08c -> xen-tested-master

