From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 13:50:11 +0100
Message-ID: <20190516125011.GE2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
 <20190516115043.GB2798@zion.uk.xensource.com>
 <20190516140451.06cfcbfe.ohering@suse.com>
 <20190516141805.281f972e.ohering@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRFpw-0002uq-3m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:50:16 +0000
Content-Disposition: inline
In-Reply-To: <20190516141805.281f972e.ohering@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <ohering@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTg6MDVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxNDowNDo1MSArMDIwMAo+IHNjaHJpZWIgT2xhZiBI
ZXJpbmcgPG9oZXJpbmdAc3VzZS5jb20+Ogo+IAo+ID4gVGhlcmUgYXJlIHF1aXRlIGEgZmV3IGNo
ZWNrcyBmb3IgZGV2aWNlX21vZGVsX3ZlcnNpb24sIHRoZXkgd291bGQgYmUgYWxsCj4gPiB3cm9u
ZyBpZiB0aGUgYXNzZXJ0IGlzIHJlbW92ZWQsIG9yIGNoYW5nZWQgYmFjayB0byBRRU1VX1hFTi4g
UGVyaGFwcyB3ZQo+ID4gY2FuIGNvbnRpbnVlIHRvIGxpdmUgd2l0aCB0aGF0IGVycm9yLiBkZXZp
Y2VfbW9kZWxfdmVyc2lvbiBjb3VsZCBiZWNvbWUKPiA+IGEgbG9jYWwgdmFyaWFibGUuIElmIGl0
IGlzIG5vdCBzZXQsIGFzc3VtZSB0aGUgY2FsbGVyIGp1c3Qgd2FudHMgdGhlCj4gPiBtZW1vcnkg
c2l6ZSBhbmQgZW5mb3JjZSBRRU1VX1hFTiBhZ2FpbiB3aXRoaW4gdGhhdCBmdW5jdGlvbi4KPiAK
PiBJIHRoaW5rIHRoYXQgaXMgd2hhdCBzaG91bGQgYmUgZG9uZSwganVzdCBmb3IgdGhlIHNha2Ug
b2YKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkuIElmIGFuIGluY29tcGxldGUgYl9pbmZvIGlz
IHByb3ZpZGVkLCBhc3N1bWUKPiBkZXZpY2VfbW9kZWxfdmVyc2lvbj1RRU1VX1hFTiwgbWFpbnRh
aW4gdGhhdCBzdGF0ZSBpbiBhIGxvY2FsIHZhcmlhYmxlLgoKSSBjaGVja2VkLCBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnkgaXMgYWN0dWFsbHkgdGhlIG9ubHkgcHVibGljIEFQSQp3aGljaCB0YWtl
cyBiX2luZm8uCgpTbyB0aGlzIHNob3VsZCB3b3JrIC0tIHdlIGp1c3QgbmVlZCB0byBmaXggdGhh
dCBvbmUgQVBJIHRvIHJldGFpbiBpdHMKb3JpZ2luYWwgYmVoYXZpb3VyLgoKPiBJZiB3ZSB3YW50
IHRvIHByb3ZpZGUgYW5vdGhlciBuZXcgcHVibGljIEFQSSB0byBmaWxsIG1pc3NpbmcgZGVmYXVs
dHMsCj4gdGhhdCBjb3VsZCBzdGlsbCBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4gCgpZ
ZXMuCgpXZWkuCgo+IE9sYWYKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
