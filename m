From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] x86/xen: Fix read buffer overflow
Date: Tue, 18 Dec 2018 18:42:17 +0800
Message-ID: <2fe8f6b7-b791-e7ea-6484-491e089321d5__15573.0274309919$1545129684$gmane$org@huawei.com>
References: <20181218081910.18080-1-yuehaibing@huawei.com>
 <7825d772-338a-e39e-eaff-73e666ef5c08@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKq0=O3=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1gZCpY-0000ub-3C
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 10:42:28 +0000
In-Reply-To: <7825d772-338a-e39e-eaff-73e666ef5c08@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC8xMi8xOCAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxOC8xMi8yMDE4
IDA5OjE5LCBZdWVIYWliaW5nIHdyb3RlOgo+PiBGaXggc21hdGNoIHdhcm5pbmc6Cj4+Cj4+IGFy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYzo2NDkgZ2V0X3RyYXBfYWRkcigpIGVycm9yOgo+PiAg
YnVmZmVyIG92ZXJmbG93ICdlYXJseV9pZHRfaGFuZGxlcl9hcnJheScgMzIgPD0gMzIKPj4KPj4g
Rml4ZXM6IDQyYjNhNGNiNTYwOSAoIng4Ni94ZW46IFN1cHBvcnQgZWFybHkgaW50ZXJydXB0cyBp
biB4ZW4gcHYgZ3Vlc3RzIikKPj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmlu
Z0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyB8IDIg
Ky0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jCj4+IGluZGV4IDJmNjc4N2YuLjgxZjIwMGQgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+PiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX3B2LmMKPj4gQEAgLTY0Niw3ICs2NDYsNyBAQCBzdGF0aWMgYm9vbCBfX3JlZiBnZXRfdHJh
cF9hZGRyKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBpbnQgaXN0KQo+PiAgCj4+ICAJaWYgKG5yID09
IEFSUkFZX1NJWkUodHJhcF9hcnJheSkgJiYKPj4gIAkgICAgKmFkZHIgPj0gKHZvaWQgKillYXJs
eV9pZHRfaGFuZGxlcl9hcnJheVswXSAmJgo+PiAtCSAgICAqYWRkciA8ICh2b2lkICopZWFybHlf
aWR0X2hhbmRsZXJfYXJyYXlbTlVNX0VYQ0VQVElPTl9WRUNUT1JTXSkgewo+PiArCSAgICAqYWRk
ciA8ICh2b2lkICopZWFybHlfaWR0X2hhbmRsZXJfYXJyYXlbTlVNX0VYQ0VQVElPTl9WRUNUT1JT
IC0gMV0pIHsKPj4gIAkJbnIgPSAoKmFkZHIgLSAodm9pZCAqKWVhcmx5X2lkdF9oYW5kbGVyX2Fy
cmF5WzBdKSAvCj4+ICAJCSAgICAgRUFSTFlfSURUX0hBTkRMRVJfU0laRTsKPj4gIAkJKmFkZHIg
PSAodm9pZCAqKXhlbl9lYXJseV9pZHRfaGFuZGxlcl9hcnJheVtucl07Cj4+Cj4gCj4gTm8sIHRo
aXMgcGF0Y2ggaXMgd3JvbmcuCj4gCj4gZWFybHlfaWR0X2hhbmRsZXJfYXJyYXkgaXMgYSAyLWRp
bWVuc2lvbmFsIGFycmF5Ogo+IAo+IGNvbnN0IGNoYXIKPiBlYXJseV9pZHRfaGFuZGxlcl9hcnJh
eVtOVU1fRVhDRVBUSU9OX1ZFQ1RPUlNdW0VBUkxZX0lEVF9IQU5ETEVSX1NJWkVdOwo+IAo+IFNv
IGFib3ZlIGNvZGUgZG9lc24ndCBkbyBhbiBvdXQgb2YgYm91bmRzIGFycmF5IGFjY2VzcywgYnV0
IGNoZWNrcyBmb3IKPiAqYWRkciBiZWluZyBpbiB0aGUgYXJyYXkgb3Igb3V0c2lkZSBvZiBpdCAo
bm90ZSB0aGUgIjwiIHVzZWQgZm9yIHRoZQo+IHRlc3QpLgoKVGhhbmsgeW91IGZvciB5b3VyIGV4
cGxhbmF0aW9uLgoKPiAKPiAKPiBKdWVyZ2VuCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
