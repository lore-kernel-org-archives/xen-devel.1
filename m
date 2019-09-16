Return-Path: <SRS0=eqFR=XL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4323DC49ED7
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 10:01:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B342067B
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 10:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B342067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9noY-00076E-FH; Mon, 16 Sep 2019 10:00:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9noW-000768-Pz
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:00:56 +0000
X-Inumbo-ID: dfac5f7e-d868-11e9-978d-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfac5f7e-d868-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 10:00:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p7so9387366wmp.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 03:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7addVq4nC+TGaKW2Q7DaiTsvroHtpTEdoiZlUyxbLqA=;
 b=T7qSzBD3EhuuI9InSs4Dl2B4YoF2lVFBoqhsMvJUoHnZI58CMW73C9awgzXUnxvLbm
 pgkK9ekHayyQ3TRPE1sFevgVP1pgvPrN1LoaE9cY0KDZQu5dEVMMg8re3Ahcj0T3SNS7
 B7VR8dBY5e8zaMZNzWX2bAIZLBkms0KbY6mr6o84WC+3imt24l1p9Qd/zbmIc3WEKpQ1
 3DtGeNJmbFA4boQ2aTk9VgMdbp8MxMuQ8fLt8lLfkctqKKOWdfQnj2WpC9miixZQcyTc
 UR7auCp3nCNtOwVd+azuTXpJIW8Rdj9cB7OiloqphOAyatJ5lawHY5Y5C/yIWdYOItZb
 U23w==
X-Gm-Message-State: APjAAAXjQ9ayCUWX978+F1luofA+Xvm6sBavvuk48Vvu4lfYmYJ1UwaN
 q91EhOZxKfXR8fuTd1DmuRs=
X-Google-Smtp-Source: APXvYqylRwIEQyhfBYlDygCMfP5RuYqaI2/sI9UDH3vZvYlYHzcc2pCRmUrsCyOORw91OgtYjLvvrw==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr8040444wmc.92.1568628054906; 
 Mon, 16 Sep 2019 03:00:54 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id h63sm3662044wmf.15.2019.09.16.03.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 03:00:54 -0700 (PDT)
Date: Mon, 16 Sep 2019 10:00:53 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190916100053.qaggkkjbcluxs7br@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190903072023.29147-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903072023.29147-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/libs: put common Makefile parts into
 new libs.mk
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDk6MjA6MjNBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgTWFrZWZpbGUgYmVsb3cgdG9vbHMvbGlicyBoYXZlIGEgbG90IGluIGNvbW1v
bi4gUHV0IHRob3NlIGNvbW1vbgo+IHBhcnRzIGludG8gYSBuZXcgbGlicy5tayBhbmQgaW5jbHVk
ZSB0aGF0IGZyb20gdGhlIHNwZWNpZmljIE1ha2VmaWxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
