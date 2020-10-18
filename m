Return-Path: <SRS0=S1vZ=DZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D465DC433E7
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 09:48:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6321F2137B
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2020 09:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="u4U1GN6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6321F2137B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8508.22690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU5Ie-0001MD-Cu; Sun, 18 Oct 2020 09:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8508.22690; Sun, 18 Oct 2020 09:48:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU5Ie-0001M6-A4; Sun, 18 Oct 2020 09:48:24 +0000
Received: by outflank-mailman (input) for mailman id 8508;
 Sun, 18 Oct 2020 09:48:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kU5Ic-0001M1-Tq
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 09:48:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22b7add6-75fd-4c71-a016-5be085824d96;
 Sun, 18 Oct 2020 09:48:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kU5Ib-0006xw-Cu; Sun, 18 Oct 2020 09:48:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kU5Ib-00086Y-3E; Sun, 18 Oct 2020 09:48:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kU5Ib-0006VK-2i; Sun, 18 Oct 2020 09:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kU5Ic-0001M1-Tq
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 09:48:22 +0000
X-Inumbo-ID: 22b7add6-75fd-4c71-a016-5be085824d96
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 22b7add6-75fd-4c71-a016-5be085824d96;
	Sun, 18 Oct 2020 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=5hp/k5C1vG6bt5mHJUbOpM68uXteZ6OCQoYabMWDrYI=; b=u4U1GN6hxR+syyHYhdNTCTKx67
	XTkhqI3Kaykj+b8sZVxLp9+GTKZxXII4YvLb0xGgZy/RoRKDrWwkdOrBCNTGBRwSxDn9L928OGmOQ
	y3l4jT/7S7bl4DnHGVM+ghgAxDB30y6rQQhm8cq0IGXM5lBx6Gck61orpdFZ5QHCHfog=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU5Ib-0006xw-Cu; Sun, 18 Oct 2020 09:48:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU5Ib-00086Y-3E; Sun, 18 Oct 2020 09:48:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kU5Ib-0006VK-2i; Sun, 18 Oct 2020 09:48:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155955-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 155955: all pass - PUSHED
X-Osstest-Versions-This:
    xen=0dfddb2116e3757f77a691a3fe335173088d69dc
X-Osstest-Versions-That:
    xen=25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Oct 2020 09:48:21 +0000

flight 155955 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155955/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0dfddb2116e3757f77a691a3fe335173088d69dc
baseline version:
 xen                  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9

Last test of basis   155687  2020-10-11 09:19:29 Z    7 days
Testing same since   155955  2020-10-18 09:19:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Chen Yu <yu.c.chen@intel.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Trammell Hudson <hudson@trmm.net>
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
   25849c8b16..0dfddb2116  0dfddb2116e3757f77a691a3fe335173088d69dc -> coverity-tested/smoke

