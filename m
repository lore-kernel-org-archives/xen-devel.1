From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/3] spapr: Eliminate
 SPAPR_PCI_2_7_MMIO_WIN_SIZE macro
Date: Tue, 8 Jan 2019 10:59:46 +0100
Message-ID: <20190108105946.5fdd8e38.cohuck@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-2-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F+WJ=PQ=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1ggoAx-00084T-Sl
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 09:59:59 +0000
In-Reply-To: <20190107193020.21744-2-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAgNyBKYW4gMjAxOSAxNzozMDoxOCAtMDIwMApFZHVhcmRvIEhhYmtvc3QgPGVoYWJr
b3N0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBUaGUgbWFjcm8gaXMgb25seSB1c2VkIGluIG9uZSBw
bGFjZSwgd2hlcmUgdGhlIHB1cnBvc2Ugb2YgdGhlCj4gdmFsdWUgaXMgb2J2aW91cy4gIEVsaW1p
bmF0ZSB0aGUgbWFjcm8gc28gd2UgZG9uJ3QgbmVlZCB0byByZWx5Cj4gb24gc3RyaW5naWZ5KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRWR1YXJkbyBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29t
Pgo+IC0tLQo+ICBpbmNsdWRlL2h3L3BjaS1ob3N0L3NwYXByLmggfCAxIC0KPiAgaHcvcHBjL3Nw
YXByLmMgICAgICAgICAgICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0By
ZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
