From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 12/12] xen/domain: Allocate d->vcpu[] in
 domain_create()
Date: Wed, 29 Aug 2018 09:03:36 -0600
Message-ID: <5B86B5C802000078001E328F@prv1-mh.provo.novell.com>
References: <1534154469-6076-13-git-send-email-andrew.cooper3@citrix.com>
 <1535553621-7671-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535553621-7671-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDE2OjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIEFSTSwgdGhlIGNhbGwgdG8gYXJjaF9kb21haW5fY3JlYXRlKCkgbmVlZHMgdG8g
aGF2ZSBjb21wbGV0ZWQgYmVmb3JlCj4gZG9tYWluX21heF92Y3B1cygpIHdpbGwgcmV0dXJuIHRo
ZSBjb3JyZWN0IHVwcGVyIGJvdW5kLgo+IAo+IEZvciBlYWNoIGFyY2gncyBkb20wJ3MsIGRyb3Ag
dGhlIHRlbXBvcmFyeSBtYXhfdmNwdXMgcGFyYW1ldGVyLCBhbmQgYWxsb2NhdGlvbgo+IG9mIGRv
bTAtPnZjcHUuCj4gCj4gV2l0aCBkLT5tYXhfdmNwdXMgbm93IGNvcnJlY3RseSBjb25maWd1cmVk
IGJlZm9yZSBldnRjaG5faW5pdCgpLCB0aGUgcG9sbCBtYXNrCj4gY2FuIGJlIGNvbnN0cnVjdGVk
IHN1aXRhYmx5IGZvciB0aGUgZG9tYWluLCByYXRoZXIgdGhhbiBmb3IgdGhlIHdvcnN0LWNhc2UK
PiBzZXR0aW5nLgo+IAo+IER1ZSB0byB0aGUgZXZ0Y2huX2luaXQoKSBmaXhlcywgaXQgbm8gbG9u
Z2VyIGNhbGxzIGRvbWFpbl9tYXhfdmNwdXMoKSwgYW5kCj4gQVJNJ3MgdHdvIGltcGxlbWVudGF0
aW9ucyBvZiB2Z2ljX21heF92Y3B1cygpIG5vIGxvbmdlciBuZWVkIHdvcmsgYXJvdW5kIHRoZQo+
IG91dC1vZi1vcmRlciBjYWxsLgo+IAo+IEZyb20gdGhpcyBwb2ludCBvbiwgZC0+bWF4X3ZjcHVz
IGFuZCBkLT52Y3B1c1tdIGFyZSB2YWxpZCBmb3IgYW55IGRvbWFpbiB3aGljaAo+IGNhbiBiZSBs
b29rZWQgdXAgYnkgZG9taWQuCj4gCj4gVGhlIFhFTl9ET01DVExfbWF4X3ZjcHVzIGh5cGVyY2Fs
bCBpcyBtb2RpZmllZCB0byByZWplY3QgYW55IGNhbGwgYXR0ZW1wdCB3aXRoCj4gbWF4ICE9IGQt
Pm1heF92Y3B1cywgd2hpY2ggZG9lcyBtYXRjaCB0aGUgb2xkZXIgc2VtYW50aWNzIChub3QgdGhh
dCBpdCBpcwo+IG9idmlvdXMgZnJvbSB0aGUgY29kZSkuICBUaGUgbG9naWMgdG8gYWxsb2NhdGUg
ZC0+dmNwdVtdIGlzIGRyb3BwZWQsIGJ1dCBhdAo+IHRoaXMgcG9pbnQgdGhlIGh5cGVyY2FsbCBz
dGlsbCBuZWVkcyBtYWtpbmcgdG8gYWxsb2NhdGUgZWFjaCB2Y3B1Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgppbiBwcmluY2lwbGUsIGJ1dCBhcyBzYWlk
IGJlZm9yZSB0aGUgbGFjayBvZiByZW5hbWluZyBvZiB0aGUgZG9tY3RsCm1ha2VzIG15IGFjayBk
ZXBlbmRlbnQgdXBvbiBzb21lIG90aGVyIFJFU1QgbWFpbnRhaW5lcgphZ3JlZWluZyB3aXRoIHlv
dXIgcG9zaXRpb24gdGhlcmUgKHRoZSBtb3JlIHRoYXQgeW91J3ZlIGFkZGVkCnRoZSBjb21tZW50
IHRvIHRoZSBpbXBsZW1lbnRhdGlvbiByYXRoZXIgdGhhbiB0aGUgcHVibGljIGhlYWRlcikuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
