Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D9C04A68
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jul 2022 10:04:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.376008.608570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdtW-0006BL-2S; Wed, 27 Jul 2022 10:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376008.608570; Wed, 27 Jul 2022 10:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdtV-0006BE-V0; Wed, 27 Jul 2022 10:03:57 +0000
Received: by outflank-mailman (input) for mailman id 376008;
 Wed, 27 Jul 2022 10:03:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGdtU-0006B0-2T; Wed, 27 Jul 2022 10:03:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGdtU-0001ca-0a; Wed, 27 Jul 2022 10:03:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGdtT-0000v5-JC; Wed, 27 Jul 2022 10:03:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGdtT-0002O5-Ik; Wed, 27 Jul 2022 10:03:55 +0000
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
	bh=4qcH6FaXy/TAqvYX7BUgZog9ls1ORI4zCTstWu2Cl/8=; b=xuR5Mxh0xqd73M8ZyVFyM2Ln2U
	uAjGWGTqKMoqLkSshsCKG/FBNr3sFJP6sraBGbTLkW7r0F6yd8nugqHjIlWZjOf7RVGiGncUjatzm
	J6SClg7h/nG1HbonqYtZE9yXhmTN/hw19cthmGYA10tGw7t/3fPZm36wwLBhesmiznk4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171878-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171878: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b68d566439683d0ebe60d52c85ff0e90331db740
X-Osstest-Versions-That:
    ovmf=7f1c89f16790fc2fa8bc88330dc896941b9b40bb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Jul 2022 10:03:55 +0000

flight 171878 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171878/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b68d566439683d0ebe60d52c85ff0e90331db740
baseline version:
 ovmf                 7f1c89f16790fc2fa8bc88330dc896941b9b40bb

Last test of basis   171858  2022-07-25 23:40:21 Z    1 days
Testing same since   171878  2022-07-27 05:12:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   7f1c89f167..b68d566439  b68d566439683d0ebe60d52c85ff0e90331db740 -> xen-tested-master

