From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 02 Oct 2018 08:08:14 -0600
Message-ID: <5BB37BCE02000078001EDC75@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <20181002135549.k5nc7cv3mqjahnqq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7LLX-0003F9-Vr
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 14:08:20 +0000
In-Reply-To: <20181002135549.k5nc7cv3mqjahnqq@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEwLjE4IGF0IDE1OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMDQ6MTI6MDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEluIGEgbnVtYmVyIG9mIGNhc2VzIHRoZSB0YXJnZXRzIG9mIGluZGlyZWN0IGNhbGxz
IGdldCBkZXRlcm1pbmVkIG9uY2UKPj4gYXQgYm9vdCB0aW1lLiBJbiBzdWNoIGNhc2VzIHdlIGNh
biByZXBsYWNlIHRob3NlIGNhbGxzIHdpdGggZGlyZWN0IG9uZXMKPj4gdmlhIG91ciBhbHRlcm5h
dGl2ZSBpbnN0cnVjdGlvbiBwYXRjaGluZyBtZWNoYW5pc20uCj4+IAo+PiBTb21lIG9mIHRoZSB0
YXJnZXRzIChpbiBwYXJ0aWN1bGFyIHRoZSBodm1fZnVuY3Mgb25lcykgZ2V0IGVzdGFibGlzaGVk
Cj4+IG9ubHkgaW4gcHJlLVNNUCBpbml0Y2FsbHMsIG1ha2luZyBuZWNlc3NhcnkgYSBzZWNvbmQg
cGFzc3MgdGhyb3VnaCB0aGUKPj4gYWx0ZXJuYXRpdmUgcGF0Y2hpbmcgY29kZS4gVGhlcmVmb3Jl
IHNvbWUgYWRqdXN0bWVudHMgYmV5b25kIHRoZQo+PiByZWNvZ25pdGlvbiBvZiB0aGUgbmV3IHNw
ZWNpYWwgcGF0dGVybiBhcmUgbmVjZXNzYXJ5IHRoZXJlLgo+PiAKPj4gTm90ZSB0aGF0IHBhdGNo
aW5nIHN1Y2ggc2l0ZXMgbW9yZSB0aGFuIG9uY2UgaXMgbm90IHN1cHBvcnRlZCAoYW5kIHRoZQo+
PiBzdXBwbGllZCBtYWNyb3MgYWxzbyBkb24ndCBwcm92aWRlIGFueSBtZWFucyB0byBkbyBzbyku
Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IC0tLQo+PiB2NDogRXh0ZW5kIC8gYWRqdXN0IGNvbW1lbnRzLgo+IAo+IFRoYW5rcywgdGhpcyBt
YWtlcyBpdCBtdWNoIGVhc2llciB0byByZWFzb24gYWJvdXQgdGhlIGNvZGUuCj4gCj4gSSBrbm93
IHRoZXJlIGFyZSBjb21tZW50cyBhYm91dCBhIG1hY3JvLCBidXQgdGhleSBkb24ndCByZWFsbHkg
YWZmZWN0Cj4gdGhlIG1lYXQgb2YgdGhpcyBwYXRjaCwgc28gd2hldGhlciB0aGUgbWFjcm8gaXMg
c3BsaXQgb3V0IHRvIGEKPiBwcmVyZXF1aXNpdGUgcGF0Y2ggb3Igbm90Ogo+IAo+IFJldmlld2Vk
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhhbmtzLCB0aGlzIGlzIG11Y2gg
YXBwcmVjaWF0ZWQgZXNwZWNpYWxseSBpbiB0aGF0IGNvbnRleHQuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
