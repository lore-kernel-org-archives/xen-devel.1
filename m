Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD74606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=vYbIB5+B
Received: from list by lists.xenproject.org with outflank-mailman.1502314.1698287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWC2Z-0004Y3-0P; Wed, 25 Nov 2026 12:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502314.1698287; Wed, 25 Nov 2026 12:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWC2Y-0004Xw-Ts; Wed, 25 Nov 2026 12:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1502314;
 Wed, 25 Nov 2026 12:23:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWC2X-0004Xq-R9
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:23:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWC2W-002WOJ-Sl
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:23:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b06d359-2eae-0a2a0a5409dd-0a2a45058ac0-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:23:56 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b06d35c-4cb1-0a2a45050019-d155dd35e0f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:23:56 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so5479812f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 04:23:56 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf680fsm38920127f8f.14.2026.11.25.04.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 04:23:55 -0800 (PST)
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
        d=citrix.com; s=google; t=1795609436; x=1796214236; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ptz8xdnkDV3M9ld4h55qzN+WgUrmUpYaWFN9TvWPKR8=;
        b=vYbIB5+BJ7d+b1kjMtFUjH86I0Qhg5UDYMC8zSoEIVeBYERt2YjdNMhGjA20/tzJ3s
         StpmCdBakmfawEUAQ0u+avHlFXaoSG3dfzZch3bpLe4aobsMemYgeVfXVivRU5kRV8NX
         VrLhvSSrsGJOcwMmeW9EP9Co1OGMqmOAinUa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609436; x=1796214236;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ptz8xdnkDV3M9ld4h55qzN+WgUrmUpYaWFN9TvWPKR8=;
        b=WwM/jdUff6byUaAqgpKrP01MB0Xilsfi0584VhkhAE2YLVDXLXW19iDPCKHIi1JR8O
         xrQQprD+0Hq0k7AjkMOGGh13CgAd+/Hvt8Naq7zOG8IUgfJ7INPCgrjT1NelqT3+VVxz
         qp9wDuz5cd8s+pA/c2kF0v0yaho6zIoEP91GMrhEROcfzqL3fOj3wR8PmOhExw1Bh+hO
         L00MYBiVuliZTdlo3eNz+Lch2KuaBkPXLJ/yQzdKg+9RweViATnuXUKwq2eHqVcRuD0Q
         HoiFFRxfX1salr3ugC2GXwZDniGhl2jskeJTvcyx5YMv0ICVvM+wmfUyc60Q7FZEAVdX
         AsUg==
X-Gm-Message-State: APuU4Z9Px2XPpphTFj0H0Dgf2dIJhOpmUvgYbPAo9SIKi987kQ1Stq1r
	SpdU8Unn8MEnPP0rPJeRmAlBbKvsw+oyd44TRwNVFAyTA5a9jfleG6d6Pifmp39lygmpAioRCPa
	CkBHZ
X-Gm-Gg: AZFdTZfBEWnYQ6+V/wST/I0E2H61p+763Z2dQifLIXj3ozEIxdyeHQGUna50J9PmT2c
	W+uI3S8p3+UdSdr/7cM42J9RlhG1hXnZMrNRBNLRmqoOKwpHqSUV/SF85tHPCVbJgrjkxXu+tW9
	VVR2v17cuBoYHCRuePELhPFE9i8euc2H54m7f3qJv/8fk3nrNrwRcykJVhpRekZ4xI7JzZ9HBp9
	vU1InjvKl7LJuJz2deZIMAvHT7n4wYJgou1DYhEe7adHhK33r52Gqkl8PNac3p543bAMksuVAfp
	U3cZsYDCBi29Pbhd57FbkJDSVCD4oGiG7l6/UgcDlm/BCAigDIsKGx2ySKAIIPeBb9Ztx4hOvfn
	d8JJWfrL/oZOeWYIB4gPcEsPDLQG35a9QwouY1KUN0jsylcRYtJc+FFphFucvKOgtjb+HK6ldqo
	ZTsXLT0z91RiYCf5TBNOHCFWpVQWAzAvJUxHvwHKeqmSlFaGMMhRdXtC24+SB/lzAdQEChUIO2u
	GMyB+9o5fpl7k0QtnbJh6GwrIfJ7Jn8TqU01MtugZ21CLMI9nuxSj3B/4Oz49C0aDecE7u42pzz
	A7K4V/xtZn1L2k49uHzRFd/yhPNmXCBQpsh0aHa3j8jRzre+kt+QJZjLrkyzkGc+yjCZlQyXV8y
	yYys=
X-Received: by 2002:a05:6000:45c7:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-4abb5144bd2mr20446370f8f.55.1795609435634;
        Wed, 25 Nov 2026 04:23:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/efi: Explicitly set NX_COMPAT on xen.efi
Date: Wed, 25 Nov 2026 12:23:52 +0000
Message-Id: <20261125122352.578425-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795609436-247132A1-17453B5E/10/78276251493
X-purgate-type: spam
X-purgate-size: 1476
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Binutils since 2.45 no longer set NX_COMPAT.  Programs have to ask for it
explicitly.

Xen is NX_COMPAT-able; Xen does not execute from it's stack at all.  The
property is mandated by the Microsoft UEFI signing requirements.

The --nxcompat option is available since binutils 2.20 and llvm 6, so can be
used unconditionally given our toolchain baseline.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Backporting notes: 4.20 and earlier need this turning into an $(ld-option).
---
 xen/arch/x86/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2be90ea09880..320593a1e824 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -131,6 +131,7 @@ EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
 EFI_LDFLAGS += --minor-image-version=$(XEN_SUBVERSION)
 EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
 EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
+EFI_LDFLAGS += --nxcompat
 # It seems ld unfortunately can't set a custom timestamp, so add a zero value
 # for the timestamp (option --no-insert-timestamp) if SOURCE_DATE_EPOCH is
 # defined to make reproducible builds possible.

base-commit: 56e231174e1050a43cf199411d5b8a041f5625c6
-- 
2.39.5


