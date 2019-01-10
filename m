From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/3] machine: Use shorter
 format for GlobalProperty arrays
Date: Wed, 9 Jan 2019 22:43:07 -0200
Message-ID: <20190110004307.GE4500__35142.4893168316$1547080945$gmane$org@habkost.net>
References: <20190107193020.21744-1-ehabkost@redhat.com>
 <20190107193020.21744-4-ehabkost@redhat.com>
 <20190108064543.asg63onrb3hpripf@sirius.home.kraxel.org>
 <20190108112012.78f3dbb9.cohuck@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5y6=PS=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1ghORT-0006Zb-A0
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 00:43:27 +0000
Content-Disposition: inline
In-Reply-To: <20190108112012.78f3dbb9.cohuck@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Richard Henderson <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDgsIDIwMTkgYXQgMTE6MjA6MTJBTSArMDEwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBUdWUsIDggSmFuIDIwMTkgMDc6NDU6NDMgKzAxMDAKPiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiAgIEhpLAo+ID4gCj4gPiA+ICsgICAg
eyAibWlncmF0aW9uIiwgImRlY29tcHJlc3MtZXJyb3ItY2hlY2siLCAib2ZmIiB9LAo+ID4gPiAr
ICAgIHsgImhkYS1hdWRpbyIsICJ1c2UtdGltZXIiLCAiZmFsc2UiIH0sCj4gPiA+ICsgICAgeyAi
Y2lycnVzLXZnYSIsICJnbG9iYWwtdm1zdGF0ZSIsICJ0cnVlIiB9LAo+ID4gPiArICAgIHsgIlZH
QSIsICJnbG9iYWwtdm1zdGF0ZSIsICJ0cnVlIiB9LAo+ID4gPiArICAgIHsgInZtd2FyZS1zdmdh
IiwgImdsb2JhbC12bXN0YXRlIiwgInRydWUiIH0sCj4gPiA+ICsgICAgeyAicXhsLXZnYSIsICJn
bG9iYWwtdm1zdGF0ZSIsICJ0cnVlIiB9LCAgCj4gPiAKPiA+IEknZCBsaWtlIHRvIGhhdmUgdGhl
IGZpZWxkcyBhbGlnbmVkLiAgRXNwZWNpYWxseSBpbiBjYXNlcyBsaWtlIHRoaXMgb25lCj4gPiB3
aGVyZSBtdWx0aXBsZSBkZXZpY2VzIGdldCB0aGUgc2FtZSB2YWx1ZSBhc3NpZ25lZCBpdCBtYWtl
cyB0aGluZ3MgbW9yZQo+ID4gcmVhZGFibGU6Cj4gPiAKPiA+ICAgICB7ICJtaWdyYXRpb24iLCAg
ICJkZWNvbXByZXNzLWVycm9yLWNoZWNrIiwgIm9mZiIgICB9LAo+ID4gICAgIHsgImhkYS1hdWRp
byIsICAgInVzZS10aW1lciIsICAgICAgICAgICAgICAiZmFsc2UiIH0sCj4gPiAgICAgeyAiY2ly
cnVzLXZnYSIsICAiZ2xvYmFsLXZtc3RhdGUiLCAgICAgICAgICJ0cnVlIiAgfSwKPiA+ICAgICB7
ICJWR0EiLCAgICAgICAgICJnbG9iYWwtdm1zdGF0ZSIsICAgICAgICAgInRydWUiICB9LAo+ID4g
ICAgIHsgInZtd2FyZS1zdmdhIiwgImdsb2JhbC12bXN0YXRlIiwgICAgICAgICAidHJ1ZSIgIH0s
Cj4gPiAgICAgeyAicXhsLXZnYSIsICAgICAiZ2xvYmFsLXZtc3RhdGUiLCAgICAgICAgICJ0cnVl
IiAgfSwKPiA+IAo+ID4gdGhhbmtzLAo+ID4gICBHZXJkCj4gPiAKPiAKPiBJJ20gYSBiaXQgb24g
dGhlIGZlbmNlIGhlcmUuIEl0IGRvZXMgbWFrZSB0aGluZ3MgbW9yZSByZWFkYWJsZSAoYXQKPiBs
ZWFzdCBpbiB5b3VyIGV4YW1wbGUpLCBidXQgSSBmaW5kIGVkaXRpbmcgYWxpZ25lZCB0YWJsZXMg
YSBiaXQKPiBhbm5veWluZy4gT1RPSCwgdGhhdCB3b24ndCBoYXBwZW4gb2Z0ZW4sIGFueXdheS4K
CkknbSB1bnN1cmUsIHRvby4gIEFsc28sIG5vdCBtZXJnaW5nIHRoaXMgc2VyaWVzIGlzIGluY3Jl
YXNpbmcgdGhlCmxpa2VsaWhvb2Qgb2YgY29uZmxpY3RzIHdpdGggb3RoZXIgcGF0Y2hlcy4gIEkn
bSBxdWV1ZWluZyB0aGlzCnZlcnNpb24sIGFuZCB3ZSBjYW4gZGlzY3VzcyBhbGlnbm1lbnQgYWx0
ZXJuYXRpdmVzIGxhdGVyLgoKKEknbSBsZXNzIHdvcnJpZWQgYWJvdXQgY29uZmxpY3RzIGNhdXNl
ZCBieSBmdXR1cmUgYWxpZ25tZW50CnBhdGNoZXMgYmVjYXVzZSBhbGlnbm1lbnQgY29uZmxpY3Rz
IGFyZSBlYXNpZXIgdG8gc29ydCBvdXQgdGhhbgpyZWRvaW5nIHRoZSAuZHJpdmVyLy5wcm9wZXJ0
eS8udmFsdWUgY29udmVyc2lvbikuCgotLSAKRWR1YXJkbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
