Return-Path: <SRS0=G/Cc=AT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8FCC433DF
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 13:05:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECECE20772
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 13:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4R5OTp/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECECE20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt9kx-0005gF-Qd; Wed, 08 Jul 2020 13:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sx7s=AT=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jt9kw-0005gA-Vt
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:04:59 +0000
X-Inumbo-ID: a024b6c0-c11b-11ea-bb8b-bc764e2007e4
Received: from mail-il1-x12d.google.com (unknown [2607:f8b0:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a024b6c0-c11b-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 13:04:58 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id k6so38958998ili.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2020 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9nLHeBgBW8UFVrjRxD8OX4sNylczp6LaD1uqbgcE0kc=;
 b=D4R5OTp/YEamTWt158xQhM2KZF8/FkwNtmmFPpCqWNlcJR/16DHFHfHCYZ/D+f9Gh1
 qkP7M46DHyW98nhUXBVvO+mQlFNcOQrSoAyJ1FK0hD1b/UACvrdQxo1v8c+HNilN04fQ
 nvKIhkLXZ5MzJLgr5OAzbINo7PyrGDrKfUsZzlPAxm/NaLlkojBviRwNf0eS2yP3LQCU
 XK+TGBSxpsh2VxppnJBHgA/ImrELkB/H8t50DVz+h011FXeL7Wmm25GwZADbw4XlbMHN
 8v1TgYNlLfb0evf05IAVzZu9bkxUzyPfbGrZU5yebH0IStWUEPbpn4POn7lwPZnlHlmd
 nBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9nLHeBgBW8UFVrjRxD8OX4sNylczp6LaD1uqbgcE0kc=;
 b=ZXc08GPufyrSB0r5EbMRkP+XkkykDnM0fKSMP5EuPngJfGRWjXB++aMQaic/EJMra2
 UWjw5IZt7I8hCJXvV5ILE/D7ZDgrPcXogzgoGsK/Ba8elLgQ5tBLwa99unysk5G8vd9K
 kjLaL9tyVBEMgTFyGK6UiOVIr+USi6fl2i+QrAmGb8gv5BK71zuk9FcZDzdKNRZU5vfc
 jyIeFyQhoLOFBDNew+oDhcyVl4BNYBl5S5yJ3wrW8lVOK2y+A3iriyxWSBkp1XlNndVE
 m7LrXSr3bxg78oedhrQl3Ze8rv10olHGO/Qy2ODrk7s9HtOf1xEAILqyq3RCj0yiedjF
 BjDw==
X-Gm-Message-State: AOAM5306Jn4U0Uy3kNg69n/O+ks35QAlvJrSObRtHMyxLg1+cnmfGqR7
 53w0XyvN9YTa0D7XQzs962o8596OdUNA8sZGDuMDjomE
X-Google-Smtp-Source: ABdhPJyqYE1MdnlgxzM8cc5OmZKD0G4/j2Ea01ySH8yJS56xlEHHZ/nypyWlQeqchSVz9cPzItfpU3aQVfUmrcPP7Qs=
X-Received: by 2002:a92:c213:: with SMTP id j19mr42080782ilo.40.1594213497749; 
 Wed, 08 Jul 2020 06:04:57 -0700 (PDT)
MIME-Version: 1.0
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jul 2020 05:55:06 -0700
Message-ID: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
Subject: Xen and RISC-V Design Session
To: "open list:X86" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bobby Eshleman <bobby.eshleman@starlab.io>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hey,

I'm not sure if there is a better way to suggest a design session but
can we have a Xen on RISC-V discussion tomorrow at the Xen Design
Summit?

Preferably in a later slot as the early slots are very early for me.

Alistair

