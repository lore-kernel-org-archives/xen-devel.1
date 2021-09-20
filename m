Return-Path: <SRS0=T9jm=OK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3344C433EF
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 19:41:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD98260EE2
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 19:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD98260EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.191173.341105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP9x-0003vd-VV; Mon, 20 Sep 2021 19:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191173.341105; Mon, 20 Sep 2021 19:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP9x-0003vW-Sa; Mon, 20 Sep 2021 19:41:01 +0000
Received: by outflank-mailman (input) for mailman id 191173;
 Mon, 20 Sep 2021 19:41:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSP9w-0003vQ-QA
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 19:41:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44ece320-adcc-4bbb-a0aa-a55416f63440;
 Mon, 20 Sep 2021 19:40:59 +0000 (UTC)
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
X-Inumbo-ID: 44ece320-adcc-4bbb-a0aa-a55416f63440
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632166859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q5RosjG14jEcDjoqHjZaARZmPLrzC7t3kj65ZG4GA9g=;
  b=Dy+mwlfDbzTxGZtP8Zo7VcWgLIMBssk+wab63M26Pn/AkFWHCkr/jxpg
   qPKhlSzulWMrQL7MfuMniI4tcH9+TpcC5n5GE2tAxQAt4+r8ObubVFe54
   9uvW9VSZB+DqtHfHe2dbQIwsObADcwOFRhw4oKBjIHnwD0XgxuF/UkAP1
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: URdGVb4GDUGZmnJleHI618yPWG0cdyYQiacFP0IJpJY8+pBE7XzjDkW/ypCObR2QjuRzt/RBYX
 +Kjl2PWqm9jQh4NyWoxoprF/Blj/VuKGDWBpKpX3bcTKvq+EbSeDcHwYtA3ttA5yCP5Ymz3LFK
 +zp6ZEtANWhlkRUlypCgcXPsRSWijLNx494Le+IASKcUE/bTWOEHoYRIFo9BWE/PtBTN77ElSI
 RNZ8483mEoBM1I6Sh3pwQBRF2CM92T/yiKD4ksdvLpnoHzRbsgQwJHa9hZCKGTezM+m+Rb03PT
 /OIfM9Z0VdsSf6hxvFuQ8yGf
X-SBRS: 5.1
X-MesageID: 53173829
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ybOnE6z02LYk0g8q9Md6t+fTwSrEfRIJ4+MujC+fZmUNrF6WrkVWy
 mIWUDqPM//Ya2SgfN13bI/i/UME75SAn9RkTQRv+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRh2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+97m
 e1DtpKec1kgHrLgmfYcVUgDNj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25sXQq2OP
 ZtxhTxHayXKWThJBgYuKallhOqitnTGawdZpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE4mD4DxcyJNGZjz2f/RqEuOjLmi/qXZMII5ex/PVqnV67y3QaDVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iL453yrBTdhNKvC8rsLZGCPxx
 WHRiTdr0t3/kvU3O7WHEUHv2mz3/8iSH19tvG07TUr+sVgoP9fNi5iArAGBtKcedt7xokyp4
 SBc8/Vy+tziGn1keMale+wLALjhzPKMKjS0bbVHTsR5qmjFF5JOe+ltDNBCyKVBaZ1sldzBO
 ha7VeZtCHh7ZiDCUEOPS9jtY/nGNIC5fTgfahwxUjapSsMrHDJrAQk0PRLAt4wTuBF0zMnTx
 qt3ge7zVC1HWMyLPRKdRvsH0K9D+8zN7TqIHvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI8STl9VKeOke1+E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:l7kHParxj+UfTNl9lIUuG0UaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="53173829"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2.1 16/12] xen/trace: Restrict CONFIG_TRACEBUFFER to x86 PV
Date: Mon, 20 Sep 2021 20:40:33 +0100
Message-ID: <20210920194033.25998-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The mapping interface can only be used by x86 PV guests.

This can and should be fixed by changing to an acquire_resource() based
interface, which is compatbile with x86 PVH and ARM dom0's, but until this
happens, don't give the impression of this feature being useable elsewhere.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785e7..6b6f7139e6f0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -429,6 +429,7 @@ config DTB_FILE
 
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
+	depends on PV
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
-- 
2.11.0


