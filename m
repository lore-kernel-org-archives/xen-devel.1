From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/3] machine: Use shorter
 format for GlobalProperty arrays
Date: Tue, 8 Jan 2019 11:20:12 +0100
Message-ID: <20190108112012.78f3dbb9.cohuck@redhat.com>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-4-ehabkost@redhat.com>
 <20190108064543.asg63onrb3hpripf@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F+WJ=PQ=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1ggoUe-0001yl-O1
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 10:20:20 +0000
In-Reply-To: <20190108064543.asg63onrb3hpripf@sirius.home.kraxel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>, Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA4IEphbiAyMDE5IDA3OjQ1OjQzICswMTAwCkdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPiB3cm90ZToKCj4gICBIaSwKPiAKPiA+ICsgICAgeyAibWlncmF0aW9uIiwgImRl
Y29tcHJlc3MtZXJyb3ItY2hlY2siLCAib2ZmIiB9LAo+ID4gKyAgICB7ICJoZGEtYXVkaW8iLCAi
dXNlLXRpbWVyIiwgImZhbHNlIiB9LAo+ID4gKyAgICB7ICJjaXJydXMtdmdhIiwgImdsb2JhbC12
bXN0YXRlIiwgInRydWUiIH0sCj4gPiArICAgIHsgIlZHQSIsICJnbG9iYWwtdm1zdGF0ZSIsICJ0
cnVlIiB9LAo+ID4gKyAgICB7ICJ2bXdhcmUtc3ZnYSIsICJnbG9iYWwtdm1zdGF0ZSIsICJ0cnVl
IiB9LAo+ID4gKyAgICB7ICJxeGwtdmdhIiwgImdsb2JhbC12bXN0YXRlIiwgInRydWUiIH0sICAK
PiAKPiBJJ2QgbGlrZSB0byBoYXZlIHRoZSBmaWVsZHMgYWxpZ25lZC4gIEVzcGVjaWFsbHkgaW4g
Y2FzZXMgbGlrZSB0aGlzIG9uZQo+IHdoZXJlIG11bHRpcGxlIGRldmljZXMgZ2V0IHRoZSBzYW1l
IHZhbHVlIGFzc2lnbmVkIGl0IG1ha2VzIHRoaW5ncyBtb3JlCj4gcmVhZGFibGU6Cj4gCj4gICAg
IHsgIm1pZ3JhdGlvbiIsICAgImRlY29tcHJlc3MtZXJyb3ItY2hlY2siLCAib2ZmIiAgIH0sCj4g
ICAgIHsgImhkYS1hdWRpbyIsICAgInVzZS10aW1lciIsICAgICAgICAgICAgICAiZmFsc2UiIH0s
Cj4gICAgIHsgImNpcnJ1cy12Z2EiLCAgImdsb2JhbC12bXN0YXRlIiwgICAgICAgICAidHJ1ZSIg
IH0sCj4gICAgIHsgIlZHQSIsICAgICAgICAgImdsb2JhbC12bXN0YXRlIiwgICAgICAgICAidHJ1
ZSIgIH0sCj4gICAgIHsgInZtd2FyZS1zdmdhIiwgImdsb2JhbC12bXN0YXRlIiwgICAgICAgICAi
dHJ1ZSIgIH0sCj4gICAgIHsgInF4bC12Z2EiLCAgICAgImdsb2JhbC12bXN0YXRlIiwgICAgICAg
ICAidHJ1ZSIgIH0sCj4gCj4gdGhhbmtzLAo+ICAgR2VyZAo+IAoKSSdtIGEgYml0IG9uIHRoZSBm
ZW5jZSBoZXJlLiBJdCBkb2VzIG1ha2UgdGhpbmdzIG1vcmUgcmVhZGFibGUgKGF0CmxlYXN0IGlu
IHlvdXIgZXhhbXBsZSksIGJ1dCBJIGZpbmQgZWRpdGluZyBhbGlnbmVkIHRhYmxlcyBhIGJpdAph
bm5veWluZy4gT1RPSCwgdGhhdCB3b24ndCBoYXBwZW4gb2Z0ZW4sIGFueXdheS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
