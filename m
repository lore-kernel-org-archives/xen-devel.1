Return-Path: <SRS0=mWk2=SP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2C4C10F0E
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 03:18:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6B520869
	for <xen-devel@archiver.kernel.org>; Sat, 13 Apr 2019 03:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCO52ALj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F6B520869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hF9B4-00049m-2W; Sat, 13 Apr 2019 03:18:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WTA6=SP=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hF9B3-00049h-JS
 for xen-devel@lists.xenproject.org; Sat, 13 Apr 2019 03:18:01 +0000
X-Inumbo-ID: bd9d1883-5d9a-11e9-92d7-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bd9d1883-5d9a-11e9-92d7-bc764e045a96;
 Sat, 13 Apr 2019 03:18:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y197so1361555wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sQg0Jez0gH7P2Yf/gOA9yD1nUWcmoCw/Rnp1IrVHKSM=;
 b=pCO52ALjkKmO+2aKlFQvfWsqAGTIY6tse7aj1hFrFNefzjGllSOX/6G0e6eRDLoh2e
 tKsbV5xB/c05klj3UMQ7e/CkcKA+YR8P97HsgnG0Ni5ivntUiDlgaiUtSPZCZO3E6Mk9
 XRsecSbkyrV+iAHkoEThmRYrlyEWuU2E/n+Yx8aCCwYFeEPcF+TXbkGBrqwSVuLPsT46
 rxqPk9ZLBmqoL+xtYlfCs6GCelBlINHvk8y9TGpBnVj1JASTtvaFwSuvenq0nSrxJGnI
 b+A47eo6UDtb3U9do2iPdVCwqbLIvLLweVSUWdiTvsw9tbjwx+xmsoruN+VAJypJebky
 x6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sQg0Jez0gH7P2Yf/gOA9yD1nUWcmoCw/Rnp1IrVHKSM=;
 b=SNu0kZEJITGmODU/O/VU05092WsK4GQ7HqsDhp1BUDtc1QLqlpopIX8djUy4pC6ycq
 GBLlkV0+JlrIFS9T1Nd9IDfehXestjvdR2fO1V1MlTsmehAUwXlMM/p0JOPJpoQOiSkr
 2Oa6xdtK/I3RV52XI6h9W+oo4xNAQQiCcspu7fDOFwPyVvNgcIlZRtN+8E8eek5jwsHy
 WR/qjdoOVWrPQ9OlkAyDappPghd7LmarPiUY2YyHEN5ejoWNcSD7HLJuwO13wM7PMUbs
 XPnpwHsBmUJGrAXQDMwOolO+6cOQdTmajo//PegF1OShyJa0NzG+7ULrvBDyQQHVznJ7
 5QeQ==
X-Gm-Message-State: APjAAAXnPz/9P1ab4vey6yKnBk6uXODBcrIK6oJB8MYqKvTFNrkt61T7
 Qy4lnoW3LIYBMs/t7+ns5W8mgSCI4zWzbwZQL6c=
X-Google-Smtp-Source: APXvYqwhSNCf/CM+j5BsBDBUOH7OsLTb0vXFhBq5v3SYJWV9+NTesYvosM5DU8zjgxJSbMinyTi8yvutuHfMLIDp1tk=
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr14246050wme.49.1555125479532; 
 Fri, 12 Apr 2019 20:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
In-Reply-To: <20190411102843.GE30543@zion.uk.xensource.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sat, 13 Apr 2019 11:17:48 +0800
Message-ID:
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190413031748.zMV-ZQ1UI3LjmZXkREn2yNwCQo3kQj3FEF3c3S13qm4@z>

T24gVGh1LCAxMSBBcHIgMjAxOSBhdCAxODoyOSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4gd3JvdGU6Cj4KPiAuLi4KPiBTdXJlLiBJIHdpbGwgd3JpdGUgYSBwYXRjaC4KPgo+IFdlaS4K
CkNvdXBsZSBvZiBvdGhlciB0aGluZ3MgSSBub3RpY2VkIGFmdGVyIHBvc3RpbmcgdGhlIG9yaWdp
bmFsIG9ic2VydmF0aW9uLAp0aGF0IG1pZ2h0IGJlIG9mIHVzZSBpbiBwYXRjaGluZyB0aGUgZG9j
dW1lbnRhdGlvbgoKMSkKClRoZSB0b29scy9NYWtlZmlsZSBoYXMgYSBiYXJlIFBZVEhPTiBFbnZW
YXIgdGhhdCBpc24ndCBzZWVtaW5nbHkKcmVwbGFjZWQgYnkgdGhlIFBZVEhPTj0gdmFsdWUgc3Vw
cGxpZWQgdG8gY29uZmlndXJlLCBzbyBJIGFsc28KbmVlZGVkIHRvIHNwZWNpZnkgdGhlCgpQWVRI
T049L3BhdGgvdG8vaW50ZXJwcmV0ZXIKCmFzIGFuIGFyZ3VtZW50IHRvIHRoZSAibWFrZSB3b3Js
ZCIgYXMgd2VsbCBhcyB0byB0aGUgY29uZmlndXJlLgoKCjIpCgpJbiB0aGUgdG9wLWxldmVsIElO
U1RBTEwgZmlsZSwgd2UgcmVhZAoKLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8
LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0KU01CSU9TX1JFTF9E
QVRFPW1tL2RkL3l5eXkKVkdBQklPU19SRUxfREFURT0iZGQgTW9uIHl5eXkiCgpEdXJpbmcgdG9v
bHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRy
ZWUuClRoaXMgdmFyaWFibGUgY2FuIGJlIHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQgZ2l0
IGJpbmFyeSB0byBiZSB1c2VkLgpHSVQ9CgpEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVw
b3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRyZWUuCkR1cmluZyBzdHViZG9tIGJ1
aWxkIGV4dGVybmFsIHBhY2thZ2VzIHdpbGwgYmUgZG93bmxvYWRlZCBpbnRvIHRoZQpzb3VyY2Ug
dHJlZS4gVGhlc2UgdmFyaWFibGVzIGNhbiBiZSB1c2VkIHRvIHBvaW50IHRvIGEgZGlmZmVyZW50
CmxvY2F0aW9ucy4KWEVOX0VYVEZJTEVTX1VSTD0KT1ZNRl9VUFNUUkVBTV9VUkw9Ci0tLS04PC0t
LS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04
PC0tLS0tLS0tODwtLS0tCgpJcyB0aGF0IHNlY29uZAoKICAgRHVyaW5nIHRvb2xzIGJ1aWxkIGV4
dGVybmFsIHJlcG9zIHdpbGwgYmUgY2xvbmVkIGludG8gdGhlIHNvdXJjZSB0cmVlLgoKYWJvdmUg
dGhlCgogICBEdXJpbmcgc3R1YmRvbSBidWlsZAoKcmVxdWlyZWQgPwoKRldJVywgSSBub3RpY2Vk
ICgyKSAgYmVjYXVzZSBJIGRpZG4ndCBoYXZlIEdpdCBpbiBteSBMRlMgc3lzdGVtIGF0CnBvaW50
IHRoYXQgSSB3YXMgdHJ5aW5nIHRvIGJ1aWxkIFhlbiBpbnNpZGUgaXQuCgpLZXZpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
