Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74851606A326
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P2IX2YhX
Received: from list by lists.xenproject.org with outflank-mailman.1481761.1685679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlg6-0004xs-Kh; Tue, 10 Nov 2026 13:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481761.1685679; Tue, 10 Nov 2026 13:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlg6-0004xg-FT; Tue, 10 Nov 2026 13:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1481761;
 Tue, 10 Nov 2026 13:14:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQlg5-0004xa-7q
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:14:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlg4-007NmJ-Kn
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:14:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af318a1-8faa-0a2a0a5109dd-0a2a4505df30-40
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:14:19 +0100
Received: from [209.85.216.48] (helo=mail-pj1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31434-4cb1-0a2a45050019-d155d830ec3a-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:55:18 +0100
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3ace1f3897cso1082550a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:55:17 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b1690eb517sm1631666a91.4.2026.11.10.04.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:55:15 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315316; x=1794920116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9a4dXZz2Gh7g55gQ4afYnhsZlVmNBXmZzJsbUHMreY=;
        b=P2IX2YhXia1jOieP+F2+iek5nwHI0sl0w7alhBQVGkIaIR4Q2+RgnYkE+cBhM8Xux/
         VYEmbK9S/JfxJqdNy2K6Jhit64Kk1K/ScZYic2jDLOHEYjJfYRGGiMOetWxsL1t6ZPlw
         2OaIZj/mfqm4zhE7n8HAfvbAvxGD2DF9H5+dF6jZO1Iy7R4jybhMzZn242Po2+OK7CDE
         i9kDUQN4INLudVJ3F7LVoqRdnJw4uQvSXDa/UsmKQaK6kQw+lEHiHgRXieYqwz6/q4T6
         DHOm7rejmUl3zfz2D639u3KM8At64Bb9CGKC8suh6AdF0oEm9oME4eSMU2a9iEqg13/J
         qClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315316; x=1794920116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9a4dXZz2Gh7g55gQ4afYnhsZlVmNBXmZzJsbUHMreY=;
        b=1aeJVhNotR+WJ9lq6Gm2C/SK9VXc71gQhkUZrnVTLZtxwxMGebHU3o7h+tPvZBrD64
         vp4lY/B9iqM0+vp/wJnQLObn/AOAHmHhCezTmK87J0I2Sc2gxC7r1yTyLl5+VRGOtK0N
         X1zY4iPHYBN78lUwO77RsACDmAXIHZOy87osrIDZdnqin4YJVMOWNoLh5t2fv2mD3zYj
         SD65412EK7HKRybyrY+7a8GX/bzSi5JXOvCg0MxfkDk2wv02w7vwXw3RrAvZKT+FRv6B
         dogBHe6+rOFKsOWPDJuBmNeNH0a1bC739g7sjH5RmgLZx5cRFLpMzceaKC2qXF1G5EOK
         2Yjg==
X-Forwarded-Encrypted: i=1; AL+hErGFVqKG5hgP8UTPcTKNHjHhwBJg2PD8YlGleGtChNnMJwsmYNfZ0wmSxjltsi4/HcD8i3dw0anus7k=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/32cBIpXGSB4kXr2Vtg5LXhQZOmjdTXsuDgroQ6lSt8at/OcvC
	OoSift3vgHmXuYNYHSB6jNB0GN806jdfA0Q2QKZztSipPLdcd3Zr7xxz8cli5jKlP6vq9eoXPoS
	v/k9s0es=
X-Gm-Gg: AYBFou0jeChWSiRutooQucfywNuookAUZpvt6Vw2sVkQ5MJxbZK/2/AGU8CXtD1ncSH
	+ZgwhbHTYXD4yL5zyV4L47FxLBPzFosJusB49+WyDmVEFNkE9mu7XXLug+sUu9byQpsd9zJrLa8
	SY6LyCt1zXCrqNZn5936/sJUnI9dFPrN7bcjGOzXiMMUBhCReAxnBcws1/K9TjFS+fNlS5miWCH
	C2802jF5oONyam+nBTqnj4aUieTXPIXmmOJDNYW8BprogzRQ725vGRUsihxe/+5FXTAUkYhwUbi
	aZ3hRYzIRF6NOqV9+72S1V2V29lc6O/8bUtzkagtz+KT5lKmzIHcaeyAtvqg022e3Ok8kk0aew3
	x0Zz2s1gGTPdlhHaCHbEJBcKUGxpOhsxFxrbdgNDgNQYO4q7Zq/CWJa/H2WjzMi27rFrDGLUz33
	Tv3S3OIr3xOyPDVAYAQtPp35Vr8XloMZSI/VkpHHtoLFFHfsMuT58BE1UWWXef6bYJjcJ9nTo3z
	UyQBUaK8R7gc6DyPMizBp7g1om0yNGgRWIanFcvuj1u9d0KltQMM8wnmrSy0fCLCzuoguOavVkt
	eaKiY6uA1o8xCd52tPL65226VJb5erMWDAwD8FL4sCLRFbJE3v5R2T5Dvyf6+3S8/CwpusoIjpA
	RiAIchZHun39zRZDPF54/sfcXC6C449loUWtwyw==
X-Received: by 2002:a17:90b:1dcd:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b166d31305mr2579742a91.54.1794315316112;
        Tue, 10 Nov 2026 04:55:16 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sstabellini@kernel.org
Cc: jgross@suse.com,
	oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Tue, 10 Nov 2026 21:55:08 +0900
Message-ID: <20261110125508.47483-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <604a9832-80ac-107c-b36f-4bb338519cbc@kernel.org>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr> <20261109122324.30134-3-yhlee@isslab.korea.ac.kr> <604a9832-80ac-107c-b36f-4bb338519cbc@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794315318-726B52A1-24790693/10/78177266408
X-purgate-type: clean
X-purgate-size: 243
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026, Stefano Stabellini wrote:
> Please move the call to destroy_workqueue() just after flush_work().

Done in v2:
https://lore.kernel.org/all/20261110125002.46683-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

