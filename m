Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92669C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:52:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627EA20855
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627EA20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqEb-0003rz-KQ; Tue, 09 Apr 2019 12:52:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqEa-0003rs-FE
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:52:16 +0000
X-Inumbo-ID: 4ccd5eb8-5ac6-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ccd5eb8-5ac6-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:52:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 06:52:14 -0600
Message-Id: <5CAC957C0200007800225DC8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 06:52:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-14-wei.liu2@citrix.com>
 <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
 <20190409122718.GD30543@zion.uk.xensource.com>
In-Reply-To: <20190409122718.GD30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 13/55] x86/mm: rewrite virt_to_xen_l3e
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409125212.Ajx4oUzd2oWTNRuRFRDQt4egDlO0arrxT-kTPMprYV0@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjI3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDk6NTU6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wMi4xOSBhdCAxNzo0NCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IEBAIC00NzY5LDQ1ICs0NzY5LDcwIEBAIHZvaWQgZnJlZV94ZW5fcGFnZXRhYmxl
X25ldyhtZm5fdCBtZm4pCj4+ID4gIAo+PiA+ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG1hcF9w
Z2Rpcl9sb2NrKTsKPj4gPiAgCj4+ID4gKy8qCj4+ID4gKyAqIEdpdmVuIGEgdmlydHVhbCBhZGRy
ZXNzLCByZXR1cm4gYSBwb2ludGVyIHRvIHhlbidzIEwzIGVudHJ5LiBDYWxsZXIKPj4gPiArICog
bmVlZHMgdG8gdW5tYXAgdGhlIHBvaW50ZXIuCj4+ID4gKyAqLwo+PiA+ICBzdGF0aWMgbDNfcGdl
bnRyeV90ICp2aXJ0X3RvX3hlbl9sM2UodW5zaWduZWQgbG9uZyB2KQo+PiA+ICB7Cj4+ID4gICAg
ICBsNF9wZ2VudHJ5X3QgKnBsNGU7Cj4+ID4gKyAgICBsM19wZ2VudHJ5X3QgKnBsM2UgPSBOVUxM
Owo+PiA+ICAKPj4gPiAgICAgIHBsNGUgPSAmaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQo
dildOwo+PiA+ICAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3MoKnBsNGUpICYgX1BBR0VfUFJFU0VO
VCkgKQo+PiA+ICAgICAgewo+PiA+ICAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0
ZSA+IFNZU19TVEFURV9ib290Owo+PiA+IC0gICAgICAgIGwzX3BnZW50cnlfdCAqbDN0ID0gYWxs
b2NfeGVuX3BhZ2V0YWJsZSgpOwo+PiA+ICsgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0Owo+PiA+
ICsgICAgICAgIG1mbl90IG1mbjsKPj4gPiArCj4+ID4gKyAgICAgICAgbWZuID0gYWxsb2NfeGVu
X3BhZ2V0YWJsZV9uZXcoKTsKPj4gPiArICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURf
TUZOKSApCj4+ID4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+PiAKPj4gQW55IHJlYXNvbiBub3Qg
dG8gdXNlICJyZXR1cm4gTlVMTCIgaGVyZSwgYXZvaWRpbmcgdGhlIGdvdG8KPj4gYW5kIGxhYmVs
IGFsdG9nZXRoZXIgaW4gdGlzIGZ1bmN0aW9uPwo+IAo+IFRoaXMgY2FuIGJlIGRvbmUsIGJ1dCBJ
IHdhbnRlZCB0byBoYXZlIGFsbCB2aXJ0X3RvX3hlbl9sWGUgaGF2ZSB0aGUgc2FtZQo+IHN0cnVj
dHVyZS4KCkkgc29ydCBvZiBndWVzc2VkIHRoaXMgYnV0IGZvciBib3RoIHRoaXMgYW5kIC4uLgoK
Pj4gPiAgc3RhdGljIGwyX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDJlKHVuc2lnbmVkIGxvbmcg
dikKPj4gPiAgewo+PiA+ICAgICAgbDNfcGdlbnRyeV90ICpwbDNlOwo+PiA+ICsgICAgbDJfcGdl
bnRyeV90ICpwbDJlID0gTlVMTDsKPj4gPiAgCj4+ID4gICAgICBwbDNlID0gdmlydF90b194ZW5f
bDNlKHYpOwo+PiA+ICAgICAgaWYgKCAhcGwzZSApCj4+ID4gLSAgICAgICAgcmV0dXJuIE5VTEw7
Cj4+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4+IAo+PiBXaHkgbm90IGtlZXAgdGhpcyBvbmUgdGhl
IHdheSBpdCBpcz8KPiAKPiBCZWNhdXNlIHRoZXJlIHdpbGwgYmUgYW4gb3V0IGxhYmVsIGFueXdh
eSwgd2h5IG5vdCB1c2UgaXQgdG8gaGF2ZSBhCj4gc2luZ2xlIGV4aXQgcGF0aD8KCi4uIHRoaXM6
IFRvIG1lLCB0aGUgZmV3ZXIgZ290by1zIHRoZSBiZXR0ZXIsIGVzcGVjaWFsbHkgd2hlbiAtIGxp
a2UKaGVyZSAtIHRoZXkgY2FuIGJlIHJlcGxhY2VkIHdpdGgganVzdCBhIHNpbmdsZSAobm9uLWJs
b2NrKSBzdGF0ZW1lbnQuCkJ1dCB5ZXMsIHRoaXMgaXMgcGVyc29uYWwgdGFzdGUgLi4uCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
