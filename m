Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2846C5B572
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 18:59:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391429.1631240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7K-0004zA-AV; Fri, 14 Aug 2026 18:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391429.1631240; Fri, 14 Aug 2026 18:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wux7K-0004z3-7m; Fri, 14 Aug 2026 18:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1391429;
 Fri, 14 Aug 2026 18:58:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wux7J-0004yx-Se
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:58:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wux7J-003WkB-9K
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 20:58:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6541-e002-0a2a0a5209dd-0a2a450ca5e2-26
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:57 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7f6571-f479-0a2a450c0019-d155dd2eed4c-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 20:58:57 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1222848f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:58:57 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f229681sm8682153f8f.16.2026.08.14.11.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 11:58:55 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786733937; x=1787338737; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbqIDU5qqia2cTs+RqhS404ZmRB6enkb3DZiZgMZOVk=;
        b=VhLgyhH+fD5xgCbEHWYNVtb4e3RqX1VisTUpxClLxZb02VgWQoK1OQi85gg6XLIZbv
         rhBROEuXB6ruWsDUeRKjN/Bkq68T+9LphosYhTTmTEw3IyALbQbf/r05PrsNlGX1OGGg
         r1kbv/z391deDQ+XUbE2zX4Amdlke0lLb8Loc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786733937; x=1787338737;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lbqIDU5qqia2cTs+RqhS404ZmRB6enkb3DZiZgMZOVk=;
        b=CV5SL9WnukWNLSsdrlxppyjn4v8rxnmjsv0JdBuihcNKNUWVRACm9ukv36NplW8vaV
         +7bb0JVJCMvks5hkfpugD8ROfwLx0sbBZ/rjGf9dwijqUsw70JTNzueUMZqsw/5cukVR
         36kb3jLt3/S7ngdNCu0/jQCdYlnZqr35YkPK/5toeQFV+p3BUHs+nZ4p2WIDY3uVQxhq
         YkphwUB3cVdgsAg/asrjMpuO3HmoJeNN2a75cK/y+uOaSDUDnhj8ZGX3Jdsoi+sQrUSJ
         1jNPiPPuGWgy1fOnYX3BFazPKhH5zDsZEetBhhS/zOsZSMz4jUrm6vmfwrct/MjGP6Gb
         8cDg==
X-Gm-Message-State: AOJu0YxmfVgCVrEK8ez05QY4Myv2abU4OnsIuYpXqO2ZhZgGbLWlmxfc
	xQMB0d5HWuUQToK/FYeQsb/4bXKI23zHGgpnfusXDlhErgIw503oGSPfSTM9YFWNzHpAlBPZvvo
	NSjfQ/nM=
X-Gm-Gg: AR+sD10zu4o+qeDUg3cESZdUFATuoUravT8uE9cZ2TqdzI1VHtcFxuZmnkZbIX2o1We
	7TiKjUm7LkgB3t2UEKigcDlteCGfPggIptyQLzY9hv6KBVm+4SkVmtNEB1LdNdoyx1q9B/BmVyQ
	cYjSwXolalF8ILkqcYPPs4pi3ctOSnr49PzAng5T5OOYJ1tlcc9tGdwjBSMGz9B8OUUB0v7o+2x
	1Caa0M47qjEvxWrDsWG/EORyFckeW9LKd6twf7jS7enFpDLdCSZ9+AHVNzv7789iy2+G25eNVX9
	bh3KFZXuRGRgdX+8CMcryBOdZQ9Rr1bcNVEe4uyCdwXoWaEsh95viZPc224edrgcHI3n7+g9G2O
	RXDUxtozexLTqVNH+CGX7CmvMJ+dBuwWDkHeWZb0NrMd8XsAXlV8CWM6/lBV9c0MdGCSe1CH4+v
	Ykbk0TlH+wPfnKkfjkgVd7Hk0DagYew/JuE4mM8oVxxJKULMWuzF9Ziu4o/UeHbnfkS0EsrVeRH
	qIEYLFnVJezoAn8pD4EMXkzJRGVlGFlk3LCtvA=
X-Received: by 2002:a05:6000:2913:b0:47f:9266:9bde with SMTP id ffacd0b85a97d-481606f5992mr10023090f8f.4.1786733936396;
        Fri, 14 Aug 2026 11:58:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/3] x86/emul: Cleanup
Date: Fri, 14 Aug 2026 19:58:38 +0100
Message-Id: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786733937-030D9A5B-4BFF1EE7/0/0
X-purgate-type: clean
X-purgate-size: 1522

Cleanup from recent observations.

From a future backporting perspective, now is about the least bad time to take
patchs 2 and 3, at the point we're doing all the other structural
rearrangements.

Andrew Cooper (3):
  x86/emul: Adjust comments in x86-types.h
  x86/emul: Drop trailing r from x86_seg_[lgi]dt names
  x86/emul: Drop the union in x86_event had have a single data field

 .../fuzz/x86_instruction_emulator/fuzz-emul.c |  2 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |  4 +-
 xen/arch/x86/hvm/dm.c                         |  2 +-
 xen/arch/x86/hvm/hvm.c                        | 46 +++++++++----------
 xen/arch/x86/hvm/svm/nestedsvm.c              |  2 +-
 xen/arch/x86/hvm/svm/svm.c                    | 30 ++++++------
 xen/arch/x86/hvm/vmx/realmode.c               |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    | 24 +++++-----
 xen/arch/x86/include/asm/domain.h             |  6 +--
 xen/arch/x86/include/asm/hvm/hvm.h            |  3 +-
 xen/arch/x86/include/asm/x86-event.h          | 14 ++++--
 xen/arch/x86/include/asm/x86-types.h          | 15 +++---
 xen/arch/x86/pv/traps.c                       | 10 ++--
 xen/arch/x86/vm_event.c                       |  4 +-
 xen/arch/x86/x86_emulate/0f01.c               |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        |  6 +--
 xen/arch/x86/x86_emulate/x86_emulate.h        |  2 +-
 17 files changed, 89 insertions(+), 85 deletions(-)


base-commit: 0a249bcb0279a99b7ddad683fcc84a5e256c13f1
-- 
2.39.5


