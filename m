Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3E2C5478C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Feb 2024 03:42:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.686392.1068353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfApo-0006f6-Py; Wed, 28 Feb 2024 03:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686392.1068353; Wed, 28 Feb 2024 03:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfApo-0006ez-Mb; Wed, 28 Feb 2024 03:42:20 +0000
Received: by outflank-mailman (input) for mailman id 686392;
 Wed, 28 Feb 2024 03:42:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfApm-0006ep-Hv; Wed, 28 Feb 2024 03:42:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfApm-0007sD-Ef; Wed, 28 Feb 2024 03:42:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfApm-0002Bd-43; Wed, 28 Feb 2024 03:42:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rfApm-0002iC-3j; Wed, 28 Feb 2024 03:42:18 +0000
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
	bh=fPajU2ElPmgjasgNwYun/KiFJzyjYbcYVlRgxY1ogLU=; b=vwCXhhU++IfLIfx3/C9KLyQqnE
	yQA3yekSbWJlXz7s69VglBrG4Fp1IYg2eKnLTQZvaRHWN4tC8kYMRmjFwj8QCtevfJs+giqlD5Oul
	2JymfI9S0sWSR+prknzsSc5kBR0eD10Qdl+K5bYY81tYw9i1s7FmxNaIBzUb3iM73VFQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184790-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184790: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aceb3490a2a350b128156fd4e36e53fc19739e4e
X-Osstest-Versions-That:
    ovmf=ba9c3ceaf83d3ee448b2fd38bc9ad28b690c697a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Feb 2024 03:42:18 +0000

flight 184790 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184790/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aceb3490a2a350b128156fd4e36e53fc19739e4e
baseline version:
 ovmf                 ba9c3ceaf83d3ee448b2fd38bc9ad28b690c697a

Last test of basis   184782  2024-02-27 12:43:39 Z    0 days
Testing same since   184790  2024-02-27 15:45:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   ba9c3ceaf8..aceb3490a2  aceb3490a2a350b128156fd4e36e53fc19739e4e -> xen-tested-master

