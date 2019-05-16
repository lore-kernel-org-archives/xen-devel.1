From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 12:24:48 +0100
Message-ID: <20190516112448.GV2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREVH-0001OP-WC
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:24:52 +0000
Content-Disposition: inline
In-Reply-To: <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <ohering@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6NDU6NDBQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMTowNzozNUFNICswMjAwLCBPbGFm
IEhlcmluZyB3cm90ZToKPiA+IEFtIFRodSwgMTYgTWF5IDIwMTkgMTA6MDk6MzggKzAyMDAKPiA+
IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPiA+IAo+ID4gPiBUaGUg
cGF0Y2ggImxpYnhsOiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHNldCBkZXZpY2VfbW9kZWxfdmVy
c2lvbiIKPiA+ID4gYnJlYWtzIGNyZWF0aW5nIGFueSBkb21haW4gZm9yIG1lLgo+ID4gCj4gPiBU
aGUgaXNzdWUgaXMsIGNyZWF0ZV9kb21haW4gd2lsbCBldmVudHVhbGx5IGNhbGwgZnJlZW1lbS4K
PiA+IElmIGF1dG9iYWxsb29uIGlzIHNldCwgZHVlIHRvIGRvbTBfbWVtPSBmb3IgZXhhbXBsZSwg
YWxsIGlzIGZpbmUuCj4gPiBJZiBtZW1vcnkgaGFzIHRvIGJlIGZyZWVkLCBsaWJ4bF9kb21haW5f
bmVlZF9tZW1vcnkgd2lsbCBnZXQgYW4KPiA+IGluY29tcGxldGUgYl9pbmZvLiBTb21laG93IHRo
ZSBuZXcgbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVsCj4gPiBtdXN0IGJlIGNhbGxlZCBm
b3IgdGhlIGRfY29uZmlnIHJldHVybmVkIGJ5IHBhcnNlX2NvbmZpZ19kYXRhLgo+ID4gCj4gPiBI
b3cgc2hvdWxkIHRoaXMgYmUgZml4ZWQ/Cj4gCj4gSGF2aW5nIGEgZmllbGQgaW4gYnVpbGRfaW5m
byB3aXRoIGEgZGVmYXVsdCB2YWx1ZSB0aGF0IGRlcGVuZHMgb24KPiBmaWVsZHMgb3V0c2lkZSBv
ZiBidWlsZF9pbmZvIGlzIHByb2JsZW1hdGljLCBzaW5jZSBub3QgYWxsIGNhbGxlcnMgb2YKPiBs
aWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBoYXZlIGFjY2VzcyB0byBsaWJ4bF9k
b21haW5fY29uZmlnLgo+IAo+IEFuIG9wdGlvbiB3b3VsZCBiZSB0byBwYXNzIGxpYnhsX2RvbWFp
bl9jb25maWcgdG8KPiBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBhbmQgZml4
dXAgdGhlIGNhbGxlcnMuIFRoYXQgc2VlbXMKPiBsaWtlIHRoZSBiZXN0IHNvbHV0aW9uIEFUTSwg
YnV0IGl0IHdvdWxkIHJlcXVpcmUgcmV2ZXJ0aW5nIHRoZQoKVGhhdCB3aWxsIDEpIG1ha2UgdGhl
IG5hbWUgd3JvbmcgMikgeW91IHdpbGwgaGF2ZSB0byBjb25qdXJlIHVwIGEKZG9tYWluX2NvbmZp
ZyBzdHJ1Y3R1cmUgZXZlbiBpZiBpdCBpcyBub3QgbmVlZGVkLi4uCgpXZWkuCgo+IGN1cnJlbnRs
eSBjb21taXR0ZWQgcGF0Y2hlcywgc2luY2UgdGhlcmUgd29uJ3QgYmUgYSByZWFzb24gYW55bW9y
ZSB0bwo+IHNwbGl0IHRoZSBkZXZpY2UgbW9kZWwgc2VsZWN0aW9uIGNvZGUgb3V0IG9mCj4gbGli
eGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQuCj4gCj4gUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
