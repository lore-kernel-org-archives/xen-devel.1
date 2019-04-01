From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/sched: Remove d->is_pinned
Date: Mon, 01 Apr 2019 06:21:47 -0600
Message-ID: <5CA2025B020000780022397B@prv1-mh.provo.novell.com>
References: <1554113345-15068-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554113345-15068-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDEyOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gMykgY3B1bWFza193ZWlnaHQoKSBpcyBhIHN1cnByaXNpbmdseSBleHBlbnNpdmUgZnVu
Y3Rpb24sIGFuZCB3ZSB1c2UgaXQgYWxsCj4gICAgb3ZlciB0aGUgcGxhY2UuICBJdCB3aWxsIGFs
bW9zdCBjZXJ0YWlubHkgYmVuZWZpdCBmcm9tIHRoZSB1c2Ugb2YgcG9wY250LgoKRlRSIHRoaXMg
d2FzIHNvbWV0aGluZyBJIHdhcyBtZWFuaW5nIHRvIHBvc3NpYmx5IGRvIG9uY2UgdGhlIEJNSTIK
YWx0ZXJuYXRpdmVzIHBhdGNoaW5nIHNlcmllcyB3b3VsZCBoYXZlIGJlZW4gYWNjZXB0ZWQuIEl0
IGhhdmluZwpnb3QgcmVqZWN0ZWQgKGFuZCBhbHNvIHRoZSBmc2dzYmFzZSBwYXRjaGluZyBvbmUs
IGJ1dCB0aGF0J3MgbW9vdApub3cgYW55d2F5IGR1ZSB0byBzZWxlY3Rpb24gb2YgaW5zbiBoYXZp
bmcgYmVjb21lIGRlcGVuZGVudCBvbiBhCnJ1bnRpbWUgcHJvcGVydHkpLCBJJ3ZlIHN0b3BwZWQg
YWxsIGNvbnNpZGVyYXRpb25zIHRvd2FyZHMgZnVydGhlcgphbHRlcm5hdGl2ZXMuIFdoaWxlIHRo
ZXJlIHdvdWxkbid0IGJlIGFzIG1hbnkgaGVscGVyIGZ1bmN0aW9ucwpuZWVkZWQgaGVyZSBhcyB0
aGV5IHdlcmUgbmVlZGVkIHRoZXJlLCBvdXIgYmFzaWMgZGlzYWdyZWVtZW50CmFzIHRvIHdoZXRo
ZXIgdG8gdXNlIHBlci1yZWdpc3RlciBoZWxwZXIgZnVuY3Rpb25zIHdvdWxkIGNvbnRpbnVlCnRv
IGV4aXN0LgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvZG9tYWluLmMKPiBAQCAtMTIyOSw3ICsxMjI5LDcgQEAgYXJjaF9kb192Y3B1X29wKAo+ICAg
ICAgICAgIHN0cnVjdCB2Y3B1X2dldF9waHlzaWQgY3B1X2lkOwo+ICAKPiAgICAgICAgICByYyA9
IC1FSU5WQUw7Cj4gLSAgICAgICAgaWYgKCAhaXNfcGlubmVkX3ZjcHUodikgKQo+ICsgICAgICAg
IGlmICggIWlzX2h3ZG9tX3Bpbm5lZF92Y3B1KHYpICkKPiAgICAgICAgICAgICAgYnJlYWs7CgpJ
IHRoaW5rIHRoZSBpZGVhIGhlcmUgd2FzIHRvIGFsbG93IGV2ZW50dWFsIHVzZSBvZiB0aGlzIGlu
IGEgaGlnaGx5CmRpc2FnZ3JlZ2F0ZWQgZW52aXJvbm1lbnQgYnkgb3RoZXIgdGhhbiBEb20wLiBC
dXQgdGhpcyBpcyBub3QKdG8gc2F5IHRoYXQgSSB3b3VsZCBtaW5kIHRoaXMgY2hhbmdlOyBpbiBm
YWN0ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
