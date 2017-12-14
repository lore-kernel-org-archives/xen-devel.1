From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Thu, 14 Dec 2017 04:52:06 -0800
Message-ID: <20171214125206.GA24958__10504.9068145037$1513255988$gmane$org@infradead.org>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=natu=dk=bombadil.srs.infradead.org=batv+30cbe128c006e9007863+5226+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ePSzn-0005lA-A4
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 12:52:15 +0000
Content-Disposition: inline
In-Reply-To: <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: jgross@suse.com, Govinda Tatti <Govinda.Tatti@Oracle.COM>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, JBeulich@suse.com, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTMsIDIwMTcgYXQgMDM6MjQ6MjFQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBQcmlvciB0byBhNjBhMmI3M2JhNjksIHdlIGhhZAo+IAo+ICAgaW50IHBjaWVfZmxy
KHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBwcm9iZSk7Cj4gCj4gbGlrZSBhbGwgdGhlIG90aGVy
IHJlc2V0IG1ldGhvZHMuICBBRkFJQ1QsIHRoZSBhZGRpdGlvbiBvZgo+IHBjaWVfaGFzX2Zscigp
IHdhcyB0byBvcHRpbWl6ZSB0aGUgcGF0aCBzbGlnaHRseSBiZWNhdXNlIHdoZW4gZHJpdmVycwo+
IGNhbGwgcGNpZV9mbHIoKSwgdGhleSBzaG91bGQgYWxyZWFkeSBrbm93IHRoYXQgdGhlaXIgaGFy
ZHdhcmUgc3VwcG9ydHMKPiBGTFIuICBCdXQgSSBkb24ndCB0aGluayB0aGF0IG9wdGltaXphdGlv
biBpcyB3b3J0aCB0aGUgZXh0cmEgY29kZQo+IGNvbXBsZXhpdHkuICBJZiB3ZSBkbyBuZWVkIHRv
IG9wdGltaXplIGl0LCB3ZSBjYW4gY2hlY2sgdGhpcyBpbiB0aGUKPiBjb3JlIGR1cmluZyBlbnVt
ZXJhdGlvbiBhbmQgc2V0IFBDSV9ERVZfRkxBR1NfTk9fRkxSX1JFU0VUCj4gYWNjb3JkaW5nbHku
Cj4gCj4gQ2hyaXN0b3BoLCBjaGltZSBpbiBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZS4K
CkRpZG4ndCB3ZSBqdXN0IGhhdmUgdGhhdCBkaXNjdXNzaW9uIGluIGFub3RoZXIgdGhyZWFkIGEg
ZmV3IGRheXMKYWdvPyAgSSB0aGluayB0aGF0IHRoZSBwY2llX2hhc19mbHIgd2FzIGEgbWlzdGFr
ZSBpbiByZXRyb3NwZWN0aXZlIGJ1dCBJCnRoaW5rIHRoZSBib29sIHByb2JlIEFQSSB3YXMgYW4g
ZXZlbiBiaWdnZXIgbWlzdGFrZS4gIFRoZSBvbmx5IHVzZQpvZiBpdCBpcyB0byBoaWRlIHRoZSBy
ZXNldCBhdHRyaWJ1dGUgaW4gc3lzZnMuICBJJ2QgbXVjaCByYXRoZXIgYWx3YXlzCmhhdmUgaXQg
YW5kIGhhdmUgaXQgcmV0dXJuIEVPUE5PVFNVUFAgaWYgbm8gcmVzZXQgbWV0aG9kIGlzIHN1cHBv
cnRlZC4KCkkgY2FuIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCBpZiBpdCBzb3VuZHMgZmluZSB0byB5
b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
