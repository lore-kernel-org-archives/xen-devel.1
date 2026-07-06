Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0FC43602
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:34:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355438.1610208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKx-0000wz-0Q; Mon, 06 Jul 2026 15:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355438.1610208; Mon, 06 Jul 2026 15:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglKw-0000wo-SI; Mon, 06 Jul 2026 15:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1355438;
 Mon, 06 Jul 2026 15:34:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wglKv-0000wY-1q
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:34:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglKu-00AYjo-5h
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:34:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcae4-e002-0a2a0a5209dd-0a2a45018e7c-40
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:20 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4bcafb-400f-0a2a45010019-d1558036e94f-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:34:19 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so24419695e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:34:19 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63bfba1sm433726505e9.15.2026.07.06.08.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:34:18 -0700 (PDT)
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
        d=citrix.com; s=google; t=1783352059; x=1783956859; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qWRi/xO25DPpZrSe3/IaGOg37uxMNwU0hVO7Y1/SSU=;
        b=EQWYw1NxbFtfzHfhDxXjxSV5zy3jMIO6KYpw4HSPq7D2N76Paai6jT7kFF+pjYT/j0
         VHXw0x94yfGeD6vFiS28jvYQNFsZvzXqNnPkBirenJGB76rauPUC9OZ07Qhl/1wM50py
         VutFFyKXgAbiN+y9isC+7sltwnAQw+3QFsKpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352059; x=1783956859;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qWRi/xO25DPpZrSe3/IaGOg37uxMNwU0hVO7Y1/SSU=;
        b=Wp7qF5BuNIDwJpNKDX/AU7jp95do+tfEeeivHQIpHQMw9gvpMx+g4S/JMYtIPH6Y0J
         KcdaQmnrVJpeKJjfyTaN8xQoOR/RFHu6/ZwH630SXAo4YmDJXaS/5kGvteAKkUiTFEoh
         skDpBz6woGA9MZY3Wycd30cmPb6q83q2TN0QszrHqUQi0iYklYL8vgfDa9ME5iehXiIa
         trLCIrmMuTuq6T/THnjd84g3VyZH1jQoRblAfkwIdR/XrpkMiuABBGVMa+khuOXLn+IY
         NOhfPf5UE/L3DCUWhpJMbuxew5BoiHrTTVzSra1ftFr8alQI9T19+ufL8hANCPzbMhJw
         Jg7Q==
X-Gm-Message-State: AOJu0YyFdjui15xYiy3mkv7VlqmBjFEWvloI1K17FCyYN2vnR9cp5Jmh
	ozFAP1DpWtgV+rjiV5wfKsENcP938YUt+FE4tDBXvtsP+bHPLtGILqgduUuh/ouLp80Y2LhFbWo
	REDxc
X-Gm-Gg: AfdE7cl0vQztTnwewnJuqPYeVBkpduwwHjwtONvz4q2g3Gvg3ZW2v4obUJVYdNE2RIa
	TCwMVw9X7vcxuAuupU05ZpkV5kOa3DfDS74De8HIkcknGEwxV0mWVGbDkbpkRtZi+dgKhp+IU1x
	YdND84/e/oAwwcFK/o+KhesS/jrEV/dZDf+WV0m1tpbTeiikwiv0NKcbmHbtG6IJU5CmTSZ0VX7
	i/Wzub8BDyJ8+r/xnfMA0V6q0SsiHSokV1c197ciKMHuWVGmGyFjYg5EN1JjTfc/ydXwndR7hvE
	ry8cguJ4X9XmZiI/FvIHk72f2GWb6t8I0c9DRnShyyLFZP8ZK4KvQuMnsHI6W6+N3LfKD+R4QVY
	qmYZBbX2JtPq3s9mu6VQqkknIgLNKipG3rI5rqzbeSdy6/haiWxZrNNYklSnaHbeue5ognZkK75
	uK2Sn+wLt7s8h7vws56cmG8OWMq1mTTIJZMJe1tpVjdF4YK/h3GGoG3usTqQhrRfY=
X-Received: by 2002:a7b:ca43:0:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-493df5d6cafmr686255e9.25.1783352058828;
        Mon, 06 Jul 2026 08:34:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/3] x86/entry: GPR handling improvements
Date: Mon,  6 Jul 2026 16:34:12 +0100
Message-Id: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783352060-816DB1E0-1D52B02E/0/0
X-purgate-type: clean
X-purgate-size: 736

Finish the conversion to PUSH/POP_GPRS, and remove SAVE/RESTORE_ALL.

Slightly RFC; testing still ongoing, but I dont anticipate any issues.

Andrew Cooper (3):
  x86/hvm: Use PUSH_AND_CLEAR_GPRS in preference to SAVE_ALL
  x86/entry: Use POP_GPRS and remove RESTORE_ALL
  x86/entry: Use PUSH_AND_CLEAR_GPRS and drop SAVE_ALL

 xen/arch/x86/hvm/svm/entry.S         |  2 +-
 xen/arch/x86/hvm/vmx/entry.S         |  4 +-
 xen/arch/x86/include/asm/asm_defns.h | 95 +---------------------------
 xen/arch/x86/x86_64/compat/entry.S   | 12 ++--
 xen/arch/x86/x86_64/entry.S          | 37 ++++++-----
 5 files changed, 31 insertions(+), 119 deletions(-)


base-commit: eca5f92e6b6b6135092ec179647a9349dfe8f907
-- 
2.39.5


