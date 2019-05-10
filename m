From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
Date: Fri, 10 May 2019 14:02:49 +0100
Message-ID: <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5As-0001LP-RP
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:02:54 +0000
In-Reply-To: <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8wNS8yMDE5IDEyOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L2NvbW1vbi5jCj4+IEBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNl
X3Jlc3luYyhpbnQgZXZlbnQsIG1mbl90IGdtZm4pCj4+ICAgICAgIGlmICggdGJfaW5pdF9kb25l
ICkKPj4gICAgICAgewo+PiAgICAgICAgICAgLyogQ29udmVydCBnbWZuIHRvIGdmbiAqLwo+PiAt
ICAgICAgICB1bnNpZ25lZCBsb25nIGdmbiA9IG1mbl90b19nZm4oY3VycmVudC0+ZG9tYWluLCBn
bWZuKTsKPj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feChtZm5fdG9fZ2ZuKGN1
cnJlbnQtPmRvbWFpbiwgZ21mbikpOwo+PiArCj4+ICAgICAgICAgICBfX3RyYWNlX3ZhcihldmVu
dCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4+ICAgICAgIH0KPiAKPiBDYW4ndCB5
b3UgdXNlIGdmbl90IGhlcmUsIGFuZCBoZW5jZSBhdm9pZCB0aGUgZ2ZuX3goKT8gU2FtZSBhZ2Fp
biBmdXJ0aGVyCj4gZG93bi4KQmVjYXVzZSBfX3RyYWNlX3ZhciB3aWxsIGV4cG9ydCB0aGUgdmFs
dWUgdG8gdGhlIGd1ZXN0LiBJIHdhc24ndCBzdXJlIHdoZXRoZXIgd2UgCmNhbiBzYWZlbHkgY29u
c2lkZXIgdGhhdCBnZm5fdCBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHVuc2lnbmVkIGxvbmcgaW4g
ZGVidWctYnVpbGQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
