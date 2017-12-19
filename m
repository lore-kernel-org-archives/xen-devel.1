From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-devel] [PATCH V5] pci: removed the is_express
 field since a uniform interface was inserted
Date: Tue, 19 Dec 2017 14:42:18 -0200
Message-ID: <20171219164218.GB4836@localhost.localdomain>
References: <20171218152140.17985-1-ybettan@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qjqi=dp=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1eRKyT-0001Xd-3J
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 16:42:37 +0000
Content-Disposition: inline
In-Reply-To: <20171218152140.17985-1-ybettan@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yoni Bettan <ybettan@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:nvme" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>, Anthony Perard <anthony.perard@citrix.com>, Alex Williamson <alex.williamson@redhat.com>, Paul Burton <paul.burton@mips.com>, Paolo Bonzini <pbonzini@redhat.com>, Dmitry Fleytman <dmitry@daynix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTgsIDIwMTcgYXQgMDU6MjE6NDBQTSArMDIwMCwgWW9uaSBCZXR0YW4gd3Jv
dGU6Cj4gYWNjb3JkaW5nIHRvIEVkdWFyZG8gSGFia29zdCdzIGNvbW1pdCBmZDNiMDJjODg5IGFs
bCBQQ0lFcyBub3cgaW1wbGVtZW50Cj4gSU5URVJGQUNFX1BDSUVfREVWSUNFIHNvIHdlIGRvbid0
IG5lZWQgaXNfZXhwcmVzcyBmaWVsZCBhbnltb3JlLgo+IAo+IERldmljZXMgdGhhdCBpbXBsZW1l
bnRzIG9ubHkgSU5URVJGQUNFX1BDSUVfREVWSUNFIChpc19leHByZXNzID09IDEpCj4gb3IKPiBk
ZXZpY2VzIHRoYXQgaW1wbGVtZW50cyBvbmx5IElOVEVSRkFDRV9DT05WRU5USU9OQUxfUENJX0RF
VklDRSAoaXNfZXhwcmVzcyA9PSAwKQo+IHdoZXJlIG5vdCBhZmZlY3RlZCBieSB0aGUgY2hhbmdl
Lgo+IAo+IFRoZSBvbmx5IGRldmljZXMgdGhhdCB3ZXJlIGFmZmVjdGVkIGFyZSB0aG9zZSB0aGF0
IGFyZSBoeWJyaWQgYW5kIGFsc28KPiBoYWQgKGlzX2V4cHJlc3MgPT0gMSkgLSB0aGVyZWZvciBv
bmx5Ogo+ICAgLSBody92ZmlvL3BjaS5jCj4gICAtIGh3L3VzYi9oY2QteGhjaS5jCj4gICAtIGh3
L3hlbi94ZW5fcHQuYwo+IAo+IEZvciB0aG9zZSAzIEkgbWFkZSBzdXJlIHRoYXQgUUVNVV9QQ0lf
Q0FQX0VYUFJFU1MgaXMgb24gaW4gaW5zdGFuY2VfaW5pdCgpCj4gCj4gU2lnbmVkLW9mZi1ieTog
WW9uaSBCZXR0YW4gPHliZXR0YW5AcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBFZHVhcmRvIEhh
Ymtvc3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+CgotLSAKRWR1YXJkbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
