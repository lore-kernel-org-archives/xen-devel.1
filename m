From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] libxc: do not return a value from
 xc_cpuid_policy
Date: Thu, 28 Jun 2018 09:45:06 +0200
Message-ID: <20180628074506.skqz5xncrrcwfzq2@mac.bytemobile.com>
References: <20180627143214.35751-1-roger.pau@citrix.com>
 <20180627143214.35751-4-roger.pau@citrix.com>
 <20180627144930.majmqtalvc67o62k@citrix.com>
 <20180628072932.ydur2tfprkyokkhw@mac.bytemobile.com>
 <20180628073149.pvt6nesc423uprvi@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gr/a=jo=citrix.com=prvs=7102bc0aa=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fYRcB-0000Ld-Sf
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 07:45:15 +0000
Content-Disposition: inline
In-Reply-To: <20180628073149.pvt6nesc423uprvi@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMDg6MzE6NDlBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEp1biAyOCwgMjAxOCBhdCAwOToyOTozMkFNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6NDk6MzBQTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDQ6MzI6MTRQTSAr
MDIwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiA+IE5vbmUgb2YgdGhlIGNhbGxlZCBm
dW5jdGlvbnMgcmV0dXJuIGFueSBlcnJvcnMsIHNvIHRoZXJlJ3Mgbm8gcG9pbnQgaW4KPiA+ID4g
PiByZXR1cm5pbmcgYW4gaW50IGZyb20geGNfY3B1aWRfcG9saWN5Lgo+ID4gPiA+IAo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
ID4gPiAKPiA+ID4gV2hhdCBpcyB0aGUgcGxhbiBmb3IgdGhpcyBmdW5jdGlvbj8gSSBleHBlY3Qg
aXQgKGFuZCBpdHMgY2hpbGRyZW4pIHRvIGdvCj4gPiA+IGF3YXkgc29vbj8KPiA+IAo+ID4gVGhp
cyBpcyBsaWtlbHkgdG8gZ28gYXdheSB3aXRoIGZ1cnRoZXIgY3B1aWQgd29yay4KPiA+IAo+ID4g
PiBZb3UgY2FuIGFsc28gZGVsZXRlIHhjaCwgSSB0aGluay4gSXQgaXMgbm90IHVzZWQuCj4gPiAK
PiA+IFJpZ2h0LCBJIGxlZnQgaXQgYmVjYXVzZSBhbGwgdGhlIHhjX2NwdWlkXyogdGFrZSB4Y2gg
YXMgdGhlIGZpcnN0Cj4gPiBwYXJhbWV0ZXIuIElmIEkgcmVtb3ZlIGl0IGhlcmUgSSB3aWxsIGhh
dmUgdG8gcmVtb3ZlIGl0IGZyb20gdGhlCj4gPiBfaW50ZWwsIF9hbWQsIF9odm0gYW5kIF9wdiBo
ZWxwZXJzLgo+IAo+IElmIHRoaXMgYW5kIGl0cyBsZWFmIGZ1bmN0aW9ucyBhcmUgZ29pbmcgYXdh
eSBzb29uLWlzaCBJJ20gZmluZSB3aXRoCj4gbGVzcyBjb2RlIGNodXJuLgoKSG0sIEknbSBub3Qg
cmVtb3ZpbmcgYWxsIG9mIHRoZW0sIHNvIGxldCBtZSBhZGQgYW5vdGhlciBwYXRjaCBvbiB0b3AK
b2YgdGhpcyBvbmUgdG8gcmVtb3ZlIHRoZSB4Y2ggcGFyYW1ldGVyLgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
