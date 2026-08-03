Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD6FC55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381224.1624781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy6-0001jt-6s; Mon, 03 Aug 2026 07:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381224.1624781; Mon, 03 Aug 2026 07:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy6-0001jm-39; Mon, 03 Aug 2026 07:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1381224;
 Mon, 03 Aug 2026 07:20:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqmy4-0001jZ-Sq
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:20:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmy3-00Dk9I-RV
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:20:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412b-e002-0a2a0a5209dd-0a2a450bb788-0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:11 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412b-b7e8-0a2a450b0019-d1558032e956-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:11 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso9803985e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:20:11 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm254687935e9.2.2026.08.03.00.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 00:20:10 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785741611; x=1786346411; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn4hYT6+TtjuUJM3snHYvQUurh//1CWbljHmLcAATKw=;
        b=KsLvh5lyyn7oCgi26jrcq3NPMa2gHS12AWLM6hL5DVKPxrwb1cv5+gLXkgYwcLvu/o
         z8ulse263sFtKOBLfQXuVKPFqLrs7iulylpQQndrliRZLAoiSxsufSV992V9ex77W5bx
         6i8JMcgKC2P+f5RTX6CzTj0PxeiCjRseWUKE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741611; x=1786346411;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vn4hYT6+TtjuUJM3snHYvQUurh//1CWbljHmLcAATKw=;
        b=qgoGVNHHQgveS1ZQIpxRaxj0MxO6yWI4R0zpNxLyZPKM6jJsYhMHKB3NgmRmgceHeq
         EuHQI7HJs+tfhemw72/8tgPV1WIPANasjPm4xfecZnx5TteC81KzoWCfPVqEK6W6lZ7N
         rq5Jq3FV1uxY7a55tV1FLWT4v3DF5nLMs68FUD72bxqsr/CYH9ujoQ4LBvcZ85naioUF
         k+EeJ3ZavaRGvkVjcinUi8nX6FazhgeKwPQsXkeeIMTT2xHIYzJ+B6pF9NxyHg8LefDi
         ZCRQJ9/7pdW+WGkHuVIbAGP/g3oXCkU+FaQRjTFAu0csatIOGlVIQpwSRNI2FCUHaQhx
         DahQ==
X-Gm-Message-State: AOJu0Yw0ajfmlq7aynMU6uubSYZ6rtsZlTF15S+7/bGBY/eBM34xtA+O
	pvD8OmzWmEHiOwRw5V3+BSEfWlyfNLRI9wwUfGLNWqgH457jOODskdsKgoz2Q7C6x3yPrY12KUw
	9Kh4v7TE=
X-Gm-Gg: AR+sD13uDVgrHDW7GBtbkiO0HeCr+mSz9B0Gk1Ve9lfRfSw5G0PCqTLKHVzr0v8MJaN
	QOJS3De4fEdLPTtELb/XOvUZn0mLdVz96D8RROVAEDRewVszJKEv3DAJMOm/pyGx0X0MDzp2JeN
	BrDWCvMld3CoA4rvARJhwb3cEdPI+0iZg34LHGWPyRS69Ap1hmyRNoJrHJCV/Kef41NvtdjXcmm
	vSdgq+3j2a1FhAj1acDrzljUvEArHCLFm5+g/rClP+e26YLXu2wDfsjfu1j/SNpKVmmjabYzsM9
	ptt6+Z1fe+4TSzOrqDIvILpvaqIsvr+/IQBWfqf6IdfKFQzDrl50IweazRPJ4f9qxFWR9zfE+rI
	ziwqoOA9JnkRAtqBhERfQc30PqUVZoradorSXxOTinBrCaFQI+JcM+WhjfuLvcXn3ofUxeG4SHL
	m3UGFg+ckd6LWay11buZ9oI2wbCXOKIBEllPSa2ElmeFzBDqnxgMijy0n4Ii0bEfW9LVJKjXzvR
	X/KyHJYKKDZXEXOOG5UgYFo6fa91IY0iIKv62w=
X-Received: by 2002:a05:600c:8b13:b0:498:8e6:d464 with SMTP id 5b1f17b1804b1-4980c65cd2fmr198611065e9.14.1785741610768;
        Mon, 03 Aug 2026 00:20:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 0/5] x86/alternatives: Adjust all insn-relative fields
Date: Mon,  3 Aug 2026 08:20:01 +0100
Message-Id: <20260803072006.9678-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785741611-188C99EA-C3D7F43C/0/0
X-purgate-type: clean
X-purgate-size: 1886

Alternatives have had a reasonably severe restriction since their
introduction.  This has been the source of several bugs, and several
inefficiencies particularly in the speculative safety paths.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2724019865

v3:
 * Run through Gitlab CI.
 * Fix up Eclair issues, Clang issues, and older-binutils issues.

Andrew Cooper (5):
  x86/emul: Introduce x86_decode_lite()
  tests/x86: Introduce a userspace test harness for x86_decode_lite()
  x86/alternative: Walk all replacements during self tests
  x86/alternative: Relocate all insn-relative fields
  x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ

 tools/tests/Makefile                      |   1 +
 tools/tests/x86-decode-lite/.gitignore    |   1 +
 tools/tests/x86-decode-lite/Makefile      |  56 ++
 tools/tests/x86-decode-lite/insns.S       | 703 ++++++++++++++++++++++
 tools/tests/x86-decode-lite/macro-magic.h |  62 ++
 tools/tests/x86-decode-lite/main.c        | 111 ++++
 tools/tests/x86-decode-lite/x86-emulate.h |  27 +
 xen/arch/x86/alternative.c                | 102 +++-
 xen/arch/x86/hvm/vmx/entry.S              |  12 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h  |  43 +-
 xen/arch/x86/x86_emulate/Makefile         |   6 +
 xen/arch/x86/x86_emulate/decode-lite.c    | 330 ++++++++++
 xen/arch/x86/x86_emulate/x86_emulate.h    |  14 +
 13 files changed, 1434 insertions(+), 34 deletions(-)
 create mode 100644 tools/tests/x86-decode-lite/.gitignore
 create mode 100644 tools/tests/x86-decode-lite/Makefile
 create mode 100644 tools/tests/x86-decode-lite/insns.S
 create mode 100644 tools/tests/x86-decode-lite/macro-magic.h
 create mode 100644 tools/tests/x86-decode-lite/main.c
 create mode 100644 tools/tests/x86-decode-lite/x86-emulate.h
 create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c

-- 
2.39.5


