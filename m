From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 08:54:10 +0000
Message-ID: <4a38b1a409a443d4940973c1d6eb4366@AMSPEX02CL03.citrite.net>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-6-paul.durrant@citrix.com>
 <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
 <71ebe85f6fe94f989db6618eabf22c1e@AMSPEX02CL03.citrite.net>
 <5BA110EF02000078001E9802@prv1-mh.provo.novell.com>
 <ef6cbe5d4b994f7fbf61eb634c040dd4@AMSPEX02CL03.citrite.net>
 <5BA1E69F02000078001E99DF@prv1-mh.provo.novell.com>
 <f6f35c7b1ccf4abbaf0352f99b89e4fe@AMSPEX02CL03.citrite.net>
 <5BA20A0A02000078001E9C25@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rnom=mb=citrix.com=prvs=793e9bccb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g2YKP-0000vv-QL
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 08:59:21 +0000
In-Reply-To: <5BA20A0A02000078001E9C25@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTkgU2VwdGVtYmVyIDIwMTggMDk6MzQKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElh
bgo+IEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPjsgU3RlZmFubwo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEtvbnJhZCBS
emVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKSA8
dGltQHhlbi5vcmc+Cj4gU3ViamVjdDogUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2OSA1LzddIG1l
bW9yeTogYWRkCj4gY2hlY2tfZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhcyBhIHdyYXBwZXIuLi4KPiAK
PiA+Pj4gT24gMTkuMDkuMTggYXQgMDk6NTYsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4gRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPiA+
PiBTZW50OiAxOSBTZXB0ZW1iZXIgMjAxOCAwNzowMwo+ID4+Cj4gPj4gPj4+IE9uIDE4LjA5LjE4
IGF0IDE4OjM3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gTW92aW5n
IHRvIHAybS1jb21tb24gd29uJ3Qgd29yay4gVGhlIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIGludm9s
dmVzIGEKPiA+PiA+IHAybV90eXBlX3QgYXJndW1lbnQgYW5kIHRoYXQgZW51bSBpcyBkZWZpbmVk
IGluIHRoZSBhcm0gYW5kIHg4Ngo+IHNwZWNpZmljCj4gPj4gPiBoZWFkZXJzLiBJIHByb3Bvc2Ug
dGhlcmVmb3JlIHRvIGxlYXZlIHRoaXMgcGF0Y2ggYXMtaXMuCj4gPj4KPiA+PiBMZWF2aW5nIHRo
ZSBkdXBsaWNhdGlvbiBpbiBwbGFjZSBpcyBqdXN0IHRoZSBsYXN0IHJlc29ydCBpbW8uIERvZXMK
PiA+PiB4ZW4vbW0uaAo+ID4+IG5vdCB3b3JrIGVpdGhlcj8KPiA+Cj4gPiBObywgaXQgd29uJ3Qu
IEl0IGhhcyB0byBiZSBzb21ldGhpbmcgKmFmdGVyKiB0aGUgZGVmaW5pdGlvbiBvZiB0aGUKPiA+
IHAybV90eXBlX3QgZW51bS4gSSBjb3VsZCwgYXMgSnVsaWVuIHN1Z2dlc3RlZCwgbW92ZSB0aGUg
aW5jbHVzaW9uIG9mCj4gPiBwMm0tY29tbW9uIGFmdGVyIHRoYXQgcG9pbnQsIGJ1dCBpdCB3b3Vs
ZCBtZWFuIHRoZSBoZWFkZXIgZ3VhcmRzIHdvdWxkCj4gY2Vhc2UKPiA+IHRvIERUUlQgb2YgY291
cnNlLiBJJ20gbm90IHN1cmUgd2hldGhlciBDIHdpbGwgYWxsb3cgbWUgdG8gZm9yd2FyZAo+IGRl
Y2xhcmUKPiA+IHRoZSBlbnVtIChub3Qgc29tZXRoaW5nIEkndmUgdHJpZWQpIGJ1dCBJIGNvdWxk
IGdpdmUgdGhhdCBhIGdvLiBBbnkKPiBvdGhlcgo+ID4gc3VnZ2VzdGlvbnM/Cj4gCj4gSSdtIGFm
cmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIHdydCBpbmNsdWRlIGd1YXJkcy4g
RWFjaCBoZWFkZXIKPiBoYXMgaXRzIG93bi4gSSdtIGFjdHVhbGx5IHN1cnByaXNlZCB0aGUgY3Vy
cmVudCBpbmNsdXNpb24gcG9pbnQgaXMgYXQgdGhlCj4gdG9wCj4gb2YgdGhlIGZpbGUsIHJhdGhl
ciB0aGFuIGFmdGVyIGF0IGxlYXN0IHRoZSBiYXNpYyB0eXBlIGRlZmluaXRpb25zIGVhY2gKPiBh
cmNoCj4gaGFzIHRvIHN1cHBseS4KPiAKCk9rLCBpZiB3ZSBpbmNsdWRlIHAybS1jb21tb24gaW4g
dGhlIG1pZGRsZSBvZiBwMm0sIGFuZCB0aGVuIGFkZCBzdHVmZiBkZXBlbmRlbnQgb24gdGhlIGRl
Y2xhcmF0aW9uIG9mIHAybV90eXBlX3QsIHdoYXQgaGFwcGVucyB3aGVuIGEgc291cmNlIG1vZHVs
ZSBleHBsaWNpdGx5IGluY2x1ZGVzIHAybS1jb21tb24gcHJpb3IgdG8gcDJtPwoKICBQYXVsCgo+
IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
