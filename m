Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0E4C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 14:44:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6CE320787
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 14:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="T6TAkPFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6CE320787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagzz-0007ok-Ro; Mon, 18 May 2020 14:44:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c05r=7A=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jagzw-0007ob-J4
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:44:10 +0000
X-Inumbo-ID: 065d6992-9916-11ea-b9cf-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::7])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 065d6992-9916-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589813046;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=x+0kfUR9YmVlwWVg05/3BODhZYwM+tYi5GOOeNzNaLs=;
 b=T6TAkPFHOZ/DXffT+L/3rRJvzhzxyowWG4dFgoB0P8GHNivoJymq2PUBXSY4lB8j8w
 df41vjpMU4578Qn7tU9wKYWWxzfoyLlIaWqJgNcrJZbZtAljjm+fL4dFp0Sx5UgbWuC+
 DNAmIOOo3nxdG2iIe0YtbvOXXCoqt5MiHRdbY1mWStCruaNJMuf7wvKUKT2VLprJJQQE
 1Lfm3B3XXwF1y6qmoJsTTuGq8N7Z4wV7eXkk9wWRvVmY8mFH7VHvdYc6KUNPsU2/Wot1
 tSnUNEViyUsZBvuiYbOEJZRCRY9cU2J9GocLkIKG4tcgQglwR8SlaP5eO6HGniKDdxYI
 xSag==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS224g"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
 with ESMTPSA id c03f94w4IEi5UFx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 18 May 2020 16:44:05 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Subject: [PATCH v1] tools: use HOSTCC/CPP to compile rombios code and helper
Date: Mon, 18 May 2020 16:44:00 +0200
Message-Id: <20200518144400.16708-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.1
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
Cc: Olaf Hering <olaf@aepfle.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use also HOSTCFLAGS for biossums while touching the code.

Spotted by inspecting build logfile.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/firmware/rombios/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/rombios/Makefile b/tools/firmware/rombios/Makefile
index 78237fd736..02abdb3038 100644
--- a/tools/firmware/rombios/Makefile
+++ b/tools/firmware/rombios/Makefile
@@ -19,7 +19,7 @@ clean: subdirs-clean
 distclean: clean
 
 BIOS-bochs-latest: rombios.c biossums 32bitgateway.c tcgbios.c
-	gcc -DBX_SMP_PROCESSORS=1 -E -P $< > _rombios_.c
+	$(CPP) -DBX_SMP_PROCESSORS=1 -P $< > _rombios_.c
 	bcc -o rombios.s -C-c -D__i86__ -0 -S _rombios_.c
 	sed -e 's/^\.text//' -e 's/^\.data//' rombios.s > _rombios_.s
 	as86 _rombios_.s -b tmp.bin -u- -w- -g -0 -j -O -l rombios.txt
@@ -29,6 +29,6 @@ BIOS-bochs-latest: rombios.c biossums 32bitgateway.c tcgbios.c
 	rm -f _rombios_.s
 
 biossums: biossums.c
-	gcc -o biossums biossums.c
+	$(HOSTCC) $(HOSTCFLAGS) -o biossums biossums.c
 
 -include $(DEPS_INCLUDE)

