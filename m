Return-Path: <SRS0=hLJu=KT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A20DC04FF3
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 09:00:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D93EA611EE
	for <xen-devel@archiver.kernel.org>; Mon, 24 May 2021 09:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D93EA611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=epam.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.131701.246014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll6Rm-0005lU-ED; Mon, 24 May 2021 09:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131701.246014; Mon, 24 May 2021 09:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll6Rm-0005kd-8Z; Mon, 24 May 2021 09:00:26 +0000
Received: by outflank-mailman (input) for mailman id 131701;
 Mon, 24 May 2021 08:59:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMb4=KT=darkstar.site=sakib@srs-us1.protection.inumbo.net>)
 id 1ll6QV-0004xC-GZ
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 08:59:07 +0000
Received: from pb-smtp1.pobox.com (unknown [64.147.108.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22e90eb8-1801-4bd7-b845-4aed584d810b;
 Mon, 24 May 2021 08:59:05 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 76323C5336;
 Mon, 24 May 2021 04:59:05 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 6CD61C5335;
 Mon, 24 May 2021 04:59:05 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id AC917C5334;
 Mon, 24 May 2021 04:59:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 22e90eb8-1801-4bd7-b845-4aed584d810b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=N3y2IUOrV3tiaMzNDcpoZJubh8fsBaImgmUzGyl9YYg=; b=k0bv
	mGxaD3or+1r/4ZAdUHMIq/qVK51+Ra3roGoCKfOuK9Wie1Y71IwuuawCq24jMbxl
	fzQyLGFDR06/M/NX+7VtjR+XfpPgW/8L/3FxGmuyoWTQb50z7LIhqSbfR0DOeJ+U
	8jE2ZpsrrGf1o/OLi279T0EI7Xhys9CteC615EI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1] libxl: use getrandom() syscall for random data extraction
Date: Mon, 24 May 2021 08:58:58 +0000
Message-Id: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4A7FC54E-BC6E-11EB-928E-D152C8D8090B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Simplify libxl__random_bytes() routine by using a newer dedicated syscall=
.
This allows not only to substantially reduce its footprint, but syscall a=
lso
considered to be safer and generally better solution:

https://lwn.net/Articles/606141/

getrandom() available on Linux, FreeBSD and NetBSD.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 tools/libxl/libxl_utils.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
index b039143b8a..f3e56a4026 100644
--- a/tools/libxl/libxl_utils.c
+++ b/tools/libxl/libxl_utils.c
@@ -16,6 +16,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
=20
 #include <ctype.h>
+#include <sys/random.h>
=20
 #include "libxl_internal.h"
 #include "_paths.h"
@@ -1226,26 +1227,10 @@ void libxl_string_copy(libxl_ctx *ctx, char **dst=
, char * const*src)
  */
 int libxl__random_bytes(libxl__gc *gc, uint8_t *buf, size_t len)
 {
-    static const char *dev =3D "/dev/urandom";
-    int fd;
-    int ret;
-
-    fd =3D open(dev, O_RDONLY);
-    if (fd < 0) {
-        LOGE(ERROR, "failed to open \"%s\"", dev);
+    ssize_t ret =3D getrandom(buf, len, 0);
+    if (ret !=3D len)
         return ERROR_FAIL;
-    }
-    ret =3D libxl_fd_set_cloexec(CTX, fd, 1);
-    if (ret) {
-        close(fd);
-        return ERROR_FAIL;
-    }
-
-    ret =3D libxl_read_exactly(CTX, fd, buf, len, dev, NULL);
-
-    close(fd);
-
-    return ret;
+    return 0;
 }
=20
 int libxl__prepare_sockaddr_un(libxl__gc *gc,
--=20
2.25.1


