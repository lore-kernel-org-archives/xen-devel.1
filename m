From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 18/39] ARM: new VGIC: Add CTLR,
 TYPER and IIDR handlers
Date: Wed, 28 Mar 2018 10:20:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803281019080.15200@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-19-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803271329370.12360@sstabellini-ThinkPad-X260>
 <22aabd4d-df1b-0743-5453-c453e9754784@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yb8v=gs=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f1EkS-0000E9-Q5
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 17:20:32 +0000
In-Reply-To: <22aabd4d-df1b-0743-5453-c453e9754784@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: marc.zyngier@arm.com, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24gMjcvMDMvMTgg
MjE6MzgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMjEgTWFyIDIwMTgs
IEFuZHJlIFByenl3YXJhIHdyb3RlOgo+ID4+IFRob3NlIHRocmVlIHJlZ2lzdGVycyBhcmUgdjIg
ZW11bGF0aW9uIHNwZWNpZmljLCBzbyB0aGVpciBpbXBsZW1lbnRhdGlvbgo+ID4+IGxpdmVzIGVu
dGlyZWx5IGluIHZnaWMtbW1pby12Mi5jLiBBbHNvIHRoZXkgYXJlIGhhbmRsZWQgaW4gb25lIGZ1
bmN0aW9uLAo+ID4+IGFzIHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIHByZXR0eSBzaW1wbGUuCj4g
Pj4gV2UgY2hvb3NlIHRvIHBpZ2d5LWJhY2sgb24gdGhlIGV4aXN0aW5nIEtWTSBpZGVudGlmaWNh
dGlvbiByZWdpc3RlcnMsCj4gPj4gYnV0IHVzZSBhIGRpZmZlcmVudCB2YXJpYW50IChtYWpvciBy
ZXZpc2lvbikuCj4gPiAKPiA+IENDJ2luZyBNYXJjLgo+ID4gCj4gPiBSZXVzaW5nIHRoZSBLVk0g
cHJvZHVjdCBJRCBjb3VsZCBjYXVzZSBpc3N1ZXMsIGZvciBpbnN0YW5jZSB3ZSBjb3VsZAo+ID4g
Y2xhc2ggd2l0aCBLVk0gaWYgTGludXggY2hhbmdlcyB0aGUgTWFqb3IgbnVtYmVyLiBJZiB3ZSB3
ZXJlIHRvIGFjdHVhbGx5Cj4gPiByZXVzZSBLVk0ncyBQUk9EVUNUX0lEIHdlIHdvdWxkIG5lZWQg
YSBiZXR0ZXIgY29vcmRpbmF0aW9uIGluIHBsYWNlLgo+IAo+IE1hcmMgaXMgYXdhcmUgb2YgdGhp
cywgYXMgdGhpcyBhcHByb2FjaCB3YXMgZGVjaWRlZCBhZnRlciBhIGJyaWVmCj4gZGlzY3Vzc2lv
biB3aXRoIEp1bGllbiBhbmQgaGltIGxhc3Qgd2Vlay4KPiBJZiB3ZSBuZWVkIGEgcXVpcmsgb24g
dGhlIChndWVzdCkgR0lDIGRyaXZlciBzaWRlIGZvciB0aGUgS1ZNIFZHSUMsIEtWTQo+IHdvdWxk
IGJ1bXAgdGhlIHJldmlzaW9uIG51bWJlciwgbm90IHRoZSB2YXJpYW50Lgo+IFRoaXMgaXMgYSBn
b29kIGFzIGNvb3JkaW5hdGlvbiBjYW4gcmVhbGlzdGljYWxseSBldmVyIGdldC4KClN1cmUsIGFz
IGxvbmcgYXMgaXQgZ2V0cyBkb2N1bWVudGVkLiBJdCBuZWVkcyB0byBiZSB3cml0dGVuIGRvd24K
c29tZXdoZXJlIGFuZCBjb21taXR0ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
