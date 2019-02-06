From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Wed, 6 Feb 2019 16:52:33 +0000
Message-ID: <23643.4305.505749.803438@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901161630210.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
 <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
 <76A2DEED0200005600417A66@prv1-mh.provo.novell.com>
 <5C41A256020000780020EF25@prv1-mh.provo.novell.com>
 <5A96F2FD0200008D00417A66@prv1-mh.provo.novell.com>
 <58377FAD0200004688BF86FB@prv1-mh.provo.novell.com>
 <5C4599C2020000780020F9D6@prv1-mh.provo.novell.com>
 <23643.13.22252.324537@mariner.uk.xensource.com>
 <58B0ADFB020000D800417A66@prv1-mh.provo.novell.com>
 <27086E4A0200006A88BF86FB@prv1-mh.provo.novell.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <7A8C0A4F020000EEB8D7C7D4@prv1-mh.provo.novell.com>
 <5C5B09910200007800214659@prv1-mh.provo.novell.com>
 <23643.3403.803290.647664@mariner.uk.xensource.com>
 <08D440470200001BB8D7C7D4@prv1-mh.provo.novell.com>
 <5C5B0F9D0200007800214692@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+/Z=QN=citrix.com=prvs=933e35509=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1grQRg-0005VB-LH
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 16:53:08 +0000
In-Reply-To: <5C5B0F9D0200007800214692@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiAxLzRdIHhlbjog
aW50cm9kdWNlIFNZTUJPTCIpOgo+IE9uIDA2LjAyLjE5IGF0IDE3OjM3LCA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1hlbi1kZXZl
bF0gW1BBVENIIHY2IDEvNF0geGVuOiBpbnRyb2R1Y2UgU1lNQk9MIik6Cj4gPj4gLSBpdCBhbGxv
d3MgdGhlIGVuZC1vZi13aGF0ZXZlciBzeW1ib2xzIHRvIGFsc28gYmUgaGFuZGVkIHRvCj4gPj4g
ICBmdW5jdGlvbnMgaW4gYSB0eXBlLXNhZmUgbWFubmVyCj4gPiAKPiA+IFllcy4gIEhvd2V2ZXIu
Li4KPiA+IAo+ID4+ICAgKHdlIGNvdWxkIGV2ZW4gaGF2ZSBwZXItaW5zdGFuY2Ugc3RydWN0dXJl
IGZsYXZvcnMsIHN1Y2ggdGhhdAo+ID4+ICAgdW5yZWxhdGVkICJlbmQiIHN5bWJvbHMgY2FuJ3Qg
YmUgbWl4ZWQgdXA7IGZvciBleGFtcGxlIHRoZSB0eXBlCj4gPj4gICBjb3VsZCBzaW1wbHkgYmUg
YSBzdHJ1Y3R1cmUgd3JhcHBpbmcgYSBmaWVsZCBvZiB0aGUgb3JpZ2luYWwgYmFzZQo+ID4+ICAg
dHlwZSkuCj4gPiAKPiA+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBkaWZmaWN1bHQgdG8gYWNoaWV2
ZSB3aXRob3V0IHdyaXRpbmcgYSBmb3JiaWRkZW4KPiA+IHBvaW50ZXIgY29tcGFyaXNvbiBpbiB0
aGUgbWFjcm8uICBJdCBjb3VsZCBwZXJoYXBzIGJlIGFjaGlldmVkIHdpdGgKPiA+IHR5cGVvZigp
IGlmIHRoYXQgaXMgYXZhaWxhYmxlIGluIGh5cGVydmlzb3IgY29kZS4KPiAKPiBJJ20gYWZyYWlk
IEkgZG9uJ3QgdW5kZXJzdGFuZCAtIHlvdSB3YW50IHRvIGNhc3QgdG8gYW4gaW50ZWdlcgo+IHR5
cGUgYW55d2F5IGZvciBkb2luZyB0aGUgY29tcGFyaXNvbi4KClRoZSB1c3VhbCBhcHByb2FjaCB0
byBoYWtpbmcgYSBtYWNybyBwZXJmb3JtIGFuIGV4cGxpY2l0IHR5cGVjaGVjawooaWUsIHRvIGhh
dmUgdGhlIG1hY3JvIGNoZWNrIHRoYXQgdGhlIHR5cGVzIG9mIGl0cyBhcmd1bWVudHMgYXJlCnJp
Z2h0KSBpcyB0byBoYXZlIHRoZSBtYWNybyBleHBhbnNpb24gY29udGFpbiBhIGBzcHVyaW91cycg
Y29tcGFyaXNvbgp3aG9zZSByZXN1bHQgaXMgaWdub3JlZCBidXQgd2hpY2ggd2lsbCB5aWVsZCBh
IGNvbXBpbGUtdHlwZSB0eXBlCm1pc21hdGNoIGlmIHRoZSBhcmd1bWVudCB0eXBlcyB3ZXJlIHdy
b25nLiAgQnV0IHRoaXMgaXMgb25seSBsZWdhbCBpZgp0aGUgcHJvdmVuYW5jZSBvZiB0aGUgY29t
cGFyZWQgcG9pbnRlcnMgaXMgbGVnYWwgZm9yIGEgcG9pbnRlcgpjb21wYXJpc29uLiAgVGhlIGJh
ZCBlZmZlY3RzIG9mIGV2YWx1YXRpbmcgYW4gVUIgZXhwcmVzc2lvbiBhcmUgbm90CmxpbWl0ZWQg
Ynkgd2l0aGluLXByb2dyYW0gY2F1c2FsaXR5LgoKPiBBcyB0byB0eXBlb2YoKSAtIHRoaXMgYmVp
bmcgYSBjb21waWxlciBjb25zdHJ1Y3QsIGl0IGlzIGF2YWlsYWJsZQo+IHdoZW5ldmVyIHRoZSBj
b21waWxlciBzdXBwb3J0cyBpdC4gV2UgY2VydGFpbmx5IHVzZSBpdAo+IGVsc2V3aGVyZSBpbiBo
eXBlcnZpc29yIGNvZGUuCgpJIHRoaW5rIHRoZW4gdGhhdAogICAodHlwZW9mKFgpKTAgPT0gKHR5
cGVvZihZKSkwCmlzIHRoZSBjb3JyZWN0IGZvcm11bGF0aW9uIG9mIHRoZSB0eXBlIGNoZWNrIC0g
YmVjYXVzZSBpdCBpcyBsZWdhbCBubwptYXR0ZXIgdGhlIHByb3ZlbmFuY2Ugb2YgWCBhbmQgWS4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
