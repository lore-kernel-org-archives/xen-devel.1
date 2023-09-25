Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30494CE7A94
	for <xen-devel@archiver.kernel.org>; Mon, 25 Sep 2023 10:49:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.607791.946090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkj8x-0002tL-Ip; Mon, 25 Sep 2023 10:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607791.946090; Mon, 25 Sep 2023 10:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkj8x-0002tE-Fk; Mon, 25 Sep 2023 10:48:47 +0000
Received: by outflank-mailman (input) for mailman id 607791;
 Mon, 25 Sep 2023 10:48:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qkj8w-0002t4-Mh; Mon, 25 Sep 2023 10:48:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qkj8w-00030d-FT; Mon, 25 Sep 2023 10:48:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qkj8w-000388-1h; Mon, 25 Sep 2023 10:48:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qkj8w-0001kA-1A; Mon, 25 Sep 2023 10:48:46 +0000
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
	bh=GN2ROLlADVfzI635bDkehUR7u6sH8IMoFxqeuTl8F3o=; b=0lF/DzjnQRsdovMoT3DAPsxHma
	zdm7AA7D6DlYJFnZ4+ndDqwPxNA7oW5Puuv3UczOQp7qqPOgUuHicw9/W/+qvS+pthjPYR6cMx/7K
	b+w4/oS7p/0hCLcKB251sWWCJxubyFLuc/VKbJNE/q3mkEBrk6g0ZlCj4v/fZU/NzR2c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183155-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183155: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c70d91442889078eb94e0abf777f74e403b72d37
X-Osstest-Versions-That:
    ovmf=43dcf453fc15ca152945ca41dcce7f2f43a14313
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Sep 2023 10:48:46 +0000

flight 183155 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183155/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c70d91442889078eb94e0abf777f74e403b72d37
baseline version:
 ovmf                 43dcf453fc15ca152945ca41dcce7f2f43a14313

Last test of basis   183151  2023-09-25 03:12:35 Z    0 days
Testing same since   183155  2023-09-25 08:40:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cai, Xianglei <xianglei.cai@intel.com>
  Dongyan Qian <qiandongyan@loongson.cn>
  Xianglei Cai <xianglei.cai@intel.com>

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
   43dcf453fc..c70d914428  c70d91442889078eb94e0abf777f74e403b72d37 -> xen-tested-master

