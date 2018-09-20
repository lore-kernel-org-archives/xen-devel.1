From: Jens Axboe <axboe@kernel.dk>
Subject: Re: clean up physical merging helpers
Date: Thu, 20 Sep 2018 08:39:08 -0600
Message-ID: <6e7fa8d3-4839-726d-572c-1678f5450880__18463.9734485701$1537454280$gmane$org@kernel.dk>
References: <20180904191431.20102-1-hch@lst.de> <20180915070300.GA10555@lst.de>
 <b8f3621a-f789-d737-649f-7b3645912888@kernel.dk>
 <20180920062946.GA12893@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180920062946.GA12893@lst.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xen.org, linux-arm-kernel@lists.infradead.org, Ming Lei <ming.lei@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAxMjoyOSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gU2F0LCBT
ZXAgMTUsIDIwMTggYXQgMDg6NDc6MTNBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToKPj4+PiB0
aGlzIHNlcmllcyBtb3ZlcyB2YXJpb3VzIGhlbHBlcnMgcmVsYXRlZCB0byBtZXJnaW5nIGJhc2Vk
IG9uIHBoeXNpY2FsCj4+Pj4gYWRkcmVzc2VzIGZyb20gdGhlIHB1YmxpYyBoZWFkZXJzIGludG8g
YmxvY2svLCBtb3ZlcyB0aGUgWGVuIHNwZWNpYWwKPj4+PiBjYXNlIGZyb20gYXJjaCBob29rcyBp
bnRvIGNvbW1vbiBjb2RlLCBjbGVhbnMgdXAgdGhlIGNvZGUgYSBiaXQsIGFuZAo+Pj4+IHJlbW92
ZXMgbm90IG5lc3NlY2FyeSBpbmNsdWRlcyBmcm9tIHRoZSBibG9jayBoZWFkZXJzLgo+Pj4gLS0t
ZW5kIHF1b3RlZCB0ZXh0LS0tCj4+Pgo+Pgo+PiBJdCdzIGEgZ29vZCBjbGVhbnVwLCBJIGxpa2Ug
aXQuIFdvdWxkIHByZWZlciBpZiB0aGUgYXJtL3hlbiBmb2xrcyBjb3VsZAo+PiBhY2sgdGhlIGZp
cnN0IGJpdHMsCj4gCj4gS29ucmVhZCwgY2FuIHlvdSBsb29rIGF0IHRoZSBzZXJpZXMgKG9yIGRl
bGVnYXRlKS4KPiAKPj4gYW5kIDEzLzEzIHNob3VsZCBwcm9iYWJseSBqdXN0IHRvIGluIGRpZmZl
cmVudGx5Lgo+IAo+IEkgY2FuJ3QgcGFyc2UgdGhpcyBzZXRlbmNlLgoKVGhlIGlyb255IGlzIHRo
aWNrIDotKQoKQW55d2F5LCBzL3RvL2dvIGZvciB0aGF0IHNlbnRlbmNlLiBJIGRvbid0IG1pbmQg
Y2FycnlpbmcgaXQgaWYgS29ucmFkCmlzIGhhcHB5IHdpdGggaXQsIGJ1dCBpdCBjb3VsZCBnbyBp
biBzZXBhcmF0ZWx5IGFmdGVyIHRoaXMgc2VyaWVzIGlzCm1lcmdlZC4KCi0tIApKZW5zIEF4Ym9l
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
