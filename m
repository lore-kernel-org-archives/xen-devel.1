From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Thu, 17 May 2018 13:47:12 -0400
Message-ID: <656c5250-3406-a98a-309c-ac3d7e3e4c41__21863.4018362083$1526578962$gmane$org@oracle.com>
References: <20180517144723.21585-1-boris.ostrovsky@oracle.com>
 <20180517144723.21585-2-boris.ostrovsky@oracle.com>
 <5AFD999402000078001C3B29@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o0py=ie=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fJMwZ-0006De-1H
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 17:43:59 +0000
In-Reply-To: <5AFD999402000078001C3B29@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTcvMjAxOCAxMTowMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDUu
MTggYXQgMTY6NDcsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IEBAIC02
NCw2ICs2Nyw5IEBAIEVOVFJZKHB2aF9zdGFydF94ZW4pCj4+ICAJbW92ICVlYXgsJWVzCj4+ICAJ
bW92ICVlYXgsJXNzCj4+ICAKPj4gKwltb3YgJFBWSF9DQU5BUllfU0VMLCVlYXgKPj4gKwltb3Yg
JWVheCwlZ3MKPiBJIGRvdWJ0IHRoaXMgaXMgbmVlZGVkIGZvciA2NC1iaXQgKHlvdSBjb3VsZCBl
cXVhbGx5IHdlbGwgbG9hZCB6ZXJvIG9yIGxlYXZlCj4gaW4gcGxhY2Ugd2hhdCdzIHRoZXJlIGlu
IHRoYXQgY2FzZSksCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4KCgo+ICBhbmQgbG9hZGluZyB0
aGUgc2VsZWN0b3IgYmVmb3JlIHNldHRpbmcKPiB0aGUgYmFzZSBhZGRyZXNzIGluIHRoZSBkZXNj
cmlwdG9yIHdvbid0IGhhdmUgdGhlIGludGVuZGVkIGVmZmVjdC4KCgpJIHdhc24ndCBzdXJlIGFi
b3V0IHRoaXMgZWl0aGVyIGJ1dCB0aGVuIEkgbm90aWNlZCB0aGF0CnNlY29uZGFyeV9zdGFydHVw
XzY0KCkgZG9lcyBpdCBpbiB0aGUgc2FtZSBvcmRlciAoYWx0aG91Z2ggbm90IHVzaW5nIHRoZQpN
U1IpLgoKCj4KPj4gQEAgLTE1MCw5ICsxNzAsMTIgQEAgZ2R0X3N0YXJ0Ogo+PiAgCS5xdWFkIEdE
VF9FTlRSWSgweGMwOWEsIDAsIDB4ZmZmZmYpIC8qIF9fS0VSTkVMX0NTICovCj4+ICAjZW5kaWYK
Pj4gIAkucXVhZCBHRFRfRU5UUlkoMHhjMDkyLCAwLCAweGZmZmZmKSAvKiBfX0tFUk5FTF9EUyAq
Lwo+PiArCS5xdWFkIEdEVF9FTlRSWSgweDQwOTAsIDAsIDB4MTgpICAgIC8qIFBWSF9DQU5BUllf
U0VMICovCj4+ICBnZHRfZW5kOgo+PiAgCj4+IC0JLmJhbGlnbiA0Cj4+ICsJLmJhbGlnbiAxNgo+
PiArY2FuYXJ5Ogo+PiArCS5maWxsIDI0LCAxLCAwCj4gVGhpcyBpcyB0b28gbGl0dGxlIHNwYWNl
IGZvciA2NC1iaXQgYWZhaWN0ICh0aGUgY2FuYXJ5IGxpdmVzIGF0IG9mZnNldCA0MCB0aGVyZQo+
IGlmIEkgY2FuIHRydXN0IGFzbS9wcm9jZXNzb3IuaCkuCgpZZXMsIHNob3VsZCBiZSA0OC4gSSBk
aWRuJ3QgcmVhbGl6ZSB0aGUgdHdvIG1vZGVzIHVzZSBkaWZmZXJlbnQgb2Zmc2V0cy4KCi1ib3Jp
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
