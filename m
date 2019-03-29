From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Fri, 29 Mar 2019 07:01:51 -0600
Message-ID: <5C9E173F0200007800222D28@prv1-mh.provo.novell.com>
References: <20190329124940.24091-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9r8r-0008ID-V3
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 13:01:53 +0000
In-Reply-To: <20190329124940.24091-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDEzOjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0xMTc0LDkgKzExNzQsOSBAQCBzdGF0aWMgaW50IGZpbmlzaF90eXBlX2NoYW5nZShz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+ICAgICAgICAgIC8qCj4gICAgICAgICAgICogZXB0LT5y
ZWNhbGMgY291bGQgcmV0dXJuIDAvMS8tRU5PTUVNLiBwdC0+cmVjYWxjIGNvdWxkIHJldHVybgo+
ICAgICAgICAgICAqIDAvLUVOT01FTS8tRU5PRU5ULCAtRU5PRU5UIGlzbid0IGFuIGVycm9yIGFz
IHdlIGFyZSBsb29waW5nCj4gLSAgICAgICAgICogZ2ZuIGhlcmUuCj4gKyAgICAgICAgICogZ2Zu
IGhlcmUuIElmIHJjIGlzIDEgd2UgbmVlZCB0byBoYXZlIGl0IDAgZm9yIHN1Y2Nlc3MuCj4gICAg
ICAgICAgICovCj4gLSAgICAgICAgaWYgKCByYyA9PSAtRU5PRU5UICkKPiArICAgICAgICBpZiAo
IHJjID09IC1FTk9FTlQgfHwgcmMgPT0gMSApCgpJIGd1ZXNzIHlvdSBtZWFuICJyYyA+IDAiIGhl
cmU/IFRoaXMgYW5kIHRoZSBjb21tZW50IGFyZSBvZiBjb3Vyc2UKZWFzeSBlbm91Z2ggdG8gYWRq
dXN0IHdoaWxlIGNvbW1pdHRpbmcsIGFuZCB3aXRoIHRoZSBhZGp1c3RtZW50cwpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiBAQCAtMTIxMywxOSArMTIxMywx
MyBAQCBpbnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAg
ICAgICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaV0gIT0gbWZuX3goSU5WQUxJRF9NRk4p
ICkKPiAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgc3RydWN0IHAybV9kb21haW4g
KmFsdHAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsKPiAtICAgICAgICAgICAgICAgIGludCBy
YzE7Cj4gIAo+ICAgICAgICAgICAgICAgICAgcDJtX2xvY2soYWx0cDJtKTsKPiAtICAgICAgICAg
ICAgICAgIHJjMSA9IGZpbmlzaF90eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25y
KTsKPiArICAgICAgICAgICAgICAgIHJjID0gZmluaXNoX3R5cGVfY2hhbmdlKGFsdHAybSwgZmly
c3RfZ2ZuLCBtYXhfbnIpOwo+ICAgICAgICAgICAgICAgICAgcDJtX3VubG9jayhhbHRwMm0pOwo+
ICAKPiAtICAgICAgICAgICAgICAgIGlmICggcmMxIDwgMCApCj4gLSAgICAgICAgICAgICAgICB7
Cj4gLSAgICAgICAgICAgICAgICAgICAgcmMgPSByYzE7Cj4gKyAgICAgICAgICAgICAgICBpZiAo
IHJjIDwgMCApCgpBbG9uZyB0aGUgbGluZXMgb2YgYW4gZWFybGllciBjb21tZW50IC0gSSB0aGlu
ayBpdCBpcyBnZW5lcmFsbHkKYmV0dGVyIHRvIG5vdCBzcGVjaWFsIGNhc2UgbmVnYXRpdmUgcmV0
dXJuIHZhbHVlcyB3aGVuIHBvc2l0aXZlCm9uZXMgZG9uJ3QgaGF2ZSBzcGVjaWFsIG1lYW5pbmcu
IEJ1dCBJIGtub3cgdGhlIGNvZGUgYmFzZSBpcwp2ZXJ5IGluY29uc2lzdGVudCBhYm91dCB0aGlz
LCBzbyBJIGRvbid0IHJlYWxseSBtaW5kIGxlYXZpbmcgaXQgYXMKaXMuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
