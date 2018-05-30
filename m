From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Wed, 30 May 2018 14:32:30 +1000
Message-ID: <20180530143230.0000602b@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <5B0D627702000078001C6A9E@prv1-mh.provo.novell.com>
 <20180530035607.000071e0@gmail.com>
 <20180530044749.00006c68@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x44a=ir=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1fNsmv-0006qM-Ej
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 04:32:41 +0000
Received: by mail-lf0-x242.google.com with SMTP id t134-v6so2107060lff.6
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 21:32:40 -0700 (PDT)
In-Reply-To: <20180530044749.00006c68@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pk9uIFdlZCwgMzAgTWF5IDIwMTggMDM6NTY6MDcgKzEwMDAKPkFsZXhleSBHIDx4MTkxN3hAZ21h
aWwuY29tPiB3cm90ZToKPgo+Pk9uIFR1ZSwgMjkgTWF5IDIwMTggMDg6MjM6NTEgLTA2MDAKPj4i
SmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+ICAKPj4+Pj4+IE9uIDEy
LjAzLjE4IGF0IDE5OjMzLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6ICAgICAgCj4+Pj4gLS0t
IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4+Pj4gKysrIGIvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL2NvbmZpZy5oCj4+Pj4gQEAgLTUzLDEwICs1MywxNCBAQCBleHRlcm4g
dWludDhfdCBpb2FwaWNfdmVyc2lvbjsKPj4+PiAgI2RlZmluZSBQQ0lfSVNBX0RFVkZOICAgICAg
IDB4MDggICAgLyogZGV2IDEsIGZuIDAgKi8KPj4+PiAgI2RlZmluZSBQQ0lfSVNBX0lSUV9NQVNL
ICAgIDB4MGMyMFUgLyogSVNBIElSUXMgNSwxMCwxMSBhcmUgUENJIGNvbm5lY3RlZCAqLwo+Pj4+
ICAjZGVmaW5lIFBDSV9JQ0g5X0xQQ19ERVZGTiAgMHhmOCAgICAvKiBkZXYgMzEsIGZuIDAgKi8K
Pj4+PiArI2RlZmluZSBQQ0lfTUNIX0RFVkZOICAgICAgIDAgICAgICAgLyogYnVzIDAsIGRldiAw
LCBmdW5jIDAgKi8gICAgICAKPj4+Cj4+Pkp1c3QgTUNIIGlzIGxpYWJsZSB0byBiZWNvbWUgYW1i
aWd1b3VzIGluIHRoZSBmdXR1cmUuIFBlcmhhcHMgUENJX1EzNV9NQ0hfREVWRk4/ICAgIAo+Pgo+
PkFncmVlLCBQQ0lfUTM1X01DSF9ERVZGTiBpcyBtb3JlIGV4cGxpY2l0LgoKT24gdGhlIG90aGVy
IHRob3VnaHQsIHdlIGNhbiByZXVzZSBvbmUgTUNIIEJERiAjZGVmaW5lIGZvciBtdWx0aXBsZQpl
bXVsYXRlZCBjaGlwc2V0cywgbm90IGp1c3QgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpc3Rp
bmN0IHRvIFEzNQpidXQgZXZlbiBmb3IgdGhvc2Ugd2hpY2ggbW9zdGx5IHJlcXVpcmUgbWVyZWx5
IGNoYW5naW5nIFBDSSBESURzIChsaWtlClAzNSBldGMuKSBTbyBpbiB0aGlzIGNhc2UgcHJvZHVj
aW5nIG11bHRpcGxlICNkZWZpbmVzIGxpa2UKUENJX3tRfFB8R30zNV9NQ0hfREVWRk4gZm9yIHRo
ZSBzYW1lIEJERiAwOjAuMCBtaWdodCBiZSBleGNlc3NpdmUuCgpQQ0lfSUNIOV9MUENfREVWRk4g
Y2FuIGJlIGFjdHVhbGx5IHJldXNlZCB0b28sIGl0cyBCREYgbG9jYXRpb24Kc3Vydml2ZWQgbWFu
eSBjaGlwc2V0IGdlbmVyYXRpb25zIHNvIGl0cyAjZGVmaW5lIGNhbiBiZSBzaGFyZWQgYXMgd2Vs
bAoodGhvdWdoIHJlbmFtZWQgdG8gc29tZXRoaW5nIGxpa2UgUENJX0xQQ19CUklER0VfREVWRk4p
LgoKPj4+PiBAQCAtMTcyLDEwICsxNzMsMTQgQEAgdm9pZCBwY2lfc2V0dXAodm9pZCkKPj4+PiAg
Cj4+Pj4gICAgICAvKiBDcmVhdGUgYSBsaXN0IG9mIGRldmljZSBCQVJzIGluIGRlc2NlbmRpbmcg
b3JkZXIgb2Ygc2l6ZS4gKi8KPj4+PiAgICAgIHN0cnVjdCBiYXJzIHsKPj4+PiAtICAgICAgICB1
aW50MzJfdCBpc182NGJhcjsKPj4+PiAgICAgICAgICB1aW50MzJfdCBkZXZmbjsKPj4+PiAgICAg
ICAgICB1aW50MzJfdCBiYXJfcmVnOwo+Pj4+ICAgICAgICAgIHVpbnQ2NF90IGJhcl9zejsKPj4+
PiArICAgICAgICB1aW50NjRfdCBhZGRyX21hc2s7IC8qIHdoaWNoIGJpdHMgb2YgdGhlIGJhc2Ug
YWRkcmVzcyBjYW4gYmUgd3JpdHRlbiAqLwo+Pj4+ICsgICAgICAgIHVpbnQzMl90IGJhcl9kYXRh
OyAgLyogaW5pdGlhbCB2YWx1ZSAtIEJBUiBmbGFncyBoZXJlICovICAgICAgCj4+PgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
