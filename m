From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: log XPTI enabled status
Date: Thu, 01 Feb 2018 06:18:24 -0700
Message-ID: <5A7321B002000078001A4549@prv-mh.provo.novell.com>
References: <5A72E35802000078001A4390@prv-mh.provo.novell.com>
 <4f330bfc-c5d5-1fd5-4f75-b50ab76ed0f7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xbw8=e3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ehEl6-0006Bm-N7
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 13:18:32 +0000
In-Reply-To: <4f330bfc-c5d5-1fd5-4f75-b50ab76ed0f7@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE4IGF0IDEzOjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDIvMTggMDg6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBdCB0aGUgc2Ft
ZSB0aW1lIGFsc28gcmVwb3J0IHRoZSBzdGF0ZSBvZiB0aGUgdHdvIGRlZmluZWQKPj4gQVJDSF9D
QVBBQklMSVRJRVMgTVNSIGJpdHMgKGJ1dCBkb24ndCBleHBvc2UgdGhlIE1TUiB0byBndWVzdHMg
eWV0KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+PiAtLS0KPj4gU2hvdWxkIHdlIGRpc2FibGUgWFBUSSByaWdodCBoZXJlIHdoZW4gd2UgZmlu
ZCBSRENMX05PPwo+IAo+IEkgd2FzIHBsYW5uaW5nIHRvIHdhaXQgZm9yIGEgd29ya2luZyBwaWVj
ZSBvZiBoYXJkd2FyZSBiZWZvcmUgdHJ5aW5nIHRvCj4gaW1wbGVtZW50IEFSQ0hfQ0FQUywgZ2l2
ZW4gaG93IG9mdGVuIHRoZSBzcGVjIGNoYW5nZWQuICBUaGVuIGFnYWluLCBhdAo+IHRoZSBwb2lu
dCBMaW51eCBpcyBkb2luZyB0aGlzLCB3ZSBtaWdodCBhcyB3ZWxsIGNvbnNpZGVyIGl0IHNhZmUu
CgpJIGhhdmUgbm8gaWRlYSBob3cgZmFyIExpbnV4IGhhcyBwcm9ncmVzc2VkIGluIHRoYXQgZGly
ZWN0aW9uLCBzbyBJCmNhbid0IGRlY2lkZSB3aGV0aGVyIHRoaXMgaXMgYSAieWVzIiBvciBhICJs
ZXQncyBiZXR0ZXIgd2FpdCIuCgo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYv
Y3B1ZmVhdHVyZXNldC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVm
ZWF0dXJlc2V0LmgKPj4gQEAgLTI0NCw2ICsyNDQsNyBAQCBYRU5fQ1BVRkVBVFVSRShBVlg1MTJf
NFZOTklXLCA5KjMyKyAyKSAvCj4+ICBYRU5fQ1BVRkVBVFVSRShBVlg1MTJfNEZNQVBTLCA5KjMy
KyAzKSAvKkEgIEFWWDUxMiBNdWx0aXBseSBBY2N1bXVsYXRpb24gU2luZ2xlIFByZWNpc2lvbiAq
Lwo+PiAgWEVOX0NQVUZFQVRVUkUoSUJSU0IsICAgICAgICAgOSozMisyNikgLypBICBJQlJTIGFu
ZCBJQlBCIHN1cHBvcnQgKHVzZWQgYnkgSW50ZWwpICovCj4+ICBYRU5fQ1BVRkVBVFVSRShTVElC
UCwgICAgICAgICA5KjMyKzI3KSAvKkEhIFNUSUJQICovCj4+ICtYRU5fQ1BVRkVBVFVSRShBUkNI
X0NBUFMsICAgICA5KjMyKzI5KSAvKiAgIElBMzJfQVJDSF9DQVBBQklMSVRJRVMgTVNSICovCj4g
Cj4gVGhpcyBkb2Vzbid0IGFwcGVhciB0byBiZSB1c2VkPwoKU2VlIHRoZSBjb25kaXRpb25hbCBh
cm91bmQgcmRtc3JsKE1TUl9BUkNIX0NBUEFCSUxJVElFUywgY2FwcykuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
