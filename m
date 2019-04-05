Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C11C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:00:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB2621738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB2621738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCLeF-0001ie-4V; Fri, 05 Apr 2019 10:00:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCLeE-0001iZ-Dq
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:00:34 +0000
X-Inumbo-ID: a4d4d8be-5789-11e9-a79d-3ffe4e682967
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4d4d8be-5789-11e9-a79d-3ffe4e682967;
 Fri, 05 Apr 2019 10:00:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 04:00:29 -0600
Message-Id: <5CA7273C0200007800224D26@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 04:00:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
In-Reply-To: <20190402164238.1815-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405100028.LQ-DqJJVC6oA5YYY4ArPST9_Z5DNa0CXqAfhy4ycQqg@z>

Pj4+IE9uIDAyLjA0LjE5IGF0IDE4OjQyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC0zNDUsMTUgKzM0NSwxNSBAQCB2b2lkIGNvbnNvbGVfZ2l2ZWJhY2soaW50IGlkKQo+ICAg
ICAgICAgIHNlcmlhbF9zdGVhbF9mbiA9IE5VTEw7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIHNl
cmNvbl9wdXRzKGNvbnN0IGNoYXIgKnMpCj4gK3N0YXRpYyB2b2lkIHNlcmNvbl9wdXRzKGNvbnN0
IGNoYXIgKnMsIHVuc2lnbmVkIGludCBucikKPiAgewo+ICAgICAgaWYgKCBzZXJpYWxfc3RlYWxf
Zm4gIT0gTlVMTCApCj4gLSAgICAgICAgKCpzZXJpYWxfc3RlYWxfZm4pKHMpOwo+ICsgICAgICAg
ICgqc2VyaWFsX3N0ZWFsX2ZuKShzLCBucik7CgpNYXkgSSBhc2sgdGhhdCB5b3UgdGFrZSB0aGUg
b3Bwb3J0dW5pdHkgYW5kIGRyb3AgdGhlIHVubmVjZXNzYXJ5CmRlY29yYXRpb24gYXMgd2VsbD8g
QSBjYWxsIHRocm91Z2ggYSBmdW5jdGlvbiBwb2ludGVyIGlzIGZpbmUgdG8gbWFrZQp3aXRob3V0
ICogYW5kIHBhcmVudGhlc2VzLgoKQWxzbyBhIG1vcmUgZ2VuZXJhbCBuYW1pbmcgcmVsYXRlZCBy
ZW1hcms6IEkgdGhpbmsgdGhpcyBhbmQgaXRzCnZhcmlvdXMgc2libGluZyBmdW5jdGlvbnMgYXJl
IG5hbWVkICpfcHV0cygpIGJlY2F1c2Ugb2YgdGhlaXIKc2ltaWxhcml0eSB0byB0aGUgQyBsaWJy
YXJ5J3MgcHV0cygpLiBJJ20gbm90IGNvbnZpbmNlZCBpdCBpcyBhIGdvb2QKbW92ZSB0byBhZGQg
YSBsZW5ndGggcGFyYW1ldGVyIHdpdGhvdXQgYWxzbyByZW5hbWluZyB0aGUgZnVuY3Rpb24KdG8g
YmUgbGVzcyBzaW1pbGFyIHRvIHB1dHMoKS4KCj4gQEAgLTU3NSwxOSArNTcyLDIwIEBAIHN0YXRp
YyBsb25nIGd1ZXN0X2NvbnNvbGVfd3JpdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjaGFyKSBi
dWZmZXIsIGludCBjb3VudCkKPiAgICAgICAgICAgICAgY2hhciAqa2luID0ga2J1ZiwgKmtvdXQg
PSBrYnVmLCBjOwo+ICAKPiAgICAgICAgICAgICAgLyogU3RyaXAgbm9uLXByaW50YWJsZSBjaGFy
YWN0ZXJzICovCj4gLSAgICAgICAgICAgIGZvciAoIDsgOyApCj4gKyAgICAgICAgICAgIGRvCj4g
ICAgICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgIGMgPSAqa2luKys7Cj4gLSAgICAgICAg
ICAgICAgICBpZiAoIGMgPT0gJ1wwJyB8fCBjID09ICdcbicgKQo+ICsgICAgICAgICAgICAgICAg
aWYgKCBjID09ICdcbicgKQo+ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAg
ICAgICAgICAgaWYgKCBpc3ByaW50KGMpIHx8IGMgPT0gJ1x0JyApCj4gICAgICAgICAgICAgICAg
ICAgICAgKmtvdXQrKyA9IGM7CgpIb3cgZG9lcyB0aGlzIGZpdCB3aXRoIHlvdXIgZ29hbCBvZiBo
YW5kaW5nIHRocm91Z2ggbnVsIGNoYXJhY3RlcnM/CmlzcHJpbnQoJ1wwJykgcHJldHR5IGNlcnRh
aW5seSBwcm9kdWNlcyBmYWxzZSwgSSB3b3VsZCB0aGluaz8gSSByZWFsaXplCnRoaXMgaXMgdGhl
IERvbVUgY2FzZSwgYnV0IHNob3VsZG4ndCB3ZSB0cnkgdG8gdHJlYXQgdGhpcyBzaW1pbGFybHk/
IEkKY2FuJ3QgcmVhbGx5IGRlY2lkZSB3aHkgdGhlIGlzcHJpbnQoKSBsaW1pdGF0aW9uIGhlcmUg
ZXhpc3RzIGluIHRoZSBmaXJzdApwbGFjZS4KCkluIGFueSBldmVudCwgaWYgeW91IG1lYW4gdG8g
dHJlYXQgaHdkb20gYW5kIERvbVUgZGlmZmVyZW50bHksCnRoZW4gSSB0aGluayB0aXRsZSBhbmQv
b3IgZGVzY3JpcHRpb24gc2hvdWxkIGFjdHVhbGx5IHNheSBzbywgYW5kIHdoeS4KCj4gLSAgICAg
ICAgICAgIH0KPiArICAgICAgICAgICAgfSB3aGlsZSAoIC0ta2NvdW50ID4gMCApOwoKUGVyc29u
YWxseSBJIGZpbmQgaXQgb2RkIHRvIHVzZSAiPiAwIiBvciAiICE9IDAiIG9uIHZhcmlhYmxlcyBv
Zgp1bnNpZ25lZCB0eXBlLiBBdCBsZWFzdCBmb3IgdGhlIGxhdHRlciB3ZSBpbmRlZWQgY29tbW9u
bHkgb21pdCBpdCwKc28gSSB0aGluayBoZXJlIGFuZCBlbHNld2hlcmUgdGhlICI+IDAiIHdvdWxk
IGJldHRlciBiZSBvbWl0dGVkIGluCmEgc2ltaWxhciBmYXNoaW9uLgoKPiBAQCAtMTI1NywxNCAr
MTI1NiwxNSBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+
ICAgICAgQVNTRVJUKGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMgLSAxXSA9PSAwKTsK
PiAgCj4gICAgICB2YV9zdGFydChhcmdzLCBmbXQpOwo+IC0gICAgdnNucHJpbnRmKGJ1Ziwgc2l6
ZW9mKGJ1ZiksIGZtdCwgYXJncyk7Cj4gKyAgICBuciA9IHZzY25wcmludGYoYnVmLCBzaXplb2Yo
YnVmKSwgZm10LCBhcmdzKTsKPiAgICAgIHZhX2VuZChhcmdzKTsKPiAgCj4gICAgICBpZiAoIGRl
YnVndHJhY2Vfc2VuZF90b19jb25zb2xlICkKPiAgICAgIHsKPiAtICAgICAgICBzbnByaW50Zihj
bnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUgIiwgKytjb3VudCk7Cj4gLSAgICAgICAgc2VyaWFs
X3B1dHMoc2VyY29uX2hhbmRsZSwgY250YnVmKTsKPiAtICAgICAgICBzZXJpYWxfcHV0cyhzZXJj
b25faGFuZGxlLCBidWYpOwo+ICsgICAgICAgIHVuc2lnbmVkIGludCBuID0gc25wcmludGYoY250
YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIsICsrY291bnQpOwoKVG8gYmUgb24gdGhlIHNhZmUg
c2lkZSwgcGVyaGFwcyBiZXR0ZXIgdG8gdXNlIHNjbnByaW50ZigpIGhlcmUsCmp1c3QgbGlrZSB2
c2NucHJpbnRmKCkgZ2V0cyB1c2VkIGFib3ZlPwoKPiBAQCAtMTAzLDEzICsxMDQsMTQgQEAgdm9p
ZCBsZmJfcmVkcmF3X3B1dHMoY29uc3QgY2hhciAqcykKPiAgfQo+ICAKPiAgLyogU2xvd2VyIGxp
bmUtYmFzZWQgc2Nyb2xsIG1vZGUgd2hpY2ggaW50ZXJhY3RzIGJldHRlciB3aXRoIGRvbTAuICov
Cj4gLXZvaWQgbGZiX3Njcm9sbF9wdXRzKGNvbnN0IGNoYXIgKnMpCj4gK3ZvaWQgbGZiX3Njcm9s
bF9wdXRzKGNvbnN0IGNoYXIgKnMsIHVuc2lnbmVkIGludCBucikKPiAgewo+ICAgICAgdW5zaWdu
ZWQgaW50IGk7Cj4gLSAgICBjaGFyIGM7Cj4gIAo+IC0gICAgd2hpbGUgKCAoYyA9ICpzKyspICE9
ICdcMCcgKQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBucjsgaSsrICkKCk5vdGUgaG93IGkgaXMg
YWxyZWFkeSB1c2VkIGluIGFuIGlubmVyIGxvb3AuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
