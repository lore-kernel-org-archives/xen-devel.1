From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 12:45:40 +0200
Message-ID: <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRDtY-0005yV-Kd
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:45:52 +0000
Content-Disposition: inline
In-Reply-To: <20190516110735.67e19d15.ohering@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <ohering@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MDc6MzVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMDowOTozOCArMDIwMAo+IHNjaHJpZWIgSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPiAKPiA+IFRoZSBwYXRjaCAibGlieGw6IGFkZCBo
ZWxwZXIgZnVuY3Rpb24gdG8gc2V0IGRldmljZV9tb2RlbF92ZXJzaW9uIgo+ID4gYnJlYWtzIGNy
ZWF0aW5nIGFueSBkb21haW4gZm9yIG1lLgo+IAo+IFRoZSBpc3N1ZSBpcywgY3JlYXRlX2RvbWFp
biB3aWxsIGV2ZW50dWFsbHkgY2FsbCBmcmVlbWVtLgo+IElmIGF1dG9iYWxsb29uIGlzIHNldCwg
ZHVlIHRvIGRvbTBfbWVtPSBmb3IgZXhhbXBsZSwgYWxsIGlzIGZpbmUuCj4gSWYgbWVtb3J5IGhh
cyB0byBiZSBmcmVlZCwgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5IHdpbGwgZ2V0IGFuCj4gaW5j
b21wbGV0ZSBiX2luZm8uIFNvbWVob3cgdGhlIG5ldyBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwKPiBtdXN0IGJlIGNhbGxlZCBmb3IgdGhlIGRfY29uZmlnIHJldHVybmVkIGJ5IHBhcnNl
X2NvbmZpZ19kYXRhLgo+IAo+IEhvdyBzaG91bGQgdGhpcyBiZSBmaXhlZD8KCkhhdmluZyBhIGZp
ZWxkIGluIGJ1aWxkX2luZm8gd2l0aCBhIGRlZmF1bHQgdmFsdWUgdGhhdCBkZXBlbmRzIG9uCmZp
ZWxkcyBvdXRzaWRlIG9mIGJ1aWxkX2luZm8gaXMgcHJvYmxlbWF0aWMsIHNpbmNlIG5vdCBhbGwg
Y2FsbGVycyBvZgpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBoYXZlIGFjY2Vz
cyB0byBsaWJ4bF9kb21haW5fY29uZmlnLgoKQW4gb3B0aW9uIHdvdWxkIGJlIHRvIHBhc3MgbGli
eGxfZG9tYWluX2NvbmZpZyB0bwpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBh
bmQgZml4dXAgdGhlIGNhbGxlcnMuIFRoYXQgc2VlbXMKbGlrZSB0aGUgYmVzdCBzb2x1dGlvbiBB
VE0sIGJ1dCBpdCB3b3VsZCByZXF1aXJlIHJldmVydGluZyB0aGUKY3VycmVudGx5IGNvbW1pdHRl
ZCBwYXRjaGVzLCBzaW5jZSB0aGVyZSB3b24ndCBiZSBhIHJlYXNvbiBhbnltb3JlIHRvCnNwbGl0
IHRoZSBkZXZpY2UgbW9kZWwgc2VsZWN0aW9uIGNvZGUgb3V0IG9mCmxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
