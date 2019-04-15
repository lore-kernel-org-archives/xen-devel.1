Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFFAC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:52:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8911020848
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="mZADTN6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8911020848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG5lv-0005y4-K5; Mon, 15 Apr 2019 17:51:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1d2=SR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hG5lu-0005xz-KW
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 17:51:58 +0000
X-Inumbo-ID: 28365965-5fa7-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 28365965-5fa7-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 17:51:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555350715; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=Owrw4YaVlBTq7i4rI16EAR2S7YkkDifwNgQhv7Phzc8=;
 b=mZADTN6BtjDM+daEaKXpKmQIqdUu/4XnCpv4DexuCQJnwsOt3q1NZeoTh76ljy596dZBnd/N
 WF8UmmcWvzqBj5Ksp9tz6vpUtv1yaH7o1OoFCIqlXfCDarn4SdNYV8ePTsVEi3mgBCtzOazC
 94v38hHF5AjavujXRzbScANQPTc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mxa.mailgun.org with ESMTP id 5cb4c4b6.7fdc9b0965f0-smtp-out-n01;
 Mon, 15 Apr 2019 17:51:50 -0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w10so23139522wrm.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 10:51:50 -0700 (PDT)
X-Gm-Message-State: APjAAAW1qZe7IRYkYbePLDd/rJMDtQRlgTWn8CkKiWEUcVaGJgKdgQTa
 tySPUe6sbO1B0kox4oWGglwNWR79BOKTcv6tp5o=
X-Google-Smtp-Source: APXvYqwekdhXvE4IiDToyOavhh0lovowSLXhM9NVTh/gjabOL/TwHzmXWGXCyJ2r8DuQOBMtPr96LEGbUdYFrzIvML4=
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr24233120wrv.131.1555350709392; 
 Mon, 15 Apr 2019 10:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
In-Reply-To: <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Apr 2019 11:51:12 -0600
X-Gmail-Original-Message-ID: <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
Message-ID:
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415175112.ztgd4r46xmam0L4zKgFOXPz-EXbmuHSn_2YqcMqIJxA@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMTE6MjggQU0gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+Cj4KPiA+IE9uIEFwciAxNSwgMjAxOSwgYXQgNDoz
MSBQTSwgVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIEFwciAxNSwgMjAxOSBhdCA5OjIxIEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiA0LzEyLzE5IDg6NDcgUE0sIFRh
bWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4gUGF0Y2ggMDUwMmUwYWRhZTIgIng4NjogY29ycmVj
dCBpbnN0YW5jZXMgb2YgUEdDX2FsbG9jYXRlZCBjbGVhcmluZyIgaW50cm9kdWNlZAo+ID4+PiBn
cmFiYmluZyBleHRyYSByZWZlcmVuY2VzIGZvciBwYWdlcyB0aGF0IGRyb3AgcmVmZXJlbmNlcyB0
aWVkIHRvIFBHQ19hbGxvY2F0ZWQuCj4gPj4+IEhvd2V2ZXIsIHRoZSB3YXkgdGhlc2UgZXh0cmEg
cmVmZXJlbmNlcyB3ZXJlIGdyYWJiZWQgd2VyZSBpbmNvcnJlY3QsIHJlc3VsdGluZwo+ID4+PiBp
biBib3RoIHNoYXJlX3BhZ2VzIGFuZCB1bnNoYXJlX3BhZ2VzIGZhaWxpbmcuCj4gPj4KPiA+PiBX
aHk/ICBJcyBjZCBub3QgdGhlIG93bmVyIG9mIHRoZSBwYWdlPwo+ID4KPiA+IEl0J3Mgbm90LCBk
b21fY293IGlzLgo+ID4KPiA+Pj4gQEAgLTEwMDIsNyArOTk0LDEwIEBAIHN0YXRpYyBpbnQgc2hh
cmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwK
PiA+Pj4gICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gPj4+ICAgICBpZih0ZXN0X2Fu
ZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4gPj4+ICAg
ICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwo+ID4+PiAtICAgIHB1dF9wYWdlKGNwYWdlKTsKPiA+Pj4g
Kwo+ID4+PiArICAgIEFTU0VSVChwdXRfY291bnQpOwo+ID4+PiArICAgIHdoaWxlICggcHV0X2Nv
dW50LS0gKQo+ID4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4gPj4KPiA+
PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgaW4gdGhlIHNwaXJpdCBvZiB0aGUgZml4IGluIDA1MDJl
MGFkYWUyOyB0aGUgaWRlYQo+ID4+IHRoZXJlIHNlZW1zIHRvIGhhdmUgYmVlbiB0byBtYWtlIHN1
cmUgdGhhdCBjcGFnZSBiZWxvbmdzIHRvIHRoZSByaWdodAo+ID4+IGRvbWFpbiwgYW5kIHRoYXQg
dGhlIG93bmVyc2hpcCBkb2Vzbid0IGNoYW5nZS4gIElmIHN1Y2ggYSByYWNlIC8gbWlzdGFrZQo+
ID4+IHdlcmUgcG9zc2libGUgYmVmb3JlIHRoYXQgY2hhbmdlLCBzdWNoIGEgcmFjZSAvIG1pc3Rh
a2Ugd291bGQgYmUKPiA+PiBwb3NzaWJsZSBhZnRlciB0aGlzIGNoYW5nZSwgd291bGRuJ3QgaXQ/
Cj4gPgo+ID4gSSBkb24ndCBoYXZlIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLiBBRkFJVSB0
aGlzIGlzIGp1c3QgdG8gZW5zdXJlCj4gPiB0aGF0IHRoZSBwYWdlIGlzbid0IGRyb3BwZWQgYmVm
b3JlIHRlc3RfYW5kX2NsZWFyX2JpdCBpcyB1c2VkIG9uIHRoZQo+ID4gcGFnZS4KPgo+IFJpZ2h0
LCBidXQgd2h5IHdvdWxkIHRoYXQgYmUgYSBiYWQgdGhpbmc/Cj4KPiBJIHRoaW5rIGl04oCZcyB0
byBhdm9pZCByYWNlcyBsaWtlIHRoaXM6Cj4KPiBQMTogR2V0cyBwb2ludGVyIHRvIHBhZ2UgQSwg
b3duZWQgYnkgZG9tYWluIE0KPiBQMjogR2V0cyBwb2ludGVyIHRvIHBhZ2UgQSwgb3duZWQgYnkg
ZG9tYWluIE0KPiBQMjogdGVzdF9hbmRfY2xlYXJfYml0KFBHQ19hbGxvY2F0ZWQpIHN1Y2NlZWRz
Cj4gUDI6IHB1dF9wYWdlKCkKPiAgIC0+IHBhZ2UgZnJlZWQKPiAgIC0+IFBhZ2UgcmUtYWxsb2Nh
dGVkIHRvIGRvbWFpbiBOCj4gUDE6IHRlc3RfYW5kX2NsZWFyX2JpdChQR0NfYWxsb2NhdGVkKSBz
dWNjZWVkcwo+IFAxOiBwdXRfcGFnZSgpCj4gICAtPiBwYWdlIGZyZWVkICMjCj4KPiBOb3cgUDEg
aW5jb3JyZWN0bHkg4oCcZnJlZXPigJ0gYSBwYWdlIG93bmVkIGJ5IGRvbWFpbiBOLgo+Cj4gSWYg
Ym90aCBQMSBhbmQgUDIgY2FsbCBnZXRfcGFnZShBLCBNKSBmaXJzdCwgYW5kIGRyb3AgdGhhdCBy
ZWZlcmVuY2UgYWZ0ZXJ3YXJkcywgdGhpcyByYWNlIGNhbuKAmXQgaGFwcGVuLgo+Cj4gSmFuLCB5
b3XigJlyZSB0aGUgYXV0aG9yIG9mIHRoYXQgcGF0Y2gg4oCUIGlzIHRoYXQgbm90IHRoZSBjYXNl
Pwo+Cj4gQ291bGQgYSBzaW1pbGFyIHJhY2UgdG8gdGhlIGFib3ZlIG9jY3VyIGluIHRoaXMgY29k
ZT8gIEl0IGxvb2tzIGxpa2UgaXQgY291bGQgaGF2ZSBiZWZvcmUgMDUwMmUwYWRhZTIgZm9yIHN1
cmUsIHNpbmNlIGFsbCByZWZlcmVuY2VzIGFuZCBsb2NrcyB3ZXJlIGRyb3BwZWQuICBJdOKAmXMg
bm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgbWVtX3NoYXJpbmdfcGFnZV9sb2NrKCkgd2lsbCBwcm90
ZWN0IGFnYWluc3Qgb3duZXJzaGlwIGNoYW5nZXMuCj4KPiAqSWYqIHRoYXQgYXNzZXJ0aW9uIHlv
dSBhZGRlZCBpcyBhbHdheXMgdHJ1ZSwgdGhhdCB0aGVyZSBpcyBhbHdheXMgYXQgbGVhc3Qgb25l
IHJlZmVyZW5jZSBpbiB0aGUgcm1hcCB0aGF0IHdpbGwgYmUgaGVsZDsgKmFuZCogdGhvc2UgcmVm
ZXJlbmNlcyBhcmUgYWx3YXlzIOKAnGhlbGTigJ0gb24gYmVoYWxmIG9mIGRvbV9jb3csIHRoZW4g
SSB0aGluayB5b3VyIHZlcnNpb24gd2lsbCBwcm9iYWJseSBiZSBzYWZlIChhcyB0aGUgcmVmZXJl
bmNlIGluIHRoZSBybWFwIHdpbGwgcHJldmVudCBpdCBmcm9tIGNoYW5naW5nIG93bmVyc2hpcCB1
bnRpbCB0aGUgZmluYWwgcHV0X3BhZ2VfYW5kX3R5cGUoKSkuICBCdXQgaWYgIzIgZXZlciBmYWxz
ZSBmb3IgYW55IHJlYXNvbiAoZXZlbiBkdWUgdG8gYSBidWcgaW4gWGVuKSwgdGhlbiB0aGlzIHdp
bGwgb3BlbiB1cCBhIHBvdGVudGlhbCBzZWN1cml0eSBpc3N1ZSAoc2luY2UgQVNTRVJUKClzIGRv
buKAmXQgdHJpZ2dlciBpbiBwcm9kdWN0aW9uIGNvZGUpLgo+Cj4gQSBjb3VwbGUgb2Ygb3B0aW9u
czoKPiAqIE1ha2UgaXQgYSBCVUdfT04oKTsgdGhhdCB3b3VsZCBjaGFuZ2UgYSBwb3RlbnRpYWwg
cHJpdmlsZWdlIGVzY2FsYXRpb24gaW50byBhIERvUwoKSSdtIGZpbmUgd2l0aCBjaGFuZ2luZyB0
aGF0IEFTU0VSVCBpbnRvIGEgQlVHX09OLgoKPiAqIE9ubHkgY2xlYXIgUEdDX2FsbG9jYXRlZCBp
ZiBwdXRfY291bnQgPiAwLiAgVGhpcyBjaGFuZ2VzIGEgcG90ZW50aWFsIHByaXZpbGVnZSBlc2Nh
bGF0aW9uIGludG8gYSBzbG93IG1lbW9yeSBsZWFrCj4gKiBJZiBwdXRfY291bnQgPT0gMCwgZ3Jh
YiBhbiBleHRyYSByZWZlcmVuY2UgYW5kIGRyb3AgaXQgYWZ0ZXJ3YXJkcyAod2l0aCBhbiBBU1NF
UlRfVU5SRUFDSEFCTEUoKSB0byBoZWxwIGNhdGNoIGVycm9ycyBlYXJseSkuICBUaGlzIGF2b2lk
cyBhbnkgWFNBLCBidXQgbWFrZXMgdGhlIGNvZGUgYSBiaXQgdWdsaWVyLgo+ICogTGVhdmUgdGhl
IGNvZGUgYXMgaXQgaXM7IGp1c3QgY2hhbmdlIHRoZSBnZXRfcGFnZSgpIHRvIGdyYWJiaW5nIGRv
bV9jb3cgcmF0aGVyIHRoYW4gY2QuICBUaGlzIGF2b2lkcyBhbnkgWFNBLCBidXQgYWRkcyBhbiBl
eHRyYSBnZXQgLyBwdXQgcGFnZSB3aGljaCB3aWxsIGJlIHB1cmUgb3ZlcmhlYWQgaW4gdGhlIGNv
bW1vbiBjYXNlLgoKU2ltcGx5IGNoYW5naW5nIHRvIGdldF9wYWdlIHdpdGggZG9tX2NvdyBpcyBu
b3QgZW5vdWdoLCBJIHJhbiBpbnRvCmlzc3VlcyB3aGVyZSB0aGUgc3lzdGVtIHN0aWxsIGRlYWRs
b2NrcyBkdWUgdG8gdGhlIG9yZGVyaW5nIG9mCnB1dF9wYWdlX2FuZF90eXBlIGJlaW5nIGNhbGxl
ZCBiZWZvcmUgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2suIFNvIHRoZQpvcmRlcmluZyBzdGlsbCBo
YXMgdG8gYmUgY2hhbmdlZC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
