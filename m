Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C6E7C4EB
	for <xen-devel@archiver.kernel.org>; Wed,  4 Oct 2023 18:14:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.612739.952803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6OO-0007yj-1y; Wed, 04 Oct 2023 18:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612739.952803; Wed, 04 Oct 2023 18:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo6ON-0007yc-VJ; Wed, 04 Oct 2023 18:14:39 +0000
Received: by outflank-mailman (input) for mailman id 612739;
 Wed, 04 Oct 2023 18:14:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo6OM-0007yS-LY; Wed, 04 Oct 2023 18:14:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo6OM-0002hO-Fe; Wed, 04 Oct 2023 18:14:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo6OM-0000Qw-0J; Wed, 04 Oct 2023 18:14:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qo6OL-0003a6-W6; Wed, 04 Oct 2023 18:14:37 +0000
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
	bh=k7UGRqZoCqYqcOFb2QyLzj1/5VyidAWYBm+4qoxSFcE=; b=3qqRGAiyteZCw+sYcqo+vvNJkJ
	9Zq724Cq79OlvHHyqA7eVWT0JqSI6mXoat8xVQuTJDI3lmzYIQuFGDjy19fQ/w3zQy+jV9099A+LC
	3r86hf+tS0GWCsaBGZXNz7l7uQsEcEyb+ONIaS6bjbNUpTa4xTQSYxeHB6Wg3nKF45mQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183263-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183263: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d073a545119140070c83e4b2b249bf0448c6f89e
X-Osstest-Versions-That:
    ovmf=1497c4b074946f3ad9d46ddbb6d655c951e23ae8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Oct 2023 18:14:37 +0000

flight 183263 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183263/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d073a545119140070c83e4b2b249bf0448c6f89e
baseline version:
 ovmf                 1497c4b074946f3ad9d46ddbb6d655c951e23ae8

Last test of basis   183250  2023-10-03 12:10:44 Z    1 days
Testing same since   183263  2023-10-04 16:12:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   1497c4b074..d073a54511  d073a545119140070c83e4b2b249bf0448c6f89e -> xen-tested-master

