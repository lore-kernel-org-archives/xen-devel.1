Return-Path: <SRS0=q1ly=3F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C1DC33CB1
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 15:54:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A62832073A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jan 2020 15:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnic2HG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A62832073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7St-0006bk-T2; Thu, 16 Jan 2020 15:53:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Je7C=3F=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1is7Ss-0006bf-M1
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 15:53:46 +0000
X-Inumbo-ID: 606ff3b8-3878-11ea-ac27-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 606ff3b8-3878-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 15:53:46 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o13so23223155ljg.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 07:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eD/EmGOa00rlfZpzvj4LTdZvVgUXd502kkq3O2QOwzg=;
 b=fnic2HG9Opxwn+5R0KbHLs1X64Wmr807nEEqGMRNSrXYJ5+ZaLRsyBI9VQQF8vGLEc
 l4gY2zZD/jnEiAqbhGrtYfZNolDc7xibhBTOOLwcYkZuW9kH6ydXv0lvCYtkQzxPQLW+
 AJj4rhM4iHCym11NAv+DnDozSsx37umD/r2tKdzDYnz5e3cC2d7H5W6b51hwS0LLMWSr
 kfO83sl3fgUmFFoRVb4+J1eE3INFAunITVmL2ovQT3CaC8ydzqSygo8X+ZCkH68DonzM
 SIV6Vs3qua2YvTYV0xPBGBceyEW4nnNLjE3FW/7DVQHZKeZABCmir50R7SvYHtehQxN9
 OWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eD/EmGOa00rlfZpzvj4LTdZvVgUXd502kkq3O2QOwzg=;
 b=bmnqny4nSRxVyYAQFheYXyXkG7wSEKfn3V25c1qiHCIQ+GZY5L9dQVBYK9ravRoUzJ
 +zWIOveGw16HciaDYxoBXsZ+3yPbJkspgJOLe3HjgkzEg5CRvUqNlksEi/jMi00NRyux
 Rgd3hyLosYAwXy79W3DmUl657eAc8v2Nilx7kbCe3WNEWSRkE50nkAeCADtP0TVDxJnH
 3N7+Xa7bXQI/NI9raN3lIAnR4nX2WGxjybQLJIcr/zuWYl3NdmJYXYIfLxMUCvnJk6nq
 TAHDgzanOcp8DlUqbnSqnUYC2UjAGURARUvuFK9x21mnrGn20Y5/JkPk6UbiR0rsNQuU
 W6XA==
X-Gm-Message-State: APjAAAU8EBTv1kDdu01BnwXW6zRq2WiZx5MK7bBO2DFKb1b9PNnuvqpE
 Rdk3rZnk9EG95u2wUsatH2jZ5pnnS+EUDW6+1zE=
X-Google-Smtp-Source: APXvYqxAflGA0reZsGlaCPfPtSRiSZB2zoEoURS/04dLjGFLAJdQOKY3HM1ObC9+v8Y7FT9FST96aDeeDOIoqtsu+qo=
X-Received: by 2002:a2e:9183:: with SMTP id f3mr2770212ljg.64.1579190024926;
 Thu, 16 Jan 2020 07:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-5-pdurrant@amazon.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 16 Jan 2020 10:53:33 -0500
Message-ID: <CAKf6xpt1csug1wn5RU8btefK+11eXGXhMjDpFT-44bxn4wpDQw@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgNDozNiBBTSBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGEgJ2RvbWlkJyBmaWVsZCB0byBs
aWJ4bF9kb21haW5fY3JlYXRlX2luZm8gYW5kIHRoZW4KPiBtb2RpZmllcyBkb19kb21haW5fY3Jl
YXRlKCkgdG8gdXNlIHRoYXQgdmFsdWUgaWYgaXQgaXMgdmFsaWQuIEFueSB2YWxpZAo+IGRvbWlk
IHdpbGwgYmUgY2hlY2tlZCBhZ2FpbnN0IHRoZSByZXRpcmVkIGRvbWlkIGxpc3QgYmVmb3JlIGJl
aW5nIHBhc3NlZAo+IHRvIGxpYnhsX19kb21haW5fbWFrZSgpLgo+IElmIHRoZSBkb21pZCB2YWx1
ZSBpcyBpbnZhbGlkIHRoZW4gWGVuIHdpbGwgY2hvb3NlIHRoZSBkb21pZCwgYXMgYmVmb3JlLAo+
IHVubGVzcyB0aGUgdmFsdWUgaXMgdGhlIG5ldyBzcGVjaWFsIFJBTkRPTV9ET01JRCB2YWx1ZSBh
ZGRlZCB0byB0aGUgQVBJLgo+IFRoaXMgdmFsdWUgaW5zdHJ1Y3RzIGxpYnhsX19kb21haW5fbWFr
ZSgpIHRvIHNlbGVjdCBhIHJhbmRvbSBkb21pZCB2YWx1ZSwKPiBjaGVjayBpdCBmb3IgdmFsaWRp
dHksIHZlcmlmeSBpdCBkb2VzIG5vdCBtYXRjaCBhIHJldGlyZWQgZG9tYWluLCBhbmQgdGhlbgo+
IHBhc3MgaXQgdG8gWGVuJ3MgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gb3BlcmF0aW9uLiBJZiBY
ZW4gZGV0ZXJtaW5lcyB0aGF0Cj4gaXQgY28taW5jaWRlcyB3aXRoIGFuIGV4aXN0aW5nIGRvbWFp
biwgYSBuZXcgcmFuZG9tIHZhbHVlIHdpbGwgYmUKPiBzZWxlY3RlZCBhbmQgdGhlIG9wZXJhdGlv
biB3aWxsIGJlIHJlLXRyaWVkLgo+Cj4gTk9URTogbGlieGxfX2xvZ3YoKSBpcyBhbHNvIG1vZGlm
aWVkIHRvIG9ubHkgbG9nIHZhbGlkIGRvbWlkIHZhbHVlcyBpbgo+ICAgICAgIG1lc3NhZ2VzIHJh
dGhlciB0aGFuIGFueSBkb21pZCwgdmFsaWQgb3Igb3RoZXJ3aXNlLCB0aGF0IGlzIG5vdAo+ICAg
ICAgIElOVkFMSURfRE9NSUQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+CgpMb29rcyBnb29kLgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8
amFuZHJ5dWtAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
