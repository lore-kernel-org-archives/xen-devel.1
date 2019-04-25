From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/mm: Make change_type_range return
 error
Date: Thu, 25 Apr 2019 06:54:10 -0600
Message-ID: <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdtL-0003XA-0c
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:54:19 +0000
In-Reply-To: <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com, Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA0LjE5IGF0IDE2OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDAyOjI3OjMyUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVm
YW4gSVNBSUxBIHdyb3RlOgo+PiBAQCAtMTA1MywxNSArMTA1MywxMSBAQCBzdGF0aWMgdm9pZCBj
aGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+PiAgICAgICAqIFRoaXMg
c2hvdWxkIGJlIHJldmlzaXRlZCBsYXRlciwgYnV0IGZvciBub3cgcG9zdCBhIHdhcm5pbmcuCj4+
ICAgICAgICovCj4+ICAgICAgaWYgKCB1bmxpa2VseShlbmQgPiBob3N0X21heF9wZm4pICkKPj4g
LSAgICB7Cj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJEb20lZCBsb2dkaXJ0
eSByYW5nZXNldCBjbGlwcGVkIHRvIG1heF9tYXBwZWRfcGZuXG4iLAo+PiAtICAgICAgICAgICAg
ICAgZC0+ZG9tYWluX2lkKTsKPj4gLSAgICAgICAgZW5kID0gaW52YWxpZGF0ZV9lbmQgPSBob3N0
X21heF9wZm47Cj4+IC0gICAgfQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gIAo+PiAg
ICAgIC8qIElmIHRoZSByZXF1ZXN0ZWQgcmFuZ2UgaXMgb3V0IG9mIHNjb3BlLCByZXR1cm4gZG9p
bmcgbm90aGluZy4gKi8KPj4gICAgICBpZiAoIHN0YXJ0ID4gZW5kICkKPj4gLSAgICAgICAgcmV0
dXJuOwo+PiArICAgICAgICByZXR1cm4gMDsKPiAKPiBTaW5jZSB5b3UgYXJlIGFscmVhZHkgY2hh
bmdpbmcgdGhlIGJlaGF2aW9yIG9mIHRoZSBmdW5jdGlvbiBhYm92ZSB0aGlzCj4gc2hvdWxkIGFs
c28gcmV0dXJuIEVJTlZBTCBJTU8uCgpJIGRvbid0IHRoaW5rIEkgYWdyZWUuIFF1aXRlIHRoZSBv
dGhlciB3YXkgYXJvdW5kOiBJbiB0aGUgbGF0dGVyCmNhc2UgaXQncyBzaW1wbHkgYW4gZW1wdHkg
cmFuZ2UgdGhhdCBnZXRzIHJlcXVlc3RlZCwgd2hpY2ggaXMgYQpuby1vcCAoYW5kIGhlbmNlIG5v
IHJlYXNvbiB0byBmYWlsKS4gQXZvaWRpbmcgZW1wdHkgcmFuZ2VzIGluCnRoZSBjYWxsZXJzIG1h
eSByZXN1bHQgaW4gbGVzcyByZWFkYWJsZSBjb2RlIHRoZXJlLgoKRXZlbiBpbiB0aGUgZm9ybWVy
IGNhc2UgSSBkb24ndCB0aGluayByZXR1cm5pbmcgYW4gZXJyb3IgaXMKYXBwcm9wcmlhdGUsIHRo
ZSBtb3JlIHRoYXQgdGhlIGNvbW1lbnQgdGhlcmUgc2F5cyB0aGlzIGlzCnByb2JhYmx5IG5vdCB0
aGUgcmlnaHQgYmVoYXZpb3IuIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvCmxlYXZlIHRo
aXMgYWxvbmUgdW50aWwgd2UgaGF2ZSBzZXR0bGVkIG9uIHdoYXQgdGhlIHJpZ2h0CmJlaGF2aW9y
IGhlcmUgaXMuIEl0IGlzIGFuIGlzc3VlIGFueXdheSB0aGF0IGEgY2hhbmdlIGlzCm1hZGUgd2l0
aG91dCBzYXlpbmcgd2h5IHRoZSBuZXcgYmVoYXZpb3IgcHJlZmVyYWJsZSBvdmVyCnRoZSBjdXJy
ZW50IG9uZS4KCkluIGFueSBldmVudCB0aGUgY29tbWVudCB0aGVyZSB3b3VsZCBiZWNvbWUgc3Rh
bGUgd2l0aCB0aGUKcmVtb3ZhbCBvZiB0aGUgcHJpbnRrKCkuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
