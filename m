From: Christoph Hellwig <hch@lst.de>
Subject: clean up physical merging helpers
Date: Tue,  4 Sep 2018 12:14:18 -0700
Message-ID: <20180904191431.20102-1-hch__37479.9299905591$1536088400$gmane$org@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xen.org, linux-arm-kernel@lists.infradead.org, Ming Lei <ming.lei@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmVucywKCnRoaXMgc2VyaWVzIG1vdmVzIHZhcmlvdXMgaGVscGVycyByZWxhdGVkIHRvIG1l
cmdpbmcgYmFzZWQgb24gcGh5c2ljYWwKYWRkcmVzc2VzIGZyb20gdGhlIHB1YmxpYyBoZWFkZXJz
IGludG8gYmxvY2svLCBtb3ZlcyB0aGUgWGVuIHNwZWNpYWwKY2FzZSBmcm9tIGFyY2ggaG9va3Mg
aW50byBjb21tb24gY29kZSwgY2xlYW5zIHVwIHRoZSBjb2RlIGEgYml0LCBhbmQKcmVtb3ZlcyBu
b3QgbmVzc2VjYXJ5IGluY2x1ZGVzIGZyb20gdGhlIGJsb2NrIGhlYWRlcnMuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
