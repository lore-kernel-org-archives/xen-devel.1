From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 7/7] tools/kdd: mute spurious gcc warning
Date: Fri, 6 Apr 2018 16:12:46 +0100
Message-ID: <20180406151246.c5s6zig3m73bcmb4@citrix.com>
References: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
 <5888eecca0c8de49a455b2ce9722760a3dbdf4d0.1522893038.git-series.marmarek@invisiblethingslab.com>
 <3b81cb5f-4f64-4626-d105-bd58766807d0@oracle.com>
 <20180406130728.ez7725vdsltorixu@citrix.com>
 <dc5d9a85-ab9c-2cdb-9319-1284158e4596@oracle.com>
 <20180406134117.cnw6taklnojynfn3@citrix.com>
 <52a5c902-c75e-9cae-d447-10f2aefffa9a@oracle.com>
 <20180406143242.GM3176@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180406143242.GM3176@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMDYsIDIwMTggYXQgMDQ6MzI6NDJQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+ID4gPj4gY2MxOiB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwo+ID4gPj4ga2RkLmM6NjM5OiBlcnJvcjogZXhwZWN0ZWQgW2Vycm9yfHdhcm5pbmd8
aWdub3JlZF0gYWZ0ZXIg4oCYI3ByYWdtYSBHQ0MKPiA+ID4+IGRpYWdub3N0aWPigJkKPiA+ID4+
IGtkZC5jOjcxNDogZXJyb3I6IGV4cGVjdGVkIFtlcnJvcnx3YXJuaW5nfGlnbm9yZWRdIGFmdGVy
IOKAmCNwcmFnbWEgR0NDCj4gPiA+PiBkaWFnbm9zdGlj4oCZCj4gPiA+Pgo+ID4gPj4gKEludGVy
ZXN0aW5nbHksIG15IDY0LWJpdCBidWlsZCBjb21wbGV0ZWQgd2l0aG91dCBpc3N1ZXMpCj4gPiA+
IEhtbS4uLiB0aGlzIGlzIG1lc3N5Lgo+ID4gPgo+ID4gPiBJZiB5b3UgaGF2ZSBpbmZvcm1hdGlv
biBhYm91dCB3aGljaCB2ZXJzaW9uIGRvZXMgd2hhdCB3ZSBjYW4gdHJ5IHRvCj4gPiA+IGVuY2xv
c2UgdGhlICNwcmFnbWEncyB3aXRoICNpZiBfX0dDQ19fLgo+ID4gCj4gPiAKPiA+IENhbiB3ZSBp
bnN0ZWFkIHByZS1jb21wdXRlIHRoZSBwb2ludGVyIHRvIHBhY2lmeSB0aGUgY29tcGlsZXI/IEkg
aGF2ZW4ndAo+ID4gc2VlbiB0aGUgb3JpZ2luYWwgZXJyb3Igc28gSSBjYW4ndCB0ZXN0IGl0LCBi
dXQgc29tZXRoaW5nIGxpa2UKPiAKPiBOb3BlLCBpdCBkb2Vzbid0IGhlbHAuIEJ1dCBhZGRpbmcg
ImlmIChvZmZzZXQgPiAwKSIgYmVmb3JlIHRoYXQgIis9Cj4gb2Zmc2V0IiBkb2VzLi4uIAo+IEZv
ciBtZSBpdCBsb29rcyBsaWtlIGEgZ2NjIGJ1Zy4gTm90IHN1cmUgaG93IHRvIGRlYWwgd2l0aCB0
aGlzLiBFbmNsb3NlCj4gI3ByYWdtYSB3aXRoICNpZiBfX0dOVUNfXyA+PSA4ID8KCkkgd291bGQg
YmUgZmluZSB3aXRoIHRoaXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
