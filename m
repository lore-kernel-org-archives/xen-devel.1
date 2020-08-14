Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC423C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD7520774
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="NzVsSnU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD7520774
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dPC-00024M-Ae; Fri, 14 Aug 2020 17:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dPB-00024H-4x
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:22:13 +0000
X-Inumbo-ID: 4c243ad5-4a45-4638-aa9b-618e2221c3ca
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c243ad5-4a45-4638-aa9b-618e2221c3ca;
 Fri, 14 Aug 2020 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=40Khy0gWh0iQVdg61oKnTFxaeFxIc6NbFWsDCEifoNI=;
 b=NzVsSnU+jQbW0cnH8oB8pm3JoxuimzwXYrFAqAA5Kum6aAVDLOIQsz8b
 naITne2R5iz6D3jOC4T5l23Jx7XEDDisVaUY9oXj275enINIByN3NuzTh
 mtAFXXR2M2XUSdnAjpCsK0vVdLouK6MHqSq9KGzdrkvzFyjsrKh5D8RUp k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KGE6f1lJ2abRajEOCKn/DzJS37ZkBGsTzNgXxJ1+j42XSJepw13zOvxdV1pXGu5S7w2WK6P8DF
 Y5pqJzveiVjfrWvPmyWzR6YMzYPN8XSHIRLgFIojNfTgoR58TyEgBGVR3O6nW5Dn3w+ql/w2MR
 oELiDTNifuYNsgKlXhsVKNBXzr1GAf2jwZTnDTJFg8SpIBkfILxR2w5EVn4plmAtPbkbfFKzGW
 YrC2M9VuxibYmow5rmG5CL6VWXw0VA+fDi5mW7LTZn0zC1loMIXzN8mZ8g7yie2vJxmNAo9+Pk
 f9s=
X-SBRS: 2.7
X-MesageID: 24879724
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879724"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/60] history reporting (nfc): Add some test runes to
 the notes
Date: Fri, 14 Aug 2020 18:21:07 +0100
Message-ID: <20200814172205.9624-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 runes | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/runes b/runes
index 27ece2af..8139f955 100644
--- a/runes
+++ b/runes
@@ -3,3 +3,11 @@ select * from resource_sharing s full outer join resources r on r.restype = 'sha
 
 select * from jobs full outer join steps using (job, flight) where flight=2364 order by job, stepno;
 
+
+
+
+>v; env DBI_TRACE=2=v time ./sg-report-job-history --debug --html-dir=$PWD/d --flight=152223 --max-flight=152223  2>&1 |tee c |ts -s %.s >c.ts
+
+>v; env DBI_TRACE=2=v time ./sg-report-host-history --debug --html-dir=$PWD/e --max-flight=152223 flight:152223  2>&1 |tee c |ts -s %.s >c.ts
+rm -rf d; mkdir d; cp -a e/. d/.; mv c.ts b.ts; mv c b; mv v u
+cp -a d/. e/.
-- 
2.11.0


