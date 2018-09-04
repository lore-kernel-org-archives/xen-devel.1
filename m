From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/13] block: remove bvec_to_phys
Date: Tue, 4 Sep 2018 21:36:06 +0200
Message-ID: <CAMuHMdUOdbf=m-OiYWup-WWrf6YS+294DA1dQzt_wVAtqE5W2g@mail.gmail.com>
References: <20180904191431.20102-1-hch@lst.de>
 <20180904191431.20102-11-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180904191431.20102-11-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, ming.lei@redhat.com, linux-block@vger.kernel.org, xen-devel@lists.xen.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgNCwgMjAxOCBhdCA5OjIzIFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPiB3cm90ZToKPiBXZSBvbmx5IHVzZSBpdCBpbiBiaW92ZWNfcGh5c19tZXJnZWFibGUgYW5k
IGEgbTY4ayBwYXJhdmlydCBkcml2ZXIsCj4gc28ganVzdCBvcGVuY29kZSBpdCB0aGVyZS4gIEFs
c28gcmVtb3ZlIHRoZSBwb2ludGxlc3MgdW5zaWduZWQgbG9uZyBjYXN0Cj4gZm9yIHRoZSBvZmZz
ZXQgaW4gdGhlIG9wZW5jb2RlZCBpbnN0YW5jZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKPiAtLS0KPiAgYXJjaC9tNjhrL2VtdS9uZmJsb2NrLmMg
fCAyICstCgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
IApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
