From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 07/16] xen/x86: mm: Switch x86/mm.c to
 use typesafe for virt_to_mfn
Date: Fri, 2 Mar 2018 14:46:28 +0000
Message-ID: <84e5240b-0184-47d0-9c2a-7a1d59274736@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-8-julien.grall@arm.com>
 <5A9971A702000078001ADD74@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9971A702000078001ADD74@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDIvMDMvMTggMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIx
LjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBObyBmdW5j
dGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPj4KPj4gU2lnbmVkLW9mZiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gd2l0aCBvbmUgcmVtYXJrOgo+IAo+PiBAQCAtNTU0NSw4ICs1NTQ3LDcgQEAg
c3RhdGljIHZvaWQgX19tZW1ndWFyZF9jaGFuZ2VfcmFuZ2Uodm9pZCAqcCwgdW5zaWduZWQgbG9u
ZyBsLCBpbnQgZ3VhcmQpCj4+ICAgICAgIGlmICggZ3VhcmQgKQo+PiAgICAgICAgICAgZmxhZ3Mg
Jj0gfl9QQUdFX1BSRVNFTlQ7Cj4+ICAgCj4+IC0gICAgbWFwX3BhZ2VzX3RvX3hlbigKPj4gLSAg
ICAgICAgX3AsIHZpcnRfdG9fbWFkZHIocCkgPj4gUEFHRV9TSElGVCwgX2wgPj4gUEFHRV9TSElG
VCwgZmxhZ3MpOwo+PiArICAgIG1hcF9wYWdlc190b194ZW4oX3AsIG1mbl94KHZpcnRfdG9fbWZu
KHApKSwgX2wgPj4gUEFHRV9TSElGVCwgZmxhZ3MpOwo+IAo+IFdvdWxkIGhhdmUgYmVlbiBuaWNl
IGlmIHRoaXMgd2FzIHN3aXRjaGVkIHRvIFBGTl9ET1dOKCkgaW5zdGVhZAo+IG9mIHRoZSBvcGVu
IGNvZGVkIHNoaWZ0IHJpZ2h0IGF3YXkuCgpJIGNhbiBkbyB0aGF0LgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
