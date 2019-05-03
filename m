From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Fri, 3 May 2019 08:14:02 -0600
Message-ID: <CABfawh=111EfZKc237tLDiOFx0EsUU44qN8dH4QmcR=EfZgfCg@mail.gmail.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
 <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
 <5CCC486E020000780022B9E5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMYxY-00058J-LJ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 14:14:44 +0000
Received: by mail-wm1-f47.google.com with SMTP id t76so7340279wmt.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 07:14:41 -0700 (PDT)
In-Reply-To: <5CCC486E020000780022B9E5@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA3OjU2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDMuMDUuMTkgYXQgMTU6NDgsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDMsIDIwMTkgYXQgMjoxMiBBTSBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gPj4+IE9uIDAzLjA1LjE5
IGF0IDAwOjEzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4gPiBAQCAtMTAwMiw3
ICs5ODksMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2Zu
X3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ID4+ID4gICAgICAvKiBGcmVlIHRoZSBjbGllbnQg
cGFnZSAqLwo+ID4+ID4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQs
ICZjcGFnZS0+Y291bnRfaW5mbykpCj4gPj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4K
PiBUaGlzIHNob3VsZCBiZSBhZnRlciAuLi4KPgo+ID4+ID4gLSAgICBwdXRfcGFnZShjcGFnZSk7
Cj4gPj4gPiArCj4gPj4gPiArICAgIEJVR19PTighcHV0X2NvdW50KTsKPgo+IC4uLiB0aGlzLCBi
ZWNhdXNlIC4uLgo+Cj4gPj4gPiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4+ID4gKyAg
ICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+ID4+Cj4gPj4gU3RyaWN0bHkgc3BlYWtp
bmcgSSB0aGluayB0aGUgQlVHX09OKCkgc2hvdWxkIGJlIG1vdmVkIGFoZWFkIG9mIHRoZQo+ID4+
IGlmKCkgaW4gY29udGV4dCwgc28gdGhhdCBhIHByb2JsZW1hdGljIHB1dF9wYWdlKCkgd291bGQg
bm90IGdldAo+ID4+IGV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0aGUgc3lz
dGVtIGlzIHRvIGRpZSBzb29uIGFmdGVyKS4KPiA+Cj4gPiBJIGRvbid0IGZvbGxvdyAtIHdoZXJl
IGlzIHRoZSBwcm9ibGVtYXRpYyBwdXRfcGFnZSgpPyBBbmQgd2h5IGlzIGl0Cj4gPiBwcm9ibGVt
YXRpYz8KPgo+IC4uLiBpZiBpbmRlZWQgdGhlIEJVR19PTigpIHRyaWdnZXJzLCB0aGVuIGl0IHNo
b3VsZCBkbyBzbyBiZWZvcmUKPiBwb3RlbnRpYWxseSBwdXR0aW5nIHRoZSBsYXN0IHJlZiBvZiBh
IHBhZ2Ugd2hpY2ggc2hvdWxkbid0IGJlIHB1dAo+IHRoYXQgd2F5LgoKSSBzZWUsIHRoYW5rcy4K
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
