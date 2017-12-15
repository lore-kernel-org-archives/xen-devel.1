From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Thu, 14 Dec 2017 18:24:30 -0600
Message-ID: <20171215002430.GS30595__38697.8162256584$1513297535$gmane$org@bhelgaas-glaptop.roam.corp.google.com>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171214125206.GA24958@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i1mu=dl=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1ePdnv-0005cf-2h
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 00:24:43 +0000
Content-Disposition: inline
In-Reply-To: <20171214125206.GA24958@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: jgross@suse.com, Govinda Tatti <Govinda.Tatti@Oracle.COM>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, JBeulich@suse.com, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTQsIDIwMTcgYXQgMDQ6NTI6MDZBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBEZWMgMTMsIDIwMTcgYXQgMDM6MjQ6MjFQTSAtMDYwMCwgQmpv
cm4gSGVsZ2FhcyB3cm90ZToKPiA+IFByaW9yIHRvIGE2MGEyYjczYmE2OSwgd2UgaGFkCj4gPiAK
PiA+ICAgaW50IHBjaWVfZmxyKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBwcm9iZSk7Cj4gPiAK
PiA+IGxpa2UgYWxsIHRoZSBvdGhlciByZXNldCBtZXRob2RzLiAgQUZBSUNULCB0aGUgYWRkaXRp
b24gb2YKPiA+IHBjaWVfaGFzX2ZscigpIHdhcyB0byBvcHRpbWl6ZSB0aGUgcGF0aCBzbGlnaHRs
eSBiZWNhdXNlIHdoZW4gZHJpdmVycwo+ID4gY2FsbCBwY2llX2ZscigpLCB0aGV5IHNob3VsZCBh
bHJlYWR5IGtub3cgdGhhdCB0aGVpciBoYXJkd2FyZSBzdXBwb3J0cwo+ID4gRkxSLiAgQnV0IEkg
ZG9uJ3QgdGhpbmsgdGhhdCBvcHRpbWl6YXRpb24gaXMgd29ydGggdGhlIGV4dHJhIGNvZGUKPiA+
IGNvbXBsZXhpdHkuICBJZiB3ZSBkbyBuZWVkIHRvIG9wdGltaXplIGl0LCB3ZSBjYW4gY2hlY2sg
dGhpcyBpbiB0aGUKPiA+IGNvcmUgZHVyaW5nIGVudW1lcmF0aW9uIGFuZCBzZXQgUENJX0RFVl9G
TEFHU19OT19GTFJfUkVTRVQKPiA+IGFjY29yZGluZ2x5Lgo+ID4gCj4gPiBDaHJpc3RvcGgsIGNo
aW1lIGluIGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLgo+IAo+IERpZG4ndCB3ZSBqdXN0
IGhhdmUgdGhhdCBkaXNjdXNzaW9uIGluIGFub3RoZXIgdGhyZWFkIGEgZmV3IGRheXMKPiBhZ28/
CgpQcm9iYWJseSwgYnV0IEkgZGlkbid0IGhhdmUgYSBjbGVhciBwaWN0dXJlIG9mIHdoYXQgeW91
IHdlcmUgc3VnZ2VzdGluZy4KCj4gSSB0aGluayB0aGF0IHRoZSBwY2llX2hhc19mbHIgd2FzIGEg
bWlzdGFrZSBpbiByZXRyb3NwZWN0aXZlIGJ1dCBJCj4gdGhpbmsgdGhlIGJvb2wgcHJvYmUgQVBJ
IHdhcyBhbiBldmVuIGJpZ2dlciBtaXN0YWtlLiAgVGhlIG9ubHkgdXNlCj4gb2YgaXQgaXMgdG8g
aGlkZSB0aGUgcmVzZXQgYXR0cmlidXRlIGluIHN5c2ZzLiAgSSdkIG11Y2ggcmF0aGVyIGFsd2F5
cwo+IGhhdmUgaXQgYW5kIGhhdmUgaXQgcmV0dXJuIEVPUE5PVFNVUFAgaWYgbm8gcmVzZXQgbWV0
aG9kIGlzIHN1cHBvcnRlZC4KPiAKPiBJIGNhbiBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQgaWYgaXQg
c291bmRzIGZpbmUgdG8geW91LgoKSWYgeW91IGNhbiBnZXQgcmlkIG9mIHRoZSB3aG9sZSBwcm9i
ZSBpbmZyYXN0cnVjdHVyZSwgdGhhdCBzb3VuZHMKZ29vZCB0byBtZS4KCkJqb3JuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
