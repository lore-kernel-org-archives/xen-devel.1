Return-Path: <SRS0=byJw=PT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7167C433EF
	for <xen-devel@archiver.kernel.org>; Sun, 31 Oct 2021 00:41:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825A2603E5
	for <xen-devel@archiver.kernel.org>; Sun, 31 Oct 2021 00:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 825A2603E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.218840.379441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgytu-0004q2-SL; Sun, 31 Oct 2021 00:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218840.379441; Sun, 31 Oct 2021 00:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgytu-0004pv-Oj; Sun, 31 Oct 2021 00:40:42 +0000
Received: by outflank-mailman (input) for mailman id 218840;
 Sun, 31 Oct 2021 00:40:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgytt-0004pj-Vn; Sun, 31 Oct 2021 00:40:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgytt-0001iY-Ng; Sun, 31 Oct 2021 00:40:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mgytt-0003Yu-FJ; Sun, 31 Oct 2021 00:40:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mgytt-00086B-Eo; Sun, 31 Oct 2021 00:40:41 +0000
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
	bh=aE1XOUqbTWcXyYElAfETfhAWYApUhzBWz4FgQ6vtf40=; b=7GgvCjXaCrKXtsV0/LatI+fF+0
	L/9T1YrDhgSpnJ1z6PdjEKWuTwi6YCnW3jVHJcxF2V2izxtFXkdYlL4K1PKNBtN/zE+Vt30QL5OsI
	3ouwAEnW4wlbZlRDHmCaN9ix1/ToWnyBMeehkV6qySsr7Xzq0LPKJezUSmflCrby09T0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165950-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165950: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=91b772ab626913bf740e9e1b20387b25bcb2de97
X-Osstest-Versions-That:
    ovmf=e7663fdd82a2bf934c51b66f4af3e4479b131923
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Oct 2021 00:40:41 +0000

flight 165950 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165950/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 91b772ab626913bf740e9e1b20387b25bcb2de97
baseline version:
 ovmf                 e7663fdd82a2bf934c51b66f4af3e4479b131923

Last test of basis   165948  2021-10-30 15:11:20 Z    0 days
Testing same since   165950  2021-10-30 20:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   e7663fdd82..91b772ab62  91b772ab626913bf740e9e1b20387b25bcb2de97 -> xen-tested-master

