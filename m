Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216CFC4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:04:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8417C2076E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=qubes-os.org header.i=frederic.pierret@qubes-os.org header.b="hTINhEBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8417C2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=qubes-os.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15739.38846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT8o-0003BK-Jc; Fri, 30 Oct 2020 12:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15739.38846; Fri, 30 Oct 2020 12:04:22 +0000
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
	id 1kYT8o-0003BD-G5; Fri, 30 Oct 2020 12:04:22 +0000
Received: by outflank-mailman (input) for mailman id 15739;
 Fri, 30 Oct 2020 12:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYT8n-0003At-AV
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:21 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 811e4464-7ffd-47c4-917d-48109bc8779a;
 Fri, 30 Oct 2020 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604059448395617.7980217961564;
 Fri, 30 Oct 2020 05:04:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYT8n-0003At-AV
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:21 +0000
X-Inumbo-ID: 811e4464-7ffd-47c4-917d-48109bc8779a
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 811e4464-7ffd-47c4-917d-48109bc8779a;
	Fri, 30 Oct 2020 12:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604059449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=REVGGL4++4PneHfwBVedPiZUkD7hCTO7jzyeWeS4fzbtA502l+xodIUB9TvARH2AbNszD5vMSi8+KoYYdurWJ8V6v3z95FMgly0pHxoqGJ0bS5lQQpUFTymezaIjEFC/2ziIS+ggtAwASOJRKSDR/aC+hKV2L5kqV49iA1iNOVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604059449; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dilez5HdGh46lx7AxEt9ZLygHthnDA5O3R/mUATC4fA=; 
	b=jjxrA5RxZcAI+IrFT1rAseh+F6GPuLT1uJBeQrNe/WQEqnGQLj311xIugxWPI3dMCjAf3OVWXTkuHHBZ1kMsMpkAnTa3XgZbpwT4+biQSTXy08QGwDDoItC1dT7uVr9LVLGpmPVXFcyX7AnniuOwLagFNKqDJe3zdmj2QGmMddA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604059449;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dilez5HdGh46lx7AxEt9ZLygHthnDA5O3R/mUATC4fA=;
	b=hTINhEBThGzORRa7QzQ2WqFzH6/fns152PJVtp6bHWAQ3K8m52XVCAqQYBlv2bNv
	avKRKuib1VT6cw+YCIYBju1nwX0crIMX5Iy9vE4J/U9MC14iTA8UVfCngJ6YwrGPxxu
	9AfFmUhAc0soMNZjx3D8S2N4z/bmT2UNCtiB6P04=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604059448395617.7980217961564; Fri, 30 Oct 2020 05:04:08 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <64fc67bc2227d6cf92e079228c9f8d2d6404b001.1603725003.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 1/2] No insert of the build timestamp into the x86 xen efi binary
Date: Fri, 30 Oct 2020 13:03:50 +0100
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603725003.git.frederic.pierret@qubes-os.org>
References: <cover.1603725003.git.frederic.pierret@qubes-os.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

This is for improving reproducible builds.

Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes=
-os.org>
---
 xen/arch/x86/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b388861679..f5a529afd5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -170,6 +170,7 @@ EFI_LDFLAGS +=3D --major-image-version=3D$(XEN_VERSION)
 EFI_LDFLAGS +=3D --minor-image-version=3D$(XEN_SUBVERSION)
 EFI_LDFLAGS +=3D --major-os-version=3D2 --minor-os-version=3D0
 EFI_LDFLAGS +=3D --major-subsystem-version=3D2 --minor-subsystem-version=
=3D0
+EFI_LDFLAGS +=3D --no-insert-timestamp
=20
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI :=3D $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o ef=
i/check.o 2>/dev/null && echo y)
--=20
2.26.2



