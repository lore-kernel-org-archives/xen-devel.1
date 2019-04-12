Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88718C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:03:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578DE2083E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="Bc8kt/zd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 578DE2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hExiA-0006tJ-5W; Fri, 12 Apr 2019 15:03:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hExi8-0006tD-Tl
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 15:03:24 +0000
X-Inumbo-ID: 1dec7ef3-5d34-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1dec7ef3-5d34-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 15:03:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555081403; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=8d/OiOS0o0J4Ax85ws7f3g6L8SX+Gq4zBZtiCGfO7zc=;
 b=Bc8kt/zds55hapbEoaOK8B3exfQjEosrYq5iJ5v5l4vlvWPyiLxQwFSwKijAIZvvE68Ky1DG
 cxVuy87gI9HmoGyrmatfhpWDCEfKjkPLBCNN07uVJyOa7WruHk0KgP+8oWugaUkrI1xAwOgZ
 FoZv/hcJ1jdN8yOzloxJ3yZkWR4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5cb0a89c.7f852c21a0b0-smtp-out-n02;
 Fri, 12 Apr 2019 15:02:52 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w10so12398038wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 08:02:52 -0700 (PDT)
X-Gm-Message-State: APjAAAVS1H4bHdDO5xStJXvy2BHdaY3jaE+PkiurwYgXAlUD75SuZzf5
 b1t85SwjQqD9yWmfheGKAtN5LMSCaB79P3yq76s=
X-Google-Smtp-Source: APXvYqwcKlX16wYWqYYueRfNEJK+/3PvNH2V0Va48hxIm7vI1ZBgf1k23c4ROgeVQ0GZYEOYxZedensvxKrvAxBCVAQ=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr36289733wrp.37.1555081371125; 
 Fri, 12 Apr 2019 08:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
 <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
 <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
 <5CB0A3380200007800226ED5@prv1-mh.provo.novell.com>
In-Reply-To: <5CB0A3380200007800226ED5@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 09:02:14 -0600
X-Gmail-Original-Message-ID: <CABfawhmSZjUcFtv_8PjapZ1ZGcPaKXC53MNJ4TgZLXkVriYMbQ@mail.gmail.com>
Message-ID:
 <CABfawhmSZjUcFtv_8PjapZ1ZGcPaKXC53MNJ4TgZLXkVriYMbQ@mail.gmail.com>
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
Message-ID: <20190412150214.tmIEWen8gw7ldxn-CsroVU7I9oG112mzcSQPu31Huq4@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgODozOSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEyLjA0LjE5IGF0IDE1OjU1LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAxMiwgMjAxOSBhdCA2OjAxIEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gPj4+IE9uIDEyLjA0LjE5IGF0
IDA2OjI5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4gPiBQYXRjaCBjZjRiMzBk
Y2EwYSAiQWRkIGRlYnVnIGNvZGUgdG8gZGV0ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRf
cGFnZV90eXBlCj4gPj4gPiBvcmRlcmluZyIgYWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNraW5nIHRv
IHBhZ2VfbG9jay9wYWdlX3VubG9jayBmb3IgZGVidWcgYnVpbGRzCj4gPj4gPiB3aXRoIHRoZSBh
c3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBwYXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2VzIGF0
IG9uY2UuCj4gPj4gPgo+ID4+ID4gVGhpcyBhc3N1bXB0aW9uIGRvZXNuJ3QgaG9sZCBkdXJpbmcg
bWVtb3J5IHNoYXJpbmcuCj4gPj4KPiA+PiBBIGZ1bmRhbWVudGFsIHF1ZXN0aW9uIGlzIC0gZG9l
c24ndCBtZW0tc2hhcmluZyBhYnVzZSBwYWdlX2xvY2soKT8KPiA+PiBJJ3ZlIG5ldmVyIHVuZGVy
c3Rvb2Qgd2h5IGl0IHVzZXMgaXQsIGFuZCBiYWNrIHdoZW4gaXQgd2FzIGludHJvZHVjZWQKPiA+
PiB0aGUgZnVuY3Rpb24gY2xlYXJseSB3YXNuJ3QgbWVhbnQgdG8gYmUgdXNlZCBvdXRzaWRlIG9m
IFBWIG1lbW9yeQo+ID4+IG1hbmFnZW1lbnQgY29kZS4KPiA+Cj4gPiBJIGhhdmUgbGltaXRlZCB1
bmRlcnN0YW5kaW5nIG9mIHdoYXQgdGhlIGxpbWl0YXRpb25zIGFyZSBvZiBwYWdlX2xvY2sKPiA+
IGJ1dCBoZXJlIGlzIHRoZSByZWFzb25pbmcgZm9yIHRha2luZyB0aGUgbG9jayBmb3IgdHdvIHBh
Z2VzLgo+ID4gTWVtX3NoYXJpbmcgdGFrZXMgdGhlIHBhZ2VzIGl0IHdhbnRzIHRvIGJlIHNoYXJh
YmxlIGFuZCBhc3NpZ25zIHRoZW0KPiA+IHRvIGRvbV9jb3cgYXQgbGVhc3Qgd2l0aCBvbmUgcmVm
ZXJlbmNlIGJlaW5nIGhlbGQgKHNpbmNlIHdlIGp1c3QgdG9vawo+ID4gdGhlc2UgcGFnZXMgZnJv
bSBhIGxpdmUgZG9tYWluKS4gVGhvc2UgcGFnZXMgbWF5IHRoZW4gYmUgYXNzaWduZWQgdG8KPiA+
IHNldmVyYWwgYWN0dWFsIGRvbWFpbnMgYXQgdGhlIHNhbWUgdGltZSwgYW5kIGVhY2ggZG9tYWlu
IGNvdWxkIGJlCj4gPiBkZXN0cm95ZWQgYXQgYW55IGdpdmVuIHBvaW50LiBUaGVyZSBpcyBubyBy
ZXF1aXJlbWVudCB0aGF0IHRoZQo+ID4gb3JpZ2luYWwgZG9tYWluIHN0aWxsIGJlIGFsaXZlIHNp
bmNlIHRoZSBvd25lciBvZiB0aGVzZSBwYWdlcyBpcyBub3cKPiA+IGRvbV9jb3cuIFRoZSBiYWNr
aW5nIHBhZ2VzIG93bmVkIGJ5IGRvbV9jb3cgb25seSBnZXQgZHJvcHBlZCB3aGVuIHRoZQo+ID4g
cmVmZXJlbmNlIGNvdW50IGhpdHMgemVybywgaWUuIG5vIGFjdHVhbCBkb21haW4gYWN0dWFsbHkg
dXNlcyB0aG9zZQo+ID4gcGFnZXMgYW55bW9yZS4gVGhpcyBjb3VsZCBoYXBwZW4gaWYgYWxsIGRv
bWFpbnMgdW5zaGFyZSB0aGUgZ2ZuJ3MgdGhhdAo+ID4gdXNlIHRoaXMgcGFnZSBhcyB0aGUgYmFj
a2luZyBvciBpZiBhbGwgZG9tYWlucyB0aGF0IHVzZSB0aGVtIGZvcgo+ID4gbWVtX3NoYXJpbmcg
Z2V0IGRlc3Ryb3llZC4gV2hlbiB3ZSBzaGFyZSBwYWdlcywgd2Ugd2FudCB0byBtYWtlIHN1cmUK
PiA+IHRob3NlIGRvbid0IGdldCBkcm9wcGVkIHVuZGVyIG91ciBmZWV0IHdoaWxlIHdlIGFyZSBp
biB0aGUgbWlkZGxlIG9mCj4gPiB0aGlzIGZ1bmN0aW9uLiBTbyB3ZSBsb2NrIGJvdGggcGFnZXMu
Cj4KPiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgYnV0IEknbSBhZnJhaWQgdGhpcyBkb2Vz
bid0IGFkZHJlc3MKPiBteSByZW1hcms6IFlvdSBuZWVkIF9zb21lXyBraW5kIG9mIGxvY2sgZm9y
IHRoaXMsIGJ1dCBJIHdhcwo+IHF1ZXN0aW9uaW5nIHdoZXRoZXIgdXNpbmcgcGFnZV9sb2NrKCkg
aXMgdGhlIHJpZ2h0IGNob2ljZS4gRnJvbQo+IHdoYXQgeW91IHNheSwgb2J0YWluaW5nIHByb3Bl
ciByZWZlcmVuY2VzIHRvIHRoZSBwYWdlIHdvdWxkCj4gc2VlbSB3aGF0IHlvdSBhY3R1YWxseSB3
YW50IHRvIGF2b2lkIHRoZW0gZGlzYXBwZWFyaW5nCj4gYmVoaW5kIHlvdXIgYmFjay4KClllcywg
YnV0IGJlc2lkZSB0aGUgcmVmZXJlbmNlcyBlbnN1cmluZyB0aGUgcGFnZXMgZG9uJ3QgZ2V0IGRy
b3BwZWQKdGhlcmUgaXMgYWxzbyBhIGJ1bmNoIG9mIGJvb2sta2VlcGluZyBvcGVyYXRpb25zIGlu
IG1lbV9zaGFyaW5nICh0aGUKcm1hcCBiaXRzKSB0aGF0IGFsc28gbG9vayBsaWtlIHRoZXkgbmVl
ZCB0aGUgbG9ja2luZyB0byBlbnN1cmUgbm8KY29uY3VycmVudCB1cGRhdGVzIGhhcHBlbiBmb3Ig
dGhlIHNhbWUgcGFnZS4gSSBndWVzcyB3ZSBjb3VsZAppbnRyb2R1Y2UgYSBuZXcgbG9jayBidXQg
aXQgd291bGQgYWxzbyBuZWVkIHRvIGJlIHBlci1wYWdlLCBzbyB0byBtZQppdCBsb29rcyBsaWtl
IGl0IHdvdWxkIGp1c3QgZHVwbGljYXRlIHdoYXQgcGFnZV9sb2NrIGRvZXMgYWxyZWFkeS4KCj4g
cGFnZV9sb2NrKCkgaXMgdXNlZCBvbiBQViBwYWdlIHRhYmxlIHBhZ2VzIHRvIGV4Y2x1ZGUgbXVs
dGlwbGUKPiB1cGRhdGVzIHRvIHRoZSBzYW1lIHBhZ2UgdGFibGUgaGFwcGVuaW5nIGF0IHRoZSBz
YW1lIHRpbWUuCj4gSW4gYSAhUFYgYnVpbGQgaXQgc2hvdWxkbid0IGV2ZW4gYmUgYXZhaWxhYmxl
LgoKSSBkb24ndCBzZWUgcGFnZV9sb2NrIGJlaW5nIGVuY2Fwc3VsYXRlZCBieSBDT05GSUdfUFYg
YmxvY2tzIHNvIHRoYXQKc2hvdWxkIGJlIGZpbmUuCgo+ID4gQWxzbywgSSBkb24ndCBzZWUgd2h5
IGl0IHdvdWxkIGJlIGZ1bmRhbWVudGFsbHkgd3JvbmcgdG8gaG9sZCB0aGUKPiA+IGxvY2tzIHRv
IHR3byBwYWdlcyBhdCBvbmNlLiBJcyB0aGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBsb2NrCj4gPiBp
bXBsZW1lbnRhdGlvbiBpdHNlbGY/Cj4KPiBObywgdGhlIGltcGxlbWVudGF0aW9uIGl0c2VsZiBz
aG91bGQgYmUgZmluZSAoYnV0IEkgYWxzbyBkaWRuJ3Qgc2F5Cj4gdGhlcmUncyBhIHByb2JsZW0g
bG9ja2luZyB0d28gcGFnZXMpLiBMb2NrIG9yZGVyIG1pZ2h0IGJlIGFuIGlzc3VlLAo+IGJ1dCBz
ZWVtIHRvIGJlIGRlYWxpbmcgd2l0aCB0aGF0IGZpbmUgKGNvbnNpZGVyaW5nIG1lbV9zaGFyaW5n
LmMKPiBhbG9uZSkuCgpDb3VsZCB5b3UgZXhwYW5kIG9uIHRoZSBsb2NrIG9yZGVyaW5nIHJlcXVp
cmVtZW50PyBJIG5vdGljZWQKbWVtX3NoYXJpbmcgYXF1aXJlcyB0aGUgbG9ja3MgdG8gdGhlIHBh
Z2VzIGluIGluY3JlYXNpbmcgbWZuIG9yZGVyIGFuZAp0cmllZCB0byBkZWNpcGhlciB3aHkgdGhh
dCBpcyBkb25lIGJ1dCBJIGNvdWxkbid0IHJlYWxseSBtYWtlIGhlYWRzIG9yCnRhaWxzLgoKVGhh
bmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
