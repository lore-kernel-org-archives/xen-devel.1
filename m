Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8289606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=IFAd0U8q
Received: from list by lists.xenproject.org with outflank-mailman.1504052.1699598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd4-0006IL-3P; Thu, 26 Nov 2026 21:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504052.1699598; Thu, 26 Nov 2026 21:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd4-0006IE-0m; Thu, 26 Nov 2026 21:03:42 +0000
Received: by outflank-mailman (input) for mailman id 1504052;
 Thu, 26 Nov 2026 21:03:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWgd2-0006Hu-9y
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgd1-00CPvZ-Mw
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:03:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089e84-8faa-0a2a0a5109dd-0a2a4509e5ce-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:39 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089eab-be1a-0a2a45090019-d155dd2ec1cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:39 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so4874099f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:03:39 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm570536295e9.1.2026.11.26.13.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 13:03:38 -0800 (PST)
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
        d=citrix.com; s=google; t=1795727019; x=1796331819; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPSbQAWXvTMjEnBpBEGczMtDP46LVNgP44uX/nrr/BQ=;
        b=IFAd0U8qSaFMQqlRqZv2O3+56jjPT6Q5PCA0hQkTH6e/UD1YL3al10tq2eJ6rTkpjn
         bzmwK4N2H5eqDTlYXaiVVVTz9x5NbrnahKH01s/JmgmTTErQDFS7nXDBOZqYJslOS8XI
         e2+PlmnyLfK6ezGYY6vEinm8c1I8JszyaMGxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727019; x=1796331819;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPSbQAWXvTMjEnBpBEGczMtDP46LVNgP44uX/nrr/BQ=;
        b=SlNjpjz1yj2to0+5uWS3PPMxR2oK0lXx9vKvhmlLLp+aDtzhtIid5zeeTxbZNRC4Yl
         sdUIeuu21VAoIpvulaQFcFKXJTUSq+1WemwnXt9+/6S3tm4WmZA0ns+Oj54qWpeWYSKy
         4vMq0APOMUps+yP0Rm6GxZsfg87NUe/kAuHPdl/NBD1XuqHE8Fxkbo0QYUM+ZOdyQ/7U
         Wsyko94JmrDRz9gR5JKknOqXI2+HybbYNkksByF5mdch2coEqz3Ua9OjLBQbb8Mu+69z
         CbIysEqRVctsc79bUgNrIwaal637LIpUUpkDiqLPYj3uzs5H9UYhyia6pikf3W6bNoIG
         Xr3Q==
X-Gm-Message-State: APuU4Z8uOuzxRR6+zCOdPVubZF6nGgn5Yyguy94FG6ZhdcmM6E4DbME6
	w6FWICT2Ta2kkQx3AtMv9XzWjK60dbXUtOz58d54oKSeJUO8eZa//IuVocIMb90iobqA8wAkt6Y
	q/YnohpE=
X-Gm-Gg: AZFdTZe6L+P7b+MpY8/7/yKbdJaZceJvzFTv1HpwnsjO/aKlUKtPDEHXBnuGj2XCFBl
	qXjJKN/CYFFZjHBKsB2tZN7+BhAjxQUburr9kbHmUNaN24UWIDYkGYM9+BowzGOH9jhrfKlqBWD
	bfB+oVB5a3yYBfTdFamWmjyA7C1G44Jp/GGF1qcbHzBR9hZxEy2vxAfXpLwlZyvcstfOlLECeVs
	efVAvwDhaAdV9Ca2mPlKc6+yLfCxgqmqkQIcgDFgMfn0LouwYuL27ycdjQuqaKdORFrMDFnwOmh
	G+kIt73R0FmOegzyU8lxRKETUI0rOiB7A8F67NBfbhAVef74kwK+30uHDLw392q0VRqTMNWpon9
	fPslYnHL1rXw6OiOlKCg1pDqkZToX7dxwiZz2eo4T8VGoAs6kq2XYE42xWDW3NHao0Xqny0iYLd
	4L631GQ3G+lawauBK2b0vNofI9omu0B6mnDF7NscUB/qYtmyGG8tmuPc6ky9Du/3TLNNT1md0Yr
	YRAzdM6jMfgkMRAWFWqHW9JQ1WMhlBsSyf9RYhOUSV+6pRRzQtqhA5nsR8PAtLTFfeTO4klQiTv
	+ToHqEM85CeSI/4A2rv4hYHe4QACOeOOlabqyef52mlcOdSfeGjnq3z/RRVvm8HKDZ9yzeCSjfH
	DWRkiY2l3vWdNfOG7HJow31FO
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr505722615e9.10.1795727018837;
        Thu, 26 Nov 2026 13:03:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH 0/4] CI: Add an EFI/StrictNX test
Date: Thu, 26 Nov 2026 21:03:33 +0000
Message-Id: <20261126210337.746228-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1795727019-BC4CB034-BD5020AE/0/0
X-purgate-type: clean
X-purgate-size: 1203
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/18411468064

This is good enough to at least get a regression test in CI.

Further work is going to be required to become strictly spec compliant,
aligning all data sections properly.  See patch 3 for details.

Andrew Cooper (2):
  CI: Update Fedora to 45
  x86/efi: Move the trampoline into .init.data for EFI builds

Frediano Ziglio (1):
  x86/efi: Split .init section to satisfy Microsoft UEFI signing
    requirements

Roger Pau Monné (1):
  CI: Add an EFI/StrictNX test

 ...x86_64.dockerfile => 45-x86_64.dockerfile} |  9 ++-
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/gitlab-ci/test.yaml                |  9 +++
 automation/scripts/containerize               |  2 +-
 .../scripts/include/xtf-x86_64-efi-strictnx   | 64 +++++++++++++++++++
 xen/arch/x86/boot/head.S                      | 14 +++-
 xen/arch/x86/xen.lds.S                        | 25 +++++---
 7 files changed, 116 insertions(+), 15 deletions(-)
 rename automation/build/fedora/{43-x86_64.dockerfile => 45-x86_64.dockerfile} (88%)
 create mode 100644 automation/scripts/include/xtf-x86_64-efi-strictnx

-- 
2.39.5


