Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51216C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 11:59:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 203C0206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 11:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRXz/wSN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203C0206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJzVU-0008R7-Es; Fri, 26 Apr 2019 11:59:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/EtS=S4=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hJzVT-0008QN-5b
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 11:59:07 +0000
X-Inumbo-ID: b0ceee2e-681a-11e9-843c-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0ceee2e-681a-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 11:59:05 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l203so2715682oia.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qdi7Cis1NWDTOaHpSte8S7/aNGiD4j9PxOE1Nw2yXBk=;
 b=DRXz/wSNlwu/LIMT1cyutbNxs7QQbHu8zHcQzptnS5D7Pv4vnp2HfeZhnxmDPTyyRf
 HX0vru1iYa0yW88dY/QiBCgxc3FYIkx709rCJAuW9ZTJCunKqQXOit0CjR4JlUAfVe6b
 MfKey45mXQHun7rQwRUhSaS6Kuu1qJGvbJ8X8EA88gOl3UvDq+aHnQ/33NyzX8OD4XbW
 W9ztj0nOK6Mco01TkO9znNHXEpqMzyz2Nrx2m6a/U1jepyMGNH6utJeuqQlMyGPQWT5D
 Z1iw3aYB12ucQipBtIUkoSiRb5vXEaadpZlQNEv7XP5iHSx5bzHAgXwlhpsaX5ZsPopI
 fcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qdi7Cis1NWDTOaHpSte8S7/aNGiD4j9PxOE1Nw2yXBk=;
 b=NAjWafPCWb26ognW7PpD+0xciA+j0Gm4VmzSWCdaT7pQTvH2keoJxJZpb0fUyovDqV
 z10e1YigQqM7nMhzCX5aAgzl7/HAW6Zaquk1YnARcGLVkIENBQSRBtiVPjpcHgAF6iKX
 36F/K9VMzus3X5BRdSxWQ651AZyyIhSIpNH1CKUYGNLos1q3vlHExhewroPJN8pphf9S
 1G4ziHsp9tusRTP1LMb4zIjpCmOCEzteqPihn5LKaun2sjXerciSOvKXeLo6+ODlEqLc
 ykMDxvWynH+11mzVuy0ZbHhV5VaPLcI2J7w/xvd8PyQuBCZuivOVkDsMcBn09wmcCpsP
 k/oQ==
X-Gm-Message-State: APjAAAWUGef6V/sUQPx6K0sL++i8er5nl+3/sz3pIVqQm8XuuGgOV0lG
 eldxj8DMD5r+pxhE2J9CP3ypHthN8VGqoHBae+4=
X-Google-Smtp-Source: APXvYqyY3lWm7ACi/dqyINtpcIK/4txhG/w4BCiqHrOLCvIx7MKS2p/oPwFaOV2ffwOHoOUZDkyH4/fRHc6ryKSi9VA=
X-Received: by 2002:aca:b4c6:: with SMTP id d189mr6936055oif.83.1556279944847; 
 Fri, 26 Apr 2019 04:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
In-Reply-To: <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Fri, 26 Apr 2019 17:28:53 +0530
Message-ID:
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426115853.P_hNCcqwXQ7qWny0Xk4bSsOt0ldRS1w4qllm28urMSA@z>

SGVsbG8sCgo+IENvdWxkIHdlIGluc3RlYWQgdHJ5IHRvIGF1dG9tYXRpY2FsbHkgYmxhY2tsaXN0
IGFueSBkZXZpY2UgdXNpbmcgUFBJPwoKSnVzdCB0ZXN0ZWQgZm9sbG93aW5nIGNoYW5nZToKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uMGM4Mjk3NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAt
MTI4OSw2ICsxMjg5LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9kZXZpY2Uoc3RydWN0
IGRvbWFpbgoqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsCiAgICAgICAgICAgICByZXR1
cm4gcmVzOwogICAgICAgICB9CgorICAgICAgICAvKiBEb24ndCBwcm9jZXNzIGRldmljZSB1c2lu
ZyBQUEkgc291cmNlICovCisgICAgICAgIGlmICggcmVzID4gMTYgJiYgcmVzIDwgMzIpCisgICAg
ICAgICAgICByZXR1cm4gMDsKKwogICAgICAgICByZXMgPSBtYXBfaXJxX3RvX2RvbWFpbihkLCBy
ZXMsIG5lZWRfbWFwcGluZywgZHRfbm9kZV9uYW1lKGRldikpOwogICAgICAgICBpZiAoIHJlcyAp
CiAgICAgICAgICAgICByZXR1cm4gcmVzOwoKV291bGQgaXQgYmUgT2sgPwoKVGhhbmtzLAotQW1p
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
