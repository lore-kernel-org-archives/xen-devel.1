Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BF1C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:49:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D65A206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCXn8Pvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D65A206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1Db-0000uO-PM; Fri, 26 Apr 2019 13:48:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1Da-0000uJ-IT
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:48:46 +0000
X-Inumbo-ID: 0142061a-682a-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0142061a-682a-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:48:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z26so3029307ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOzA+Iq3OyyW/0ssn6/LcVjurIqyd86jXO0A84AtoLA=;
 b=YCXn8PvkLLIrmhbf0DJs6Ywh5NEJMmf7cD0N/7wCb6GZzKCVy1VfltXY8we8mO7PDI
 BDa9CVLKAG38GHMqN47RrAeFh5G4gMClPE5T5ca62c5CPJqt3sUa76LVPBTUhwP01r4+
 bIiMKyMWtKLZDE9wjzkWyKZ7Y4GQQY+Au4ZKoZHHLw0TsCGKVDAma/f7vQh5GY7IWRX2
 413/kmrmCoI6zpAIhVzEiLh/TXy4mDpLBj2cL3bV5B8VOfgeh5AIx/KfBVard6DVBZOh
 +GD/+/qn1bRZcHJDo5MIW5Pqqk3Jt1jVBJuvJbHzALp0hSzJMws9gVzvltHixbZakx1x
 fLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOzA+Iq3OyyW/0ssn6/LcVjurIqyd86jXO0A84AtoLA=;
 b=Qad5dHK5UjlQU9e44a5GLz15+3sMkXi6eE5bHnGZShSZyy2PKp3/KdsOp+xvRK263P
 Zib72uOlNscluEo66PcpvTdLTlj6jYTonxRnaKeQ70pOOHsZxAngEDrWEbc+PnPsP1PQ
 k4TM1f46u9aIiSsPl0anWzn0FqJOxXWWgWnb6KxjSDKFFBu4QHuzj09xxMMbgigBE3QD
 7+wpq0Vx4GKRqWfcCTNSxt6H19dQ34tN1cGm1vgamZurzJh9xNAEBZsryJSg4NLZl4W0
 Sr1ULzzX1Yv4RlppCTnZB8g9EnBFSobVLgFGCbARhl4Z7VXZjfzqUevzezIBV3c9J4x3
 ZUdw==
X-Gm-Message-State: APjAAAXP5lyhiTbARhWJC6w/CV3WH4WaXCNDSpkZKMGN7RnMeyZ6XfUX
 PPck10JbcUQcAwV6/Dl4AuY=
X-Google-Smtp-Source: APXvYqxMWq4U6bbEZj+JrynKsfvyTQ0qbfqvLTWLV3es+5+NJUGPdloNXLjZU1tFxc/SX5JISu6ggg==
X-Received: by 2002:a2e:9812:: with SMTP id a18mr7594746ljj.146.1556286522428; 
 Fri, 26 Apr 2019 06:48:42 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 w19sm5590409lfe.23.2019.04.26.06.48.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 06:48:41 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-2-julien.grall@arm.com>
 <52b107e1-fa03-54aa-3b64-3bba7104661b@gmail.com>
 <8bcf25e7-3c7a-b61d-6caf-a11eaf68a232@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <5fdaab28-ee8e-180e-5cd5-2694bbab214c@gmail.com>
Date: Fri, 26 Apr 2019 16:48:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8bcf25e7-3c7a-b61d-6caf-a11eaf68a232@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426134840.h2FLRkwZtY85onDODmCDJyqefgVATjz1dIrsM82rnQo@z>

SGVsbG8gSnVsaWVuLAoKT24gMjUuMDQuMTkgMjM6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBX
aHkgY2FuJ3Qgd2UgbGV0IHRoZSBjb21waWxlciBkZWNpZGluZyBmb3IgdXM/IFRoZSBtb3JlIHRo
YXQgaW5saW5lIGlzCj4gcHJldHR5IGJyb2tlbi4gU2VlOgo+IAo+IGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2xvY2FsL2lubGluZS5odG1sCgpBaCwgb2suIFNvIGxldCBpdCBiZS4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
