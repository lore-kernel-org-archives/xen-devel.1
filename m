Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC7CF9C6F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Sep 2024 20:36:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.802315.1212529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sspmn-00089h-Kk; Mon, 23 Sep 2024 20:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802315.1212529; Mon, 23 Sep 2024 20:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sspmn-00089a-Gp; Mon, 23 Sep 2024 20:35:57 +0000
Received: by outflank-mailman (input) for mailman id 802315;
 Mon, 23 Sep 2024 20:35:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sspmm-00089Q-Lh; Mon, 23 Sep 2024 20:35:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sspmm-0006dr-I0; Mon, 23 Sep 2024 20:35:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sspmm-0002XJ-6p; Mon, 23 Sep 2024 20:35:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sspmm-000303-4j; Mon, 23 Sep 2024 20:35:56 +0000
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
	bh=quL+YH82YT0HdGGf8YwBZjfcLYanC8UFZ4SKv0x1AhM=; b=dlU8yFfsFSWWBwoTrF5e3bawPJ
	rNjP5PaZj0MH0pK/j+EamLM0pJ2Np8vcEb0TmWqWwl1J3FLWTtHl2VYKZNFcx0KdFpncFcAv2+o0k
	Nb0XOws9A2dzJg4Kws1MMDDZP4936n2vRuMDx05yPY9+qJQL3IrfpHXan0ZnNd+bJ+C4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187833-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187833: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a131839a3db7f933f51efc6c13d5986d7f09eab3
X-Osstest-Versions-That:
    ovmf=4c3bffaeb3cff662686e33c506802132147c4fbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 20:35:56 +0000

flight 187833 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187833/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a131839a3db7f933f51efc6c13d5986d7f09eab3
baseline version:
 ovmf                 4c3bffaeb3cff662686e33c506802132147c4fbf

Last test of basis   187829  2024-09-23 16:13:15 Z    0 days
Testing same since   187833  2024-09-23 18:41:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Turner <miketur@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   4c3bffaeb3..a131839a3d  a131839a3db7f933f51efc6c13d5986d7f09eab3 -> xen-tested-master

