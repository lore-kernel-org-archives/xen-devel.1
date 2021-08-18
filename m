Return-Path: <SRS0=jJV9=NJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854A4C4338F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 09:54:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C0260F35
	for <xen-devel@archiver.kernel.org>; Wed, 18 Aug 2021 09:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42C0260F35
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168157.306995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIGO-0008DT-Bc; Wed, 18 Aug 2021 09:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168157.306995; Wed, 18 Aug 2021 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIGO-0008DM-7P; Wed, 18 Aug 2021 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 168157;
 Wed, 18 Aug 2021 09:53:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGN-0008DC-3L; Wed, 18 Aug 2021 09:53:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0002s5-Uj; Wed, 18 Aug 2021 09:53:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0002Hl-Ni; Wed, 18 Aug 2021 09:53:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0006yc-N1; Wed, 18 Aug 2021 09:53:34 +0000
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
	bh=R4nHtISBsFobS7FAvBD+nPph7n+essC09rfzqtcfhZs=; b=OSfsazp9Jm5lnZq1+6hzx6pQ0m
	n7y/KQNmHsVUtQZf2H9E2PNHznCCWBG+yu/Aql5eSEbLqJgn+Tv6U+SSR6p0cQ1prTGOxJbQcsU6/
	BcDwUioCLzY6+WnKgxp/HHnFSbQdCOgQ6AtkbAwpAK1IcAFtijTSpdRhS0Ag1ii7fRlA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164239: all pass - PUSHED
X-Osstest-Versions-This:
    xen=54c9736382e0d558a6acd820e44185e020131c48
X-Osstest-Versions-That:
    xen=5c34b9af05b9e5abd25d88efc4fb783136547810
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Aug 2021 09:53:34 +0000

flight 164239 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  54c9736382e0d558a6acd820e44185e020131c48
baseline version:
 xen                  5c34b9af05b9e5abd25d88efc4fb783136547810

Last test of basis   164193  2021-08-15 09:18:30 Z    3 days
Testing same since   164239  2021-08-18 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
   5c34b9af05..54c9736382  54c9736382e0d558a6acd820e44185e020131c48 -> coverity-tested/smoke

