From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/1] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Tue, 18 Dec 2018 10:47:54 +0100
Message-ID: <20181218094754.dcja5rr7qlprscmp__14939.8855785423$1545126411$gmane$org@mac>
References: <1545094538-31426-1-git-send-email-dongli.zhang@oracle.com>
 <20181218093300.qfslnloxooqnu2im@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S5ZZ=O3=citrix.com=prvs=883416a23=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gZByv-0004pE-2f
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 09:48:05 +0000
Content-Disposition: inline
In-Reply-To: <20181218093300.qfslnloxooqnu2im@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: axboe@kernel.dk, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTgsIDIwMTggYXQgMTA6MzM6MDBBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIERlYyAxOCwgMjAxOCBhdCAwODo1NTozOEFNICswODAwLCBEb25n
bGkgWmhhbmcgd3JvdGU6Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBucl9ncmVmczsgaSsrKSB7Cj4g
PiArCQljaGFyIHJpbmdfcmVmX25hbWVbUklOR1JFRl9OQU1FX0xFTl07Cj4gPiArCj4gPiArCQlz
bnByaW50ZihyaW5nX3JlZl9uYW1lLCBSSU5HUkVGX05BTUVfTEVOLCAicmluZy1yZWYldSIsIGkp
Owo+ID4gKwkJZXJyID0geGVuYnVzX3NjYW5mKFhCVF9OSUwsIGRpciwgcmluZ19yZWZfbmFtZSwK
PiA+ICsJCQkJICAgIiV1IiwgJnJpbmdfcmVmW2ldKTsKPiA+ICsKPiA+ICsJCWlmIChlcnIgIT0g
MSAmJiAoaSB8fCAoIWkgJiYgbnJfZ3JlZnMgPiAxKSkpIHsKPiAKPiBBRkFJQ1QgdGhlIGFib3Zl
IGNvbmRpdGlvbiBjYW4gYmUgc2ltcGxpZmllZCBhcyAiZXJyICE9IDEgJiYKPiBucl9ncmVmcyIu
CgpTb3JyeSwgdGhpcyBzaG91bGQgYmUgImVyciAhPSAxICYmIG5yX2dyZWZzID4gMSIsIHNpbmNl
IGl0J3Mgbm90IG9yZGVyCmJ1dCByYXRoZXIgdGhlIG51bWJlciBvZiBncmVmcy4KClJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
