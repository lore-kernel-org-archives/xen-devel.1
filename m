From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [RFC v2] xen/arm: Suspend to RAM Support in Xen for
 ARM
Date: Tue, 23 Jan 2018 18:58:57 +0700
Message-ID: <20180123115857.GB1706@toto>
References: <20171222174137.30076-1-mirela.simonovic@aggios.com>
 <f2c7c2c2-0498-4135-3031-853b04c64be6@linaro.org>
 <CAPD2p-n8wE5HPgjBPDX9fGGx=7SNS+gcNy3uqEaFKzwAWm09HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <CAPD2p-n8wE5HPgjBPDX9fGGx=7SNS+gcNy3uqEaFKzwAWm09HA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDE6NTI6NTBQTSArMDIwMCwgT2xla3NhbmRyIFR5c2hj
aGVua28gd3JvdGU6Cj4gSGkgTWlyZWxhLAo+IAo+IEp1c3Qgc29tZSByZW1hcmtzIHJlZ2FyZGlu
ZyB0aGUgc2NvcGUgb2Ygd29yazoKPiAKPiArSW4gYWRkaXRpb24sIHRoZSBmb2xsb3dpbmcgaGF2
ZSB0byBiZSBpbXBsZW1lbnRlZDoKPiArKiBTdXNwZW5kL3Jlc3VtZSB2Q1BVICh0cmlnZ2VyZWQg
YnkgdlNZU1RFTV9TVVNQRU5EIGNhbGwpCj4gKyogU3VzcGVuZC9yZXN1bWUgWGVuICh0cmlnZ2Vy
ZWQgYnkgdlNZU1RFTV9TVVNQRU5EIGNhbGxlZCBieSBEb20wKSwgaW5jbHVkaW5nOgo+ICsgICAg
ICAgKiBEaXNhYmxlIHdhdGhkb2cgb24gc3VzcGVuZCwgZW5hYmxlIGl0IG9uIHJlc3VtZQo+ICsg
ICAgICAgKiBQYXVzZSBkb21haW5zIG9uIHN1c3BlbmQsIHVucGF1c2UgdGhlbSBvbiByZXN1bWUK
PiArICAgICAgICogRGlzYWJsZSBub24tYm9vdCBwQ1BVcyBvbiBzdXNwZW5kLCBlbmFibGUgdGhl
bSBvbiByZXN1bWUKPiArICAgICAgICogU2F2ZS9yZXN0b3JlIG9mIEdJQyBjb25maWd1cmF0aW9u
Cj4gKyAgICAgICAqIFN1c3BlbmQvcmVzdW1lIHRpbWVyCj4gKyAgICAgICAqIFNhdmUvcmVzdG9y
ZSBvZiBFTDIgY29udGV4dAo+ICsgICAgICAgKiBJbXBsZW1lbnQgcmVzdW1lIGVudHJ5IHBvaW50
IGluIFhlbiwgaW5jbHVkaW5nIE1NVSBjb25maWd1cmF0aW9uCj4gCj4gSSB0aGluayB0aGF0IHNh
dmluZy9yZXN0b3JpbmcgSU9NTVUgcmVnaXN0ZXJzL2NvbnRleHQgc2hvdWxkIGJlCj4gaW1wbGVt
ZW50ZWQgYXMgd2VsbC4KClllcywgZ29vZCBwb2ludC4KTWlyZWxhLCBJIHRoaW5rIHRoYXQgaW4g
dGhlIFpVKyBjYXNlIHRoZSBJT01NVSBhY3R1YWxseSBnZXRzIHBvd2VyZWQgZG93bgp3aXRoIHRo
ZSBGUEQuCgoKPiBJbiBvdGhlciB3b3JkcywgZWFjaCBpbnZvbHZlZCBwbGF0Zm9ybSBkZXZpY2Ug
ZHJpdmVyIGluIFhlbiBvbiBBUk0KPiAoSU9NTVUtWFgsIFVBUlQtWFgsIGV0Yykgc2hvdWxkIGhh
dmUgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzCj4gaW1wbGVtZW50ZWQuCgpZZXMgYWdyZWVkLgoK
QmVzdCByZWdhcmRzLApFZGdhcgoKCj4gCj4gLS0gCj4gUmVnYXJkcywKPiAKPiBPbGVrc2FuZHIg
VHlzaGNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
