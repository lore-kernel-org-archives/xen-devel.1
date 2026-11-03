Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A55606A32D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=pAvu/Y8R
Received: from list by lists.xenproject.org with outflank-mailman.1470114.1678854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGS9-0005wM-Hr; Tue, 03 Nov 2026 15:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470114.1678854; Tue, 03 Nov 2026 15:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGS9-0005wF-EX; Tue, 03 Nov 2026 15:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1470114;
 Tue, 03 Nov 2026 15:29:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xOGS8-0005ut-0R
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:29:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGS7-007Ik4-4s
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:29:35 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdd8-e002-0a2a0a5209dd-0a2a45069112-16
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:34 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae9fdde-195a-0a2a45060019-d155dd30d5aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 16:29:34 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2718731f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:29:34 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm25430467f8f.45.2026.11.03.07.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 07:29:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793719774; x=1794324574; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLUNCn2/D5g5yvkcTLpH7WqPGLr39WKTjFC7rSB4uPo=;
        b=pAvu/Y8RLp+QF+xI3cpcMf8ZIKcntYK5ckqNk/bWKtgd+UPDu9XktqpmcuhZ6iufz5
         nZUi3cwXHK6j3xSStDK8yKJzVN/Ptx70Exz1xuhivhZiVIgW2Way6qG4iMI/DMvDC5Bg
         NlsNbYc3b1nZkTVJjR9T+OJu/OJnJSlbQarlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719774; x=1794324574;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLUNCn2/D5g5yvkcTLpH7WqPGLr39WKTjFC7rSB4uPo=;
        b=t+w47tUXwHMdBYHKYci3DgZ1SZY9wBaCoGkv7rHVyhi/XVGRWrWkal/f8Wlq2ErlJ7
         CYjXjobDsnZdf6x1JTl//cxgXWSp71b0aClWRyWqJN7TZjhuyq56VavJpk6sZNtgJfiL
         1SJwdUs+H9fy/LOZDlfaG/RHRcDLLNa5F9zpqVZupz7VjnEyLlmj6BbU1rsr2bQHlgMT
         vN+r3rUr+/Y0q+wNJa5AhwIxncwvFzy0PJvLPB48qWKXv4SOXAurTFQNzTHZtT6J0FfT
         Wx8UEL+v8afk7pTmJlYn3y9iK7gTYYTBYvf+GO+5EBzXXlHgoS6s58bFOc1x57VRYYxx
         kkDQ==
X-Gm-Message-State: APuU4Z+cBqCgXv3YFhd+NPlcFYZIJ6sSimnrYAHNTewPBDubvyKj/BVZ
	gNYVjnzC+mQk8jDujAbrF+Yp1WLthvK7rnvn+/niB0QqkbapU8U2s0533zU7g0X+qgTfAgQFFO3
	BT96fiT0=
X-Gm-Gg: AYBFou0qCMpV3ek7iIMPFsmxypNCrOejSHsUPPm5pCESK4hgF+KDkWJA6G44Qr33lQu
	X/kzbwvu5fa9yIpCafMr3bYJiwFC/nqpeTQjphAhE2pr6WnmWYvuwAVyKGRrh79/r9oEqbDPE6B
	mnnXjBlk6O5NRx90nR8J+MVr89zO0XQIkwxK0tk6yNdMn7kT3Jrmohkc9m++HdFSYBB3pzCXgph
	4PgbKSOxELQeGJHC7+kQvfUPTHwpmmtfOZgCQZK57Iloa3+f94uM5a5SwYhh9jC+BlKmWgI7Uam
	VxZwqxzDa9aREnPKvmd4QFcEOpf/CWe3hPjwDTZ5r+ZQXrVHrwwqzWy9jLm60nXytPEbzO25IOY
	oRM1KW1J4Qo+vmneD/YvY/e/a7XVCvOV4pPFaRJ5fSthlWOcv/ld64w4+GFP2y3yDL10GAlUrIz
	nz0V2rS/bZU/fKMSGHeIchoRnt7iXesv3jiTfVkT6SrAK767O4n4p93ae5k43Y5vhWeLr8v/Lxw
	uJchIVEwY0lejyFuJiv5uZS50B/EF3U9MGr+50BUAgNLjkUASCXwj7+aftculk7YRy2tAwTzbKW
	10V3M4EO/nHJVdpOJJznar1KqgeaNVQ8nvjWjHkz9SJjSYu/y7LaoZTLoFg7DMCkn1oWvi/1R76
	d+UjPS8O0ZzJdsZa4up03O6sV
X-Received: by 2002:a05:6000:4810:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48e6e304036mr32900523f8f.27.1793719774017;
        Tue, 03 Nov 2026 07:29:34 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 0/6] xen/gnttab: XSA-519/520 followup
Date: Tue,  3 Nov 2026 15:29:22 +0000
Message-Id: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793719774-F460277B-7281E0F5/0/0
X-purgate-type: clean
X-purgate-size: 677
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Andrew Cooper (6):
  xen/gnttab: Drop owner->grant_table check in _cache_flush()
  xen/gnttab: Disallow GNTTABOP_cache_flush from non-direct-mapped
    domains
  xen/gnttab: Remove explicit rcu_lock_current_domain()
  xen/gnttab: Document how _cache_flush() works
  xen/gnttab: Fold error handling in _cache_flush()
  treewide: Make {invalidate/clean}_dcahce_va_range() void

 xen/arch/arm/include/asm/page.h   | 20 +++++--------
 xen/arch/riscv/include/asm/page.h | 10 ++-----
 xen/arch/riscv/mm.c               |  4 +--
 xen/common/grant_table.c          | 48 ++++++++++++++++---------------
 4 files changed, 36 insertions(+), 46 deletions(-)

-- 
2.39.5


