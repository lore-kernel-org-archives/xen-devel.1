From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: clean up physical merging helpers
Date: Mon, 24 Sep 2018 10:25:45 -0400
Message-ID: <5fc63f64-4e81-0e10-bc3e-bde6f279c973__43313.6914660738$1537799020$gmane$org@oracle.com>
References: <20180904191431.20102-1-hch@lst.de> <20180915070300.GA10555@lst.de>
 <b8f3621a-f789-d737-649f-7b3645912888@kernel.dk>
 <20180920062946.GA12893@lst.de>
 <6e7fa8d3-4839-726d-572c-1678f5450880@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6e7fa8d3-4839-726d-572c-1678f5450880@kernel.dk>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-block@vger.kernel.org, Ming Lei <ming.lei@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8yMC8xOCAxMDozOSBBTSwgSmVucyBBeGJvZSB3cm90ZToKPiBPbiA5LzIwLzE4IDEyOjI5
IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4gT24gU2F0LCBTZXAgMTUsIDIwMTggYXQg
MDg6NDc6MTNBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToKPj4+Pj4gdGhpcyBzZXJpZXMgbW92
ZXMgdmFyaW91cyBoZWxwZXJzIHJlbGF0ZWQgdG8gbWVyZ2luZyBiYXNlZCBvbiBwaHlzaWNhbAo+
Pj4+PiBhZGRyZXNzZXMgZnJvbSB0aGUgcHVibGljIGhlYWRlcnMgaW50byBibG9jay8sIG1vdmVz
IHRoZSBYZW4gc3BlY2lhbAo+Pj4+PiBjYXNlIGZyb20gYXJjaCBob29rcyBpbnRvIGNvbW1vbiBj
b2RlLCBjbGVhbnMgdXAgdGhlIGNvZGUgYSBiaXQsIGFuZAo+Pj4+PiByZW1vdmVzIG5vdCBuZXNz
ZWNhcnkgaW5jbHVkZXMgZnJvbSB0aGUgYmxvY2sgaGVhZGVycy4KPj4+PiAtLS1lbmQgcXVvdGVk
IHRleHQtLS0KPj4+Pgo+Pj4gSXQncyBhIGdvb2QgY2xlYW51cCwgSSBsaWtlIGl0LiBXb3VsZCBw
cmVmZXIgaWYgdGhlIGFybS94ZW4gZm9sa3MgY291bGQKPj4+IGFjayB0aGUgZmlyc3QgYml0cywK
Pj4gS29ucmVhZCwgY2FuIHlvdSBsb29rIGF0IHRoZSBzZXJpZXMgKG9yIGRlbGVnYXRlKS4KCgpL
b25yYWQgaXMgb3V0IHRoaXMgKGFuZCBsYXN0KSB3ZWVrLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUu
IEluY2x1ZGluZwpwYXRjaCAxMywgYWx0aG91Z2ggaXQncyBoYXJkIHRvIHNheSB3aGV0aGVyIGl0
IG1heSBicmVhayBzb21lIGJ1aWxkcy4KCi1ib3JpcwoKCgo+Pgo+Pj4gYW5kIDEzLzEzIHNob3Vs
ZCBwcm9iYWJseSBqdXN0IHRvIGluIGRpZmZlcmVudGx5Lgo+PiBJIGNhbid0IHBhcnNlIHRoaXMg
c2V0ZW5jZS4KPiBUaGUgaXJvbnkgaXMgdGhpY2sgOi0pCj4KPiBBbnl3YXksIHMvdG8vZ28gZm9y
IHRoYXQgc2VudGVuY2UuIEkgZG9uJ3QgbWluZCBjYXJyeWluZyBpdCBpZiBLb25yYWQKPiBpcyBo
YXBweSB3aXRoIGl0LCBidXQgaXQgY291bGQgZ28gaW4gc2VwYXJhdGVseSBhZnRlciB0aGlzIHNl
cmllcyBpcwo+IG1lcmdlZC4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
