From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 4/6] xen/arm: zynqmp: implement
 zynqmp_eemi
Date: Tue, 18 Dec 2018 14:36:26 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812181308220.15901@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1812171407210.15901@sstabellini-ThinkPad-X260>
 <1545084630-3873-4-git-send-email-sstabellini@kernel.org>
 <c57cd38f-5e0a-3174-4b58-226d929cc7c8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c57cd38f-5e0a-3174-4b58-226d929cc7c8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, saeed.nowshadi@xilinx.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxOCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTIvMTcvMTggMTA6MTAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ICsg
ICAgLyogVGhlc2UgY2FsbHMgYXJlIHNhZmUgYW5kIGFsd2F5cyBhbGxvd2VkLiAgKi8KPiA+ICsg
ICAgY2FzZSBFRU1JX0ZJRChaWU5RTVBfU0lQX1NWQ19DQUxMX0NPVU5UKToKPiA+ICsgICAgY2Fz
ZSBFRU1JX0ZJRChaWU5RTVBfU0lQX1NWQ19VSUQpOgo+ID4gKyAgICBjYXNlIEVFTUlfRklEKFpZ
TlFNUF9TSVBfU1ZDX1ZFUlNJT04pOgo+IAo+IEkgYW0gYSBiaXQgc3VycHJpc2VkIHRoYXQgeW91
IGltcGxlbWVudCB0aG9zZSBvbmUgdXNpbmcgU01DNjQuIFdoeSB3b3VsZCB5b3UKPiBkdXBsaWNh
dGUgdGhlIFNNQzMyIHZlcnNpb24gKEFSTV9TTUNDQ19DQUxMX0NPVU5UX0ZJRChTSVApKT8KClRo
aXMgaXMgYSBtaXN0YWtlIGludHJvZHVjZWQgaW4gdGhlIGxhc3QgY291cGxlIG9mIHZlcnNpb25z
LCBnb29kIGNhdGNoLgpaWU5RTVBfU0lQX1NWQ18qIHdlcmUgcHJlZXhpc3RpbmcsIHRoZXkgZ28g
YmFjayB0byB0aGUgaW5pdGlhbAppbXBsZW1lbnRhdGlvbiBieSBFZGdhci4gVGhlIHdheSB0aGUg
Y29kZSB3YXMgd3JpdHRlbiBiZWZvcmUsIGl0IGRpZG4ndAptYXR0ZXIgaWYgdGhlIGNhbGwgd2Fz
IFNNQzMyIG9yIFNNQzY0LiBOb3cgdGhhdCB3ZSBtYXRjaCBvbiB0aGUgZnVsbApGSUQsIGFuZCB0
aGF0IHdlIGhhdmUgdGhlIHJpZ2h0IFNNQzMyIGNhbGxzIGhhbmRsZWQsIEknbGwgcmVtb3ZlIHRo
ZXNlIDMKY2FzZXMgY29tcGxldGVseS4KCgo+IEkgYWxzbyBkb24ndCBzZWVtIHRvIGZpbmQgdGhl
bSBuZWl0aGVyIGluIHRoZSBzcGVjIG5vciBpbiB0aGUgQVRGIGNvZGUuCgpZZXMsIEkgcmFpc2Vk
IHRoZSBpc3N1ZSBpbnRlcm5hbGx5LiBJbiBhbnkgY2FzZSwgSSB0aGluayBpdCBtYWtlcyBzZW5z
ZQp0byBoYW5kbGUgdGhlIG1hbmRhdG9yeSBjYWxscyBpbiBYZW4gYnkgZm9yd2FyZGluZyB0aGVt
IHRvIGZpcm13YXJlLgoKCj4gVGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
