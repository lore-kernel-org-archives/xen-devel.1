From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] firmware/shim : filter output files during
 Xen tree setup
Date: Mon, 23 Jul 2018 11:09:40 +0200
Message-ID: <20180723090940.jf6bysl5vtt7ehqx@mac.bytemobile.com>
References: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6gub=kh=citrix.com=prvs=735afa564=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fhWqq-00052V-Ga
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:09:56 +0000
Content-Disposition: inline
In-Reply-To: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMDI6MTU6MDVQTSAtMDcwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gRXhjbHVkZSBuYW1lZCBvdXRwdXQgZmlsZXMgZnJvbSB0aGUgWGVuIHRyZWUg
c2V0dXAuCj4gCj4gVGhlIGxpbmtmYXJtLnN0YW1wIGNvbnRlbnQgd2lsbCBkaWZmZXIgYmV0d2Vl
biB0b3AgbGV2ZWwgIm1ha2UiCj4gYW5kICJtYWtlIGluc3RhbGwiIGludm9jYXRpb25zLCBkdWUg
dG8gdGhlIGludHJvZHVjdGlvbiBvZiB0aGVzZQo+IG91dHB1dCBmaWxlcyB0aGF0IGFyZSBwcm9k
dWNlZCBkdXJpbmcgdGhlICJtYWtlIiBidWlsZC4KPiAKPiBGaWx0ZXIgdGhlc2Ugb3V0IHRvIHBy
ZXZlbnQgYW4gdW5uZWNlc3NhcnkgcmVidWlsZCBvZiB0aGUgc2hpbSBkdXJpbmcKPiAibWFrZSBp
bnN0YWxsIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3Bo
ZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgo+IC0tLQo+ICB0b29scy9maXJtd2FyZS94ZW4tZGly
L01ha2VmaWxlIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01h
a2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+IGluZGV4IDg0NjQ4YzMu
LmU0OTBkY2EgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+
ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiBAQCAtMTEsNiArMTEsOSBA
QCBEPXhlbi1yb290Cj4gIExJTktfRElSUz1jb25maWcgeGVuCj4gIExJTktfRklMRVM9Q29uZmln
Lm1rCj4gIAo+ICsjIEZpbGVzIHRvIGV4Y2x1ZGUgZnJvbSB0aGUgbGluayBmYXJtCj4gK0VYQ0xV
REVfRklMRVM9eGVuIHhlbi5neiB4ZW4tc3ltcyB4ZW4tc3ltcy5tYXAgZWZpLmxkcyB4ZW4ubGRz
IG1rZWxmMzIgbWtyZWxvYwoKSSBkb24ndCByZWFsbHkgbGlrZSB0byBsaXN0IHRoZSBmaWxlcyBo
ZXJlLCBzaW5jZSBpdCdzIHZlcnkgZWFzeSBmb3IKdGhlbSB0byBnZXQgb3V0IG9mIHN5bmMuIFRo
ZSBhbHRlcm5hdGl2ZSBJIGhhdmUgaXMgYWxzbyBub3QgdmVyeSBuaWNlCmhvd2V2ZXIsIHNpbmNl
IGl0IHJlbGllcyBvbiAuZ2l0aWdub3JlOgoKRVhDTFVERV9GSUxFUzo9JChwYXRzdWJzdCB4ZW4v
JSwlLCQoZmlsdGVyIHhlbi8lLCQoc2hlbGwgY2F0ICQoWEVOX1JPT1QpLy5naXRpZ25vcmUpKSkK
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
