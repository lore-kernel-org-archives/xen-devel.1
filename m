From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 14:21:50 +0000
Message-ID: <28c28ffcd5fd4d738c0fa502551ecd1f@AMSPEX02CL03.citrite.net>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
 <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
 <a500cc7c-ec6b-9894-63a0-df3329790bdc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MIvs=OG=citrix.com=prvs=8623b3373=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gReFN-0001pr-Oz
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 14:21:53 +0000
In-Reply-To: <a500cc7c-ec6b-9894-63a0-df3329790bdc@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IENvb3Blcg0K
PiBTZW50OiAyNyBOb3ZlbWJlciAyMDE4IDE0OjE5DQo+IFRvOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+OyBQYXVsIER1cnJhbnQNCj4gPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0K
PiBDYzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBCcmlhbiBX
b29kcw0KPiA8YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdA0KPiA8
c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVs
XSBbUEFUQ0hdIGFtZC1pb21tdTogcmVtb3ZlIHBhZ2UgbWVyZ2luZyBjb2RlDQo+IA0KPiBPbiAy
Ny8xMS8yMDE4IDEzOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+PiBPbiAyNi4xMS4xOCBh
dCAxODozMCwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToNCj4gPj4gVGhlIHBhZ2Ug
bWVyZ2luZyBsb2dpYyBtYWtlcyB1c2Ugb2YgYml0cyAxLTggYW5kIGJpdCA2MyBvZiBhIFBURSwg
d2hpY2gNCj4gdXNlZA0KPiA+PiB0byBiZSBzcGVjaWZpZWQgYXMgaWdub3JlZC4gSG93ZXZlciwg
Yml0cyA1IGFuZCA2IGFyZSBub3cgc3BlY2lmaWVkIGFzDQo+ID4+ICdhY2Nlc3NlZCcgYW5kICdk
aXJ0eScgYml0cyBhbmQgdGhlaXIgdXNlIG9ubHkgcmVtYWlucyBzYWZlIGFzIGxvbmcgYXMNCj4g
Pj4gdGhlIERURSAnSG9zdCBBY2Nlc3MgRGlydHknIGJpdHMgcmVtYWluIGNsZWFyLg0KPiA+IFVw
b24gc2Vjb25kIHRob3VnaHQgLSBpcyB0aGlzIGFjdHVhbGx5IHRydWUgd2l0aCB0aGUgWFNBLTI3
NQ0KPiA+IGNoYW5nZXMgaW4gcGxhY2U/IEFzIGxvbmcgYXMgdGhlIGRvbWFpbiBpcyBub3QgcnVu
bmluZyB5ZXQsDQo+ID4gaG93IHdvdWxkIEEgYW5kL29yIEQgYml0cyBnZXQgc2V0Pw0KPiANCj4g
RFRFLkhBRCBpcyBhbiBJT01NVSBjb250cm9sIHdoaWNoIFhlbiBkb2Vzbid0IGN1cnJlbnRseSBl
bmFibGUsIHNvIHRoaXMNCj4gaXNuJ3QgYW4gaXNzdWUgaW4gY3VycmVudCB1c2FnZS4NCg0KWWVz
LCB0aGF0IHdhcyB0aGUgcG9pbnQgb2YgbXkgY29tbWVudCBidXQgSSdsbCBjbGFyaWZ5IHRoYXQg
J3JlbWFpbiBjbGVhcicgbWVhbnMgdGhhdCBYZW4gZG9lcyBub3Qgc2V0IHRoZW0uDQoNCiAgUGF1
bA0KDQo+IA0KPiB+QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
