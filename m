From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/3] xen netback: add fault injection
 facility
Date: Mon, 23 Apr 2018 10:58:59 +0100
Message-ID: <20180423095859.vdi7f7r267urodlx__7233.07911907813$1524477479$gmane$org@citrix.com>
References: <20180420104603.17823.31095.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <20180420104731.17823.97617.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flmh=hm=citrix.com=prvs=6441587ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAYFU-0000MK-4M
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 09:59:04 +0000
Content-Disposition: inline
In-Reply-To: <20180420104731.17823.97617.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stanislav Kinsburskii <staskins@amazon.com>
Cc: jakub.kicinski@netronome.com, mcroce@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, daniel@iogearbox.net, x86@kernel.org, mingo@redhat.com, xen-devel@lists.xenproject.org, jgross@suse.com, amir.jer.levy@intel.com, paul.durrant@citrix.com, stefanha@redhat.com, dsa@cumulusnetworks.com, tglx@linutronix.de, ggarcia@abra.uab.cat, axboe@kernel.dk, linux-block@vger.kernel.org, wei.liu2@citrix.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, dwmw@amazon.co.uk, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMTA6NDc6MzFBTSArMDAwMCwgU3RhbmlzbGF2IEtpbnNi
dXJza2lpIHdyb3RlOgo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2lmX3ZsYW4uaD4KPiBAQCAtMTY0OSw2ICsxNjUwLDcgQEAgc3RhdGljIGludCBf
X2luaXQgbmV0YmFja19pbml0KHZvaWQpCj4gIAkJCVBUUl9FUlIoeGVuX25ldGJhY2tfZGJnX3Jv
b3QpKTsKPiAgI2VuZGlmIC8qIENPTkZJR19ERUJVR19GUyAqLwo+ICAKPiArCSh2b2lkKSB4ZW5f
bmV0YmtfZmlfaW5pdCgpOwoKSWYgeW91IGNhcmUgYWJvdXQgdGhlIHJldHVybiB2YWx1ZSwgcGxl
YXNlIHByb3BhZ2F0ZSBpdCB0bwpuZXRiYWNrX2luaXQncyBjYWxsZXIuIE90aGVyd2lzZSB5b3Ug
Y2FuIGp1c3QgbWFrZSB0aGUgZnVuY3Rpb24gcmV0dXJuCnZvaWQuCgo+ICsKPiAraW50IHhlbnZp
Zl9maV9pbml0KHN0cnVjdCB4ZW52aWYgKnZpZikKPiArewo+ICsJc3RydWN0IGRlbnRyeSAqcGFy
ZW50Owo+ICsJc3RydWN0IHhlbnZpZl9maSAqdmZpOwo+ICsJaW50IGZpLCBlcnIgPSAtRU5PTUVN
Owo+ICsKPiArCXBhcmVudCA9IHZpZl9maV9kaXI7Cj4gKwlpZiAoIXBhcmVudCkKPiArCQlyZXR1
cm4gLUVOT01FTTsKPiArCj4gKwl2ZmkgPSBrbWFsbG9jKHNpemVvZigqdmZpKSwgR0ZQX0tFUk5F
TCk7Cj4gKwlpZiAoIXZmaSkKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwl2ZmktPmRpciA9
IGRlYnVnZnNfY3JlYXRlX2Rpcih2aWYtPmRldi0+bmFtZSwgcGFyZW50KTsKPiArCWlmICghdmZp
LT5kaXIpCj4gKwkJZ290byBlcnJfZGlyOwo+ICsKPiArCWZvciAoZmkgPSAwOyBmaSA8IFhFTlZJ
Rl9GSV9NQVg7IGZpKyspIHsKPiArCQl2ZmktPmZhdWx0c1tmaV0gPSB4ZW5fZmlfZGlyX2FkZCh2
ZmktPmRpciwKPiArCQkJCXhlbnZpZl9maV9uYW1lc1tmaV0pOwo+ICsJCWlmICghdmZpLT5mYXVs
dHNbZmldKQo+ICsJCQlnb3RvIGVycl9mYXVsdDsKPiArCX0KPiArCj4gKwl2aWYtPmZpX2luZm8g
PSB2Zmk7Cj4gKwlyZXR1cm4gMDsKPiArCj4gK2Vycl9mYXVsdDoKPiArCWZvciAoOyBmaSA+IDA7
IGZpLS0pCgpmaSA+PSAwCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
