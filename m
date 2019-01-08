From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 2/3] machine: Eliminate unnecessary
 stringify() usage
Date: Tue, 8 Jan 2019 11:03:38 +0100
Message-ID: <20190108110338.60749ad6.cohuck@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-3-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F+WJ=PQ=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1ggoEj-0000Ps-TX
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 10:03:53 +0000
In-Reply-To: <20190107193020.21744-3-ehabkost@redhat.com>
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

T24gTW9uLCAgNyBKYW4gMjAxOSAxNzozMDoxOSAtMDIwMApFZHVhcmRvIEhhYmtvc3QgPGVoYWJr
b3N0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiBzdHJpbmdpZnkoKSBpcyB1c2VmdWwgd2hlbiB3ZSBu
ZWVkIHRvIHVzZSBtYWNyb3MgaW4gY29tcGF0X3Byb3BzCj4gKGxpa2Ugd2hlbiB3ZSBzZXQgdmly
dGlvLWJhbG9vbi1wY2kuY2xhc3M9UENJX0NMQVNTX01FTU9SWV9SQU0gYXQKPiBwY19pNDQwZnhf
MV8wX21hY2hpbmVfb3B0aW9ucygpKSwgYnV0IGl0IGlzIHBvaW50bGVzcyB3aGVuIHdlIGFyZQo+
IGFscmVhZHkgcHJvdmlkaW5nIGEgbnVtYmVyIGxpdGVyYWwuCj4gCj4gUmVwbGFjZSBzdHJpbmdp
ZnkoKSB3aXRoIHN0cmluZyBsaXRlcmFscyB3aGVuIGFwcHJvcHJpYXRlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcv
Y29yZS9tYWNoaW5lLmMgfCAgOCArKy0tCj4gIGh3L2kzODYvcGMuYyAgICAgIHwgOTQgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaHcvaTM4Ni9wY19w
aWl4LmMgfCAzMCArKysrKysrLS0tLS0tLS0KPiAgaHcvcHBjL3NwYXByLmMgICAgfCAgMiArLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQoKUmV2
aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
