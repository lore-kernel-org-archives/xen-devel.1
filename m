Return-Path: <SRS0=3Xfx=75=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02A8C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 17:02:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49F4208E4
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2020 17:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49F4208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEyk-0002dQ-Md; Tue, 16 Jun 2020 17:02:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLj8=75=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jlEyj-0002ar-Qu
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:02:29 +0000
X-Inumbo-ID: 204ab9c4-aff3-11ea-8496-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 204ab9c4-aff3-11ea-8496-bc764e2007e4;
 Tue, 16 Jun 2020 17:02:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jlEyT-00084x-Qv; Tue, 16 Jun 2020 18:02:13 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 4/4] make-flight: Test Xen 4.9 and Xen 4.10 on stretch
Date: Tue, 16 Jun 2020 17:58:12 +0100
Message-Id: <20200616165812.25380-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
References: <20200616165812.25380-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Xen 4.9 doesn't build on buster and won't be fixed for that.
Xen 4.10's "-prev" migration tests also fail for the same reason.

There is a (smallish) risk that Debian will break stretch before Xen
4.10 goes completely out of support from the Xen Project.  If that
happens we could revert this - but then the 4.10 -prev jobs will stop
building.

Xen 4.9 is nearly out of security support, so for the 4.9 tests this
is a no-brainer.

I have checked the runvar diff.  The results are to change
  all_host_di_version [*]
  all_host_suite
  all_hostflags
  debian_suite
  debianhvm_suite
  host_hostflags
in many jobs in
  qemu-upstream-4.9-testing
  qemu-upstream-4.10-testing
  xen-4.9-testing
  xen-4.10-testing
[*] this is not visible in standalone-generate-dump-flight-runvars
because it always just uses `current'.

This command produces no output:
   diff -ub a <(perl -pe 's/stretch/buster/g' c)
(where `a' is before and `c' is after.)

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 make-flight | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/make-flight b/make-flight
index a361bcb1..836bc31c 100755
--- a/make-flight
+++ b/make-flight
@@ -41,6 +41,8 @@ case "$xenbranch" in
   xen-4.1-testing) defsuite="wheezy"; defguestsuite="wheezy";;
   xen-4.2-testing) defsuite="wheezy"; defguestsuite="wheezy";;
   xen-4.3-testing) defsuite="wheezy"; defguestsuite="wheezy";;
+  xen-4.9-testing)  defsuite="stretch"; defguestsuite="stretch";;
+  xen-4.10-testing) defsuite="stretch"; defguestsuite="stretch";;
   *)
     defsuite=`getconfig DebianSuite`
     defguestsuite=`getconfig GuestDebianSuite`
-- 
2.20.1


