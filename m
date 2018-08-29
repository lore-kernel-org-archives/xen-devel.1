From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 12:14:36 +0100
Message-ID: <6b035dc2-7385-4842-d0f0-b1e783f3613b@citrix.com>
References: <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
 <20180829110052.GC31376@aepfle.de>
 <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuyQs-0003WI-Nc
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 11:14:42 +0000
In-Reply-To: <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTI6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMDgvMTggMTI6
MDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+PiBPbiBXZWQsIEF1ZyAyOSwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4KPj4+IEFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgaGFuZGluZyAjTUMgYmFjayBp
cyBwcm9iYWJseSB0aGUgY2xvc2VzdCB3ZQo+Pj4gY2FuIGdldCB0byBzZW5zaWJsZSBiZWhhdmlv
dXIsIGJ1dCBpdCBpcyBzdGlsbCBhIGJ1ZyB0aGF0IExpbnV4IGlzCj4+PiB0b3VjaGluZyB0aGUg
YmFsbG9vbmVkIG91dCBwYWdlIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4gV2VsbCwgdGhlIGlzc3Vl
IGlzIHRoYXQgYSByZWFkIGNyb3NzZXMgYSBwYWdlIGJvdW5kYXJ5LiBJZiB0aGF0IHdvdWxkIGJl
Cj4+IGZvcmJpZGRlbiwgbG9hZF91bmFsaWduZWRfemVyb3BhZCgpIHdvdWxkIG5vdCBleGlzdC4g
SXQgY2FuIG5vdCBrbm93Cj4+IHdoYXQgaXMgaW4gdGhlIGZvbGxvd2luZyBwYWdlLiBBbmQgc3Vj
aCBwYWdlIGNyb3NzaW5nIGhhcHBlbnMgYWxzbyBpbgo+PiB0aGUgdW5iYWxsb29uZWQgY2FzZS4g
U2FkbHkgSSBjYW4gbm90IHRyaWdnZXIgdGhlIHJlcG9ydGVkIE5GUyBidWcKPj4gbXlzZWxmLiBC
dXQgaXQgY2FuIGJlIGVuZm9yY2VkIGJ5IGJhbGxvb25pbmcgZW5vdWdoIHBhZ2VzIHNvIHRoYXQg
YW4KPj4gYWxsb2NhdGVkIHJlYWRkaXIgcmVwbHkgZXZlbnR1YWxseSBpcyByaWdodCBpbiBmcm9u
dCBvZiBhIGJhbGxvb25lZAo+PiBwYWdlLgo+IFRoZSBMaW51eCBidWcgaXMgbm90IHNob290aW5n
IHRoZSBiYWxsb29uZWQgcGFnZSBvdXQgb2YgdGhlIGRpcmVjdG1hcC7CoAo+IExpbnV4IHNob3Vs
ZCBiZSB0YWtpbmcgYSBmYXRhbCAjUEYgZm9yIHRoYXQgcmVhZCwgYmVjYXVzZSBpdHMgYSB2aXJ0
dWFsCj4gbWFwcGluZyBmb3IgYSBmcmFtZSB3aGljaCBMaW51eCBoYXMgdm9sdW50YXJpbHkgZWxl
Y3RlZCB0byBtYWtlIGludmFsaWQuCj4KPiBBcyBYZW4gY2FuJ3QgcHJldmVudCBMaW51eCBmcm9t
IG1ha2luZy9tYWludGFpbmluZyBzdWNoIGFuIGludmFsaWQKPiBtYXBwaW5nLCB0aHJvd2luZyAj
TUMgYmFjayBpcyB0aGUgbmV4dCBiZXN0IHRoaW5nLCBiZWNhdXNlIHRlcm1pbmF0aW5nCj4gdGhl
IGFjY2VzcyB3aXRoIH4wIGlzIGp1c3QgZ29pbmcgdG8gaGlkZSB0aGUgYnVnLCBhbmQgcnVuIGF0
IGEgZ2xhY2lhbAo+IHBhY2Ugd2hpbGUgZG9pbmcgc28uCgpZZXMgLSBoYXZpbmcgbG9va2VkIGF0
IGxvYWRfdW5hbGlnbmVkX3plcm9wYWQoKSwgaXQgZXhpc3RzIGV4cGxpY2l0bHkgdG8KY29wZSB3
aXRoICNQRiBvY2N1cnJpbmcgZnJvbSB0aGUgcGFnZSBjcm9zc2luZy4KClRoaXMgcmUtZW5mb3Jj
ZXMgbXkgb3BpbmlvbiB0aGF0IHRoZSB1bmRlcmx5aW5nIGJ1ZyBpcyBub3Qgc2hvb3RpbmcKYmFs
bG9vbmVkLW91dCBwYWdlcyBvdXQgb2YgdGhlIGRpcmVjdG1hcC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
