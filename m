Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A86C433F5
	for <xen-devel@archiver.kernel.org>; Wed,  9 Feb 2022 10:03:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.268901.462813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHjod-0007gW-Sk; Wed, 09 Feb 2022 10:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268901.462813; Wed, 09 Feb 2022 10:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHjod-0007gP-Pc; Wed, 09 Feb 2022 10:03:11 +0000
Received: by outflank-mailman (input) for mailman id 268901;
 Wed, 09 Feb 2022 10:03:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nHjob-0007gF-Pl; Wed, 09 Feb 2022 10:03:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nHjob-0001FR-OB; Wed, 09 Feb 2022 10:03:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nHjob-0002JP-AP; Wed, 09 Feb 2022 10:03:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nHjob-0000AP-9y; Wed, 09 Feb 2022 10:03:09 +0000
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
	bh=NpsVWUWwvhJfiwkp9fTpxAKPQ0yycifTnAyEu23jCmE=; b=Jg2fOwGbcGRw1hQotQbVgYQD+X
	20CzT+dn7pB303uVniM78zDdBeqrK2X6cccc1hKnUY45Hts4HXNe6Ycv7Vcg6LXo9LFPK6m9JQRTU
	0eU9hq7a9iKjouNr+Ue3LpaRoYwSa3eua440aN/5OQXlJAaNGNypwu7MHJCIjlCxOQHo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168068-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168068: all pass - PUSHED
X-Osstest-Versions-This:
    xen=52ce1c97844db213de01c5300eaaa8cf101a285f
X-Osstest-Versions-That:
    xen=820cc393434097f3b7976acdccbf1d96071d6d23
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Feb 2022 10:03:09 +0000

flight 168068 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168068/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  52ce1c97844db213de01c5300eaaa8cf101a285f
baseline version:
 xen                  820cc393434097f3b7976acdccbf1d96071d6d23

Last test of basis   168033  2022-02-06 09:19:52 Z    3 days
Testing same since   168068  2022-02-09 09:21:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Michal Orzel <michal.orzel@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   820cc39343..52ce1c9784  52ce1c97844db213de01c5300eaaa8cf101a285f -> coverity-tested/smoke

