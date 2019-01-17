From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 05/11] optee: add fast calls handling
Date: Thu, 17 Jan 2019 20:10:14 +0000
Message-ID: <87pnsvt595.fsf@epam.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-6-volodymyr_babchuk@epam.com>
 <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com> <87sgxrt7g8.fsf@epam.com>
 <78806e0f-4478-1841-1be9-17bc8147b497@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dvot=PZ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1gkDzX-0004p5-20
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 20:10:19 +0000
In-Reply-To: <78806e0f-4478-1841-1be9-17bc8147b497@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
List-Id: xen-devel@lists.xenproject.org

CkhpLAoKSnVsaWVuIEdyYWxsIHdyaXRlczoKCj4gSGksCj4KPiBPbiAxLzE3LzE5IDc6MjIgUE0s
IFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pgo+PiBb
Li4uXQo+Pj4+IEJlY2F1c2UgbWVkaWF0b3IgY2FuJ3Qgc2hhcmUgb25lIHN0YXRpYyBTSE0gcmVn
aW9uIHdpdGggYWxsIGd1ZXN0cywKPj4+PiBpdCBqdXN0IGRpc2FibGVzIGl0IGZvciBhbGwuCj4+
Pgo+Pj4gSSBoYXZlbid0IHNlZW4gYW4gYW5zd2VyIHRvIG15IHF1ZXN0aW9uIG9uIHRoZSBwcmV2
aW91cyB2ZXJzaW9uLiBGb3IgcmVtaW5kZXI6Cj4+IEknbSBzb3JyeSwgSSBtaXNzZWQgdGhpcyBz
b21laG93Lgo+Pgo+Pgo+Pj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBzdGlsbCBhbGxvdyB0aGUg
aGFyZHdhcmUgZG9tYWluIHRvIGFjY2VzcyBzdGF0aWMgU0hNPwo+PiBOb3QgcmVhbGx5LiBJZiBs
aW51eCBkcml2ZXJzIHNlZXMgdGhhdCBPUC1URUUgc3VwcG9ydCBkeW5hbWljIFNITSwgaXQKPj4g
dXNlcyBpdCBieSBkZWZhdWx0LiBBbmQgYWxsIG5ldyB2ZXJzaW9ucyBvZiBPUC1URUUgc3VwcG9y
dCBkeW5hbWljIFNITS4KPj4KPj4gU28sIGl0IHdpbGwgYWRkIHVubmVjZXNzYXJ5IGNvZGUgdG8g
ZW5hYmxlIGZlYXR1cmUgd2hpY2ggd2lsbCBub3QgYmUgdXNlZC4KPj4KPj4gQnV0LCBhY3R1YWxs
eSwgdGhlcmUgaXMgYSBjYXZlYXQuIFJpZ2h0IG5vdyBsaW51eCBkcml2ZXIgcmVxdWlyZXMgc3Rh
dGljIFNITSwKPj4gZXZlbiBpZiBpdCB3aWxsIG5vdCB1c2UgaXQuIEkgaGF2ZSBzdWJtaXR0ZWQg
cGF0Y2ggdGhhdCBmaXhlcyBpdCwgYnV0Cj4+IGl0IHN0aWxsIG5vdCBtZXJnZWQuCj4+Cj4+IFNv
Li4uIHdoYXQgZG8geW91IHRoaW5rPyBTaG91bGQgSSBhZGQgcGllY2Ugb2YgY29kZSB3aGljaCBp
cyBuZWVkZWQKPj4gcmlnaHQgbm93LCBidXQgd2lsbCBub3QgYmUgdXNlZCBsYXRlcj8KPgo+IEkg
dGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIE9QLVRFRSB3b3JraW5nIGluIERvbTAgd2l0
aCBjdXJyZW50Cj4gTGludXguIEZvciB0aGUgZ3Vlc3QsIHdlIGNhbiByZXF1aXJlIGEgbW9yZSBy
ZWNlbnQgTGludXggaWYgdGhlcmUgYXJlCj4gbm8gb3RoZXIgc29sdXRpb24uCgpPa2F5LCBJJ2xs
IHRha2UgYSBsb29rIHdoYXQgY2FuIGJlIGRvbmUuIENhbiBJIGRvIHRoaXMgaW4gYSBzZXBhcmF0
ZSBwYXRjaD8KCgotLSAKQmVzdCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
