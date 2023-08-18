Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15205C71156
	for <xen-devel@archiver.kernel.org>; Fri, 18 Aug 2023 14:52:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.586380.917601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0pW-0005o5-35; Fri, 18 Aug 2023 14:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586380.917601; Fri, 18 Aug 2023 14:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0pW-0005ny-09; Fri, 18 Aug 2023 14:52:02 +0000
Received: by outflank-mailman (input) for mailman id 586380;
 Fri, 18 Aug 2023 14:52:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX0pU-0005nm-EF; Fri, 18 Aug 2023 14:52:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX0pU-0003lS-DE; Fri, 18 Aug 2023 14:52:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX0pU-0007B3-34; Fri, 18 Aug 2023 14:52:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qX0pU-0003Ma-2g; Fri, 18 Aug 2023 14:52:00 +0000
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
	bh=jl8UabBgtg4LahbFtk5DMD64efxeY87dXvZXj1tBgnA=; b=V+05yTc1XyD0o5zQzC8CKgzBG3
	IUAh2VvB4/CvjRGLD187J/Qy/+EmKX6qzAeR7Cqn+MGdZ0mcgu1JRGEIWdjj5sA+AmDyjJggUYKA+
	QgUX70tfnIgNzV92pc9ZNYzHRhf4Z6zmqZ2UwDIDOEf9bOejlgiOHqmSON5kwI8gn/lM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182383-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182383: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=48089f3a7cdf308651234f5bf8d8a301f4b8acf9
X-Osstest-Versions-That:
    ovmf=eaffa1d7ff915d5af484e5e230a4dde41e4b9a00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Aug 2023 14:52:00 +0000

flight 182383 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182383/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 48089f3a7cdf308651234f5bf8d8a301f4b8acf9
baseline version:
 ovmf                 eaffa1d7ff915d5af484e5e230a4dde41e4b9a00

Last test of basis   182331  2023-08-14 15:12:20 Z    3 days
Testing same since   182383  2023-08-18 12:42:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Corvin Köhne <corvink@FreeBSD.org>

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
   eaffa1d7ff..48089f3a7c  48089f3a7cdf308651234f5bf8d8a301f4b8acf9 -> xen-tested-master

