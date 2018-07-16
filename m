From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3] xen/altp2m: set access_required properly
 for all altp2ms
Date: Mon, 16 Jul 2018 02:53:07 -0600
Message-ID: <5B4C5CF302000078001D42EE@prv1-mh.provo.novell.com>
References: <1530172441-2553-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
 <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDEwOjM1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMjgvMjAxOCAwNzoxOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+PiBP
biBUaHUsIEp1biAyOCwgMjAxOCBhdCAxOjU0IEFNIFJhenZhbiBDb2pvY2FydQo+PiA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gRm9yIHRoZSBob3N0cDJtLCBhY2Nl
c3NfcmVxdWlyZWQgc3RhcnRzIG9mZiBhcyAwLCB0aGVuIGl0IGNhbiBiZQo+Pj4gc2V0IHdpdGgg
eGNfZG9tYWluX3NldF9hY2Nlc3NfcmVxdWlyZWQoKS4gSG93ZXZlciwgYWxsIHRoZSBhbHRwMm1z
Cj4+PiBzZXQgaXQgdG8gMSBvbiBpbml0LCBhbmQgaWdub3JlIGJvdGggdGhlIGhvc3RwMm0gYW5k
IHRoZSBoeXBlcmNhbGwuCj4+PiBUaGlzIHBhdGNoIHNldHMgYWNjZXNzX3JlcXVpcmVkIHRvIHRo
ZSB2YWx1ZSBmcm9tIHRoZSBob3N0cDJtCj4+PiBvbiBhbHRwMm0gaW5pdCwgYW5kIHByb3BhZ2F0
ZXMgdGhlIHZhbHVlcyByZWNlaXZlZCB2aWEgaHlwZXJjYWxsCj4+PiB0byBhbGwgdGhlIGFjdGl2
ZSBhbHRwMm1zLCB3aGVuIGFwcGxpY2FibGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+PiAKPj4gTEdUTQo+PiAKPj4g
QWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiAKPiBUaGFu
a3MgVGFtYXMhCj4gCj4gRG9lcyB0aGUgcGF0Y2ggbmVlZCBhZGRpdGlvbmFsIGFjdGlvbiBiZWZv
cmUgaXQgY2FuIGdvIGluIChzb3JyeSBmb3IgdGhlCj4gbm9pc2UgaWYgaXQgb25seSBoYXNuJ3Qg
Z29uZSBpbiBiZWNhdXNlIGl0IGF0IHRoZSBiYWNrIG9mIHRoZSBxdWV1ZSkuCgpPbmNlIGFnYWlu
IC0gR2VvcmdlJ3MgYWNrIGlzIG1pc3NpbmcuIFBsZWFzZSByZW1lbWJlciB0aGF0IGdlbmVyYWxs
eQppdCdzIHRoZSBzdWJtaXR0ZXIgdG8gY2hhc2UgYWNrLXMsIG5vdCByZXZpZXdlcnMgb3IgY29t
bWl0dGVycy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
