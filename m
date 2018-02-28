From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 08/11] x86/pt: mask MSI vectors on unbind
Date: Wed, 28 Feb 2018 04:27:53 -0700
Message-ID: <5A96A04902000078001ACA76@prv-mh.provo.novell.com>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-9-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqztz-0000sc-SN
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:28:03 +0000
In-Reply-To: <20180123150735.74779-9-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoZW4gYSBNU0kgZGV2aWNlIHdpdGggcGVyLXZlY3RvciBtYXNraW5nIGNhcGFiaWxpdGllcyBp
cyBkZXRlY3RlZCBvcgo+IGFkZGVkIHRvIFhlbiBhbGwgdGhlIHZlY3RvcnMgYXJlIG1hc2tlZCB3
aGVuIGluaXRpYWxpemluZyBpdC4gVGhpcwo+IGltcGxpZXMgdGhhdCB0aGUgZmlyc3QgdGltZSB0
aGUgaW50ZXJydXB0IGlzIGJvdW5kIHRvIGEgZG9tYWluIGl0J3MKPiBtYXNrZWQuCj4gCj4gVGhp
cyBob3dldmVyIG9ubHkgYXBwbGllcyB0byB0aGUgZmlyc3QgdGltZSB0aGUgaW50ZXJydXB0IGlz
IGJvdW5kCj4gYmVjYXVzZSBuZWl0aGVyIHRoZSB1bmJpbmQgbm9yIHRoZSBwaXJxIHVubWFwIHdp
bGwgbWFzayB0aGUgdmVjdG9yCj4gYWdhaW4uIEluIG9yZGVyIHRvIGZpeCB0aGlzIHJlLW1hc2sg
dGhlIGludGVycnVwdCB3aGVuIHVuYmluZGluZyBpdAo+IGZyb20gYSBndWVzdC4gVGhpcyBtYWtl
cyBzdXJlIHRoYXQgcGFpcnMgb2YgYmluZC91bmJpbmQgd2lsbCBhbHdheXMKPiBnZXQgdGhlIHNh
bWUgbWFza2luZyBzdGF0ZS4KPiAKPiBOb3RlIHRoYXQgbm8gaXNzdWVzIGhhdmUgYmVlbiByZXBv
cnRlZCByZWdhcmRpbmcgdGhpcyBiZWhhdmlvciBiZWNhdXNlCj4gUUVNVSBhbHdheXMgdXNlcyB0
aGUgbmV3bHkgaW50cm9kdWNlZCBYRU5fUFRfR0ZMQUdTU0hJRlRfVU5NQVNLRUQgd2hlbgo+IGJp
bmRpbmcgaW50ZXJydXB0cywgc28gaXQncyBhbHdheXMgdW5tYXNrZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
