Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ACEC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 04:31:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1625C2084D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 04:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2dr29vF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1625C2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnx46-0003T7-Kg; Wed, 24 Jun 2020 04:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VPr=AF=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jnx45-0003T2-DL
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 04:31:13 +0000
X-Inumbo-ID: 887b4186-b5d3-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 887b4186-b5d3-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 04:31:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k6so852425wrn.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 21:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eqK1/S1BSPqTEtyBa/lwm0IqQTMCXrvmftiOVycrcDU=;
 b=I2dr29vFq0l2HgQvbr59hmpnZ0zgF3O4qDKo/3tzMs1Wl4MPALNgw9knIdc7myiqHN
 g50Fj4iuYCu/8qtv49q2nTwum0zkJvIvGphY3RkSgVmo/mV4b1F/ku0ceGt+4yHtS2YD
 ZyN6qyoeB/Tld0sTSlMHpkdz4xErOkMwAr1WnA+UvKPlviVEcuYsnzzuYG67BrpDrUf/
 6vgmkNkNk9QsCj6t4R3m5FuKsKX1x3h7G7PUdUlr0ikI6bgb5v4T441O+L3LVrBXm/0x
 bbfNZtHiQm7icNn69Sstd87xUQxp6zZkUCio2KifIEBCG+PeP2uSZJ10PE/W4wsXqasP
 l72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eqK1/S1BSPqTEtyBa/lwm0IqQTMCXrvmftiOVycrcDU=;
 b=Ye7a542g6upl9wTP5tljiJldlcC4VXhoTAAv0Bb5FjLx+tXlzZZTmXW6Es+553EYme
 LHI4JiARehkEWEb00l2jey7r4be/w1J9tLc3ASdQ7+KtrpRPG7WvU2NWJ6er899eC0S+
 qBiDuDY9KrxuHT8W5GIgr4GntgtEGx80odXpuUzjJWGsb+dvJNI6Bkqtr6rEMDfS79wy
 dio54f71hY/xFUbXcBje9Z3p9wHHDReWyorSVm6FPZiZVWLffQNNeEmcpOCCTBXgfVXY
 rjE8ZKwNw9+LNfIzPGVXxgb9t+8T/79fs26RN7zU45gAeMeFBjZMxcfOaWWBNwYqISHu
 CAVA==
X-Gm-Message-State: AOAM533KA2YqREbnF3BW7V2pv0+omLLz/tAJ5wz+BTkhLv4blMZTA7eE
 2JbFVQbk/AsN8+pa/v86fJGPpPsPLvAQmT2Qhts6kyAnp2c=
X-Google-Smtp-Source: ABdhPJycYfgpxn36qnjaQazv81nIVMYqSkZDu4OryVgKr0DbG8As3C7/xCqaEM5od0yfCc6gdcTd5duz5ZcbPS58s6I=
X-Received: by 2002:a5d:698e:: with SMTP id g14mr30826455wru.301.1592973071333; 
 Tue, 23 Jun 2020 21:31:11 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 23 Jun 2020 22:30:35 -0600
Message-ID: <CABfawhnodzf=-qiq86Pm5M7RsB2CH2=G0xJPwL5BzGxuFQJ9_A@mail.gmail.com>
Subject: [TESTDAY] Test report 4.14-rc3
To: Xen-devel <xen-devel@lists.xenproject.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

* Hardware: i9-9900x

* Guest operating systems: Ubuntu 20.04

* Functionality tested: domain create/save/restore, altp2m, vm_event,
mem_access, mem_sharing, VM forking

* Comments: also tested running nested in a VMware workstation VM, all
above work fine in that setup as well albeit with some expected
performance drop.

Everything looks good from my end.

Cheers,
Tamas

