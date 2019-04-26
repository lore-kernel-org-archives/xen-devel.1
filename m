Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A871C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 12:25:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0D42077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 12:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="cggS8WlA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0D42077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJzuk-0002eK-5d; Fri, 26 Apr 2019 12:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJzui-0002e9-LC
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 12:25:12 +0000
X-Inumbo-ID: 55166694-681e-11e9-b18b-7f64a738b553
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55166694-681e-11e9-b18b-7f64a738b553;
 Fri, 26 Apr 2019 12:25:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556281509; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=HyCxOU4dIb+scAHwPtYuaOLJ1kek8+tLoHRNbR+RFwU=;
 b=cggS8WlAbLi1488fAjTFJXhLxv22279z0S8SFK6/UXV/EtiMrOTtDJM0ikjK1l0+HRnwXANY
 tBIdIcFvAhp7sDiYizpz5EHEhU4uQ7/IV9EWpaiZ846EuZBhSDNvnspsotJ6iPKzBEZljNrW
 zR0KIpgHOx4b3PA8+DpfeKQxDJc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mxa.mailgun.org with ESMTP id 5cc2f8a5.7fa7aa028e70-smtp-out-n01;
 Fri, 26 Apr 2019 12:25:09 -0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p21so1813001wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 05:25:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVMeJ7/sVTO0QF5M27miC9f9bEtdI+IHuArNFYXcYThDk/8AYix
 FJwT8kQeXjC3MQfLU0YbR21rRO07gRUt8YMAruQ=
X-Google-Smtp-Source: APXvYqxNvq3q/I/NGXTNZ3g5qWilzoF8jZjfsrCA26gkZeqo/dwOEA2bt49ZOxdTvmbktItHPYHVJjbfvPyABgT2tPY=
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr7046467wmj.52.1556281507303; 
 Fri, 26 Apr 2019 05:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
In-Reply-To: <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Apr 2019 06:24:30 -0600
X-Gmail-Original-Message-ID: <CABfawhkeNi+Du-qJwaP=OmrMBOPFOTY+y4FLYC9OoRtpwf3izA@mail.gmail.com>
Message-ID:
 <CABfawhkeNi+Du-qJwaP=OmrMBOPFOTY+y4FLYC9OoRtpwf3izA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426122430.eptot5sMKkdRuffbwZxC5Ok9xpFtroDZLOZEixEJs9w@z>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMzoyNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI1LjA0LjE5IGF0IDIxOjU3LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAxMjo1OCBQTSBBbmRy
ZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBPbiAyNS8wNC8yMDE5IDE2OjMyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
bS5oCj4gPj4gPiBpbmRleCA2ZmFhNTYzMTY3Li41OTRkZTYxNDhmIDEwMDY0NAo+ID4+ID4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmgKPiA+PiA+IEBAIC0xMzMsNyArMTMzLDEwIEBAIHN0cnVjdCBwYWdlX2luZm8KPiA+
PiA+ICAgICAgICAgICAqIG9mIHNoYXJpbmcgc2hhcmUgdGhlIHZlcnNpb24gdGhleSBleHBlY3Qg
dG8uCj4gPj4gPiAgICAgICAgICAgKiBUaGlzIGxpc3QgaXMgYWxsb2NhdGVkIGFuZCBmcmVlZCB3
aGVuIGEgcGFnZSBpcwo+ID4gc2hhcmVkL3Vuc2hhcmVkLgo+ID4+ID4gICAgICAgICAgICovCj4g
Pj4gPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKnNoYXJpbmc7Cj4gPj4gPiAr
ICAgICAgICBzdHJ1Y3Qgewo+ID4+ID4gKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX3NoYXJpbmdf
aW5mbyAqaW5mbzsKPiA+PiA+ICsgICAgICAgICAgICByd2xvY2tfdCBsb2NrOwo+ID4+ID4gKyAg
ICAgICAgfSBzaGFyaW5nOwo+ID4+ID4gICAgICB9Owo+ID4+ID4KPiA+PiA+ICAgICAgLyogUmVm
ZXJlbmNlIGNvdW50IGFuZCB2YXJpb3VzIFBHQ194eHggZmxhZ3MgYW5kIGZpZWxkcy4gKi8KPiA+
Pgo+ID4+IEknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBidXQgZm9yIHNvbWUgcmVhc29ucyB3
aGljaCBhcmUgcmF0aGVyIG1vcmUKPiA+PiBzdWJ0bGUgdGhhdCB0aGV5IGFwcGVhciBoZXJlLgo+
ID4+Cj4gPj4gVGhlcmUgaXMgb25lIHN0cnVjdCBwYWdlX2luZm8gcGVyIDRrIGZyYW1lLCBhbmQg
eW91J3ZlIGFkZGVkIGFuIGV4dHJhIDE2Cj4gPj4gYnl0ZXMsIHRha2luZyBpdCBmcm9tIDMyIGJ5
dGVzIHRvIDQ4IGJ5dGVzLgo+ID4+Cj4gPj4gT3RoZXIgdGhhbiBtYWtpbmcgaXQgYSBub24tcG93
ZXItb2YtMiAobmV0IGRpZmZzdGF0IGdyb3cvc2hyaW5rOiAyNTYvMjcKPiA+PiB1cC9kb3duOiA3
NzUwLy01Njk2ICgyMDU0KSBkdWUgdG8gbGVzcyBlZmZpY2llbnQgYXJpdGhtZXRpY1sxXSksIHRo
ZQo+ID4+IGZyYW10YWJsZSBoYXMgYSBmaXhlZCB2aXJ0dWFsIHNpemUgKDEyOEcgYnkgZGVmYXVs
dCksIHNvIHlvdSd2ZSBlbmRlZCB1cAo+ID4+IGRyb3BwaW5nIFhlbidzIG1lbW9yeSBsaW1pdCAo
MTZUQiBieSBkZWZhdWx0KSBieSAxLzMuCj4gPgo+ID4gSW50ZXJlc3RpbmcsIEknbSBub3Qgc3Vy
ZSBJIGNvbXBsZXRlbHkgZm9sbG93IGJ1dCBkb2VzIHRoaXMgbWVhbiB0aGF0Cj4gPiB0aGlzIHN0
cnVjdHVyZSBpcyBub3cgbm90IGFsbG93ZWQgdG8gZ3JvdywgbGlrZSBldmVyLCBvciB0aGF0IEkg
anVzdAo+ID4gbmVlZCB0byBhZGQgcGFkZGluZyB0byBmaXggdXAgaXRzIGFsaWdubWVudD8KPgo+
IEluIGFkZGl0aW9uIHRvIHdoYXQgQW5kcmV3IGhhcyBzYWlkLCBhbHNvIG5vdGljZSBob3cgd2Un
dmUgZ29uZQo+IHRocm91Z2ggZXh0cmEgaG9vcHMgdG8gYXZvaWQgZ3Jvd2luZyB0aGUgc3RydWN0
dXJlIGluIHRoZSBjb250ZXh0Cj4gb2YgWFNBLTI4MC4KCkxvb2tzIHRvIG1lIGF0IHRoaXMgcG9p
bnQgSSB3b24ndCBiZSBhYmxlIHRvIHJlcGxhY2UgdXNpbmcKcGFnZV9sb2NrL3BhZ2VfdW5sb2Nr
IHdpdGggYSBzZXBhcmF0ZSBsb2NrIGluIGEgbWVhbmluZ2Z1bCB3YXkuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
