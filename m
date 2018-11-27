From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 16:40:50 +0000
Message-ID: <ad3f5b22b3ef476d8147fa70c004c467@AMSPEX02CL03.citrite.net>
References: <20181127145808.28118-1-paul.durrant@citrix.com>
 <5BFD69780200007800200734@prv1-mh.provo.novell.com>
 <0c1c8dba2ab14ea998cd4fb0c16cb458@AMSPEX02CL03.citrite.net>
 <5BFD7300020000780020077D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MIvs=OG=citrix.com=prvs=8623b3373=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRgPt-0006LQ-Jp
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 16:40:53 +0000
In-Reply-To: <5BFD7300020000780020077D@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOCAxNjozOAo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdAo+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnPgo+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjJdIGFtZC1pb21t
dTogcmVtb3ZlIHBhZ2UgbWVyZ2luZyBjb2RlCj4gCj4gPj4+IE9uIDI3LjExLjE4IGF0IDE3OjA1
LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gV2VsbCwgSSBjb3VsZCBqdXN0
IGxlYXZlIFBWLUlPTU1VIHVuaW1wbGVtZW50ZWQgZm9yIEFNRCBoL3cgaWYgeW91IHRoaW5rCj4g
dGhlCj4gPiBwYWdlIG1lcmdpbmcgY29kZSBpcyBtb3JlIGltcG9ydGFudCBzaW5jZSwgd2l0aG91
dCB0aGUgc3BhcmUgaWdub3JlZAo+IGJpdHMsIEkKPiA+IGhhdmUgbm8gd2F5IHRvIHRyYWNrIHBh
Z2VzIGFkZGVkIGJ5IHRoZSBoeXBlcmNhbGwgdnMuIHRob3NlIGFkZGVkIGF0Cj4gc3RhcnQgb2YK
PiA+IGRheS4gSSBwZXJzb25hbGx5IHRoaW5rIHRoYXQgdGhlIHNpbXBsZXIgY29kZSBpcyB3b3J0
aHdoaWxlIGluIGl0c2VsZgo+IGJ1dCBJCj4gPiBndWVzcyB5b3UgZGlzYWdyZWUuCj4gCj4gTm90
IGV4YWN0bHk6IFdpdGggYSBwcm9wZXIgcmVhc29uIChoZXJlOiB5b3UgbmVlZCB0byBmcmVlIHVw
IGF0IGxlYXN0Cj4gb25lIG9mIHRoZSBiaXRzOyAiZm9yIG90aGVyIHBvdGVudGlhbCB1c2UiIHNp
bXBseSBpcyB0b28gdmFndWUgZm9yIG15Cj4gdGFzdGUsIGFuZCB0byBiZSBob25lc3QgSSBoYWQg
YWxyZWFkeSBmb3Jnb3R0ZW4gYWJvdXQgdGhpcyBuZWVkIG9mCj4geW91cnMpLCBJIGNhbiBsaXZl
IHdpdGggdGhpcy4gUGx1cyBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoaXMgY29kZQo+IGFu
eXdheS4KPiAKCk9rLCBJJ2xsIHNlbmQgdjMgYWRqdXN0aW5nIHRoZSBjb21tZW50IGFnYWluLgoK
ICBQYXVsCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
