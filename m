Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3BEC433E1
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 11:41:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524F2206F0
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 11:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="C8XcZC1+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524F2206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXK8-0003AJ-5R; Tue, 25 Aug 2020 11:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXK7-00030H-HV
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:41:07 +0000
X-Inumbo-ID: bff63fa1-7ebc-4673-b89b-d5d18b63e45e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bff63fa1-7ebc-4673-b89b-d5d18b63e45e;
 Tue, 25 Aug 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FPSVuoZ1/NaPKMpmiA5UPv5xn1sYXBosGGVvcCDS9fQ=;
 b=C8XcZC1+D8SnFU+wyhQ6xonw62Z+edTGrAB2PGJVN/1kGqe+eRQM0Afq
 vI1ljYM1oCfPN6Un4qlrDan+gBpxLB/U2Z/+B64YXzlBAyDU/g+wIiTNn
 nq1bTWQwupboBWrqCHDIaAs9gMaFiENh6w/4RxNHSa/pwgJmNE5rIlLTl I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: st/jv3GJc7gpum5yvOnFHw1+1PcWHAhV6oTtS0z9o2yHy7lD7TuiM/SQ+LcSWUzYwl1wdLzKXp
 UbPEt06zH6hVWQO5M7ZhI90gAHj5wfYLxYmYde3AwpZ1UTYgJ+Cvu4QJ46qFgp3funzXHKxDFB
 Y0G2j+c15EGCzUB2WRuKeUCzOy+U6kfmzcE3NnEdseId0F0mihrb+9X8XhDuppV+MjEFb6iEEN
 bt3YObAGyDmhuOGaNTqhQuRETGQO+QW2/QdfpPAGzRtXmyVNJNRR+xE7ZOR24J5y4Smy4XHtal
 W/s=
X-SBRS: 2.7
X-MesageID: 25246380
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25246380"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson
 <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 07/12] ts-hosts-allocate-Executive: Add a comment
 about a warning
Date: Tue, 25 Aug 2020 12:40:36 +0100
Message-ID: <20200825114041.16290-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 698437c0..8f7a1af0 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -1035,6 +1035,10 @@ sub actual_allocation ($) {
 	    if ($shared->{ntasks}) {
 		warn "resource $shrestype $shared->{resname} allegedly".
                     " available but wrong state $shared->{state} and tasks";
+		# This can happen if following a failed prep by
+		# another job, the other shares are still owned by the
+		# now-dead task.  If so that share will become allocatable
+		# (and therefore not be counted in `ntasks') in due course.
 		return undef;
 
                 # someone was preparing it but they aren't any more
-- 
2.20.1


