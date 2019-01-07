From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 5/8] viridian: use
 viridian_map/unmap_guest_page() for reference tsc page
Date: Mon, 7 Jan 2019 15:50:31 +0000
Message-ID: <b19d162e56e14a7287c90906a96f2422@AMSPEX02CL03.citrite.net>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-6-paul.durrant@citrix.com>
 <20190102155527.gejwroarlh2a6bg5@zion.uk.xensource.com>
 <d61603dd9d72419882cc648074b17054@AMSPEX02CL03.citrite.net>
 <95290195612f428284280c757777a0d3@AMSPEX02CL03.citrite.net>
 <20190107154823.e3p3xqwpsxq3jiib@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F0Vb=PP=citrix.com=prvs=90328960c=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ggXAh-0000n3-E8
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 15:50:35 +0000
In-Reply-To: <20190107154823.e3p3xqwpsxq3jiib@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDA3IEphbnVhcnkgMjAxOSAxNTo0OAo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBSb2dlcgo+IFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+Cj4gU3Vi
amVjdDogUmU6IFtQQVRDSCA1LzhdIHZpcmlkaWFuOiB1c2UgdmlyaWRpYW5fbWFwL3VubWFwX2d1
ZXN0X3BhZ2UoKSBmb3IKPiByZWZlcmVuY2UgdHNjIHBhZ2UKPiAKPiBPbiBNb24sIEphbiAwNywg
MjAxOSBhdCAwMzozNTo0MVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gWy4uLl0KPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdmlyaWRp
YW5fcGFnZSAqdnApOwo+ID4gPiA+ID4gLXZvaWQgdmlyaWRpYW5fbWFwX2d1ZXN0X3BhZ2Uoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCB2aXJpZGlhbl9wYWdlCj4gPiA+ICp2cCk7Cj4gPiA+ID4gPiAr
dm9pZCB2aXJpZGlhbl9tYXBfZ3Vlc3RfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QKPiB2
aXJpZGlhbl9wYWdlCj4gPiA+ID4gKnZwKTsKPiA+ID4gPgo+ID4gPiA+IFNpbmNlIHlvdSBtb2Rp
ZnkgdGhpcyBhbnl3YXksIGNhbiB5b3UgY29uc3RpZnkgc3RydWN0IGRvbWFpbj8KPiA+ID4gPgo+
ID4gPgo+ID4gPiBZZXMsIEkgZ3Vlc3MgdGhhdCBzaG91bGQgYmUgZG8tYWJsZSBub3cgdGhhdCB0
aGUgdmlyaWRpYW5fcGFnZSBpcyBpbiBhCj4gPiA+IHNlcGFyYXRlIGFsbG9jYXRpb24gdW5pdC4K
PiA+Cj4gPiBBbGFzLCBuby4gVGhlIGNhbGwgdG8gZ2V0X3BhZ2VfZnJvbV9nZm4oKSB0YWtlcyBh
IG5vbi1jb25zdCBzdHJ1Y3QKPiBkb21haW4gcG9pbnRlciwgYW5kIEknbSBub3Qgb3BlbmluZyB0
aGF0IGNhbiBvZiB3b3Jtcy4gRG9lcyB5b3VyIFItYiBzdGlsbAo+IHN0YW5kPwo+IAo+IFllcy4K
CkNvb2wuIFRoYW5rcyA6LSkKCiAgUGF1bAoKPiAKPiBXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
