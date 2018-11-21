From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V8 3/7] x86/p2m: allocate logdirty_ranges
 for altp2ms
Date: Wed, 21 Nov 2018 12:54:33 +0200
Message-ID: <5a87c581-77bf-6eeb-c5ab-69a44104cc2d@bitdefender.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-4-git-send-email-rcojocaru@bitdefender.com>
 <5BF5373502000078001FE63C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RqMg=OA=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPQ9Z-0005Wy-Dh
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:54:41 +0000
In-Reply-To: <5BF5373502000078001FE63C@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTI6NDUgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjExLjE4
IGF0IDExOjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+ICtzdGF0aWMg
aW50IHAybV9hY3RpdmF0ZV9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlk
eCkKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSwgKnAybTsKPj4gKyAg
ICBpbnQgcmM7Cj4+ICsKPj4gKyAgICBBU1NFUlQoaWR4IDwgTUFYX0FMVFAyTSk7Cj4+ICsKPj4g
KyAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baWR4XTsKPj4gKyAgICBob3N0cDJtID0gcDJt
X2dldF9ob3N0cDJtKGQpOwo+PiArCj4+ICsgICAgcDJtX2xvY2socDJtKTsKPj4gKwo+PiArICAg
IHJjID0gcDJtX2luaXRfbG9nZGlydHkocDJtKTsKPj4gKwo+PiArICAgIGlmICggcmMgKQo+PiAr
ICAgICAgICBnb3RvIG91dDsKPj4gKwo+PiArICAgIC8qIFRoZSBmb2xsb3dpbmcgaXMgcmVhbGx5
IGp1c3QgYSByYW5nZXNldCBjb3B5LiAqLwo+PiArICAgIHJjID0gcmFuZ2VzZXRfbWVyZ2UocDJt
LT5sb2dkaXJ0eV9yYW5nZXMsIGhvc3RwMm0tPmxvZ2RpcnR5X3Jhbmdlcyk7Cj4gCj4gSXMgcDJt
ICE9IGhvc3RwMm0gZ3VhcmFudGVlZCBoZXJlIChyZWNhbGxpbmcgdGhlIGRpc2N1c3Npb24gYWJv
dXQKPiBhcnJheSBzbG90IDApPyBUaGUgZnVuY3Rpb24gbWF5IGhhcHBlbiB0byB3b3JrIHdpdGgg
Ym90aCByYW5nZXNldHMKPiB0aGUgc2FtZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBndWFy
YW50ZWVkLgoKWWVzLCBpdCBpcy4gV2UncmUgIndhc3RpbmciIGFsdHAybVswXSwgYXMgcHJldmlv
dXNseSBkaXNjdXNzZWQuCgo+PiArICAgIGlmICggcmMgKQo+PiArICAgIHsKPj4gKyAgICAgICAg
cDJtX2ZyZWVfbG9nZGlydHkocDJtKTsKPj4gKyAgICAgICAgZ290byBvdXQ7Cj4+ICsgICAgfQo+
PiArCj4+ICsgICAgcDJtX2luaXRfYWx0cDJtX2VwdChkLCBpZHgpOwo+PiArCj4+ICtvdXQ6Cj4g
Cj4gTGFiZWxzIGluZGVudGVkIGJ5IGF0IGxlYXN0IG9uZSBibGFuayBwbGVhc2UuCgpSaWdodCwg
d2lsbCBjaGFuZ2UgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCgpUaGFua3MsClJhenZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
