Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858FCC388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 14:36:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD5720678
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 14:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzazuIJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD5720678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23475.50253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUl0-0001Xp-Um; Tue, 10 Nov 2020 14:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23475.50253; Tue, 10 Nov 2020 14:36:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcUl0-0001Xi-Ri; Tue, 10 Nov 2020 14:36:26 +0000
Received: by outflank-mailman (input) for mailman id 23475;
 Tue, 10 Nov 2020 14:36:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xyM=EQ=gmail.com=bestofboston9@srs-us1.protection.inumbo.net>)
 id 1kcUkz-0001Xc-MC
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:36:25 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a92610d-1f55-4427-a4c4-ca89f3cd2b82;
 Tue, 10 Nov 2020 14:36:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so12888720wrc.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 06:36:25 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8xyM=EQ=gmail.com=bestofboston9@srs-us1.protection.inumbo.net>)
	id 1kcUkz-0001Xc-MC
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 14:36:25 +0000
X-Inumbo-ID: 3a92610d-1f55-4427-a4c4-ca89f3cd2b82
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3a92610d-1f55-4427-a4c4-ca89f3cd2b82;
	Tue, 10 Nov 2020 14:36:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so12888720wrc.11
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+38AGrc6bohEGufZoH3Iz9R98zqgUWm9z5uK3ylOrBU=;
        b=OzazuIJlVm5vyLp79aGJ/ENznoDl/jAHzTKkrgznLKHZ+KKG0T4q7VH1YddboO4jYQ
         6tXAEth411wHsdEZUzNLS7eV1h3bTTp89wohT42zDN0k5qopzBhwgmfhdLOfQtms1lPP
         tgiAUN9zjjsLKgyv6yFIQ0sKN1CqkJkEYK2noKq2/QDtYLVCu/vO3APMBHmUArqcPRU7
         Q1jI2HQoy52tUOyzTz5XFouDndZZBiZGUKhXzmJ3I3Pz71VdMQO3Ff9lEFr/6BFwxx1N
         uzoDcrcXZIqaksrjoOnwLss6DXzkIuEi90xWLljaN8yHlumS2EgtWzRmgq7b26G68h5h
         Olng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+38AGrc6bohEGufZoH3Iz9R98zqgUWm9z5uK3ylOrBU=;
        b=VPljCJUL12uMX+BPnUSAGT4IoBNPLVNHNoaJm8AfnOx1XXnT/hBcKvm9CQp7BkPeZT
         iAZCkhSNR1Z2d0Vc5n2d6POr7C9g65a4zgMJ5LawIffzoe5kV9ClfqHaVCv8D8uKqmjY
         OJ3EHXNDhakkDAnYqgUI7zvwXRNoTT/8xpkV0p/NtRDHZQ+WERqjJDfCqLNgeBftae8G
         ejFhGBW0JwsEwzRh0YMyBNNlNAFT3svnwgIa4CnU1ZBCOIJov1+Jm0ED/DZku8NbRw64
         /e5UujeWPwqgIndtwISzEFW1kPi8L6s4p5lyxl+Nst/tC4kxE0IHTxuQZ3Ni+AyHmRTv
         UzGA==
X-Gm-Message-State: AOAM531Q2jmETwBaf4n6VO3JczeyDw+p/eZdnzhhazC504mltwCKoc4e
	iNVm/+dsvR4TF1yu/FJwByDMc515smhHBj7U+1qjV5Kb+XIrimLj
X-Google-Smtp-Source: ABdhPJzofyWMbsWT/f5njWX710solCjUoTqAcRJOxw3B1RNIay6GG6XbrFYvy9awqvxDTonHTYk96AD237GMIfKyack=
X-Received: by 2002:adf:e388:: with SMTP id e8mr24106900wrm.65.1605018984034;
 Tue, 10 Nov 2020 06:36:24 -0800 (PST)
MIME-Version: 1.0
From: Scott Davis <bestofboston9@gmail.com>
Date: Tue, 10 Nov 2020 09:36:13 -0500
Message-ID: <CAPjWd+wmFc=OGLpmxeZiW5euvByO=fiecRk9UR3Wsre6Y+j3qQ@mail.gmail.com>
Subject: UNSUB
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000066b6d705b3c19a95"

--00000000000066b6d705b3c19a95
Content-Type: text/plain; charset="UTF-8"

UNSUB xen-devel

--00000000000066b6d705b3c19a95
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">UNSUB xen-devel</div>

--00000000000066b6d705b3c19a95--

