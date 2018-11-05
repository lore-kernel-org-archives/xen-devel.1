From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Mon, 05 Nov 2018 09:11:44 -0700
Message-ID: <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJhTm-0006JY-39
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 16:11:54 +0000
In-Reply-To: <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDE2OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTEvMTggMTU6NDgsIFdlaSBMaXUgd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDA1
LCAyMDE4IGF0IDA4OjA0OjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MDIuMTEuMTggYXQgMTY6NTUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYveDg2
XzY0L3RyYXBzLmMKPj4+PiBAQCAtMjk4LDggKzI5OCwyMSBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IHdyaXRlX3N0dWJfdHJhbXBvbGluZSgKPj4+PiAgfQo+Pj4+ICAKPj4+PiAgREVGSU5FX1BFUl9D
UFUoc3RydWN0IHN0dWJzLCBzdHVicyk7Cj4+Pj4gKwo+Pj4+ICsjaWZkZWYgQ09ORklHX1BWCj4+
Pj4gIHZvaWQgbHN0YXJfZW50ZXIodm9pZCk7Cj4+Pj4gIHZvaWQgY3N0YXJfZW50ZXIodm9pZCk7
Cj4+Pj4gKyNlbHNlCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKQo+
Pj4+ICt7Cj4+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5jX18pOwo+Pj4+ICt9Cj4+
Pj4gKwo+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3N0YXJfZW50ZXIodm9pZCkKPj4+PiArewo+
Pj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIsIF9fZnVuY19fKTsKPj4+PiArfQo+Pj4+ICsjZW5k
aWYgLyogQ09ORklHX1BWICovCj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0d28gc2VwYXJhdGUgc3R1
YnMgKGFuZCB0d28gc2VwYXJhdGUgc3RyaW5nIGxpdGVyYWxzKQo+Pj4gaGVyZT8KPj4gSSB0aGlu
ayBpdCBpcyBjbGVhcmVyIGlmIHdlIGhhdmUgdHdvIGRpc3RpbmN0IG1lc3NhZ2VzLiBCdXQgSSdt
IG5vdCB0b28KPj4gZnVzc2VkIGVpdGhlciB3YXkgcmVhbGx5LiBJZiB5b3UgZmVlbCBzdHJvbmds
eSBhYm91dCB0aGlzLCBJJ20gaGFwcHkgdG8KPj4gY2hhbmdlIGl0IHRvIG9ubHkgb25lIGZ1bmN0
aW9uLgo+IAo+IFRoaXMgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGl0LiAgX19mdW5jX18gd2ls
bCBhbHJlYWR5IGJlIGluIHRoZQo+IHN0cmluZyB0YWJsZSwgYW5kIHRoZSBmb3JtYXQgc3RyaW5n
IChiZWluZyBpZGVudGljYWwpIHdpbGwgYmUgbWVyZ2VkLgoKV2h5IHdvdWxkIF9fZnVuY19fIGJl
IGluIHRoZSBzdHJpbmcgdGFibGUgYWxyZWFkeSwgZm9yIGZ1bmN0aW9ucwpjb250YWluaW5nIG5v
IG90aGVyIHJlZmVyZW5jZXMgdG8gaXQ/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
