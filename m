Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99348C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 16:57:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F54464F08
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 16:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F54464F08
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89447.168487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExTU-0007bp-Jf; Wed, 24 Feb 2021 16:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89447.168487; Wed, 24 Feb 2021 16:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExTU-0007bi-Fo; Wed, 24 Feb 2021 16:57:20 +0000
Received: by outflank-mailman (input) for mailman id 89447;
 Wed, 24 Feb 2021 16:57:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExTT-0007ba-7e; Wed, 24 Feb 2021 16:57:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExTT-000277-1o; Wed, 24 Feb 2021 16:57:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lExTS-0004HK-Ru; Wed, 24 Feb 2021 16:57:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lExTS-0000zN-RP; Wed, 24 Feb 2021 16:57:18 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=swkNP52MfO6Gs0FiPaMtE6zGQH5T6dzXpGtBi6gX7BE=; b=iXzTLMymc72hW6+UAjLbQEZPTI
	gsGeKl9a2j/J6ba7aTwn+Ki0b5KicMmCsZwkwW2cr33ytohm7/USDImmIFQI0FauhwBhBK9+V/2xv
	i8AOvv0Cb03fztaVMvsIsZpCvg+EjCOsgkv8K9RqB56V5UTfHoyw/WnYDB8lzeO8c/LY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1lExTS-0000zN-RP@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Feb 2021 16:57:18 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  81b2b328a26c1b89c275898d12e8ab26c0673dad
  Bug not present: 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159638/


  commit 81b2b328a26c1b89c275898d12e8ab26c0673dad
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 24 12:48:13 2021 +0100
  
      hvmloader: use Xen private header for elf structs
      
      Do not use the system provided elf.h, and instead use elfstructs.h
      from libelf.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/159638.bisection-summary --basis-template=159600 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 159624 fail [host=himrod2] / 159600 ok.
Failure / basis pass flights: 159624 / 159600
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#5d94433a66df29ce314696a13bdd324ec0e342fe-81b2b328a26c1b89c275898d12e8ab26c0673dad
Loaded 5001 nodes in revision graph
Searching for test results:
 159600 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe
 159624 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
 159627 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe
 159630 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
 159631 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
 159632 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
 159634 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
 159636 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
 159637 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
 159638 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81b2b328a26c1b89c275898d12e8ab26c0673dad
Searching for interesting versions
 Result found: flight 159600 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 10bb8aa0d5d029bd56da4a2a92e1e42bef880210, results HASH(0x55aef3ccb2a8) HASH(0x55aef3cc4f68) HASH(0x55aef3cceb38) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 5d94433a66df29ce314696a13bdd324ec0e342fe, results HASH(0x55aef3cc24e0) HASH(0x55aef3cc2ae0) Result found: flight 159624 (fail), for \
 basis failure (at ancestor ~79)
 Repro found: flight 159627 (pass), for basis pass
 Repro found: flight 159630 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
No revisions left to test, checking graph state.
 Result found: flight 159631 (pass), for last pass
 Result found: flight 159632 (fail), for first failure
 Repro found: flight 159634 (pass), for last pass
 Repro found: flight 159636 (fail), for first failure
 Repro found: flight 159637 (pass), for last pass
 Repro found: flight 159638 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  81b2b328a26c1b89c275898d12e8ab26c0673dad
  Bug not present: 10bb8aa0d5d029bd56da4a2a92e1e42bef880210
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159638/


  commit 81b2b328a26c1b89c275898d12e8ab26c0673dad
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 24 12:48:13 2021 +0100
  
      hvmloader: use Xen private header for elf structs
      
      Do not use the system provided elf.h, and instead use elfstructs.h
      from libelf.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
159638: tolerable ALL FAIL

flight 159638 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159638/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


