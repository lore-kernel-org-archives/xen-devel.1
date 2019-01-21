From: Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [Qemu-devel] [PATCH v3 0/4] QEMU changes to do PVH
 boot
Date: Mon, 21 Jan 2019 08:19:03 +0000
Message-ID: <7979bbc2-2713-4043-291b-79b7132634c0@oracle.com>
References: <154803791641.5550.15254007790773130906@2d3111e9616b>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gFw6=P5=oracle.com=liam.merwick@srs-us1.protection.inumbo.net>)
 id 1glUnj-0003PP-9f
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 08:19:23 +0000
In-Reply-To: <154803791641.5550.15254007790773130906@2d3111e9616b>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, ehabkost@redhat.com, maran.wilson@oracle.com, mst@redhat.com, george.kennedy@oracle.com, stefanha@redhat.com, pbonzini@redhat.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sgarzare@redhat.com, rth@twiddle.net
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDEvMjAxOSAwMjozMSwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgd3JvdGU6Cj4gUGF0Y2hl
dyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTQ3NTU0Njg3LTEyNjg3LTEtZ2l0LXNl
bmQtZW1haWwtbGlhbS5tZXJ3aWNrQG9yYWNsZS5jb20vCi4uLj4KPiAgICBDQyAgICAgIGRtYS1o
ZWxwZXJzLm8KPiAgICBDQyAgICAgIHZsLm8KPiAvdG1wL3FlbXUtdGVzdC9zcmMvYmxvY2svc2hl
ZXBkb2cuYzogSW4gZnVuY3Rpb24gJ2ZpbmRfdmRpX25hbWUnOgo+IC90bXAvcWVtdS10ZXN0L3Ny
Yy9ibG9jay9zaGVlcGRvZy5jOjEyMzk6NTogZXJyb3I6ICdzdHJuY3B5JyBzcGVjaWZpZWQgYm91
bmQgMjU2IGVxdWFscyBkZXN0aW5hdGlvbiBzaXplIFstV2Vycm9yPXN0cmluZ29wLXRydW5jYXRp
b25dCj4gICAgICAgc3RybmNweShidWYgKyBTRF9NQVhfVkRJX0xFTiwgdGFnLCBTRF9NQVhfVkRJ
X1RBR19MRU4pOwo+ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJy
b3JzCj4gCgoKR2l2ZW4gdGhlIFBWSCBwYXRjaCBzZXJpZXMgd2FzIHBvc3RlZCA1IGRheXMgYWdv
IGFuZCB0aGUgZm9sbG93aW5nIApjaGFuZ2Ugd2FzIGNvbW1pdHRlZCAzIGRheXMgYWdvLCBJJ20g
YXNzdW1pbmcgdGhpcyBpcyBub3QgcmVsYXRlZCB0byB0aGUgClBWSCBjaGFuZ2VzICh3aGljaCBk
byBub3QgdG91Y2ggdGhpcyBmaWxlKS4KCmNvbW1pdCA5N2I1ODNmNDZjNDM1YWFhNDA5NDJjYTcz
NzM5ZDc5MTkwNzc2YjdmCkF1dGhvcjogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tPgpEYXRlOiAgIFRodSBKYW4gMyAwOTo1NjozNSAyMDE5ICswMTAwCgogICAgIGJs
b2NrL3NoZWVwZG9nOiBVc2UgUUVNVV9OT05TVFJJTkcgZm9yIG5vbiBOVUwtdGVybWluYXRlZCBh
cnJheXMKClJlZ2FyZHMsCkxpYW0KCgo+IAo+IFRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQK
PiBodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNTQ3NTU0Njg3LTEyNjg3LTEtZ2l0LXNlbmQtZW1h
aWwtbGlhbS5tZXJ3aWNrQG9yYWNsZS5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90
eXBlPW1lc3NhZ2UuCj4gLS0tCj4gRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uCj4gUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
