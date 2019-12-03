Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164FBC432C0
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 16:53:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AEB206EC
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 16:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AEB206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBPt-0003zA-HT; Tue, 03 Dec 2019 16:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+tL=ZZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1icBPs-0003z4-3j
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:52:48 +0000
X-Inumbo-ID: 55618656-15ed-11ea-a55d-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55618656-15ed-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 16:52:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s14so4314553wmh.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 08:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ILkQvdtyoAHQrauXdNN08iaFketHjyjssmAcTrEv+uE=;
 b=fo0ewdXbk6YOsZcMG0Mc0NiDcYXvmErXIlgxsdPUz7u8zFuNMchQQWDSRS/HnIIhdy
 1fDcuLFdSJjvMZknlDL8WTlh7jDMNpkvgG009OyYDVNymBhdll7r2d9WL9bOttueu3ef
 2wGhgE/i77hus5V7DWXypOkwSbyxB7ET8btm4vC+bbx0R/nvkamO0FvHuwSMsYVlYiLG
 agUe7+48G6Uq9v6woTTuvjpN6ymQ2enAg7UYE2FGn3DoKLgp+HNFQ4ED0XiClAfK4TGr
 UHZOgIj+rzRL8eE1SVWDtsTTN++PMtNNVLsdRx4GQsutkx1gsvdgdwvQvmT4O93R2j4z
 drAQ==
X-Gm-Message-State: APjAAAXMeJOqzhAgWoQfovwUvzbRz0OsbpLOaEOW+F/DD+yPXuw0GYJ6
 JeAwiwuec6y+YtcbryWvF3/9GI2+
X-Google-Smtp-Source: APXvYqzH4Q884Ef9GIlLArB31Yqlf+x/O2DI+muFCka12wAkkFwP4irxsTsF8Eju8gJuJm3ixw0Xng==
X-Received: by 2002:a05:600c:1108:: with SMTP id
 b8mr19346935wma.17.1575391966605; 
 Tue, 03 Dec 2019 08:52:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id n8sm4297696wrx.42.2019.12.03.08.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 08:52:45 -0800 (PST)
To: Andre Przywara <andre.przywara@arm.com>
References: <20191202084924.29893-1-tiny.windzz@gmail.com>
 <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
 <20191203143818.09e74f25@donnerap.cambridge.arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <796e5014-9eee-a084-714c-eab63021f65b@xen.org>
Date: Tue, 3 Dec 2019 16:52:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203143818.09e74f25@donnerap.cambridge.arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8xMi8yMDE5IDE0OjM4LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBUdWUsIDMg
RGVjIDIwMTkgMTE6Mzk6NTggKzAwMDAKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToKPiAKPiBIaSwKPiAKPj4gKCtBbmRyZSkKPj4KPj4gSGksCj4+Cj4+IEBBbmRyZSwgSUlS
QyB5b3Ugb3JpZ2luYWxseSBhZGRlZCB0aGUgc3VwcG9ydCBmb3Igc3VueGkgaW4gWGVuLiBDb3Vs
ZAo+PiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBwYXRjaD8KPiAKPiBMb29rcyBhbHJpZ2h0LCBh
bmQgaW5kZWVkIHRoZSBINiBuZWVkcyBpdC4gRXZlbiB0aG91Z2ggQWxsd2lubmVyIHRvdGFsbHkg
cmUtYXJyYW5nZWQgdGhlIG1lbW9yeSBtYXAsIHRoZXkgbWlzc2VkIHRoZSBvcHBvcnR1bml0eSB0
byBwdXQgZWFjaCBkZXZpY2UgYXQgbGVhc3QgaW4gdGhlaXIgb3duIDRLIHBhZ2UuCj4gCj4gUmV2
aWV3ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgoKVGhhbmsg
eW91IGZvciB0aGUgcmV2aWV3IQoKPiAKPiBJZiB5b3UgY2FuIHdhaXQgdGlsbCB0aGlzIGV2ZW5p
bmcsIEkgY2FuIGV2ZW4gdGVzdCBpdC4KCkkgY2FuIHdhaXQgdW50aWwgdG9tb3Jyb3cgYmVmb3Jl
IGNvbWl0dGluZyB0aGUgcGF0Y2guCgo+IAo+IEl0J3MgYWN0dWFsbHkgYSBzaGFtZSB0aGF0IHdl
IG5lZWQgdGhpcyBlbnVtZXJhdGlvbiwgd2hlbiBhbGwgd2UgYXJlIGFmdGVyIGlzIGFuIGFuc3dl
ciB0byB0aGUgcXVlc3Rpb246IERvZXMgYSBkZXZpY2UgdXNlZCBieSBYZW4gc2hhcmUgYSA0SyBw
YWdlIHdpdGggYSBkZXZpY2UgaGFuZGVkIG9mZiB0byBEb20wPyBJdCBzb3VuZHMgCmxpa2UgYSBu
aWNlIHJhaW55IGFmdGVybm9vbiBleGVyY2lzZSB0byBzY2FuIHRoZSBEVCB0byBmaW5kIHRob3Nl
IApkZXZpY2VzIGF1dG9tYXRpY2FsbHkgYW5kIG1hc2sgdGhlbSAob24gdGhlIEE2NCBmb3IgaW5z
dGFuY2UgVUFSVDQgaXMgb24gCmEgZGlmZmVyZW50IHBhZ2UpLgoKSSBhZ3JlZSBhbmQgSSB0aGlu
ayB3ZSBkaXNjdXNzZWQgYWJvdXQgaXQgYmVmb3JlIDopLiBJIHdvdWxkIHdlbGNvbWUgCnN1Y2gg
aW1wcm92ZW1lbnQgaW4gWGVuLCB0aGlzIHdvdWxkIGFjdHVhbGx5IGFsbG93IHVzIHRvIGRyb3Ag
c3VueGkuYyAKY29tcGxldGVseS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
