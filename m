Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCEFC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 22:32:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8A3C20717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 22:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8pQ7ZRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8A3C20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJmuN-0003DY-1F; Thu, 25 Apr 2019 22:31:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xa9b=S3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hJmuL-0003DT-FT
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 22:31:57 +0000
X-Inumbo-ID: ee5a29cd-67a9-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee5a29cd-67a9-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 22:31:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C37620717;
 Thu, 25 Apr 2019 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556231515;
 bh=75ED5/aMMjHZxCWoF4s0PnRPrZUv7QvrMw8PH0MgvE0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=j8pQ7ZRQ+j+n2d+nldSWhkGhtqj8u2Ds09g92UevHWGMPdgknJQ2jVdDFjw8LUWh5
 qBSVgqI7adaqMx5DVk1H3fedfJn4MXA3u0A5II1o5fLNpr/SkFsAVMHZ8DKsIgqmtA
 rSF/YjrdItG7bFJSPJGfeFBxON5zrUEFsXHkC3aE=
Date: Thu, 25 Apr 2019 15:31:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CC18ED10200007800228FAD@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1904251523070.24598@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
 <5CC18ED10200007800228FAD@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425223154.rUulS8TtG9Z2_deouCK77VypSiZdVp7rc1EIbnYmO3k@z>

T24gVGh1LCAyNSBBcHIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDE3LjA0LjE5
IGF0IDIzOjEyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBXZWQsIDI3
IEZlYiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjcuMDIuMTkgYXQgMDA6
MDcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9kb21jdGwuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oCj4gPj4gPiBAQCAtNTcxLDEyICs1NzEsMTQgQEAgc3RydWN0IHhlbl9kb21jdGxfYmluZF9w
dF9pcnEgewo+ID4+ID4gICovCj4gPj4gPiAgI2RlZmluZSBEUENJX0FERF9NQVBQSU5HICAgICAg
ICAgMQo+ID4+ID4gICNkZWZpbmUgRFBDSV9SRU1PVkVfTUFQUElORyAgICAgIDAKPiA+PiA+ICsj
ZGVmaW5lIENBQ0hFQUJJTElUWV9ERVZNRU0gICAgICAwIC8qIGRldmljZSBtZW1vcnksIHRoZSBk
ZWZhdWx0ICovCj4gPj4gPiArI2RlZmluZSBDQUNIRUFCSUxJVFlfTUVNT1JZICAgICAgMSAvKiBu
b3JtYWwgbWVtb3J5ICovCj4gPj4gPiAgc3RydWN0IHhlbl9kb21jdGxfbWVtb3J5X21hcHBpbmcg
ewo+ID4+ID4gICAgICB1aW50NjRfYWxpZ25lZF90IGZpcnN0X2dmbjsgLyogZmlyc3QgcGFnZSAo
aHZtIGd1ZXN0IHBoeXMgcGFnZSkgaW4gCj4gPiByYW5nZSAqLwo+ID4+ID4gICAgICB1aW50NjRf
YWxpZ25lZF90IGZpcnN0X21mbjsgLyogZmlyc3QgcGFnZSAobWFjaGluZSBwYWdlKSBpbiByYW5n
ZSAqLwo+ID4+ID4gICAgICB1aW50NjRfYWxpZ25lZF90IG5yX21mbnM7ICAgLyogbnVtYmVyIG9m
IHBhZ2VzIGluIHJhbmdlICg+MCkgKi8KPiA+PiA+ICAgICAgdWludDMyX3QgYWRkX21hcHBpbmc7
ICAgICAgIC8qIGFkZCBvciByZW1vdmUgbWFwcGluZyAqLwo+ID4+ID4gLSAgICB1aW50MzJfdCBw
YWRkaW5nOyAgICAgICAgICAgLyogcGFkZGluZyBmb3IgNjQtYml0IGFsaWduZWQgc3RydWN0dXJl
ICovCj4gPj4gPiArICAgIHVpbnQzMl90IGNhY2hlX3BvbGljeTsgICAgICAvKiBjYWNoZWFiaWxp
dHkgb2YgdGhlIG1lbW9yeSBtYXBwaW5nICovCj4gPj4gPiAgfTsKPiA+PiAKPiA+PiBJIGRvbid0
IHRoaW5rIERFVk1FTSBhbmQgTUVNT1JZIGFyZSBhbnl3aGVyZSBuZWFyIGRlc2NyaXB0aXZlCj4g
Pj4gZW5vdWdoLCBub3IgLSBpZiB3ZSB3YW50IHN1Y2ggY29udHJvbCBhbnl3YXkgLSBmbGV4aWJs
ZSBlbm91Z2guIEkKPiA+PiB0aGluayB3aGF0IHlvdSB3YW50IGlzIHRvIGFjdHVhbGx5IHNwZWNp
ZnkgY2FjaGFiaWxpdHksIGFsbG93aW5nIG9uCj4gPj4geDg2IHRvIGUuZy4gbWFwIGZyYW1lIGJ1
ZmZlcnMgb3IgYWxpa2UgV0MuIFRoZSBhdHRyaWJ1dGUgdGhlbgo+ID4+IHdvdWxkIChvYnZpb3Vz
bHkgYW5kIG5lY2Vzc2FyaWx5KSBiZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMuCj4gPiAKPiA+IFll
cywgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHdyb3RlLCBhbmQgYWxzbyB3aXRoIHdoYXQgSnVsaWVu
IHdyb3RlLiBOb3cKPiA+IHRoZSBxdWVzdGlvbiBpcyBob3cgZG8geW91IGJvdGggdGhpbmsgdGhp
cyBzaG91bGQgbG9vayBsaWtlIGluIG1vcmUKPiA+IGRldGFpbHM6Cj4gPiAKPiA+IC0gYXJlIHlv
dSBPSyB3aXRoIHVzaW5nIG1lbW9yeV9wb2xpY3kgaW5zdGVhZCBvZiBjYWNoZV9wb2xpY3kgbGlr
ZQo+ID4gICBKdWxpZW4ncyBzdWdnZXN0ZWQgYXMgbmFtZSBmb3IgdGhlIGZpZWxkPwo+IAo+IFll
cyAtIGluIGZhY3QgZWl0aGVyIGlzIGZpbmUgdG8gbWUuCj4gCj4gPiAtIGFyZSB5b3UgT0sgd2l0
aCB1c2luZyAjZGVmaW5lcyBmb3IgdGhlIHZhbHVlcz8KPiAKPiBZZXMuCj4gCj4gPiAtIHNob3Vs
ZCB0aGUgI2RlZmluZXMgZm9yIGJvdGggeDg2IGFuZCBBcm0gYmUgZGVmaW5lZCBoZXJlIG9yIGlu
IG90aGVyCj4gPiAgIGhlYWRlcnM/Cj4gCj4gSSdkIHNheSBoZXJlLCBidXQgSSB3b3VsZG4ndCBv
YmplY3QgdG8gcGxhY2VtZW50IGluIGFyY2gtCj4gc3BlY2lmaWMgcHVibGljIGhlYWRlcnMuCj4g
Cj4gPiAtIHdoYXQgdmFsdWVzIHdvdWxkIHlvdSBsaWtlIHRvIHNlZSBmb3IgeDg2Pwo+IAo+IFVu
bGVzcyB5b3UgaW50ZW5kIHRvIGltcGxlbWVudCB0aGUgZnVuY3Rpb24gZm9yIHg4NiwgSSdkCj4g
c3VnZ2VzdCBub3QgYWRkaW5nIGFueSB4ODYgI2RlZmluZS1zIGF0IGFsbCBmb3Igbm93Lgo+IAo+
IEJ1dCBJIGFncmVlIHdpdGggSnVsaWVuIChpbiBjYXNlIHRoaXMgd2Fzbid0IGV4cGxpY2l0IGVu
b3VnaCBmcm9tCj4gbXkgZWFybGllciByZXBsYXkpIHRoYXQgaXQgZmlyc3QgbmVlZHMgdG8gYmUg
Y2xhcmlmaWVkIHdoZXRoZXIgc3VjaAo+IGFuIGludGVyZmFjZSBpcyB3YW50ZWQgaW4gdGhlIGZp
cnN0IHBsYWNlLgoKSSBoYXZlIHdyaXR0ZW4gZG93biBhIGZldyBtb3JlIGRldGFpbHMgYWJvdXQg
dGhlIHVzZS1jYXNlIGVsc2V3aGVyZSwKSSdsbCBjb3B5L3Bhc3RlIGhlcmU6CgogIFhpbGlueCBN
UFNvQyBoYXMgdHdvIENvcnRleCBSNSBjcHVzIGluIGFkZGl0aW9uIHRvIGZvdXIgQ29ydGV4IEE1
MyBjcHVzCiAgb24gdGhlIGJvYXJkLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0byBhZGQgYWRkaXRp
b25hbCBDb3J0ZXggTTQgY3B1cyBhbmQKICBNaWNyb2JsYXplIGNwdXMgaW4gZmFicmljLiBUaGVy
ZSBjb3VsZCBiZSBkb3plbiBpbmRlcGVuZGVudCBwcm9jZXNzb3JzLgogIFVzZXJzIG5lZWQgdG8g
ZXhjaGFuZ2UgZGF0YSBiZXR3ZWVuIHRoZSBoZXRlcm9nZW5lb3VzIGNwdXMuIFRoZXkgdXN1YWxs
eQogIHNldCB1cCB0aGVpciBvd24gcmluZyBzdHJ1Y3R1cmVzIG92ZXIgc2hhcmVkIG1lbW9yeSwg
b3IgdGhleSB1c2UKICBPcGVuQU1QLiAgRWl0aGVyIHdheSwgdGhleSBuZWVkIHRvIHNoYXJlIGEg
Y2FjaGVhYmxlIG1lbW9yeSByZWdpb24KICBiZXR3ZWVuIHRoZW0uICBUaGUgTVBTb0MgaXMgdmVy
eSBmbGV4aWJsZSBhbmQgdGhlIG1lbW9yeSByZWdpb24gY2FuIGNvbWUKICBmcm9tIGEgbXVsdGl0
dWRlIG9mIHNvdXJjZXMsIGluY2x1ZGluZyBhIHBvcnRpb24gb2Ygbm9ybWFsIG1lbW9yeSwgb3Ig
YQogIHBvcnRpb24gb2YgYSBzcGVjaWFsIG1lbW9yeSBhcmVhIG9uIHRoZSBib2FyZC4gVGhlcmUg
YXJlIGEgY291cGxlIG9mCiAgc3BlY2lhbCBTUkFNIGJhbmtzIDY0SyBvciAyNTZLIGxhcmdlIHRo
YXQgY291bGQgYmUgdXNlZCBmb3IgdGhhdC4gQWxzbywKICBQUkFNIGNhbiBiZSBlYXNpbHkgYWRk
ZWQgaW4gZmFicmljIGFuZCB1c2VkIGZvciB0aGUgcHVycG9zZS4KCkF0IHRoZSB2ZXJ5IGxlYXN0
IHRvIGhhbmRsZSB0aGUgc3BlY2lhbCBtZW1vcnkgcmVnaW9ucywgd2UgbmVlZCB0byBiZQphYmxl
IHRvIGFsbG93IGlvbWVtIHRvIG1hcCB0aGVtIGFzIGNhY2hlYWJsZSBtZW1vcnkgdG8gYSBEb21V
LiBTbyBJIGRvCnRoaW5rIHdlIG5lZWQgdGhpcyBpbnRlcmZhY2UgZXh0ZW5zaW9uLgoKTGV0IG1l
IGtub3cgaWYgeW91IHN0aWxsIGhhdmUgYW55IGRvdWJ0cy9xdWVzdGlvbnMuIE90aGVyd2lzZSBJ
J2xsIHdvcmsKdG93YXJkIHJlc3Bpbm5pbmcgdGhlIHNlcmllcyBpbiB0aGUgcHJvcG9zZWQgZGly
ZWN0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
