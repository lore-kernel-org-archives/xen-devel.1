Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136FCC433F5
	for <xen-devel@archiver.kernel.org>; Sun,  9 Jan 2022 09:51:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.255099.437170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Uqw-00027k-3S; Sun, 09 Jan 2022 09:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255099.437170; Sun, 09 Jan 2022 09:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Uqv-00027d-W8; Sun, 09 Jan 2022 09:51:05 +0000
Received: by outflank-mailman (input) for mailman id 255099;
 Sun, 09 Jan 2022 09:51:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6Uqu-00027T-5H; Sun, 09 Jan 2022 09:51:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6Uqu-0005xs-2c; Sun, 09 Jan 2022 09:51:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n6Uqt-0001lk-QL; Sun, 09 Jan 2022 09:51:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n6Uqt-0002Xe-Pu; Sun, 09 Jan 2022 09:51:03 +0000
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
	bh=6zQyD3mSnwGt8j7/7cZCi2CeTlQ7P9qdLhxsKgtODdM=; b=cHBuKErX9YgK4RWGiJd4Sn30D/
	rpLcdY+6ouCB6hqu1XJFTqftYZv8k5ZmDi3CC3xtVncixFx0Q6faG5WRjQ7VA7m1VwbJ3WBBL8KNH
	HxtHyhcjtRZwhwCrPbOfrqz/EHx1zeWd2YYbk18e3Afc6B0U50oD2FIJp978N4xy0GEc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167646-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167646: all pass - PUSHED
X-Osstest-Versions-This:
    xen=ced5685208f4525edc3aa86f41eeaee5ccc9fe31
X-Osstest-Versions-That:
    xen=af0c5430a82c77432729d61c9b409dd32c477b20
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Jan 2022 09:51:03 +0000

flight 167646 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167646/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  ced5685208f4525edc3aa86f41eeaee5ccc9fe31
baseline version:
 xen                  af0c5430a82c77432729d61c9b409dd32c477b20

Last test of basis   167608  2022-01-05 09:19:45 Z    4 days
Testing same since   167646  2022-01-09 09:20:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   af0c5430a8..ced5685208  ced5685208f4525edc3aa86f41eeaee5ccc9fe31 -> coverity-tested/smoke

