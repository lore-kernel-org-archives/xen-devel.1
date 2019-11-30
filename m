Return-Path: <SRS0=NB8d=ZW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B893C432C0
	for <xen-devel@archiver.kernel.org>; Sat, 30 Nov 2019 11:49:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B80D2082E
	for <xen-devel@archiver.kernel.org>; Sat, 30 Nov 2019 11:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B80D2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1FC-0003eG-Hw; Sat, 30 Nov 2019 11:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1FB-0003eB-2D
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:48:57 +0000
X-Inumbo-ID: 636ac948-1367-11ea-a3f1-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 636ac948-1367-11ea-a3f1-12813bfff9fa;
 Sat, 30 Nov 2019 11:48:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so38205249wro.5
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ySvK4xppnMHUTHXVdmAYCTWBUSE0q506vrudpbuqObc=;
 b=K2qHMG6KO29IcG7aOxae52pKicWqJg3tm5oebHciOJWTa83dU+5izUuI00EachICjR
 X+Cc+i8X/oj4OmluuFxaZYYJwxKsK0B8BwtHzLpEnu0eu7gq8wikmq575ahdF6b5hEoz
 ZzrMJQ/7JoaqNc4ZpctLjCMRUc3uvElKzuldWs59VTb5fXSjfKbaxeYBvkG2NCJDD9RE
 7MeP0x6b1WefaoVRb21/9Umpxs8MuY8LFfOeEhRLrY7tPX8RAZ9obaUFzgZe0iooGuX8
 LUnZUO0bXvmnR29sL2v9zmH4uoW1rhB0lEaSFcXVpuZP4Fr8uuMsbtN/XyyKeRntnWo4
 YISw==
X-Gm-Message-State: APjAAAXFE3kAWk9RGAEi78IYJoRxocF+3g6b5z3bFJO2w5sRTApyMUFp
 YlIYBxsD5nFUYrO3m2MIC1k=
X-Google-Smtp-Source: APXvYqya1Owr9Obpg6EzgumRgN+6BcWfj6GwMp+ucuDsPWkn9GlUSczdYnY0Z4zvZdb7S0GLrFBKug==
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr61512899wrv.13.1575114535598; 
 Sat, 30 Nov 2019 03:48:55 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id u1sm16272804wmc.3.2019.11.30.03.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:48:54 -0800 (PST)
Date: Sat, 30 Nov 2019 11:48:53 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191130114853.coqbkua2dz3nquxc@debian>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-5-liuwe@microsoft.com>
 <4f6dfcd9-f6b4-7d36-6a6c-488f9768f038@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f6dfcd9-f6b4-7d36-6a6c-488f9768f038@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 4/8] x86: introduce hypervisor framework
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDY6MDg6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMS8xMS8yMDE5IDE4OjUwLCBXZWkgTGl1IHdyb3RlOgo+ID4gKyNpbmNsdWRl
IDx4ZW4vdHlwZXMuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL2NhY2hlLmg+Cj4gPiArI2lu
Y2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX29wcyBfX3JlYWRfbW9zdGx5ICpob3BzOwo+IAo+IENvdWxkIEkgdGFs
ayB5b3UgaW50byB1c2luZyBqdXN0IHBsYWluICdvcHMnIGhlcmUuwqAgVGhpcyBpcyBtb3N0bHkK
PiBwbHVtYmluZyBhbmQgZG9lc24ndCBhcHBlYXIgdG8gZ3JvdyBzaWduaWZpY2FudGx5LsKgIEkg
ZG9uJ3QgdGhpbmsgdGhlcmUKPiBpcyBhIHJpc2sgb2YgZ2FpbmluZyBhbWJpZ3VpdHkuCgpUaGlz
IGlzIGRvbmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
