From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/xenstore: add libdl dependency to
 libxenstore
Date: Fri, 9 Mar 2018 16:12:35 +0000
Message-ID: <20180309161235.b7x7fjxobmxweuxv@citrix.com>
References: <20180307101744.32608-1-jgross@suse.com>
 <23199.51911.713278.912475@mariner.uk.xensource.com>
 <ac4b3f73-63b1-d081-aeed-a56d8a660d83@suse.com>
 <23199.54702.631341.284821@mariner.uk.xensource.com>
 <c0db67f3-707d-6e86-0fbd-7dfed9178d99@suse.com>
 <20180309083633.GA12975@aepfle.de>
 <579ae32f-1800-7416-ee5c-ef384804bca0@suse.com>
 <20180309102343.GB12975@aepfle.de> <20180309110842.GD12975@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ymxc=f7=citrix.com=prvs=599389b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1euKdK-0006T7-PO
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 16:12:38 +0000
Content-Disposition: inline
In-Reply-To: <20180309110842.GD12975@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMTI6MDg6NDJQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBNYXIgMDksIE9sYWYgSGVyaW5nIHdyb3RlOgo+IAo+ID4gYWJ1aWxkQGxh
dGl0dWRlOn4+IHJlYWRlbGYgLVdhIC91c3IvbGliNjQvbGlicHl0aG9uMi43LnNvIHwgZ3JlcCBk
bHN5bQo+ID4gMDAwMDAwMDAwMDNlNWUwOCAgMDAwMDAwZDkwMDAwMDAwNyBSX1g4Nl82NF9KVU1Q
X1NMT1QgICAgIDAwMDAwMDAwMDAwMDAwMDAgZGxzeW1AR0xJQkNfMi4yLjUgKyAwCj4gPiAgICAy
MTc6IDAwMDAwMDAwMDAwMDAwMDAgICAgIDAgRlVOQyAgICBHTE9CQUwgREVGQVVMVCAgVU5EIGRs
c3ltQEdMSUJDXzIuMi41ICgxMCkKPiA+IGFidWlsZEBsYXRpdHVkZTp+PiByZWFkZWxmIC1XYSAv
dXNyL2xpYjY0L2xpYnhlbnN0b3JlLnNvIHwgZ3JlcCBkbHN5bQo+ID4gMDAwMDAwMDAwMDIwNzFi
MCAgMDAwMDAwMmIwMDAwMDAwNyBSX1g4Nl82NF9KVU1QX1NMT1QgICAgIDAwMDAwMDAwMDAwMDAw
MDAgZGxzeW0gKyAwCj4gPiAgICAgNDM6IDAwMDAwMDAwMDAwMDAwMDAgICAgIDAgTk9UWVBFICBH
TE9CQUwgREVGQVVMVCAgVU5EIGRsc3ltCj4gCj4gVGhlIGRpZmZlcmVuY2UgaXMgU1VTRV9BU05F
RURFRD0xIGluIGVudmlyb25tZW50Lgo+IElmIGl0IGlzIHNldCwgbGlieGVuc3RvcmUuc28gd2ls
bCBub3QgbGluayB0byBsaWJkbC5zby4KPiBJZiBpdCBpcyBub3QsIGxpYnhlbnN0b3JlLnNvIHdp
bGwgbGluayB0byBsaWJkbC5zby4KPiBTaW5jZSBwYWNrYWdlIGJ1aWxkaW5nIGV4cG9ydHMgU1VT
RV9BU05FRURFRD0xIHVzYWdlIG9mIC1seGVuc3RvcmUgd2lsbAo+IGZhaWwuIE5vdCBzdXJlIGhv
dyBhbGwgdGhlIG90aGVyIHBhY2thZ2VzIHVzZSBkbHN5bSgpLCBjbGVhcmx5IHhlbnN0b3JlCj4g
ZG9lcyBzb21ldGhpbmcgZGlmZmVyZW50LgoKSSdtIG5vdCBzdXJlIHdoYXQgdG8gbWFrZSBvZiB0
aGlzLiBJJ20gbm90IHN1cmUgd2hhdCBTVVNFX0FTTkVFREVEIGlzCmZvci4gSSBndWVzcyBJIHdp
bGwgbGVhdmUgdGhpcyB0byB5b3UgU3VTRSBleHBlcnRzIHRvIHNvcnQgb3V0LiA6LSkKCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
