Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F57CCA467
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451117.1666298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSds-0001Xv-4f; Thu, 15 Oct 2026 21:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451117.1666298; Thu, 15 Oct 2026 21:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSds-0001Xn-26; Thu, 15 Oct 2026 21:05:36 +0000
Received: by outflank-mailman (input) for mailman id 1451117;
 Thu, 15 Oct 2026 21:05:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xHSdr-0001Xb-Ed
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSdq-003e3Q-JU
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14007-2eae-0a2a0a5409dd-0a2a4505d1bc-24
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:34 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad1401e-4cb1-0a2a45050019-d155dd2ee9f0-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:34 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1199061f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:34 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1792098334; x=1792703134; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jLDJ1dB+NAtq9SWX+068kA/fTXsIbgXnYxnbgLHBbY=;
        b=NsAqYFLe5nhSVsAQDAuFkzLljfojpbJRO65jyoMVehc5OW9VVuREdgJ92ZIsaQo+Fj
         JJj+jwCCPyvDBrAmj8fVTZw3Z+AnLcryEyGOf8Y7hATt2IFWM269ue7tLnKKBG1L079H
         Kkp3OZ48KLOMqvrTFMWdlC70zOTzz5bnSaCM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098334; x=1792703134;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1jLDJ1dB+NAtq9SWX+068kA/fTXsIbgXnYxnbgLHBbY=;
        b=gKiMdaQ7pXV1Xrt55cRobu1OiPDqcuL1Zm/6rJJcNeY8x3DbaVUday0AutR5ZhjLsI
         mUoi4BX/KKvyV+YkKfAJRC/5WQhaC68Uq7aN7iIstqOScf3XhZwxLK2JK8EhAaq5YzJz
         UolvvnyTT24dEjBukM7BIaEL0j5SzP+Z0losThjlng3UR0wF94MweWo/MnFSHfArSspA
         s8Q3IjBqKzc3unQcx06ItZctvWzo6yQ88s+5+P3Nu8y/ZKrcLVFk0dDb7qpYHAW7ySVy
         1qoAD9rfU7dthBPx9zUHnO7JA2gkapohfvp7E4/4eDaLzTg1CdBdEQ6mv+LviYnHR6mq
         WG4g==
X-Gm-Message-State: AFq9FYKYQDofJpjSMwef4LNvJQnyTmkdZQFeKTaYHP7biEZltpFqgm0r
	NrBLhL7lcgolAlRpO5bWgZCDKQXQt/S5QaNzkFqiWn6YvGUuXUPHa7RZZ6OgWFCa/oUY4PvtboJ
	cUKk4BiU=
X-Gm-Gg: AYBFou14hmDdxjW7OyHD7HA8chSDFmIVaDM9BA84K0KnkTWH4FA6p78iYQtEQ0Zk9v4
	xjKB15nb0U93XZVbdIK+uhwMwVbjXz6zCuliiDQkpopE53vXQvn7ePhww3rTpMGUsGcpIc1GYuD
	g2uIRDxGyk+3I1gaHpYqRqS0elNuV5OGMssfn87imtKWReZAUXfIXvbAlyYDSzrDedELelyo+Ud
	gNqKOnbuC9o6K+++WGTQlChVaOTMs48nR9mpp9rrrl8yHdqu6ertBRmv7actx1Wg/Eft2dLx8ua
	ya2o3J8VZg0QwSYxowDgEciWlbGR7Z6ilHOvypfwEkcWfHcEG99QynRGYW1GH5t81n1TRxRb+2i
	GnSXLMgY0bgdm73J/wY2vizhqeoBnBxv1PUxp0O9xQqGAx9OqcBBkxO/b56lNw5mQjr3IGG9FR1
	n8NnbzyQlyHk0JsVvsl9zNugMZFfX9mn/a33aajCPcceUstqRaF/EH3llR0WvmiCPSGSbDdcFgA
	OnCMDdOQf04ExfdIekrMw22hGw5scJ9ICAOHdUziNe5B6wJmjiMhb+tsTA=
X-Received: by 2002:a05:600d:82c1:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a1bd175fa1mr115844435e9.28.1792098333490;
        Thu, 15 Oct 2026 14:05:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 0/5] x86/alternatives: Adjust all insn-relative fields
Date: Thu, 15 Oct 2026 22:05:25 +0100
Message-Id: <20261015210530.786604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792098334-F56AD2A1-23010FFF/0/0
X-purgate-type: clean
X-purgate-size: 1785

Alternatives have had a reasonably severe restriction since their
introduction.  This has been the source of several bugs, and several
inefficiencies particularly in the speculative safety paths.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2952556080

Andrew Cooper (5):
  x86/emul: Introduce x86_decode_lite()
  tests/x86: Introduce a userspace test harness for x86_decode_lite()
  x86/alternative: Walk all replacements during self tests
  x86/alternative: Relocate all insn-relative fields
  x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ

 tools/tests/Makefile                      |   1 +
 tools/tests/x86-decode-lite/.gitignore    |   1 +
 tools/tests/x86-decode-lite/Makefile      |  56 ++
 tools/tests/x86-decode-lite/insns.S       | 711 ++++++++++++++++++++++
 tools/tests/x86-decode-lite/macro-magic.h |  62 ++
 tools/tests/x86-decode-lite/main.c        | 113 ++++
 tools/tests/x86-decode-lite/x86-emulate.h |  29 +
 xen/arch/x86/alternative.c                | 102 +++-
 xen/arch/x86/hvm/vmx/entry.S              |  12 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h  |  43 +-
 xen/arch/x86/x86_emulate/Makefile         |   6 +
 xen/arch/x86/x86_emulate/decode-lite.c    | 331 ++++++++++
 xen/arch/x86/x86_emulate/x86_emulate.h    |  14 +
 13 files changed, 1447 insertions(+), 34 deletions(-)
 create mode 100644 tools/tests/x86-decode-lite/.gitignore
 create mode 100644 tools/tests/x86-decode-lite/Makefile
 create mode 100644 tools/tests/x86-decode-lite/insns.S
 create mode 100644 tools/tests/x86-decode-lite/macro-magic.h
 create mode 100644 tools/tests/x86-decode-lite/main.c
 create mode 100644 tools/tests/x86-decode-lite/x86-emulate.h
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

-- 
2.39.5


