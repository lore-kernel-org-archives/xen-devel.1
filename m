From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 08/12] libxl: Q35 support (new option
 device_model_machine)
Date: Tue, 20 Mar 2018 09:11:10 +0000
Message-ID: <20180320091110.e6l52uhzsycbqczm@MacBook-Pro-de-Roger.local>
References: <cover.1520867740.git.x1917x@gmail.com>
 <f553830567e76bd02fbeef431156d3189dd80aa7.1520867741.git.x1917x@gmail.com>
 <20180319170118.uf7uvyge63guo3aw@MacBook-Pro-de-Roger.local>
 <20180320081149.00003f2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=px6q=gk=citrix.com=prvs=610419324=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyDIc-0002mk-MS
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 09:11:18 +0000
Content-Disposition: inline
In-Reply-To: <20180320081149.00003f2c@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDg6MTE6NDlBTSArMTAwMCwgQWxleGV5IEcgd3JvdGU6
Cj4gT24gTW9uLCAxOSBNYXIgMjAxOCAxNzowMToxOCArMDAwMAo+IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiAKPiA+T24gVHVlLCBNYXIgMTMsIDIwMTgg
YXQgMDQ6MzM6NTNBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1lbmtvIHdyb3RlOgo+ID4+IFByb3Zp
ZGUgYSBuZXcgZG9tYWluIGNvbmZpZyBvcHRpb24gdG8gc2VsZWN0IHRoZSBlbXVsYXRlZCBtYWNo
aW5lCj4gPj4gdHlwZSwgZGV2aWNlX21vZGVsX21hY2hpbmUuIEl0IGhhcyBmb2xsb3dpbmcgcG9z
c2libGUgdmFsdWVzOgo+ID4+IC0gImk0NDAiIC0gaTQ0MCBlbXVsYXRpb24gKGRlZmF1bHQpCj4g
Pj4gLSAicTM1IiAtIGVtdWxhdGUgYSBRMzUgbWFjaGluZS4gQnkgZGVmYXVsdCwgdGhlIHN0b3Jh
Z2UgaW50ZXJmYWNlCj4gPj4gaXMgQUhDSS4gIAo+ID4KPiA+SSB3b3VsZCByYXRoZXIgbmFtZSB0
aGlzIG1hY2hpbmVfY2hpcHNldCBvciBkZXZpY2VfbW9kZWxfY2hpcHNldC4KPiAKPiBkZXZpY2Vf
bW9kZWxfIHByZWZpeCBpcyBhIG11c3QgSSB0aGluayAtLSBtdWx0aXBsZSBkZXZpY2UgbW9kZWwg
cmVsYXRlZAo+IG9wdGlvbnMgaGF2ZSBuYW1lcyBzdGFydGluZyB3aXRoIGRldmljZV9tb2RlbF8u
Cj4gCj4gZGV2aWNlX21vZGVsX2NoaXBzZXQuLi4gd2VsbCwgbWF5YmUsIGJ1dCB3ZSdyZSBhY3R1
YWxseSBzcGVjaWZ5aW5nIGEKPiBRRU1VIG1hY2hpbmUgaGVyZS4gSW4gUUVNVSBtYWlsaW5nIGxp
c3QgdGhlcmUgd2FzIGV2ZW4gYSBzdWdnZXN0aW9uCj4gdG8gYWxsb3cgdG8gcGFzcyBhIG1hY2hp
bmUgdmVyc2lvbiBudW1iZXIgaGVyZSwgbGlrZSAicGMtcTM1LTIuMTAiLgo+IEkgdGhpbmsgc29t
ZSBvcGluaW9ucyBhcmUgbmVlZGVkIGhlcmUuCgpJJ20gbm90IHN1cmUgd2hhdCBhICdtYWNoaW5l
JyBpcyBpbiBRRU1VIHNwZWFrLCBidXQgaW4gbXkgbWluZCBJIHdvdWxkCmNvbnNpZGVyIFBDIGEg
bWFjaGluZSAodnMgQVJNIGZvciBleGFtcGxlKS4KCkkgdGhpbmsgJ2NoaXBzZXQnIGlzIGNsZWFy
ZXIsIGJ1dCBhZ2FpbiBvdGhlcnMgc2hvdWxkIGV4cHJlc3MgdGhlaXIKb3Bpbmlvbi4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
