From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 5/8] viridian: use
 viridian_map/unmap_guest_page() for reference tsc page
Date: Mon, 7 Jan 2019 15:48:23 +0000
Message-ID: <20190107154823.e3p3xqwpsxq3jiib@zion.uk.xensource.com>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-6-paul.durrant@citrix.com>
 <20190102155527.gejwroarlh2a6bg5@zion.uk.xensource.com>
 <d61603dd9d72419882cc648074b17054@AMSPEX02CL03.citrite.net>
 <95290195612f428284280c757777a0d3@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fGe+=PP=citrix.com=prvs=9038031b6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ggX8j-00006c-NN
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 15:48:33 +0000
Content-Disposition: inline
In-Reply-To: <95290195612f428284280c757777a0d3@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDcsIDIwMTkgYXQgMDM6MzU6NDFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgpbLi4uXQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgdmlyaWRpYW5fcGFnZSAqdnApOwo+ID4gPiA+IC12b2lkIHZpcmlkaWFuX21hcF9ndWVz
dF9wYWdlKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmlyaWRpYW5fcGFnZQo+ID4gKnZwKTsKPiA+
ID4gPiArdm9pZCB2aXJpZGlhbl9tYXBfZ3Vlc3RfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3QgdmlyaWRpYW5fcGFnZQo+ID4gPiAqdnApOwo+ID4gPgo+ID4gPiBTaW5jZSB5b3UgbW9kaWZ5
IHRoaXMgYW55d2F5LCBjYW4geW91IGNvbnN0aWZ5IHN0cnVjdCBkb21haW4/Cj4gPiA+Cj4gPiAK
PiA+IFllcywgSSBndWVzcyB0aGF0IHNob3VsZCBiZSBkby1hYmxlIG5vdyB0aGF0IHRoZSB2aXJp
ZGlhbl9wYWdlIGlzIGluIGEKPiA+IHNlcGFyYXRlIGFsbG9jYXRpb24gdW5pdC4KPiAKPiBBbGFz
LCBuby4gVGhlIGNhbGwgdG8gZ2V0X3BhZ2VfZnJvbV9nZm4oKSB0YWtlcyBhIG5vbi1jb25zdCBz
dHJ1Y3QgZG9tYWluIHBvaW50ZXIsIGFuZCBJJ20gbm90IG9wZW5pbmcgdGhhdCBjYW4gb2Ygd29y
bXMuIERvZXMgeW91ciBSLWIgc3RpbGwgc3RhbmQ/CgpZZXMuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
