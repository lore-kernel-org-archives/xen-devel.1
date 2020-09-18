Return-Path: <SRS0=htIg=C3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB2C43463
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 00:48:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65A020853
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2020 00:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="xgP9WitH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65A020853
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJ4Z5-0000oV-Vq; Fri, 18 Sep 2020 00:47:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb7v=C3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kJ4Z5-0000oQ-9A
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 00:47:51 +0000
X-Inumbo-ID: d71ee8b5-8ff8-4cba-aab8-7e0796f667ba
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d71ee8b5-8ff8-4cba-aab8-7e0796f667ba;
 Fri, 18 Sep 2020 00:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=aehpucdsVlmSMg5s5eHjuTVsmviUFrRvkpSDX8dcI4s=; b=xgP9WitH9NuQdH+xgSnwqTzv94
 gt5FsBGh3y1HQNUzK+DFDMovvQd89VNFfKPDWtOaOEE7jhqCt9qDkLsy64zLPt4zmHdnbkmUMQ8ji
 SGjF0tiqZEWmNUNcGfWMvOEBMMLuvLPJTM6jIj2A4rQznMYgzdk34guurOeMkF7I4C38=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ4Z1-0001Ss-Ty; Fri, 18 Sep 2020 00:47:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ4Z1-00014K-L2; Fri, 18 Sep 2020 00:47:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kJ4Z1-0004hB-KV; Fri, 18 Sep 2020 00:47:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-armhf-armhf-xl-vhd
Message-Id: <E1kJ4Z1-0004hB-KV@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Sep 2020 00:47:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-armhf-armhf-xl-vhd
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154443/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.guest-start --summary-out=tmp/154443.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-armhf-armhf-xl-vhd guest-start
Searching for failure / basis pass:
 154090 fail [host=cubietruck-metzinger] / 154016 [host=arndale-bluewater] 153983 [host=arndale-metrocentre] 153957 [host=arndale-lakeside] 153931 [host=cubietruck-gleizes] 153906 [host=arndale-westfield] 153882 [host=arndale-bluewater] 153845 [host=arndale-metrocentre] 153813 [host=cubietruck-braque] 153788 [host=cubietruck-braque] 153770 [host=arndale-lakeside] 153758 [host=arndale-westfield] 153653 [host=arndale-lakeside] 153619 [host=arndale-westfield] 153602 [host=arndale-bluewater] 153591 \
 [host=arndale-metrocentre] 153551 ok.
Failure / basis pass flights: 154090 / 153551
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#afe018e041ec112d90a8b4e6ed607d22aa06f280-cc13835\
 377debe4e300c5f5f11f8f78920778c4e
Loaded 5001 nodes in revision graph
Searching for test results:
 153400 [host=cubietruck-gleizes]
 153437 [host=arndale-metrocentre]
 153468 [host=arndale-westfield]
 153494 [host=arndale-lakeside]
 153526 [host=arndale-bluewater]
 153551 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153591 [host=arndale-metrocentre]
 153602 [host=arndale-bluewater]
 153619 [host=arndale-westfield]
 153653 [host=arndale-lakeside]
 153758 [host=arndale-westfield]
 153770 [host=arndale-lakeside]
 153788 [host=cubietruck-braque]
 153813 [host=cubietruck-braque]
 153845 [host=arndale-metrocentre]
 153882 [host=arndale-bluewater]
 153906 [host=arndale-westfield]
 153931 [host=cubietruck-gleizes]
 153957 [host=arndale-lakeside]
 153983 [host=arndale-metrocentre]
 154016 [host=arndale-bluewater]
 154036 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154058 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154090 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154397 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 154400 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154403 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e
 154407 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211
 154412 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62
 154417 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412
 154425 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154430 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154433 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154437 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154439 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154442 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154443 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
Searching for interesting versions
 Result found: flight 153551 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a, results HASH(0x56494f104828) HASH(0x56494f0f6be0) HASH(0x56494ebe1c98) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412, results \
 HASH(0x56494f0f4430) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62, results HASH(0x56494f10a868) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211, results HASH(0x56494f15a310) F\
 or basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280, results HASH(0x56494f0f71e0) HASH(0x56494f103f28) Result found: flight 154036 (fail), for basis failure (at ancestor ~295)
 Repro found: flight 154397 (pass), for basis pass
 Repro found: flight 154400 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
No revisions left to test, checking graph state.
 Result found: flight 154430 (pass), for last pass
 Result found: flight 154433 (fail), for first failure
 Repro found: flight 154437 (pass), for last pass
 Repro found: flight 154439 (fail), for first failure
 Repro found: flight 154442 (pass), for last pass
 Repro found: flight 154443 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154443/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
154443: tolerable ALL FAIL

flight 154443 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154443/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl-vhd      11 guest-start             fail baseline untested


jobs:
 test-armhf-armhf-xl-vhd                                      fail    


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


