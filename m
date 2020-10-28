Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A0BC4363A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 09:53:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13469246A2
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 09:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="DWfoAlQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13469246A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13455.34124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXi8k-0000B8-RF; Wed, 28 Oct 2020 09:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13455.34124; Wed, 28 Oct 2020 09:53:10 +0000
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
	id 1kXi8k-0000B0-NR; Wed, 28 Oct 2020 09:53:10 +0000
Received: by outflank-mailman (input) for mailman id 13455;
 Wed, 28 Oct 2020 09:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6N/=ED=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kXi8j-0000Av-9M
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:53:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01eba60a-eab9-496c-83b0-0dd29d334e1b;
 Wed, 28 Oct 2020 09:53:07 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXi8h-00064B-2e; Wed, 28 Oct 2020 09:53:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXi8g-0007Or-Rw; Wed, 28 Oct 2020 09:53:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kXi8g-00076Z-RQ; Wed, 28 Oct 2020 09:53:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u6N/=ED=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kXi8j-0000Av-9M
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:53:09 +0000
X-Inumbo-ID: 01eba60a-eab9-496c-83b0-0dd29d334e1b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 01eba60a-eab9-496c-83b0-0dd29d334e1b;
	Wed, 28 Oct 2020 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=9/lxplSNEsFghK2s+esbIMjaxVO+Q8RtjMHSYIgekA0=; b=DWfoAlQ43CvUOCS78IaTPOn3OZ
	Yn3Y18RK3GeWUGuUPZn65SY4GT608B3VP7kgEYHyb/NkCEMb6EYkyqCojCWdOW5me1mv99xznBsdB
	q+NmaA8+98v90w/0fi4nmO9RcOGer6zaLbmk6TuBYTMN+nV45s5eRIEHI/8wv6v9hVuo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXi8h-00064B-2e; Wed, 28 Oct 2020 09:53:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXi8g-0007Or-Rw; Wed, 28 Oct 2020 09:53:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXi8g-00076Z-RQ; Wed, 28 Oct 2020 09:53:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156274-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156274: all pass - PUSHED
X-Osstest-Versions-This:
    xen=16a20963b3209788f2c0d3a3eebb7d92f03f5883
X-Osstest-Versions-That:
    xen=6ca70821b59849ad97c3fadc47e63c1a4af1a78c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Oct 2020 09:53:06 +0000

flight 156274 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156274/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  16a20963b3209788f2c0d3a3eebb7d92f03f5883
baseline version:
 xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c

Last test of basis   156209  2020-10-25 09:18:26 Z    3 days
Testing same since   156274  2020-10-28 09:20:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   6ca70821b5..16a20963b3  16a20963b3209788f2c0d3a3eebb7d92f03f5883 -> coverity-tested/smoke

