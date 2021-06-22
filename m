Return-Path: <SRS0=fakL=LQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F186C2B9F4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 18:21:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E542261076
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E542261076
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146025.268626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1q-0003ZC-4s; Tue, 22 Jun 2021 18:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146025.268626; Tue, 22 Jun 2021 18:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1q-0003Z5-0x; Tue, 22 Jun 2021 18:21:42 +0000
Received: by outflank-mailman (input) for mailman id 146025;
 Tue, 22 Jun 2021 18:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl1p-0002zl-1t
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:21:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7030a2c-e0bb-4f1f-b998-596486f30556;
 Tue, 22 Jun 2021 18:21:35 +0000 (UTC)
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
X-Inumbo-ID: e7030a2c-e0bb-4f1f-b998-596486f30556
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/W38Qs0N/Kt0Gac/Q7kHnj3/eNBZAqKOdXBUp3mC4Ds=;
  b=T5jvf/OIzyKMzVrOL37gRBBmwxBj706IDYpeETg9wa3ePMfeId6ljnNY
   uUIZfRUs7cp27W0Ipl5KuEFiAKSQcW2sficQRFdh4GeCV5QGo9vS1w6Am
   pjwKsU/QRZiEydA/u1LAWTLmzDBDPpRrPv1i0QrCuRNMpbui77csUcCe3
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /4xMhkTIhjDo+FBl+R9uyiEQKfld8a8hmxdUJAiJukp4aXoZCe4GI7NMdoORRk/rRa/uZ3FtRL
 zyn8Jpq1j6OshxBpbOIkSd4Azfp50S71xIBdCVL9Q7Khfl6tRd9+KuGXxXzspJVW+rzIZmfR2G
 6PjX/C3ddjxH4G9xQ3fO0DHvA9x52JQsAccwlIX1GrPudTDcQrO5lZlR4gXPaE7Iw6e+Jt9slV
 DIYikB/SUpG3t3LHhwP/q4alimHdXDrUh7JHLStuDpK5rip4u8UFFCkNHLlBrSlrcdVNrPn28z
 BNk=
X-SBRS: 5.1
X-MesageID: 46437179
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tDpkyqmeE9njscldXpEiZmfQTgHpDfORimdD5ihNYBxZY6Wkfp
 +V7ZEmPE7P+VQssS8b6LO90fG7MADhHZ4c2/hrAV7QZniVhILIFvAn0WKG+VeQfxEWmdQtqp
 uIH5IOceEYSGIK/foSgzPIVOrIouP3jpxA7N22pxwBIW4FCsEQiHYeNu/YKDwGeOAsP+tCKH
 Po3Ls6m9PWQwVrUi3UPAh8Y8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 74uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKuS/VXEO0bmSAWQR4Y
 PxSiQbTplOArTqDz2ISC7WqlLdOfAVmiDfIBGj8CXeSIfCNUcH4oJ69PZkm13imhsdVQZHof
 J2Niuixuxq5R+splWL2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZCIMvW0vFnLA
 BVNrCd2B+WSyLXU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegA28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1L8HLzou
 WObLp8jx9+R6vDM7zE4HR7yGGDfIzmZ0Wk9ih33ekyhlTTfsujDRG+
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46437179"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 2/4] tests/resource: Rework Makefile
Date: Tue, 22 Jun 2021 19:21:22 +0100
Message-ID: <20210622182124.11571-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622182124.11571-1-andrew.cooper3@citrix.com>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

Make all object files depend on the Makefile, drop redundant -f's for $(RM),
and use $(TARGET) when appropriate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Fix typo in commit message
 * Drop -f's
 * Use %.o rather than *.o for Make level wildcards
---
 tools/tests/resource/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 4bef482966..1c3aee4ff7 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -12,17 +12,20 @@ run: $(TARGET)
 
 .PHONY: clean
 clean:
-	$(RM) -f -- *.o $(TARGET) $(DEPS_RM)
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-	$(RM) -f -- *~
+	$(RM) -- *~
 
 .PHONY: install
 install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
 
 CFLAGS += -Werror
 CFLAGS += $(CFLAGS_xeninclude)
@@ -34,7 +37,9 @@ LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenforeignmemory)
 LDFLAGS += $(APPEND_LDFLAGS)
 
-test-resource: test-resource.o
+%.o: Makefile
+
+$(TARGET): test-resource.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
-- 
2.11.0


