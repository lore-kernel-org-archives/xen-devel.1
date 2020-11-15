Return-Path: <SRS0=FgwI=EV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88382C2D0E4
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2020 09:59:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DE622453
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2020 09:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="gSE9Kwsc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DE622453
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.27427.56100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keEnk-0005Mj-Tu; Sun, 15 Nov 2020 09:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27427.56100; Sun, 15 Nov 2020 09:58:28 +0000
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
	id 1keEnk-0005Mc-QH; Sun, 15 Nov 2020 09:58:28 +0000
Received: by outflank-mailman (input) for mailman id 27427;
 Sun, 15 Nov 2020 09:58:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4DI=EV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1keEnj-0005MS-O7
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 09:58:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae727bea-1ae8-40f3-86e8-1989cb1bf043;
 Sun, 15 Nov 2020 09:58:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1keEng-0004ig-T9; Sun, 15 Nov 2020 09:58:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1keEng-0007Kv-J7; Sun, 15 Nov 2020 09:58:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1keEng-0006Nw-Ic; Sun, 15 Nov 2020 09:58:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=t4DI=EV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1keEnj-0005MS-O7
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 09:58:27 +0000
X-Inumbo-ID: ae727bea-1ae8-40f3-86e8-1989cb1bf043
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ae727bea-1ae8-40f3-86e8-1989cb1bf043;
	Sun, 15 Nov 2020 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=mmMhuCafIuc0Q8uoUFMcRLCLTF7766gouFmDsQCk0J8=; b=gSE9KwscwHU5p1X0n3wlyrzF2N
	HmnYqCjdE6oIvR3n+9VuW2iSK4GM/8mhbQMi9yWC+Lj6VVgUd1uHi7hiFwROPYb3NSDgYV5TgreMc
	WG0eVrS4xpTFSEckRPsReu9wbPTynW/Qku/FM8SjUF1UcklES4y81v3WngGyvMviQsgw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keEng-0004ig-T9; Sun, 15 Nov 2020 09:58:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keEng-0007Kv-J7; Sun, 15 Nov 2020 09:58:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keEng-0006Nw-Ic; Sun, 15 Nov 2020 09:58:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156811-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156811: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5505f5f8e7e805365cfe70b6a4af6115940bb749
X-Osstest-Versions-That:
    xen=3059178798a23ba870ff86ff54d442a07e6651fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Nov 2020 09:58:24 +0000

flight 156811 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156811/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5505f5f8e7e805365cfe70b6a4af6115940bb749
baseline version:
 xen                  3059178798a23ba870ff86ff54d442a07e6651fc

Last test of basis   156681  2020-11-11 09:19:28 Z    4 days
Testing same since   156811  2020-11-15 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   3059178798..5505f5f8e7  5505f5f8e7e805365cfe70b6a4af6115940bb749 -> coverity-tested/smoke

