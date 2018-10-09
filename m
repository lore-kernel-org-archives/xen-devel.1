From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/vtd: fix IOMMU share PT destruction path
Date: Tue, 9 Oct 2018 14:57:27 +0200
Message-ID: <20181009125727.f5pxjc56vpkdhgr7@mac.bytemobile.com>
References: <20181009104217.24098-1-wei.liu2@citrix.com>
 <28e959f388ab426cb63361878c5e9185@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=av44=mv=citrix.com=prvs=81391bf32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9rZy-0001mr-Pe
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 12:57:38 +0000
Content-Disposition: inline
In-Reply-To: <28e959f388ab426cb63361878c5e9185@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMTI6MjI6MzRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFdlaSBMaXUgW21h
aWx0bzp3ZWkubGl1MkBjaXRyaXguY29tXQo+ID4gU2VudDogMDkgT2N0b2JlciAyMDE4IDExOjQy
Cj4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBDYzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lCj4gPiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgV2VpIExp
dQo+ID4gPHdlaS5saXUyQGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KPiA+IFN1YmplY3Q6IFtQQVRDSF0geDg2L3Z0ZDogZml4IElPTU1VIHNoYXJlIFBUIGRl
c3RydWN0aW9uIHBhdGgKPiA+IAo+ID4gQ29tbWl0IDI5MTY5NTFjMSAoIm1tIC8gaW9tbXU6IGlu
Y2x1ZGUgbmVlZF9pb21tdSgpIHRlc3QgaW4KPiA+IGlvbW11X3VzZV9oYXBfcHQoKSIpIGluY2x1
ZGVkIG5lZWRfaW9tbXUoKSBpbiBpb21tdV91c2VfaGFwX3B0IGFuZAo+ID4gOTFkNGVjYTdhZGQg
KCIgbW0gLyBpb21tdTogc3BsaXQgbmVlZF9pb21tdSgpIGludG8gaGFzX2lvbW11X3B0KCkgYW5k
Cj4gPiBuZWVkX2lvbW11X3B0X3N5bmMoKSIpIG1hZGUgdGhpbmdzIGZpbmVyIGdyYWluIGJ5IHNw
bGl0aW5nIG5lZWRfaW9tbXUKPiA+IGludG8gdGhyZWUgc3RhdGVzLgo+ID4gCj4gPiBUaGUgZGVz
dHJ1Y3Rpb24gcGF0aCBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9wdCBiZWNhdXNlIGF0IHRoZSBw
b2ludAo+ID4gcGxhdGZvcm0gb3AgaXMgY2FsbGVkLCBJT01NVSBpcyBhbHJlYWR5IHN3aXRjaGVk
IHRvIGRpc2FibGVkIHN0YXRlIGFuZAo+ID4gdGhlIHNoYXJlZCBQVCB0ZXN0IHdvdWxkIGFsd2F5
cyBiZSBmYWxzZS4KPiA+IAo+IAo+IFRoaXMgaXMgVlQtZCBzcGVjaWZpYyBhbmQgdGhlIGlzc3Vl
IGNvdWxkIGFmZmVjdCBBTUQgdG9vLiBDYW4ndCB5b3UganVzdCBzd2l0Y2ggcm91bmQgdGhlIGNh
bGwgdG8gdGVhcmRvd24gYW5kIHNldHRpbmcgSU9NTVVfc3RhdHVzX2Rpc2FibGVkIGluIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmM6aW9tbXVfdGVhcmRvd24oKT8KCkFNRCBkb2Vzbid0
IHN1cHBvcnQgc2hhcmVkIHBhZ2UgdGFibGVzIHNvIGZhciwgYnV0IGluIG9yZGVyIHRvIGF2b2lk
CmhhdmluZyB0byBkZWJ1ZyB0aGlzIGFnYWluIGlmIEFNRCBldmVyIGdhaW5zIHN1cHBvcnQgZm9y
IHNoYXJlZCBwYWdlCnRhYmxlcyBJIHRoaW5rIHN3aXRjaGluZyB0aGUgb3JkZXIgaW4gaW9tbXVf
dGVhcmRvd24gbWlnaHQgYmUgYmV0dGVyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
