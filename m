Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC606606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9CNCLu4
Received: from list by lists.xenproject.org with outflank-mailman.1505721.1700188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xX4K8-00008g-88; Fri, 27 Nov 2026 22:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505721.1700188; Fri, 27 Nov 2026 22:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xX4K8-00008T-3I; Fri, 27 Nov 2026 22:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1505721;
 Fri, 27 Nov 2026 22:21:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xX4K6-00008N-HQ
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 22:21:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xX4K5-00BHs5-B5
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 23:21:41 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b0a0255-8faa-0a2a0a5109dd-0a2a4507c8b2-32
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 23:21:41 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b0a0275-b4ea-0a2a45070019-d1558033ac18-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 23:21:41 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so73704115e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 14:21:41 -0800 (PST)
Received: from bala-Latitude-5580.. ([129.0.209.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm784745105e9.12.2026.11.27.14.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 14:21:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818101; x=1796422901; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdASiig+REgViCs5LDFDS0ArA2XDRPMqP5xBsyD0BS4=;
        b=u9CNCLu4JDLHIqkJBuaTp3eC4NKdyQsmS6GVOttOFDewHiDp9pbXD1yno0wi4uZsli
         FpCISYBx0lqT5Q6zHq/tvJxI2Y4wdi3R9O/oBpQWnwtT5cpDRSUgB3TyuShi8+ewejLX
         6KFmWvacY6ik9wqcjt7PNkBp5qFUTGNzjOan4xCLyQq7LTnCi++VyZOwkYxjfE2Y7xxo
         NRBIvVPUzwv1KFIaohVHOvNkT0uDVW1kk6hoYHy9Y6Yh/yVaH2VzmaeHDXRpcPdHxY7U
         66NQjPoTdbqK30AnwroZavCrWI50jqOGgA+L83s3/6d4zFZraFBXOjK4+FuhmMv+VmEg
         2cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818101; x=1796422901;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdASiig+REgViCs5LDFDS0ArA2XDRPMqP5xBsyD0BS4=;
        b=oBZkefFADwQF1jMI1BHW8Y2m8KSOdYjhYwUtyzCuLhM+GcoodMHHTBeccWm6ArsOlM
         7rLZ9Vvqy0vfi8PAdvMuep+LBdrpuQZ47zHKZBeitn5j7skur0bYsqgpEKVa2obaBooc
         /3huSwy8Ns6HOaQYOm4gega4R5r2jRLEb+vcx7xpQ0H3whZhXSBQTr8lQ26Q9a3Iqylj
         SKOLeBukTYTFOD+xDOJ2Sb1LLWAYrnRf70oB0XwBcMLUOG3BeQb90Kchg1JwAE0fdRJs
         Ooosg9lOczPkcM8tXWe1nMENt85nuDr6zYdruaX3WN1ZEdm+xJTDtRcTRlKPoyUkOYL0
         rWkw==
X-Gm-Message-State: APuU4Z+/PKIh1qem1APQ7RAG0E6LtuW+JDYWxYYHkMOeyotTt5zFrxwb
	Zm9xkNCBiGafqU3AACYhB+QNB/cI5ALeID4dnCmBoQN2PEJkIm/GyobopQ6yyCJQ
X-Gm-Gg: AZFdTZfQNt3z+boDd+ng2XsY8BBMh3RoqtcF4fAquo0+wb3nKiD+t5opJwusly4O3QH
	x0oLZr+SRFvbnFWFkfKZEjjf0ulNN0/DnbCJ50HztmodCFqQxM6BN5kL9jeN9vWXy597ITDkIcI
	Pd9v5bmhSq0ZVWq1SmtQUhrVNyM9UVxZroZsuQ1nyvha92WgCp4vFS5hZZqfgijbW4zNUzD8R5C
	YQBju3zuAoMaanBBiWIRhu2Uvsk9ICg+pkr+6Y1mLCCGB3fQNsRWegMitqUqxHCm2bdQ22u0irj
	39zEOsinQpaDNpVYvsa8CkUKYZ9RVrIXTtRzyobRDEI2TpgwIgTxi5pB0YkprJXAquFoHomxrDC
	D4pQFdjJs0RxJbTzRYyptc4+mdCkjeYPrb3nE+JpP/1hH9xXIk3MefjpuNEda6auEWuoOiLtsED
	yCqk1Bl6ZW4MEnjKl8BXqJJMwn+rw9Np96wqjPVpSz5oHNlKsu9P15caHDB3IFQcpwqMTmERXwc
	TS71YHlA1dF5533Ob7LdPdDDJpIIXiLOa82JkSBolUMiiO77dDU3UmHH1wvtnU430aurAPlDqi+
	SFz3jns8gU4doXThtUJJ0XbbGC78BV9FfnVaoCfOi/iKjlSosziQgc1uM/TtcHns6Gm9fjno9IG
	8g+UYl08=
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr495661785e9.6.1795818100607;
        Fri, 27 Nov 2026 14:21:40 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xenconsoled: fix detection of sscanf() failure in xs_gather()
Date: Fri, 27 Nov 2026 23:20:49 +0100
Message-Id: <20261127222049.128481-1-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1795818101-34ECEAE4-9C5B8352/0/0
X-purgate-type: clean
X-purgate-size: 1561
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xs_gather() only treats a return value of 0 from sscanf() as a parse
failure. However, sscanf() returns EOF if the input ends before the
first conversion, e.g. when the xenstore node holds an empty string.
In that case the result is left untouched, but xs_gather() still
reports success.

console_create_ring() then goes on with ring_ref or remote_port
uninitialised, while a non-numeric value such as "abc" is correctly
rejected with EINVAL.

All callers pass a single conversion, so treat any return value other
than 1 as an error.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>
---

Notes:
    Tested in a nested setup (Xen built from staging, busybox dom0 and a PV
    guest under QEMU/KVM). With a temporary debug log in
    console_create_ring(), writing "" to the guest's console/port node from
    dom0 gave err=0 before this patch, and EINVAL after it, the same as for
    "abc".

 tools/console/daemon/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index b6c46d11dea7..728dd01fba31 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -654,7 +654,7 @@ static int xs_gather(struct xs_handle *xs, const char *dir, ...)
 			break;
 		}
 		if (fmt) {
-			if (sscanf(p, fmt, result) == 0)
+			if (sscanf(p, fmt, result) != 1)
 				ret = EINVAL;
 			free(p);
 		} else

base-commit: abc47aca98fa87e9fdebd0e9f7fbbbaa482056fb
-- 
2.39.2


