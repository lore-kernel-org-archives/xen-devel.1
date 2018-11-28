From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-block] [PATCH 02/18] xen: introduce new
 'XenBus' and 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 17:19:17 +0100
Message-ID: <20181128161917.GE4222__40818.0324979641$1543421966$gmane$org@dhcp-200-186.str.redhat.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p1tf=oh=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1gS2Yc-0004iD-Lu
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:19:22 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-3-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

QW0gMjEuMTEuMjAxOCB1bSAxNjoxMSBoYXQgUGF1bCBEdXJyYW50IGdlc2NocmllYmVuOgo+IFRo
aXMgcGF0Y2ggYWRkcyB0aGUgYmFzaWMgYm9pbGVycGxhdGUgZm9yIGEgJ1hlbkJ1cycgb2JqZWN0
IHRoYXQgd2lsbCBhY3QKPiBhcyBhIHBhcmVudCB0byAnWGVuRGV2aWNlJyBQViBiYWNrZW5kcy4K
PiBBIG5ldyAnWGVuQnJpZGdlJyBvYmplY3QgaXMgYWxzbyBhZGRlZCB0byBjb25uZWN0IFhlbkJ1
cyB0byB0aGUgc3lzdGVtIGJ1cy4KPiAKPiBUaGUgWGVuQnVzIG9iamVjdCBpcyBpbnN0YW50aWF0
ZWQgYnkgYSBuZXcgeGVuX2J1c19pbml0KCkgZnVuY3Rpb24gY2FsbGVkCj4gZnJvbSB0aGUgc2Ft
ZSBzaXRlcyBhcyB0aGUgbGVnYWN5IHhlbl9iZV9pbml0KCkgZnVuY3Rpb24uCj4gCj4gU3Vic2Vx
dWVudCBwYXRjaGVzIHdpbGwgZmxlc2gtb3V0IHRoZSBmdW5jdGlvbmFsaXR5IG9mIHRoZXNlIG9i
amVjdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1
cy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kZWRlMmQ5MTRh
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2h3L3hlbi94ZW4tYnVzLmMKPiBAQCAtMCwwICsxLDEy
NSBAQAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIENpdHJpeCBTeXN0ZW1zIEluYy4KPiArICog
QWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICovCgpUaGlzIGRvZXNuJ3QgbG9vayB2ZXJ5IGNvbXBh
dGlibGUgd2l0aCB0aGUgR1BMLiBJbiBmYWN0IGl0IG1pZ2h0IGV2ZW4KbWFrZSBpdCBpbGxlZ2Fs
IGZvciB0aGUgUUVNVSBwcm9qZWN0IHRvIGRpc3RyaWJ1dGUgdGhpcyBjb2RlLiA6LSkKCk90aGVy
IGZpbGVzIHlvdSBhZGQgdGhyb3VnaG91dCB0aGUgc2VyaWVzIHNlZW0gdG8gaGF2ZSB0aGUgc2Ft
ZSBwcm9ibGVtLgoKS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
