Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3666C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 05:13:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410558.1641370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3RfW-00039G-DQ; Mon, 07 Sep 2026 05:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410558.1641370; Mon, 07 Sep 2026 05:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3RfW-000398-8F; Mon, 07 Sep 2026 05:13:22 +0000
Received: by outflank-mailman (input) for mailman id 1410558;
 Mon, 07 Sep 2026 01:24:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kmehltretter@gmail.com>) id 1x3O6B-0008CX-53
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 01:24:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3O68-00C0s1-21
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 03:24:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kmehltretter@gmail.com>)
 id 6a9e1254-e002-0a2a0a5209dd-0a2a4506cbc8-0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 03:24:36 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kmehltretter@gmail.com>)
 id 6a9e1253-195a-0a2a45060019-d155dd2cac54-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 03:24:35 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so1691949f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 18:24:35 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de.
 [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883be709sm25538034f8f.21.2026.09.06.18.24.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Sep 2026 18:24:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788744275; x=1789349075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzgRAz+t0pvu1F0bGXuWPazB1YZpsW2di9FQ9hUcZ7o=;
        b=OG5cAlLzLJlpzxiwmTzG2FmnQHKCJaQ8GKdtIb3ouHz1N6De7R/q7L0cSdzFAsat8i
         WgRGKGHrecQUIEb+44A1mNlXZhIdZ1sHeco9J8yza34+9Mh3CcDobZTxmZbZQuPMq3Av
         lT6s+UY9/e+8QCRGqMz1dmPXL0QkpyKfHfY4P91s7X3JoDsxVpdEk3DCOmOHED2pH4Zt
         y83myuM8mwrFKa7QBdPZoWsATpOFa7uYjte37uAuVmfNab//X0GUKiDAY/cQbhJfCRjW
         npMnboIu2dbHqeftXJ5nLoF81yOjpu+F8kUuxcRmTS1iCct9nJ96fN1Qm4M6X+u+cze6
         1QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744275; x=1789349075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzgRAz+t0pvu1F0bGXuWPazB1YZpsW2di9FQ9hUcZ7o=;
        b=Z9QN1bBwxMwJaQg/pdZfp4zY85Bi6B8gvKlQ+v5AJulbpAgBiUyS1Vw/gihrXWdTOc
         ViG3vKd4iQ6MFoNUPlyKA3HlD2JeBqQq6VQMoF20dTtJ8NHCfIZi+JyVU0fnYAbKbicE
         DS9ZATW+7dBl4kVZSqy7V6QS4AoPk+aQlMNXBItS5D6EqmAtRsSUeJyY+v7BKX/Xx7U2
         SRAJic5Nwaq6OMxbz2fGvoh3JZC6uQx31sxh4j7rE5ribIhBW1bOc5ZJxdS7mJIsQVsz
         u0jr08qJp2Vz0vCJvgJY1QPdiuSOuhG3y7LmwIt/Mg0S4RfUGGu4+6AEKi9M8oIlsj4G
         vpJQ==
X-Forwarded-Encrypted: i=1; AKwUvByrrs3uvoWdA74j/bi/uW0iTc2KBwr2LLdjHwKKOxGr4SAELiY7w4CDMZpfAdimF4QOhlfZau9rLUc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mEkvr0BwpwsUzqYGnIMGTmzClKDC4m2umeAkfrbGNoU5ZzaDRd
	AOVRhD98vperP4JN9z+91LbVTodj9UawSeoL3dIsjArUtP+fMzzWZL0s
X-Gm-Gg: AYBFou00ygs5aNkVjWFG8zPv1KFhr5dn1iwf2xB/wCiEg2wjDl6nN1DLjyE1MrOaeUJ
	CJwWG/cDFAR9kHwvDz7D1UFpuKUAXeqriLRvWO78JSfubZDb9eTL7CVCw3ffF8PHtJ/mSGWXdwe
	9ElyGs6PaD8c1BEqrFkzwL2ZeRnR+b4rmV56+tQGCut8wfFTbvf9IgkzCBgVt2VcP1gqA6Bw8My
	H/E+wsLt9eFZ7p7SYm4tvazGL3ppjrPt1uBlM170Rgxe0Y2xiDUuTIIkZr+Vv5P5VS0PndtuI57
	Yuv1uAXNpsJU5yEBEHUNFLM15FVJapgR/2vUKsmrGu8sp8PT4jafIdWs2YRfTIFK71RZSzqz0RB
	jzBRcf6phSiglCHK/PbzNzEZeXqAJuwzQ8CiFDEcy3wh75RKL4vUPwwDShcIdn84EcfgyYJahHh
	xS9B00DqjdIehgmFwZpzGzcMj4RsmwqI+VGhgMKz/fV7FG/7VXHD+YMouZvCLx7VUaQCdIPXt/N
	55VVmLXI0YwMbCSml3VDWx3+ow0ty+sisJPEzx9fNHJkY/HJNBOu1RT2+BAnSQHNA2IEsQ2rJXK
	eAr23egRr6ohAPtUVl8qXeM/ZU9NS+TOw0uFkxHf1lb7WnB7pZD2EE4daehEPOthDMs=
X-Received: by 2002:a05:6000:468a:b0:484:3310:710e with SMTP id ffacd0b85a97d-48587291a2cmr31033495f8f.26.1788744275141;
        Sun, 06 Sep 2026 18:24:35 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH] arm/xen: Point the comment at the YAML binding
Date: Mon,  7 Sep 2026 03:24:30 +0200
Message-Id: <20260907012430.21823-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788744275-FE87577B-EC72D5F3/0/0
X-purgate-type: clean
X-purgate-size: 960

The binding was converted by commit 4dbfe5467485 ("dt-bindings: arm:
xen: Convert to DT schema"), so Documentation/devicetree/bindings/arm/
xen.txt no longer exists.

Point the comment at the YAML schema.

Fixes: 4dbfe5467485 ("dt-bindings: arm: xen: Convert to DT schema")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 25a0ce3b4584..0b7b7e3417e3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 }
 
 /*
- * see Documentation/devicetree/bindings/arm/xen.txt for the
+ * see Documentation/devicetree/bindings/arm/xen.yaml for the
  * documentation of the Xen Device Tree format.
  */
 void __init xen_early_init(void)
-- 
2.53.0


