Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2832DCD5BD1
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2026 15:27:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323907.1589572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xu-0001lT-Fc; Mon, 01 Jun 2026 15:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323907.1589572; Mon, 01 Jun 2026 15:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xu-0001lM-CI; Mon, 01 Jun 2026 15:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1323907;
 Mon, 01 Jun 2026 15:27:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wU4Xs-0001YS-F9
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:27:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4Xr-00BFKf-S1
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:27:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4c8-2eae-0a2a0a5409dd-0a2a45028876-22
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:15 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4d3-af86-0a2a45020019-d155802dd138-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:15 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso9337715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 08:27:15 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm1570885e9.0.2026.06.01.08.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 08:27:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780327635; x=1780932435; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M36xUj93OTyTkHHmQQR/fasVGvQgjhMfQFR4EjgLNw0=;
        b=PlKJA5mXxhABuC9B81QKjDxcRh5MANQacQQc3w4PuY0ed16TtACKgLfkAycLgJ5/wQ
         nckBP4EDJTexdN8zNQ6rmzZKqf4UQdWSlUHnxvOke91u1D7wOGnEBnLeTPlBNzaZ3LHW
         xKglPJtGNFmryitDJ/G/L31ruW+bh++/czQ4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327635; x=1780932435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M36xUj93OTyTkHHmQQR/fasVGvQgjhMfQFR4EjgLNw0=;
        b=Kdse/v2m0XLVp5Cl71J6FFRYrYlKSjpo7aTEoxb2jA43su52OaIfPCg/QmiUWhZjo4
         8aCDMOx92N8IBdvBMopFCR5OG4ePI4blXywoyG5hLM6fjHZTtrKTFUI8/I6GinCxd3PV
         GSBojeiie2zrCUf9iAyruX0jM7Eicj3R0t+Z+PpN8gX1dJXfEf2QcI8iGluIH+lZwG3w
         OYD1V2ZyS83dVqbTwKlVpC2YEaJ/NaLwVtWjjAH6n0tGVqjI8FmfdZS+hGcGdnGdU132
         WXRoSxucX8e6mpg5zXdce88YhnprQhjx6P7vdwsv2jrt+YGmz6u03w+AFn7kRWo2AHrh
         Z+vA==
X-Gm-Message-State: AOJu0YwLylz85C7mhgLPDx4Xi9uKj3lzS1/mRhaNfVgB+FpE5Q1iFmmX
	DMMuc7H+u8NmtvyHujK3DMCsQCWaqxQBhl+8urQqnSN/MNiSci5N1uOGOB+Xz3a6NILcvl1iB+X
	U5rNd
X-Gm-Gg: Acq92OH1VGVnS2CZwZ6oSZlpzSboiHQ5SaJHblcvusSryNhCZKK1Bfo/Orp9xsF3izr
	ZTHdJYBH0xESKxAaMFAwOS5eDCSf4uMHh/473dr7vUxNKqz8msZHJY23FRiskjaKhVkJ6WBIr5c
	yGYh+CHJ4x7yr7LlPjwDm8p/YhHXy/ALTlhWQYcnLPBd4gdlSEYZvx6V3Hnln2QxZCX1Mf8i3k5
	C1IrOse1BqL//jz3t8uyjCC7+EXWUH6h24BME5oh2W0W+GApZnthQUXlFyFmQzkGRsD6TzxsFm8
	EtIkYgrnLThw2/DfqPI+2gdJ+KIIktAQzfqpmGlvRBAADALgMn2qinef0NFch1gKfERiXd3mNrL
	KRRjWD2MYvJAR3N5IJPHKDQDuUfj8k03EHE8fCxHHYTf6tq+RCbtdTqXfPbroX4B1ngTd3MC6Y9
	Y6FFFYoB2zhlsIHrpf/dghVDPYnvvJLsOf7lPcEmpic1SN3R9IddBPLNU1hjt8itNPQjPxxNirk
	435BB6hnCEHSOYZySOjHEcROg==
X-Received: by 2002:a05:600c:4703:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-490a2915af8mr228084525e9.9.1780327633600;
        Mon, 01 Jun 2026 08:27:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] Config.mk: Pin QEMU_UPSTREAM_REVISION
Date: Mon,  1 Jun 2026 16:27:08 +0100
Message-Id: <20260601152709.2588210-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
References: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780327635-8057B161-9786A3F2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1042

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index b3d48e49c70a..86a4999246d1 100644
--- a/Config.mk
+++ b/Config.mk
@@ -214,7 +214,7 @@ OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
 QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_REVISION ?= e064f42c80be6f6ff8c12dcb2a663bdf70f965f6
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b6f79f5f44cf69044079c042b88fe9d75367642e
-- 
2.39.5


