Return-Path: <SRS0=fakL=LQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0062C2B9F4
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 15:47:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8656861350
	for <xen-devel@archiver.kernel.org>; Tue, 22 Jun 2021 15:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8656861350
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.145941.268440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvibw-0005k5-Ii; Tue, 22 Jun 2021 15:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145941.268440; Tue, 22 Jun 2021 15:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvibw-0005jy-EY; Tue, 22 Jun 2021 15:46:48 +0000
Received: by outflank-mailman (input) for mailman id 145941;
 Tue, 22 Jun 2021 15:46:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvibv-0005js-Gw
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:46:47 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5e83a49-14c2-4599-80c3-6e2025f93d9d;
 Tue, 22 Jun 2021 15:46:46 +0000 (UTC)
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
X-Inumbo-ID: c5e83a49-14c2-4599-80c3-6e2025f93d9d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624376806;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=dTu4iINFlzHt/M9SZNB59k/OflALkkf5CWWkf5QRENM=;
  b=f0NDttE4FURmbfYrFIt1bu18aYA5ibZxsLLODAeGwSYyluHjM32e1m/H
   wXJr1EhULNveUCrVnzdQQvF/OdDRZdI4J6bV9oXZ+cD3yqm0txd2X87lL
   g6hReG8sbtLNxyr7UaT1Sz6Xhmei6J6XT56oN802pUAmf+m2WCwElriX/
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eNmThEQKZny8qB64yJOq+VxeJj3STEFLbmwZmPQ2UqEWbtE7tYBLNGx4SHUPRw+4Aef2lqngQV
 lwglRSved37GQRP80mi21SAVDCi26elUVB3UVDo1Zx9bsv+nbkVnSYvjI76dqg95bdxbLgb3Jf
 Zp4XcBxZtO8xdXeDUGHCJNhXAmqPtLc8NEG96jOlNQ6PlJljIx8Q4agTAu7mIppgOoBYjSfnOc
 7hg3P/8sSRGPTvm8w1Xl/rQNg6D4sncRBxAESyLxOJRenY/6snKbOoKKcACyLY/9bvNPLoe7n5
 xBQ=
X-SBRS: 5.1
X-MesageID: 46701430
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q7SWZKDJaP+TEmPlHemk55DYdb4zR+YMi2TC1yhKKCC9E/bo8f
 xG885rtiMc5Ax/ZJhCo6HmBEDjewK/yXcd2+B4Vt3OMDUO0FHYSL2KhrGD/9SPIUPDH5ZmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.83,291,1616472000"; 
   d="scan'208";a="46701430"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] Revert "tools/firmware/ovmf: Use OvmfXen platform file is exist"
Date: Tue, 22 Jun 2021 16:39:30 +0100
Message-ID: <20210622153930.16003-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This reverts commit aad7b5c11d51d57659978e04702ac970906894e8.

The change from OvmfX64 to OvmfXen causes a change in behaviour, whereby
OvmfXen maps its shared info page at the top of address space.  When trying to
migrate such a domain, XENMEM_maximum_gpfn returns a very large value.  This
has uncovered multiple issues:

 1) The userspace hypercall wrappers truncate all return values to int on
    Linux and Solaris.  This needs fixing in Xen.
 2) 32bit toolstacks can't migrate any domain with RAM above the 2^40 mark,
    because of virtual address constraints.  This needs fixing in OVMF.

Fixes for both of these aren't completely trivial.  Revert the change to
unblock staging in the meantime.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 tools/firmware/ovmf-makefile | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/firmware/ovmf-makefile b/tools/firmware/ovmf-makefile
index 637ee509c3..55f9992145 100644
--- a/tools/firmware/ovmf-makefile
+++ b/tools/firmware/ovmf-makefile
@@ -17,14 +17,8 @@ all: build
 .PHONY: build
 build:
 	if test -e .git ; then $(GIT) submodule update --init --recursive ; fi
-	set -ex; \
-	if test -e OvmfPkg/OvmfXen.dsc; then \
-	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4 -p OvmfPkg/OvmfXen.dsc; \
-	  cp Build/OvmfXen/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
-	else \
-	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4; \
-	  cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
-	fi
+	OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4
+	cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin
 
 .PHONY: clean
 clean:
-- 
2.11.0


