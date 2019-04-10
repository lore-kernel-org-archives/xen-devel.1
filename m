Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69602C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 13:25:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378252070D
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 13:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="D8fa7UgK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378252070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEDEH-00010V-Ha; Wed, 10 Apr 2019 13:25:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JgJP=SM=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEDEG-00010Q-3q
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 13:25:28 +0000
X-Inumbo-ID: 1a4b345f-5b94-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a4b345f-5b94-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 13:25:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554902726; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=5qECSsydZUNi0K8m7FH9pwIEopW1dYyDntkcQM0RtfY=;
 b=D8fa7UgKe3PgLgieaHmVAULXuPPAyqjU6iC30kEO/9fUh4MOYsdw5Fbl4t1V2L2XiOuXRQoN
 4eh99zwpevxqLQ1ARi68lEvcsTq1VkeCSS0mSdPxHNXdgvKlem10Jm+nPl4OGPFHBsYi2pEn
 i7i7WYhkxRWeOms87zMMKqTOza0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5cadee86.7f042ad3d4b0-smtp-out-n02;
 Wed, 10 Apr 2019 13:24:22 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z11so2629166wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 06:24:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUEmtUwM9W4MM/b65/baUq6pKCVe5MXBJgFCc1UAUwmQkf8VOIu
 5NX0wdmN+RWTfeMc9vE/LwlkoG6OJNEfPqaR89w=
X-Google-Smtp-Source: APXvYqzvXk0Ukp7Xwvn+cE4MlYiLnZOrVNZu8QH2vX+UAr8ELwLlGtJimjFoHhi8YISd7brNBhNLQXBkVHkyl1UyhGA=
X-Received: by 2002:a1c:f909:: with SMTP id x9mr3012284wmh.18.1554902660948;
 Wed, 10 Apr 2019 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
 <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
 <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
 <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
In-Reply-To: <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 10 Apr 2019 07:23:43 -0600
X-Gmail-Original-Message-ID: <CABfawhnL+rXfZnFLYQ_444_o5PeHCW_FREqKGXsZ4onaGAO7Gg@mail.gmail.com>
Message-ID:
 <CABfawhnL+rXfZnFLYQ_444_o5PeHCW_FREqKGXsZ4onaGAO7Gg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410132343.K5TCnjA2hB8FpTbK5IgX5O-HajUnJYowlZL9eK30eqw@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgNjoxNyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEwLjA0LjE5IGF0IDEzOjIwLCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIDQvMTAvMTkgMTI6MTMgUE0sIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4gPj4gT24gMTAvMDQvMjAxOSAxMTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
Pj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBleGVjdXRlIGFueSBpbnN0cnVjdGlvbnMgZm9yIGRvaW5n
IHNvLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiBJIHdvbmRlciB3aGV0aGVyIG1lbV9zaGFyaW5nX2luaXQo
KSBzaG91bGRuJ3QgZ28gYXdheSBhbHRvZ2V0aGVyIHRoZW4uCj4gPj4KPiA+PiBJIHZvdGUgZm9y
IHJlbW92aW5nIGl0IGNvbXBsZXRlbHkuICBUaGUgcHJpbnRrIGlzIGEgb3V0LW9mLWNoYXJhY3Rl
cgo+ID4+IGNvbXBhcmVkIHRvIG90aGVyIHN1YnN5c3RlbXMgaW4gWGVuLgo+ID4KPiA+ICsxCj4K
PiBJbiBhbnkgZXZlbnQgSSdsbCB3YWl0IGZvciBUYW1hcydlcyBvcGluaW9uLiBUaGVyZSBtaWdo
dCBiZSBwbGFucyB0byBwdXQKPiBmdXJ0aGVyIG1lYXQgaW50byB0aGUgZnVuY3Rpb24sIGFmdGVy
IGFsbC4KCisxIGZyb20gbWUgdG9vLCBubyBwbGFucyBvbiBhZGRpbmcgc3R1ZmYgaGVyZS4KClRo
YW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
