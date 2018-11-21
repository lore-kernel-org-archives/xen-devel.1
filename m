From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v5 02/24] hw: acpi: Export ACPI build
 alignment API
Date: Wed, 21 Nov 2018 15:42:50 +0100
Message-ID: <20181121144250.GG4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-3-sameo@linux.intel.com>
 <20181109152716.236d3c6e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uxgw=oa=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gPTj0-0004B7-2H
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 14:43:30 +0000
Content-Disposition: inline
In-Reply-To: <20181109152716.236d3c6e@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDksIDIwMTggYXQgMDM6Mjc6MTZQTSArMDEwMCwgSWdvciBNYW1tZWRvdiB3
cm90ZToKPiBPbiBNb24sICA1IE5vdiAyMDE4IDAyOjQwOjI1ICswMTAwCj4gU2FtdWVsIE9ydGl6
IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBpcyBnb2luZyB0byBi
ZSBuZWVkZWQgYnkgdGhlIEhhcmR3YXJlLXJlZHVjZWQgQUNQSSByb3V0aW5lcy4KPiA+IAo+ID4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4K
PiA+IFRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIE9ydGl6IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+
Cj4gdGhlIHBhdGNoIGlzIHByb2JhYmx5IG1pc3BsYWNlZCB3aXRoaW5nIHNlcmllcywKPiBpZiB0
aGVyZSBpcyBhbiBleHRlcm5hbCB1c2VyIHdpdGhpbiB0aGlzIHNlcmllcyB0aGVuIHRoaXMgcGF0
Y2ggc2hvdWxkCj4gYmUgc3F1YXNoZWQgdGhlcmUsIG90aGVyd2lzZSBpdCBkb2Vzbid0IGJlbG9u
ZyB0byB0aGlzIHNlcmllcy4KaHcvYWNwaS9yZWR1Y2VkLmMgbmVlZHMgaXQsIEkgZm9yZ290IHRv
IHJlbW92ZSB0aGF0IHBhdGNoIHdoZW4gcmVtb3ZpbmcKdGhlIGhhcmR3YXJlLXJlZHVjZWQgY29k
ZSBmcm9tIHRoZSBzZXJpZS4gSSB3aWxsIHJlbW92ZSBpdC4KCkNoZWVycywKU2FtdWVsLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
