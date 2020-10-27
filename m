Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AB6C388F9
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 13:44:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A6021707
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 13:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="6No575w7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A6021707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12858.33295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPH1-0001q0-Vw; Tue, 27 Oct 2020 13:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12858.33295; Tue, 27 Oct 2020 13:44:27 +0000
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
	id 1kXPH1-0001pt-Rm; Tue, 27 Oct 2020 13:44:27 +0000
Received: by outflank-mailman (input) for mailman id 12858;
 Tue, 27 Oct 2020 13:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPH0-0001b2-7W
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 711c59bb-aa35-4855-b496-b03771642e22;
 Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-0007w6-JZ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-00024r-If
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGc-0002Uo-Td; Tue, 27 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPH0-0001b2-7W
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:26 +0000
X-Inumbo-ID: 711c59bb-aa35-4855-b496-b03771642e22
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 711c59bb-aa35-4855-b496-b03771642e22;
	Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ht5aMArUMsbRZegTrAAwD7lR0CIO4rForYrTexZof/g=; b=6No575w7BLbLgwxOa+OluzfAhV
	eSOnAue4Va2681FC/CaJB3Z3jKGahvAu4JKegrHsj7GkzaGMVK2F6OVM3PPaeYF/GcOTz7zlSTvwR
	xVHz3Y9wyCMxKVmCCVfFfXzGJg2bsGjtaiyz7rq8UTE9qlfJAl6hV7qNiuPsVGn5Gx6I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-0007w6-JZ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-00024r-If
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGc-0002Uo-Td; Tue, 27 Oct 2020 13:44:02 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/7] pdu-snmp: Support ServerTech PDUs "Pro 1/2" aka "Sentry4"
Date: Tue, 27 Oct 2020 13:43:52 +0000
Message-Id: <20201027134354.25561-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Values from Sentry4.mib, from
  https://www.servertech.com/support/sentry-mib-oid-tree-downloads

Useful runes used when developing and testing, with "Sentry.mib" from
the Servertech zipfile renamed to "mibs/Sentry4-MIB":
  snmpwalk -On -m Sentry4-MIB -M +:mibs/ -Ci -v 2c -c private pdu1 iso.3.6.1.4.1.1718.4
  snmpwalk -m Sentry4-MIB -M +:mibs/ -Ci -v 2c -c private pdu1 iso.3.6.1.4.1.1718.4
  snmptranslate -Td -m Sentry4-MIB -M +:mibs/ Sentry4-MIB::st4OutletControlAction.1.1.2

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-snmp | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/pdu-snmp b/pdu-snmp
index 74244145..61380766 100755
--- a/pdu-snmp
+++ b/pdu-snmp
@@ -44,6 +44,13 @@ sub model_apc6 () {
     $baseoid_write= '.1.3.6.1.4.1.318.1.1.12.3.3.1.1.4';
 }
 
+sub model_sentry4 () {
+    $baseoid = ".1.3.6.1.4.1.1718.4.1.8";
+    $baseoid_name = "$baseoid.2.1.3.1.1"; # st4OutletName.1.1
+    $baseoid_read = "$baseoid.3.1.1.1.1"; # st4OutletState.1.1
+    $baseoid_write= "$baseoid.5.1.2.1.1"; # st4OutletControlAction.1.1
+}
+
 my $model_name = 'msw';
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
-- 
2.20.1


