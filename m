Return-Path: <SRS0=dt+c=FK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3889C4361B
	for <xen-devel@archiver.kernel.org>; Sun,  6 Dec 2020 09:59:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9ECD22D0B
	for <xen-devel@archiver.kernel.org>; Sun,  6 Dec 2020 09:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9ECD22D0B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.45585.81020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klqpR-00050z-Ot; Sun, 06 Dec 2020 09:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45585.81020; Sun, 06 Dec 2020 09:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klqpR-00050s-Lk; Sun, 06 Dec 2020 09:59:41 +0000
Received: by outflank-mailman (input) for mailman id 45585;
 Sun, 06 Dec 2020 09:59:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klqpQ-00050k-2f; Sun, 06 Dec 2020 09:59:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klqpP-0006Lc-SL; Sun, 06 Dec 2020 09:59:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1klqpP-000293-Ja; Sun, 06 Dec 2020 09:59:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1klqpP-0004y4-J4; Sun, 06 Dec 2020 09:59:39 +0000
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
	bh=5EUVDposGf+QDwZ5VqtoQ3AiD/9bT30ZsIILmo4j+/A=; b=CmOSqmKj22XFuVQmyV6ommtvmQ
	vH2OvL06uw52Cif7yO9ncARm08ghBxdeTR0LqSPTxOPFwzcCOZfxJlZo0Ult5KBCobucqdflWpmy5
	eaYIr2TorgqiZhqMvLwWgttfWOq2pND8RJ3tRZ6wsckFhtPBV4WQuSLNR4QhbBlGCjD8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157238-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157238: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5e666356a9d55fbd9eb5b8506088aa760e107b5b
X-Osstest-Versions-That:
    xen=3ae469af8e680df31eecd0a2ac6a83b58ad7ce53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Dec 2020 09:59:39 +0000

flight 157238 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157238/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5e666356a9d55fbd9eb5b8506088aa760e107b5b
baseline version:
 xen                  3ae469af8e680df31eecd0a2ac6a83b58ad7ce53

Last test of basis   157155  2020-12-02 09:19:29 Z    4 days
Testing same since   157238  2020-12-06 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Diederik de Haas <didi.debian@cknow.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <pdurrant@amazon.com>
  Rahul Singh <rahul.singh@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wl@xen.org>

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
   3ae469af8e..5e666356a9  5e666356a9d55fbd9eb5b8506088aa760e107b5b -> coverity-tested/smoke

