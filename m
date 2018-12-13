From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Thu, 13 Dec 2018 09:03:47 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9F41E@SHSMSX101.ccr.corp.intel.com>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DA20@SHSMSX101.ccr.corp.intel.com>
 <20181212112436.dtnd6sum5mztleih@mac>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DB2A@SHSMSX101.ccr.corp.intel.com>
 <20181212121730.kprvmtyhrwyhm62t@mac>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9E954@SHSMSX101.ccr.corp.intel.com>
 <5C121A130200007800205BA7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mz2v=OW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gXMuO-00080Q-UP
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 09:03:52 +0000
In-Reply-To: <5C121A130200007800205BA7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBEZWNlbWJlciAxMywgMjAxOCA0OjM3IFBNCj4gCj4gPj4+IE9uIDEzLjEyLjE4IGF0
IDAyOjI4LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+ID4gYnR3IEkgY2hlY2tlZCB5
b3VyIG9yaWdpbmFsIG1haWw6Cj4gPgo+ID4gKFhFTikgICAgWzxmZmZmODJkMDgwMmUyNDAzPl0g
bXdhaXQtaWRsZS5jI213YWl0X2lkbGUrMHgyYTUvMHgzODEKPiA+IHhlbi9hcmNoL3g4Ni9jcHUv
bXdhaXQtaWRsZS5jOjgwMgo+ID4KPiA+ICAgIDc4OAkJaWYgKGNwdV9pc19oYWx0YWJsZShjcHUp
KQo+ID4gICAgNzg5CQkJbXdhaXRfaWRsZV93aXRoX2hpbnRzKGVheCwKPiBNV0FJVF9FQ1hfSU5U
RVJSVVBUX0JSRUFLKTsKPiA+ICAgIDc5MAo+ID4gICAgNzkxCQlhZnRlciA9IGNwdWlkbGVfZ2V0
X3RpY2soKTsKPiA+ICAgIDc5Mgo+ID4gICAgNzkzCQljc3RhdGVfcmVzdG9yZV90c2MoKTsKPiA+
ICAgIDc5NAkJdHJhY2VfZXhpdF9yZWFzb24oaXJxX3RyYWNlZCk7Cj4gPiAgICA3OTUJCVRSQUNF
XzZEKFRSQ19QTV9JRExFX0VYSVQsIGN4LT50eXBlLCBhZnRlciwKPiA+ICAgIDc5NgkJCWlycV90
cmFjZWRbMF0sIGlycV90cmFjZWRbMV0sIGlycV90cmFjZWRbMl0sCj4gaXJxX3RyYWNlZFszXSk7
Cj4gPiAgICA3OTcKPiA+ICAgIDc5OAkJLyogTm93IGJhY2sgaW4gQzAuICovCj4gPiAgICA3OTkJ
CXVwZGF0ZV9pZGxlX3N0YXRzKHBvd2VyLCBjeCwgYmVmb3JlLCBhZnRlcik7Cj4gPiAgICA4MDAJ
CWxvY2FsX2lycV9lbmFibGUoKTsKPiA+ICAgIDgwMQo+ID4gLT4gODAyCQlpZiAoIShsYXBpY190
aW1lcl9yZWxpYWJsZV9zdGF0ZXMgJiAoMSA8PCBjc3RhdGUpKSkKPiA+ICAgIDgwMwkJCWxhcGlj
X3RpbWVyX29uKCk7Cj4gPiAgICA4MDQKPiA+ICAgIDgwNQkJc2NoZWRfdGlja19yZXN1bWUoKTsK
PiA+ICAgIDgwNgkJY3B1ZnJlcV9kYnNfdGltZXJfcmVzdW1lKCk7Cj4gPgo+ID4gTG9va3MgYWJv
dmUgY29kZSBpcyBkaWZmZXJlbnQgZnJvbSBzdGFnaW5nOgo+ID4KPiA+IGFjcGlfcHJvY2Vzc29y
X2lkbGU6Cj4gPiAJYWNwaV9pZGxlX2RvX2VudHJ5Ogo+ID4gCQlhY3BpX3Byb2Nlc3Nvcl9mZmhf
Y3N0YXRlX2VudGVyOgo+ID4gCQkJbXdhaXRfaWRsZV93aXRoX2hpbnRzCj4gPgo+ID4gdGhlcmUg
aXMgbm8gbXdhaXRfaWRsZSBhbG9uZS4gYW5kIGV2ZW4gd2l0aCBjb21waWxlciBvcHRpbWl6YXRp
b24gSSBkaWRuJ3QKPiA+IGZpbmQgY29kZSBzZXF1ZW5jZSBsaWtlIGFib3ZlLi4uCj4gCj4gWW91
J3JlIGxvb2tpbmcgYXQgdHdvIGVudGlyZWx5IGRpZmZlcmVudCBjb2RlIHBhdGhzLCBvbmx5IG9u
ZSBvZgo+IHdoaWNoIGNhbiBiZSBpbiB1c2UgaW4gYW55IHBhcnRpY3VsYXIgY2FzZTogRWl0aGVy
IHRoZSBpZGxlCj4gZW50ZXJpbmcgcm91dGluZSB1c2VkIGlzIGFjcGlfcHJvY2Vzc29yX2lkbGUo
KSwgb3IgKHdoZW4gdGhlCj4gcHJvY2Vzc29yIGlzIHN1cHBvcnRlZCBieSB0aGF0IGRyaXZlciBj
b2RlKSBpdCBpcyBtd2FpdF9pZGxlKCkuCj4gU2VlIG13YWl0X2lkbGVfaW5pdCgpIGZvciB3aGVu
IHRoZSBsYXR0ZXIgZ2V0cyB1c2VkOyB0aGUgZm9ybWVyCj4gbWF5IGdldCBpbnN0YWxsZWQgYXQg
dGhlIHBvaW50IHRoZSBEb20wIGtlcm5lbCByZXBvcnRzIEFDUEkKPiBDLXN0YXRlIGRhdGEgKGFu
ZCBvbmx5IHdoZW4gbXdhaXRfaWRsZSgpIGlzIG5vdCBpbiB1c2UpLgo+IAoKeWVzLCBJIG1pc3Nl
ZCB0aGUgb3RoZXIgcGF0aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
