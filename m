From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Fri, 9 Mar 2018 09:55:57 -0300
Message-ID: <20180309125557.GH3417__30752.5535034531$1520600104$gmane$org@localhost.localdomain>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
 <20180308200345.GD3417@localhost.localdomain>
 <23202.28943.344150.512881@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pjas=f7=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1euHZD-0007zS-Gm
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 12:56:11 +0000
Content-Disposition: inline
In-Reply-To: <23202.28943.344150.512881@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMTE6MzM6MzVBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRWR1YXJkbyBIYWJrb3N0IHdyaXRlcyAoIlJlOiBbUEFUQ0ggMDMvMTFdIHhlbjogZGVm
ZXIgY2FsbCB0byB4ZW5fcmVzdHJpY3QgdW50aWwganVzdCBiZWZvcmUgb3Nfc2V0dXBfcG9zdCIp
Ogo+ID4gT24gVGh1LCBNYXIgMDgsIDIwMTggYXQgMDU6Mzk6MDlQTSArMDAwMCwgSWFuIEphY2tz
b24gd3JvdGU6Cj4gPiBbLi4uXQo+ID4gPiBkaWZmIC0tZ2l0IGEvdmwuYyBiL3ZsLmMKPiA+ID4g
KyAgICB4ZW5fc2V0dXBfcG9zdCgpOwo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBo
YXZlIGFjY2VsZXJhdG9yLXNwZWNpZmljIGNvZGUgaW4gbWFpbigpLAo+ID4gaWYgd2UgYWxyZWFk
eSBoYXZlIGFjY2VsZXJhdG9yIGNsYXNzZXMgdGhhdCBjYW4gYWJzdHJhY3QgdGhhdAo+ID4gb3V0
LiAgSSBzdWdnZXN0IGFkZGluZyBhIEFjY2VsQ2xhc3M7OnNldHVwX3Bvc3QoKSBtZXRob2QgdGhh
dCBjYW4KPiA+IGJlIGNhbGxlZCBoZXJlLgo+IAo+IEkgdGhpbmsgSSBjYW4gZG8gdGhhdC4KPiAK
PiBBbHRob3VnaCwgaXQgaXMgYSBiaXQgZGlzYXBwb2ludGluZyB0byBiZSBnaXZlbiB0aGlzIGZl
ZWRiYWNrIGluIHY2IG9mCj4gdGhpcyBzZXJpZXMuICBEaWQgdGhlIHJpZ2h0IHBlb3BsZSBub3Qg
Z2V0IENDJ2Qgb24gdjUgaW4gT2N0b2JlciA/CgpUaGF0IGlzIGVudGlyZWx5IG15IGZhdWx0LCBm
b3Igbm90IHBheWluZyBhdHRlbnRpb24gdG8gdGhlIHBhdGNoCmJhY2sgaW4gb2N0b2JlciAoSSB3
YXMgQ0NlZCBvbiBpdCkuICBTb3JyeSBmb3IgdGhhdC4KCi0tIApFZHVhcmRvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
