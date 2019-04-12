Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62131C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:56:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDFB2084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="aMNbvAd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDFB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEwfN-0000xU-FP; Fri, 12 Apr 2019 13:56:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEwfM-0000xO-0e
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 13:56:28 +0000
X-Inumbo-ID: c3907994-5d2a-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3907994-5d2a-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 13:56:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555077386; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Zq2diMRevEQYfppNE763q3UBHiEC8M49CX2GWlPr1Xw=;
 b=aMNbvAd49ReyWz5Inv069BQUQ1TEbYoDYj2EW4hrw6RyCH/ofjgf/0U/ZEIY7wO3XUDAcS9N
 rHP4hQrGpdIgkTmDazgxrgyWuqaihzDuYldvsh1NfeVPgh4iI/DdYB36Ct5+23ZGl6MEd4jY
 hehbRKLXoVWB6gnq5Rt47WvcLa4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5cb098eb.7fcd548fa330-smtp-out-n02;
 Fri, 12 Apr 2019 13:55:55 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h18so11164756wml.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 06:55:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVp1jat6824DNv+rO3DW5KnhO2sVYVMLgyQ1sdPXUvCPSV+hDLt
 gb16jR0XuShAQrqbav6Q4k83rPfu2I48F1ZCXKQ=
X-Google-Smtp-Source: APXvYqyYeJR6xe+euZ9ysRYfS6PZf2ATc7/8OuxMGUKYwGKhyJogvdbFO6hKx2Uhy7AWTAQljjDy5I8EnKV/UouW3gg=
X-Received: by 2002:a1c:f909:: with SMTP id x9mr11830680wmh.18.1555077354489; 
 Fri, 12 Apr 2019 06:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
 <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
In-Reply-To: <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 07:55:17 -0600
X-Gmail-Original-Message-ID: <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
Message-ID:
 <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/2] RFC: x86/mm: conditionally check
 page_lock/page_unlock ownership
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
Message-ID: <20190412135517.TSiSpvy9atZuv3MPa4iScPpBrBS7bxv2q7bG0nwVdWg@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgNjowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBQYXRjaCBjZjRiMzBkY2EwYSAiQWRkIGRlYnVnIGNvZGUgdG8g
ZGV0ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRfcGFnZV90eXBlCj4gPiBvcmRlcmluZyIg
YWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNraW5nIHRvIHBhZ2VfbG9jay9wYWdlX3VubG9jayBmb3Ig
ZGVidWcgYnVpbGRzCj4gPiB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBw
YXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2VzIGF0IG9uY2UuCj4gPgo+ID4gVGhpcyBhc3N1bXB0aW9u
IGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5IHNoYXJpbmcuCj4KPiBBIGZ1bmRhbWVudGFsIHF1
ZXN0aW9uIGlzIC0gZG9lc24ndCBtZW0tc2hhcmluZyBhYnVzZSBwYWdlX2xvY2soKT8KPiBJJ3Zl
IG5ldmVyIHVuZGVyc3Rvb2Qgd2h5IGl0IHVzZXMgaXQsIGFuZCBiYWNrIHdoZW4gaXQgd2FzIGlu
dHJvZHVjZWQKPiB0aGUgZnVuY3Rpb24gY2xlYXJseSB3YXNuJ3QgbWVhbnQgdG8gYmUgdXNlZCBv
dXRzaWRlIG9mIFBWIG1lbW9yeQo+IG1hbmFnZW1lbnQgY29kZS4KCkkgaGF2ZSBsaW1pdGVkIHVu
ZGVyc3RhbmRpbmcgb2Ygd2hhdCB0aGUgbGltaXRhdGlvbnMgYXJlIG9mIHBhZ2VfbG9jawpidXQg
aGVyZSBpcyB0aGUgcmVhc29uaW5nIGZvciB0YWtpbmcgdGhlIGxvY2sgZm9yIHR3byBwYWdlcy4K
TWVtX3NoYXJpbmcgdGFrZXMgdGhlIHBhZ2VzIGl0IHdhbnRzIHRvIGJlIHNoYXJhYmxlIGFuZCBh
c3NpZ25zIHRoZW0KdG8gZG9tX2NvdyBhdCBsZWFzdCB3aXRoIG9uZSByZWZlcmVuY2UgYmVpbmcg
aGVsZCAoc2luY2Ugd2UganVzdCB0b29rCnRoZXNlIHBhZ2VzIGZyb20gYSBsaXZlIGRvbWFpbiku
IFRob3NlIHBhZ2VzIG1heSB0aGVuIGJlIGFzc2lnbmVkIHRvCnNldmVyYWwgYWN0dWFsIGRvbWFp
bnMgYXQgdGhlIHNhbWUgdGltZSwgYW5kIGVhY2ggZG9tYWluIGNvdWxkIGJlCmRlc3Ryb3llZCBh
dCBhbnkgZ2l2ZW4gcG9pbnQuIFRoZXJlIGlzIG5vIHJlcXVpcmVtZW50IHRoYXQgdGhlCm9yaWdp
bmFsIGRvbWFpbiBzdGlsbCBiZSBhbGl2ZSBzaW5jZSB0aGUgb3duZXIgb2YgdGhlc2UgcGFnZXMg
aXMgbm93CmRvbV9jb3cuIFRoZSBiYWNraW5nIHBhZ2VzIG93bmVkIGJ5IGRvbV9jb3cgb25seSBn
ZXQgZHJvcHBlZCB3aGVuIHRoZQpyZWZlcmVuY2UgY291bnQgaGl0cyB6ZXJvLCBpZS4gbm8gYWN0
dWFsIGRvbWFpbiBhY3R1YWxseSB1c2VzIHRob3NlCnBhZ2VzIGFueW1vcmUuIFRoaXMgY291bGQg
aGFwcGVuIGlmIGFsbCBkb21haW5zIHVuc2hhcmUgdGhlIGdmbidzIHRoYXQKdXNlIHRoaXMgcGFn
ZSBhcyB0aGUgYmFja2luZyBvciBpZiBhbGwgZG9tYWlucyB0aGF0IHVzZSB0aGVtIGZvcgptZW1f
c2hhcmluZyBnZXQgZGVzdHJveWVkLiBXaGVuIHdlIHNoYXJlIHBhZ2VzLCB3ZSB3YW50IHRvIG1h
a2Ugc3VyZQp0aG9zZSBkb24ndCBnZXQgZHJvcHBlZCB1bmRlciBvdXIgZmVldCB3aGlsZSB3ZSBh
cmUgaW4gdGhlIG1pZGRsZSBvZgp0aGlzIGZ1bmN0aW9uLiBTbyB3ZSBsb2NrIGJvdGggcGFnZXMu
CgpBbHNvLCBJIGRvbid0IHNlZSB3aHkgaXQgd291bGQgYmUgZnVuZGFtZW50YWxseSB3cm9uZyB0
byBob2xkIHRoZQpsb2NrcyB0byB0d28gcGFnZXMgYXQgb25jZS4gSXMgdGhpcyBhIHByb2JsZW0g
d2l0aCB0aGUgbG9jawppbXBsZW1lbnRhdGlvbiBpdHNlbGY/Cgo+Cj4gT25lIG1pbmltYWwgcmVt
YXJrIG9uIHRoZSBwYXRjaCBpdHNlbGY6IFBsZWFzZSB1c2UgdHJ1ZS9mYWxzZSBpbnN0ZWFkCj4g
b2YgMS8wIHdoZW4gcGFzc2luZyBib29sIGFyZ3VtZW50cy4KCkFjay4KClRoYW5rcywKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
