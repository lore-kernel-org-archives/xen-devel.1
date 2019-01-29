From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 4/8] viridian: add missing context save
 helpers into synic and time modules
Date: Tue, 29 Jan 2019 13:29:17 +0000
Message-ID: <e92debdcb8d847dd9d52018f04042703@AMSPEX02CL03.citrite.net>
References: <20190108151811.19510-1-paul.durrant@citrix.com>
 <20190108151811.19510-5-paul.durrant@citrix.com>
 <5C504F63020000780014B8E7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wKt=QF=citrix.com=prvs=925d89a54=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1goTSG-0001hD-Da
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:29:32 +0000
In-Reply-To: <5C504F63020000780014B8E7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
amJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjkgSmFudWFyeSAyMDE5IDEzOjA1Cj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgeGVuLQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzhdIHZpcmlk
aWFuOiBhZGQgbWlzc2luZyBjb250ZXh0IHNhdmUgaGVscGVycwo+IGludG8gc3luaWMgYW5kIHRp
bWUgbW9kdWxlcwo+IAo+ID4+PiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PiAwMS8wOC8xOSA0OjE4IFBNID4+Pgo+ID5DdXJyZW50bHkgdGhlIHRpbWUgbW9kdWxlIGxhY2tz
IHZjcHUgY29udGV4dCBzYXZlIGhlbHBlcnMgYW5kIHRoZSBzeW5pYwo+ID5tb2R1bGUgbGFja3Mg
ZG9tYWluIGNvbnRleHQgc2F2ZSBoZWxwZXJzLiBUaGVzZSBoZWxwZXJzIGFyZSBub3QgeWV0Cj4g
PnJlcXVpcmVkIGJ1dCBzdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCByZXF1aXJlIGF0IGxlYXN0IHNv
bWUgb2YgdGhlbSBzbwo+IHRoaXMKPiA+cGF0Y2ggY29tcGxldGVzIHRoZSBzZXQgdG8gYXZvaWQg
aW50cm9kdWNpbmcgdGhlbSBpbiBhbiBhZC1ob2Mgd2F5Lgo+IAo+IEJ1dCB0aGV5J3JlIGludHJv
ZHVjZWQgd2l0aG91dCBjYWxsZXJzIC0gYXMgdGhleSBkbyBub3RoaW5nIHJpZ2h0IG5vdywKPiB3
b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gYWRkIHRoZSBjYWxsIHNpdGVzIHJpZ2h0IGhlcmUsIGZv
ciB0aGVtIHRvIG5vdAo+IGxhdGVyIGdldCBhZGRlZCAtIGFzIHlvdSBzYXkgLSBpbiBhbiBhZCBo
b2Mgd2F5Pwo+IAoKT0ssIEkgY2FuIGRvIHRoYXQuCgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vdmlyaWRpYW4vc3luaWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vc3lu
aWMuYwo+IEBAIC0xNzksNiArMTc5LDE3IEBAIHZvaWQgdmlyaWRpYW5fc3luaWNfbG9hZF92Y3B1
X2N0eHQoCj4gICAgICB2LT5hcmNoLmh2bS52aXJpZGlhbi0+YXBpY19hc3Npc3RfcGVuZGluZyA9
IGN0eHQtCj4gPmFwaWNfYXNzaXN0X3BlbmRpbmc7Cj4gIH0KPiAKPiArdm9pZCB2aXJpZGlhbl9z
eW5pY19zYXZlX2RvbWFpbl9jdHh0KAo+ICsgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGh2bV92aXJpZGlhbl9kb21haW5fY29udGV4dCAqY3R4dCkKPiArewo+ICt9Cj4gKwo+ICt2
b2lkIHZpcmlkaWFuX3N5bmljX2xvYWRfZG9tYWluX2N0eHQoCj4gKyAgICBzdHJ1Y3QgZG9tYWlu
ICpkLCBjb25zdCBzdHJ1Y3QgaHZtX3ZpcmlkaWFuX2RvbWFpbl9jb250ZXh0ICpjdHh0KQo+ICt7
Cj4gK30KPiArCj4gKwo+ICAvKgo+IAo+IFdvdWxkIHlvdSBtaW5kIGF2b2lkaW5nIHRoZSBkb3Vi
bGUgYmxhbmsgbG9pbmUgaW5zZXJ0aW9uIGhlcmU/Cj4gCgpPb3BzLCB5ZXMsIHRoYXQgc2hvdWxk
IGhhdmUgYmVlbiBjbGVhbmVkIHVwLgoKICBQYXVsCgo+IAo+IEphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
