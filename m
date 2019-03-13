From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 08:36:52 -0600
Message-ID: <5C891584020000780021E2C0@prv1-mh.provo.novell.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190313145144.64b0f9fd.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4504-0008VW-75
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 14:36:56 +0000
In-Reply-To: <20190313145144.64b0f9fd.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE0OjUxLCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIFdl
ZCwgMTMgTWFyIDIwMTkgMDM6MTg6MzkgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gPiArICAgIGlmICggdG1wID49IFZUU0NfTUVBU1VSRU1F
TlRfSU5BQ0NVUkFDWV9SQU5HRV9LSFogKQo+PiA+ICsgICAgICAgIHRtcCAtPSBWVFNDX01FQVNV
UkVNRU5UX0lOQUNDVVJBQ1lfUkFOR0VfS0haOyAgCj4+IFRoZSBkaXNjb250aW51aXR5IGlzIHN0
aWxsIHRoZXJlLCBhbmQgc28gZmFyIHlvdSd2ZSBmYWlsZWQgdG8gZXhwbGFpbgo+PiB3aHkgYSBk
aXNjb250aW51aXR5IGlzIHdoYXQgeW91IHdhbnQgaGVyZS4KPiAKPiBUaGlzIGV4aXN0cyB0byBt
YWtlIHN1cmUgdGhlIG5vbi1lbXVsYXRlZCBjYXNlIHN0YXlzIHdpdGhpbiB0aGUgUFBNIHJhbmdl
LgoKU3RheWluZyB3aXRoaW4gcmFuZ2UgaXMgb3J0aG9nb25hbCB0byB0aGUgaW50cm9kdWN0aW9u
IG9mIGFueQpkaXNjb250aW51aXRpZXMuIEkgY2FuIG9ubHkgZHJhdyB0aGUgc2FtZSB0YWJsZSBh
Z2FpbjoKCiAgIHRtcCAoaW5pdGlhbCkJfCAgIHRtcCAocmVzdWx0KQogICAwCQl8ICAgMAogICAx
CQl8ICAgMQogICAuLi4KICAgMTk4CQl8ICAgMTk4CiAgIDE5OQkJfCAgIDE5OQogICAyMDAJCXwg
ICAwCiAgIDIwMQkJfCAgIDEKICAgLi4uCiAgIDM5OAkJfCAgIDE5OAogICAzOTkJCXwgICAxOTkK
ICAgNDAwCQl8ICAgMjAwCiAgIDQwMQkJfCAgIDIwMQogICAuLi4KICAgNDAwMDAwCQl8ICAgMzk5
ODAwCgpXaHkgaXMgdGhlcmUgdGhpcyBiaWcgc3RlcCBiZXR3ZWVuIDE5OSBhbmQgMjAwPyBBbmQg
d2h5IGRvZXMgYW4KaW5pdGlhbCB2YWx1ZSBvZiAyMDAgZ2V0IGhhbmRsZWQgdGhlIHNhbWUgYXMg
YW4gaW5pdGlhbCB2YWx1ZSBvZiAwLCBidXQKdGhlbiA0MDAgZG9lc24ndCBnZXQgaGFuZGxlZCB0
aGlzIHNhbWUgd2F5IGFnYWluPyBBbmQgKHNlZWluZyB0aGUKbGFzdCByb3cgSSd2ZSBhZGRlZCBu
b3cpIGhvdyBpcyB0aGUgcmVzdWx0IHN0YXlpbmcgaW4gcmFuZ2U/CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
