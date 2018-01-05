From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v1 28/74] x86: initialise shared_info
	page
Date: Fri, 5 Jan 2018 14:20:16 +0000
Message-ID: <2adb4a74-916f-714d-4441-d10ecdbf6b7a@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-29-wei.liu2@citrix.com>
 <5A4F9597020000780019B65C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oku2=ea=citrix.com=prvs=536ec9109=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eXSrR-0002VD-H2
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:20:41 +0000
In-Reply-To: <5A4F9597020000780019B65C@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDEvMTggMTQ6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0
IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC94ZW4uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKPj4gQEAgLTcy
LDYgKzcyLDMwIEBAIHZvaWQgX19pbml0IHByb2JlX2h5cGVydmlzb3Iodm9pZCkKPj4gICAgICB4
ZW5fZ3Vlc3QgPSB0cnVlOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdm9pZCBtYXBfc2hhcmVkX2lu
Zm8oc3RydWN0IGU4MjBtYXAgKmU4MjApCj4+ICt7Cj4+ICsgICAgcGFkZHJfdCBmcmFtZSA9IDB4
ZmYwMDAwMDA7IC8qIFRPRE86IEhhcmRjb2RlZCBiZXNpZGUgbWFnaWMgZnJhbWVzLiAqLwo+IFdo
YXQgYXJlIHRoZSBwbGFucyBoZXJlPwoKTm90aGluZyBpbW1lZGlhdGVseS7CoCBUaGlzIGlzIGNv
bXBhdGlibGUgd2l0aCBhbGwgdmVyc2lvbnMgb2YgbGlieGMgaW4KZXhpc3RhbmNlLCBidXQgd2Ug
bmVlZCB0byBzdGFydCBhIHRocmVhZCBkaXNjdXNzaW5nIEhWTSBndWVzdCBwaHlzaWNhbAphZGRy
ZXNzIHNwYWNlLgoKV2UndmUgYWxzbyBqdXN0IGZvdW5kIGEgcGFzc2l2ZSBwZXJmb3JtYW5jZSBo
b2xlLCB3aGVyZSBlbmFibGluZyBhbnkKa2luZCBvZiBQQ0kgUGFzc3Rocm91Z2ggY2F1c2VzIFdp
bmRvd3MgYW5kIExpbnV4J3MgZ3JhbnQgdGFibGUgbWFwcGluZ3MKdG8gdHVybiB1bmNhY2hlZCBi
ZWNhdXNlIHRoZXkgYXJlIGFsbG9jYXRlZCBpbnNpZGUgd2hhdCB0aGUgT1MgdGhpbmtzIGlzCmFu
IE1NSU8gQkFSLgoKSSdsbCBzdGFydCBhIHRocmVhZCB3aGVuIEknbSBhIGxpdHRsZSBsZXNzIGJ1
c3kuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
