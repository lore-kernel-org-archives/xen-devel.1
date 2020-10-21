Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55908C388F9
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 09:59:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38B021741
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 09:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="N0jbMCM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C38B021741
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9939.26223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAtu-0002AW-6j; Wed, 21 Oct 2020 09:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9939.26223; Wed, 21 Oct 2020 09:59:22 +0000
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
	id 1kVAtu-0002AO-3a; Wed, 21 Oct 2020 09:59:22 +0000
Received: by outflank-mailman (input) for mailman id 9939;
 Wed, 21 Oct 2020 09:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVAts-0002AJ-SC
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:59:20 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4be9edf6-b9ee-4a95-97ff-03f0c8ffd3b7;
 Wed, 21 Oct 2020 09:59:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAtr-0001mv-HY; Wed, 21 Oct 2020 09:59:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAtr-0008GI-9b; Wed, 21 Oct 2020 09:59:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVAtr-0002yL-99; Wed, 21 Oct 2020 09:59:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVAts-0002AJ-SC
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:59:20 +0000
X-Inumbo-ID: 4be9edf6-b9ee-4a95-97ff-03f0c8ffd3b7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4be9edf6-b9ee-4a95-97ff-03f0c8ffd3b7;
	Wed, 21 Oct 2020 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Qj1hOcAZrtL2sPMq+58DIGEe1NKYO0xgpbEYG4pj+I0=; b=N0jbMCM29tGp0w9gwioZwFNUEY
	Bn1LlRkT2kYO4oztTfRKy4dXfHGGr9cB166pjoTe5BaYc8I0gx8GuLtFbfMLXk3U6uWcmEOhHVQOx
	ISQTEI1I/UDSQnTnViHvfYUYXPyvn1KwJZrz6OIOgWNJ0b9fAPfnMVplK+h8dPsODhX4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAtr-0001mv-HY; Wed, 21 Oct 2020 09:59:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAtr-0008GI-9b; Wed, 21 Oct 2020 09:59:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVAtr-0002yL-99; Wed, 21 Oct 2020 09:59:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156067-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156067: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3b49791e4cc2f38dd84bf331b75217adaef636e3
X-Osstest-Versions-That:
    xen=0dfddb2116e3757f77a691a3fe335173088d69dc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Oct 2020 09:59:19 +0000

flight 156067 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156067/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3b49791e4cc2f38dd84bf331b75217adaef636e3
baseline version:
 xen                  0dfddb2116e3757f77a691a3fe335173088d69dc

Last test of basis   155955  2020-10-18 09:19:24 Z    3 days
Testing same since   156067  2020-10-21 09:19:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  George Dunlap <george.dunlap@citrix.com>
  Hongyan Xia <hongyxia@amazon.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>
  Wei Liu <wei.liu2@citrix.com>
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
   0dfddb2116..3b49791e4c  3b49791e4cc2f38dd84bf331b75217adaef636e3 -> coverity-tested/smoke

