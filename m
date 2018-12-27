From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86/e820: assume memmap provided when
 booted as a Xen guest is correct
Date: Thu, 27 Dec 2018 21:03:00 +0000
Message-ID: <eb54ef71-4aaf-3792-89ff-4237304d38e2@citrix.com>
References: <20181227155614.42292-1-roger.pau@citrix.com>
 <20181227155614.42292-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dHC=PE=citrix.com=prvs=89228f4dd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gcco3-0004S0-VA
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 21:03:03 +0000
In-Reply-To: <20181227155614.42292-4-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@cirix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTIvMjAxOCAxNTo1NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoaXMgaW1wbGll
cyB0aGVyZSdzIG5vIG5lZWQgdG8gZm9yY2VmdWxseSByZXNlcnZlIHRoZSBWR0EgTU1JTwo+IHJl
Z2lvbiwgc2luY2UgdGhlIG1lbW9yeSBtYXAgcHJvdmlkZWQgd2lsbCBiZSBjb3JyZWN0Lgo+Cj4g
UmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpcml4LmNvbT4KPiAt
LS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgMTEgKysrKysrLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+IGlu
ZGV4IDdjNWI4NTExOGYuLjVlNDZkNGVjNTMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2U4
MjAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiBAQCAtNTM3LDExICs1MzcsMTIgQEAg
c3RhdGljIHZvaWQgX19pbml0IG1hY2hpbmVfc3BlY2lmaWNfbWVtb3J5X3NldHVwKHN0cnVjdCBl
ODIwbWFwICpyYXcpCj4gIAo+ICAgICAgcmVzZXJ2ZV9kbWlfcmVnaW9uKCk7Cj4gIAo+IC0gICAg
LyoKPiAtICAgICAqIFNvbWUgQklPU2VzIGNsYWltIFJBTSBpbiB0aGUgNjQwayAtIDFNIHJlZ2lv
bi4KPiAtICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVwLgo+IC0gICAgICovCj4gLSAgICByZXNl
cnZlX3ZnYV9yZWdpb24oKTsKPiArICAgIGlmICggIXhlbl9ndWVzdCApCgpIYXZpbmcgdGhvdWdo
dCBvbiB0aGlzIHNvbWUgbW9yZSwgaG93IGFib3V0IHVzaW5nICFjcHVfaGFzX2h5cGVydmlzb3IK
aGVyZT/CoCBCb290aW5nIFBWSCB1bmRlciBYZW4gaXNuJ3QgdGhlIG9ubHkgY2FzZSB3aGVyZSB3
ZSB3b24ndCBoYXZlIGEKbGVnYWN5IFZHQSByYW5nZS7CoCBIeXBlclYgZ2VuLTIgVk1zIGFyZSB0
aGUgbmV4dCBtb3N0IG9idmlvdXMgY2FuZGlkYXRlLgoKfkFuZHJldwoKPiArICAgICAgICAvKgo+
ICsgICAgICAgICAqIFNvbWUgQklPU2VzIGNsYWltIFJBTSBpbiB0aGUgNjQwayAtIDFNIHJlZ2lv
bi4KPiArICAgICAgICAgKiBOb3QgcmlnaHQuIEZpeCBpdCB1cC4KPiArICAgICAgICAgKi8KPiAr
ICAgICAgICByZXNlcnZlX3ZnYV9yZWdpb24oKTsKPiAgCj4gICAgICB0b3Bfb2ZfcmFtID0gbXRy
cl90b3Bfb2ZfcmFtKCk7Cj4gICAgICBpZiAoIHRvcF9vZl9yYW0gKQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
