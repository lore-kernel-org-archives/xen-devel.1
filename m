From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 14/21] hw: Do not include
 "sysemu/blockdev.h" if it is not necessary
Date: Tue, 29 May 2018 13:03:57 +0200
Message-ID: <20180529130357.405f501b.cohuck__24981.7740791061$1527597189$gmane$org@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
 <20180528232719.4721-15-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eqt1=iq=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1fNcQB-0008SI-0g
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 11:04:07 +0000
In-Reply-To: <20180528232719.4721-15-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block
 layer core" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Alistair Francis <alistair@alistair23.me>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "open list:virtio-ccw" <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Max
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyOCBNYXkgMjAxOCAyMDoyNzoxMiAtMDMwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToKCj4gUmVtb3ZlIHRob3NlIHVubmVlZGVkIGluY2x1
ZGVzIHRvIHNwZWVkIHVwIHRoZSBjb21waWxhdGlvbgo+IHByb2Nlc3MgYSBsaXR0bGUgYml0Lgo+
IAo+IENvZGUgY2hhbmdlIHByb2R1Y2VkIHdpdGg6Cj4gCj4gICAgICQgZ2l0IGdyZXAgJyNpbmNs
dWRlICJzeXNlbXUvYmxvY2tkZXYuaCInIHwgXAo+ICAgICAgIGN1dCAtZDogLWYtMSB8IFwKPiAg
ICAgICB4YXJncyBlZ3JlcCAtTCAiKEJsb2NrSW50ZXJmYWNlVHlwZXxEcml2ZUluZm98ZHJpdmVf
Z2V0fGJsa19sZWdhY3lfZGluZm98YmxvY2tkZXZfbWFya19hdXRvX2RlbCkiIHwgXAo+ICAgICAg
IHhhcmdzIHNlZCAtaS5iYWsgJy8jaW5jbHVkZSAic3lzZW11XC9ibG9ja2Rldi5oIi9kJwo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+
Cj4gLS0tCj4gIGh3L2Jsb2NrL20yNXA4MC5jICAgICAgICAgIHwgMSAtCj4gIGh3L2Jsb2NrL29u
ZW5hbmQuYyAgICAgICAgIHwgMSAtCj4gIGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jIHwgMSAt
Cj4gIGh3L3MzOTB4L3ZpcnRpby1jY3cuYyAgICAgIHwgMSAtCj4gIGh3L3Njc2kvc2NzaS1nZW5l
cmljLmMgICAgIHwgMSAtCj4gIGh3L3NkL3NkaGNpLmMgICAgICAgICAgICAgIHwgMSAtCj4gIGh3
L3VzYi9kZXYtc3RvcmFnZS5jICAgICAgIHwgMSAtCj4gIG1vbml0b3IuYyAgICAgICAgICAgICAg
ICAgIHwgMSAtCj4gIDggZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBD
b3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
