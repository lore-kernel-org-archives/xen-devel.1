Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74196C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:49:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4175120693
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 15:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="wuUZITQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4175120693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEyPq-0001s6-Vm; Fri, 12 Apr 2019 15:48:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEyPp-0001s1-NY
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 15:48:33 +0000
X-Inumbo-ID: 6b7badd1-5d3a-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b7badd1-5d3a-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 15:48:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555084110; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=uD+hUIOvcJoZUSo92/JWi0XWIIXa1q1keqcMLee+chY=;
 b=wuUZITQ77axQwo3Orb6iO5aBM5wimesgzUGwLnc7jTaHdASnDnwWe/EMWd/BA5Nq5GSROh4h
 EgSEba4LXUesvzEHjEPLnhunKhbciDZWvztGsETTRybTD4xvzGru1BiAK7wnHB856xlUXiie
 Dd4bq+Exx2kbrM4dfJhXwRwX1Dk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5cb0b34d.7f461be781f0-smtp-out-n01;
 Fri, 12 Apr 2019 15:48:29 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v14so11598660wmf.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 08:48:28 -0700 (PDT)
X-Gm-Message-State: APjAAAUUawsDeACe2Y7cOx95KhBWXqjsxbbonbrNJ5qmFVdx7DozomEz
 Dk4O7nmnBZ6+DygxFViCkuC7HgmH1YtnOaakS9E=
X-Google-Smtp-Source: APXvYqz6E0Tr8ddfJt+J6bBFV5Bk6Y+y7hTRCLPjobDJWwC0ZWl7pXlGxrLvlVEo75nxP2YCIJ95TIDG8RX1xQkTm/c=
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr11398564wmd.84.1555084108158; 
 Fri, 12 Apr 2019 08:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
 <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
 <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
 <5CB0A3380200007800226ED5@prv1-mh.provo.novell.com>
 <CABfawhmSZjUcFtv_8PjapZ1ZGcPaKXC53MNJ4TgZLXkVriYMbQ@mail.gmail.com>
 <5CB0AFE80200007800226F1E@prv1-mh.provo.novell.com>
In-Reply-To: <5CB0AFE80200007800226F1E@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 12 Apr 2019 09:47:52 -0600
X-Gmail-Original-Message-ID: <CABfawhkUL62f5-V-Rog4CyhCKN5ynh=vePp9JRAF0fKKyfg=EA@mail.gmail.com>
Message-ID:
 <CABfawhkUL62f5-V-Rog4CyhCKN5ynh=vePp9JRAF0fKKyfg=EA@mail.gmail.com>
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
Message-ID: <20190412154752.KFWPf32ISWncA2SO-piPbOPdCiZ2h4yB9P8S53pZMOg@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgOTozNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEyLjA0LjE5IGF0IDE3OjAyLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAxMiwgMjAxOSBhdCA4OjM5IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gPj4+IE9uIDEyLjA0LjE5IGF0
IDE1OjU1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4gPiBPbiBGcmksIEFwciAx
MiwgMjAxOSBhdCA2OjAxIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4gPj4gPj4gPj4+IE9uIDEyLjA0LjE5IGF0IDA2OjI5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4g
d3JvdGU6Cj4gPj4gPj4gPiBQYXRjaCBjZjRiMzBkY2EwYSAiQWRkIGRlYnVnIGNvZGUgdG8gZGV0
ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRfcGFnZV90eXBlCj4gPj4gPj4gPiBvcmRlcmlu
ZyIgYWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNraW5nIHRvIHBhZ2VfbG9jay9wYWdlX3VubG9jayBm
b3IgZGVidWcgYnVpbGRzCj4gPj4gPj4gPiB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlw
ZXJ2aXNvciBwYXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2VzIGF0IG9uY2UuCj4gPj4gPj4gPgo+ID4+
ID4+ID4gVGhpcyBhc3N1bXB0aW9uIGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5IHNoYXJpbmcu
Cj4gPj4gPj4KPiA+PiA+PiBBIGZ1bmRhbWVudGFsIHF1ZXN0aW9uIGlzIC0gZG9lc24ndCBtZW0t
c2hhcmluZyBhYnVzZSBwYWdlX2xvY2soKT8KPiA+PiA+PiBJJ3ZlIG5ldmVyIHVuZGVyc3Rvb2Qg
d2h5IGl0IHVzZXMgaXQsIGFuZCBiYWNrIHdoZW4gaXQgd2FzIGludHJvZHVjZWQKPiA+PiA+PiB0
aGUgZnVuY3Rpb24gY2xlYXJseSB3YXNuJ3QgbWVhbnQgdG8gYmUgdXNlZCBvdXRzaWRlIG9mIFBW
IG1lbW9yeQo+ID4+ID4+IG1hbmFnZW1lbnQgY29kZS4KPiA+PiA+Cj4gPj4gPiBJIGhhdmUgbGlt
aXRlZCB1bmRlcnN0YW5kaW5nIG9mIHdoYXQgdGhlIGxpbWl0YXRpb25zIGFyZSBvZiBwYWdlX2xv
Y2sKPiA+PiA+IGJ1dCBoZXJlIGlzIHRoZSByZWFzb25pbmcgZm9yIHRha2luZyB0aGUgbG9jayBm
b3IgdHdvIHBhZ2VzLgo+ID4+ID4gTWVtX3NoYXJpbmcgdGFrZXMgdGhlIHBhZ2VzIGl0IHdhbnRz
IHRvIGJlIHNoYXJhYmxlIGFuZCBhc3NpZ25zIHRoZW0KPiA+PiA+IHRvIGRvbV9jb3cgYXQgbGVh
c3Qgd2l0aCBvbmUgcmVmZXJlbmNlIGJlaW5nIGhlbGQgKHNpbmNlIHdlIGp1c3QgdG9vawo+ID4+
ID4gdGhlc2UgcGFnZXMgZnJvbSBhIGxpdmUgZG9tYWluKS4gVGhvc2UgcGFnZXMgbWF5IHRoZW4g
YmUgYXNzaWduZWQgdG8KPiA+PiA+IHNldmVyYWwgYWN0dWFsIGRvbWFpbnMgYXQgdGhlIHNhbWUg
dGltZSwgYW5kIGVhY2ggZG9tYWluIGNvdWxkIGJlCj4gPj4gPiBkZXN0cm95ZWQgYXQgYW55IGdp
dmVuIHBvaW50LiBUaGVyZSBpcyBubyByZXF1aXJlbWVudCB0aGF0IHRoZQo+ID4+ID4gb3JpZ2lu
YWwgZG9tYWluIHN0aWxsIGJlIGFsaXZlIHNpbmNlIHRoZSBvd25lciBvZiB0aGVzZSBwYWdlcyBp
cyBub3cKPiA+PiA+IGRvbV9jb3cuIFRoZSBiYWNraW5nIHBhZ2VzIG93bmVkIGJ5IGRvbV9jb3cg
b25seSBnZXQgZHJvcHBlZCB3aGVuIHRoZQo+ID4+ID4gcmVmZXJlbmNlIGNvdW50IGhpdHMgemVy
bywgaWUuIG5vIGFjdHVhbCBkb21haW4gYWN0dWFsbHkgdXNlcyB0aG9zZQo+ID4+ID4gcGFnZXMg
YW55bW9yZS4gVGhpcyBjb3VsZCBoYXBwZW4gaWYgYWxsIGRvbWFpbnMgdW5zaGFyZSB0aGUgZ2Zu
J3MgdGhhdAo+ID4+ID4gdXNlIHRoaXMgcGFnZSBhcyB0aGUgYmFja2luZyBvciBpZiBhbGwgZG9t
YWlucyB0aGF0IHVzZSB0aGVtIGZvcgo+ID4+ID4gbWVtX3NoYXJpbmcgZ2V0IGRlc3Ryb3llZC4g
V2hlbiB3ZSBzaGFyZSBwYWdlcywgd2Ugd2FudCB0byBtYWtlIHN1cmUKPiA+PiA+IHRob3NlIGRv
bid0IGdldCBkcm9wcGVkIHVuZGVyIG91ciBmZWV0IHdoaWxlIHdlIGFyZSBpbiB0aGUgbWlkZGxl
IG9mCj4gPj4gPiB0aGlzIGZ1bmN0aW9uLiBTbyB3ZSBsb2NrIGJvdGggcGFnZXMuCj4gPj4KPiA+
PiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgYnV0IEknbSBhZnJhaWQgdGhpcyBkb2Vzbid0
IGFkZHJlc3MKPiA+PiBteSByZW1hcms6IFlvdSBuZWVkIF9zb21lXyBraW5kIG9mIGxvY2sgZm9y
IHRoaXMsIGJ1dCBJIHdhcwo+ID4+IHF1ZXN0aW9uaW5nIHdoZXRoZXIgdXNpbmcgcGFnZV9sb2Nr
KCkgaXMgdGhlIHJpZ2h0IGNob2ljZS4gRnJvbQo+ID4+IHdoYXQgeW91IHNheSwgb2J0YWluaW5n
IHByb3BlciByZWZlcmVuY2VzIHRvIHRoZSBwYWdlIHdvdWxkCj4gPj4gc2VlbSB3aGF0IHlvdSBh
Y3R1YWxseSB3YW50IHRvIGF2b2lkIHRoZW0gZGlzYXBwZWFyaW5nCj4gPj4gYmVoaW5kIHlvdXIg
YmFjay4KPiA+Cj4gPiBZZXMsIGJ1dCBiZXNpZGUgdGhlIHJlZmVyZW5jZXMgZW5zdXJpbmcgdGhl
IHBhZ2VzIGRvbid0IGdldCBkcm9wcGVkCj4gPiB0aGVyZSBpcyBhbHNvIGEgYnVuY2ggb2YgYm9v
ay1rZWVwaW5nIG9wZXJhdGlvbnMgaW4gbWVtX3NoYXJpbmcgKHRoZQo+ID4gcm1hcCBiaXRzKSB0
aGF0IGFsc28gbG9vayBsaWtlIHRoZXkgbmVlZCB0aGUgbG9ja2luZyB0byBlbnN1cmUgbm8KPiA+
IGNvbmN1cnJlbnQgdXBkYXRlcyBoYXBwZW4gZm9yIHRoZSBzYW1lIHBhZ2UuIEkgZ3Vlc3Mgd2Ug
Y291bGQKPiA+IGludHJvZHVjZSBhIG5ldyBsb2NrIGJ1dCBpdCB3b3VsZCBhbHNvIG5lZWQgdG8g
YmUgcGVyLXBhZ2UsIHNvIHRvIG1lCj4gPiBpdCBsb29rcyBsaWtlIGl0IHdvdWxkIGp1c3QgZHVw
bGljYXRlIHdoYXQgcGFnZV9sb2NrIGRvZXMgYWxyZWFkeS4KPgo+IEhtbSwgSSBndWVzcyBJIGNh
bid0IGZ1cnRoZXIgY29tbWVudCBvbiB0aGlzLCBhcyBJIGtub3cgbm90aGluZwo+IGFib3V0IGhv
dyBtZW0tc2hhcmluZyB3b3JrcywgYW5kIGhlbmNlIHdoeSBzdWNoIHBlci1wYWdlCj4gbG9ja2lu
ZyB3b3VsZCBiZSBuZWVkZWQgaW4gdGhlIGZpcnN0IHBsYWNlLiBTaW5jZSB5b3UgaGF2ZSBhCj4g
c3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvICogaGFuZ2luZyBvZmYgb2Ygc3RydWN0IHBhZ2VfaW5m
bywKPiBwZXJoYXBzIHRoYXQncyB3aGVyZSBzdWNoIGEgbG9jayB3b3VsZCBiZWxvbmc/CgpZZWEs
IEkgd2FzIGxvb2tpbmcgYXQgdGhhdCB0b28uIENlcnRhaW5seSB3b3VsZCBtYWtlIHNlbnNlIHRv
IG1lLiBJJ2xsCnRyeSBnbyB0aGF0IHJvdXRlIGluc3RlYWQuCgo+ID4+IHBhZ2VfbG9jaygpIGlz
IHVzZWQgb24gUFYgcGFnZSB0YWJsZSBwYWdlcyB0byBleGNsdWRlIG11bHRpcGxlCj4gPj4gdXBk
YXRlcyB0byB0aGUgc2FtZSBwYWdlIHRhYmxlIGhhcHBlbmluZyBhdCB0aGUgc2FtZSB0aW1lLgo+
ID4+IEluIGEgIVBWIGJ1aWxkIGl0IHNob3VsZG4ndCBldmVuIGJlIGF2YWlsYWJsZS4KPiA+Cj4g
PiBJIGRvbid0IHNlZSBwYWdlX2xvY2sgYmVpbmcgZW5jYXBzdWxhdGVkIGJ5IENPTkZJR19QViBi
bG9ja3Mgc28gdGhhdAo+ID4gc2hvdWxkIGJlIGZpbmUuCj4KPiBXZWxsLCBpdCBjYW4ndCBiZSBi
ZWNhdXNlIG9mIGl0cyB1c2UgYnkgbWVtLXNoYXJpbmcsIG9yIGVsc2UKPiB3ZSdkIGJyZWFrIHRo
ZSBidWlsZC4KCk9LIDopCgo+ID4+ID4gQWxzbywgSSBkb24ndCBzZWUgd2h5IGl0IHdvdWxkIGJl
IGZ1bmRhbWVudGFsbHkgd3JvbmcgdG8gaG9sZCB0aGUKPiA+PiA+IGxvY2tzIHRvIHR3byBwYWdl
cyBhdCBvbmNlLiBJcyB0aGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBsb2NrCj4gPj4gPiBpbXBsZW1l
bnRhdGlvbiBpdHNlbGY/Cj4gPj4KPiA+PiBObywgdGhlIGltcGxlbWVudGF0aW9uIGl0c2VsZiBz
aG91bGQgYmUgZmluZSAoYnV0IEkgYWxzbyBkaWRuJ3Qgc2F5Cj4gPj4gdGhlcmUncyBhIHByb2Js
ZW0gbG9ja2luZyB0d28gcGFnZXMpLiBMb2NrIG9yZGVyIG1pZ2h0IGJlIGFuIGlzc3VlLAo+ID4+
IGJ1dCBzZWVtIHRvIGJlIGRlYWxpbmcgd2l0aCB0aGF0IGZpbmUgKGNvbnNpZGVyaW5nIG1lbV9z
aGFyaW5nLmMKPiA+PiBhbG9uZSkuCj4gPgo+ID4gQ291bGQgeW91IGV4cGFuZCBvbiB0aGUgbG9j
ayBvcmRlcmluZyByZXF1aXJlbWVudD8gSSBub3RpY2VkCj4gPiBtZW1fc2hhcmluZyBhcXVpcmVz
IHRoZSBsb2NrcyB0byB0aGUgcGFnZXMgaW4gaW5jcmVhc2luZyBtZm4gb3JkZXIgYW5kCj4gPiB0
cmllZCB0byBkZWNpcGhlciB3aHkgdGhhdCBpcyBkb25lIGJ1dCBJIGNvdWxkbid0IHJlYWxseSBt
YWtlIGhlYWRzIG9yCj4gPiB0YWlscy4KPgo+IEFzIGFsd2F5cyB3aXRoIG11bHRpcGxlIGxvY2tz
LCB0aGV5IG5lZWQgdG8gYmUgYWNxdWlyZWQgaW4gdGhlCj4gc2FtZSBvcmRlciBieSBhbGwgcGFy
dGllcy4gV2hlbiBubyBoaWVyYXJjaHkgZ2V0cyBlc3RhYmxpc2hlZAo+IGJ5IGNvZGUgc3RydWN0
dXJlLCBjb25zaXN0ZW50IG9yZGVyaW5nIG5lZWRzIHRvIGJlIGVuZm9yY2VkCj4gYnkgb3RoZXIg
bWVhbnMsIGxpa2UgY29tcGFyaW5nIE1GTnMgaW4gdGhlIGNhc2UgaGVyZS4gWW91J2xsCj4gZmlu
ZCBzb21ldGhpbmcgc2ltaWxhciBpbiBncmFudCB0YWJsZSBjb2RlLCBmb3IgZXhhbXBsZS4KCk1h
a2VzIHNlbnNlLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
