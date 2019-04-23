Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D68BC10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:33:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487D7214AE
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPdvrrnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 487D7214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIsk4-00067Z-QG; Tue, 23 Apr 2019 10:33:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dq19=SZ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hIsk3-00067P-U2
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:33:36 +0000
X-Inumbo-ID: 3e72a566-65b3-11e9-92d7-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e72a566-65b3-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 10:33:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j20so11333585lfh.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yFSXY3skEtu6wntRXoeTdc25zWCEx7UMWWfScuj7PNU=;
 b=cPdvrrnQuwU/EK+y28gURDn5be8gYgr8jJL3WepLF/IAuVdpjY+DEljBcieb+vQPzl
 tE11I3ixzgWDSQ5E/30rEA7yP1rxU+81Le3VNeUCWYDn0NNBmJiD3+Yb7j3wC1DAHQHg
 suj7v5MVUxypoPYpxzL8S5o6b6N816Ex+s0le549MbXW0kwaRIuVc2HZmJS+EOEsOwGF
 ZfAmmR5o2U7D/cA9pe6SjPH6bgxeff2CiKOyk2lVAaswbJ9G1R1w4u+A3P+/7bVe+0Fd
 G3Yp8lGcuddp+NU+sVLHEiWk1N3kp+u0PuUeEoJut46tYm8Q8l/0dahN648Ld87J+C9l
 n0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFSXY3skEtu6wntRXoeTdc25zWCEx7UMWWfScuj7PNU=;
 b=GHADxeQlJfdrFdO9EmakanotXw/CJRLhkHQ/vFGSET1TLUOXEstC5ZRp1ksma9vxBQ
 3BEIxnyJQxfH+X+voJ/dRhzHxDBVuti2UeZdTBpyU4AGobwplhXJKyVXVkRbDnLWAW+7
 SSu6JO+agTRYF7LycOdOV/ju49XD3pU9r4pZANNuvy8nZ1ZcyqagAXdnHmG43L+O11cN
 XRxivovDJK2NXhrIY110wjzdMI4K+8Dv369O6PAdAt367FyDHHEylwWlC9J9Dr1xfhkJ
 WUKDuCIu03wuaFFaf9mxJ4HObMFF/ai98/1qYnSu7xY2LxMBSUd0m8I/46zw8VmPJMK2
 uDlQ==
X-Gm-Message-State: APjAAAWeakNbDcrd/1B2EBhK8TjWk7aOd45le1fs8hU+eXSfmfm5RAE1
 tB5fPdZ6J8GP4ngpPshIo2g=
X-Google-Smtp-Source: APXvYqyEPKTTiMceAXPoK3mSoxto6atBwPuO0elJgqFv8Q4YBzuwt5likPniav0b1WTe3WOfnpzPFg==
X-Received: by 2002:a19:f703:: with SMTP id z3mr13398725lfe.119.1556015612724; 
 Tue, 23 Apr 2019 03:33:32 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 h2sm3638092lfc.77.2019.04.23.03.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Apr 2019 03:33:31 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <4e237119-9b7b-6f96-a50b-f8c996ba0c2c@citrix.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <2f325cd5-22bc-c4b5-4a10-5e1189631384@gmail.com>
Date: Tue, 23 Apr 2019 13:33:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4e237119-9b7b-6f96-a50b-f8c996ba0c2c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423103330.ZkTuqkL9E_dgIaznP4bmGFbMGdY_wiqTNYGmc_pmigc@z>

SGVsbG8gQW5kcmV3LAoKT24gMjMuMDQuMTkgMTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
c2NoZWR1bGVfdGFpbCgpIGlzIGNhbGxlZCB3aXRoIGN1cnJlbnQgZnJvbSB0aGUgY29udGludWVf
cnVubmluZygpIHBhdGguCk5vdCBvbiBBUk0uIE9uIEFSTSBjb250aW51ZV9ydW5uaW5nKCkgaXMg
ZW1wdHkuCkZvciB0aGUgcXVpY2sgY2hlY2sgSSd2ZSBwdXQgYSBCVUcoKSBpbnRvIHRoZSBgZWxz
ZWAgYnJhbmNoLCBhbmQgZGlkIG5vdCBoaXQgaXQgZHVyaW5nIHN5c3RlbSB1cCwgZG9tYWluIGNy
ZWF0ZS9kZXN0cm95LCBldGMuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
