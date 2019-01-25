From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC PATCH 2/6] tools/libxc: Define VM_EVENT type
Date: Fri, 25 Jan 2019 14:16:40 +0000
Message-ID: <20190125141640.ahup2keoufgwgmpq@zion.uk.xensource.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
 <20190102111112.okgqqktbrhtx7gem@zion.uk.xensource.com>
 <142d7345bb84e972ffbc097aede42251ab8ee040.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZp+=QB=citrix.com=prvs=921c531d3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gn2Hl-0004CT-IA
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:16:45 +0000
Content-Disposition: inline
In-Reply-To: <142d7345bb84e972ffbc097aede42251ab8ee040.camel@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDgsIDIwMTkgYXQgMDM6MDE6MzRQTSArMDAwMCwgUGV0cmUgT3ZpZGl1IFBJ
UkNBTEFCVSB3cm90ZToKPiBPbiBXZWQsIDIwMTktMDEtMDIgYXQgMTE6MTEgKzAwMDAsIFdlaSBM
aXUgd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAxOSwgMjAxOCBhdCAwODo1MjowNVBNICswMjAwLCBQ
ZXRyZSBQaXJjYWxhYnUgd3JvdGU6Cj4gPiA+IERlZmluZSB0aGUgdHlwZSBmb3IgZWFjaCBvZiB0
aGUgc3VwcG9ydGVkIHZtX2V2ZW50IHJpbmdzIChwYWdpbmcsCj4gPiA+IG1vbml0b3IgYW5kIHNo
YXJpbmcpIGFuZCByZXBsYWNlIHRoZSByaW5nIHBhcmFtIGZpZWxkIHdpdGggdGhpcwo+ID4gPiB0
eXBlLgo+ID4gPiAKPiA+ID4gUmVwbGFjZSBYRU5fRE9NQ1RMX1ZNX0VWRU5UX09QXyBvY2N1cnJl
bmNlcyB3aXRoIHRoZWlyCj4gPiA+IGNvcnJlc3BvbmRpbmcKPiA+ID4gWEVOX1ZNX0VWRU5UX1RZ
UEVfIGNvdW50ZXJwYXJ0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2Fs
YWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0b29scy9s
aWJ4Yy94Y19tZW1fcGFnaW5nLmMgfCAgNiArKy0tCj4gPiA+ICB0b29scy9saWJ4Yy94Y19tb25p
dG9yLmMgICAgfCAgNiArKy0tCj4gPiA+ICB0b29scy9saWJ4Yy94Y19wcml2YXRlLmggICAgfCAg
OCArKystLS0KPiA+ID4gIHRvb2xzL2xpYnhjL3hjX3ZtX2V2ZW50LmMgICB8IDY4ICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gPiAtLS0tLS0tLS0tLS0KPiA+ID4gIHhlbi9j
b21tb24vdm1fZXZlbnQuYyAgICAgICB8IDEyICsrKystLS0tCj4gPiA+ICB4ZW4vaW5jbHVkZS9w
dWJsaWMvZG9tY3RsLmggfCA0NSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+IAo+
ID4gWW91IGFsc28gbmVlZCB0byBjaGFuZ2UgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiBp
biB0aGlzIHBhdGNoLgo+ID4gCj4gPiBXZWkuCj4gCj4gWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVS
U0lPTiB3YXMgaW5jcmVtZW50ZWQgaW4gYW5vdGhlciBwYXRjaCBvZiB0aGUKPiBzZXJpZXMgKHZt
X2V2ZW50OiBVc2Ugc2xvdHRlZCBjaGFubmVscyBmb3Igc3luYyByZXF1ZXN0cykuIElzIGl0Cj4g
bmVjZXNzYXJ5IHRvIGhhdmUgaXQgaW5jcmVtZW50ZWQgdHdpY2U/IAoKTm8gaXQgaXNuJ3QuIFNv
cnJ5LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
