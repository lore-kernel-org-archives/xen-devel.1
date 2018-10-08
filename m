From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] xen/domain: Allocate d->vcpu[] earlier
 during domain_create()
Date: Mon, 8 Oct 2018 18:39:43 +0100
Message-ID: <176fb2cc-6dd2-24e6-84b3-3f8b754a5b02@citrix.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-5-git-send-email-andrew.cooper3@citrix.com>
 <5BBB60EC02000078001EF9D6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BBB60EC02000078001EF9D6@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTAvMTggMTQ6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjEwLjE4IGF0
IDE2OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC00MDUsMTkg
KzQxOSw2IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKPj4g
IAo+PiAgICAgIGlmICggIWlzX2lkbGVfZG9tYWluKGQpICkKPj4gICAgICB7Cj4+IC0gICAgICAg
IC8qIENoZWNrIGQtPm1heF92Y3B1cyBhbmQgYWxsb2NhdGUgZC0+dmNwdVtdLiAqLwo+PiAtICAg
ICAgICBlcnIgPSAtRUlOVkFMOwo+PiAtICAgICAgICBpZiAoIGNvbmZpZy0+bWF4X3ZjcHVzIDwg
MSB8fAo+PiAtICAgICAgICAgICAgIGNvbmZpZy0+bWF4X3ZjcHVzID4gZG9tYWluX21heF92Y3B1
cyhkKSApCj4+IC0gICAgICAgICAgICBnb3RvIGZhaWw7Cj4gQWgsIHRoZXJlIGl0IGdvZXMgYXdh
eS4gQnV0IEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBsb2dpY2FsIGZvciB0aGlzIHRvCj4gaGFw
cGVuIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gQW55d2F5Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBmb3IgYm90aCwgcHJlZmVyYWJseSAoYnV0IG5vdCBu
ZWNlc3NhcmlseSkgd2l0aCB0aGUgcmVtb3ZhbCBtb3ZlZAo+IHRoZXJlLgoKVGhlIHg4NiBzaWRl
IGlzIHRyaXZpYWwsIGJ1dCB0aGUgQVJNIHNpZGUgaXMgbm90LsKgIEkgZG9uJ3QgdGhpbmsgcGF0
Y2hlcwozIGFuZCA0IHNob3VsZCBiZSBtZXJnZWQsIGJ1dCBJJ2xsIGxldCBKdWxpZW4vU3RlZmFu
byBoYXZlIHRoZSBmaW5hbCBzYXkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
