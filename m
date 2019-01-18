From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 05/11] optee: add fast calls handling
Date: Fri, 18 Jan 2019 15:29:13 +0000
Message-ID: <a097d511-fa83-e808-08e6-89af8481f0a5@arm.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-6-volodymyr_babchuk@epam.com>
 <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com> <87sgxrt7g8.fsf@epam.com>
 <78806e0f-4478-1841-1be9-17bc8147b497@arm.com> <87pnsvt595.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yjae=P2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkW57-0004uC-U8
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 15:29:17 +0000
In-Reply-To: <87pnsvt595.fsf@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNy8wMS8yMDE5IDIwOjEwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBIaSwK
PiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gT24gMS8xNy8xOSA3OjIy
IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+
Pgo+Pj4gWy4uLl0KPj4+Pj4gQmVjYXVzZSBtZWRpYXRvciBjYW4ndCBzaGFyZSBvbmUgc3RhdGlj
IFNITSByZWdpb24gd2l0aCBhbGwgZ3Vlc3RzLAo+Pj4+PiBpdCBqdXN0IGRpc2FibGVzIGl0IGZv
ciBhbGwuCj4+Pj4KPj4+PiBJIGhhdmVuJ3Qgc2VlbiBhbiBhbnN3ZXIgdG8gbXkgcXVlc3Rpb24g
b24gdGhlIHByZXZpb3VzIHZlcnNpb24uIEZvciByZW1pbmRlcjoKPj4+IEknbSBzb3JyeSwgSSBt
aXNzZWQgdGhpcyBzb21laG93Lgo+Pj4KPj4+Cj4+Pj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBz
dGlsbCBhbGxvdyB0aGUgaGFyZHdhcmUgZG9tYWluIHRvIGFjY2VzcyBzdGF0aWMgU0hNPwo+Pj4g
Tm90IHJlYWxseS4gSWYgbGludXggZHJpdmVycyBzZWVzIHRoYXQgT1AtVEVFIHN1cHBvcnQgZHlu
YW1pYyBTSE0sIGl0Cj4+PiB1c2VzIGl0IGJ5IGRlZmF1bHQuIEFuZCBhbGwgbmV3IHZlcnNpb25z
IG9mIE9QLVRFRSBzdXBwb3J0IGR5bmFtaWMgU0hNLgo+Pj4KPj4+IFNvLCBpdCB3aWxsIGFkZCB1
bm5lY2Vzc2FyeSBjb2RlIHRvIGVuYWJsZSBmZWF0dXJlIHdoaWNoIHdpbGwgbm90IGJlIHVzZWQu
Cj4+Pgo+Pj4gQnV0LCBhY3R1YWxseSwgdGhlcmUgaXMgYSBjYXZlYXQuIFJpZ2h0IG5vdyBsaW51
eCBkcml2ZXIgcmVxdWlyZXMgc3RhdGljIFNITSwKPj4+IGV2ZW4gaWYgaXQgd2lsbCBub3QgdXNl
IGl0LiBJIGhhdmUgc3VibWl0dGVkIHBhdGNoIHRoYXQgZml4ZXMgaXQsIGJ1dAo+Pj4gaXQgc3Rp
bGwgbm90IG1lcmdlZC4KPj4+Cj4+PiBTby4uLiB3aGF0IGRvIHlvdSB0aGluaz8gU2hvdWxkIEkg
YWRkIHBpZWNlIG9mIGNvZGUgd2hpY2ggaXMgbmVlZGVkCj4+PiByaWdodCBub3csIGJ1dCB3aWxs
IG5vdCBiZSB1c2VkIGxhdGVyPwo+Pgo+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2
ZSBPUC1URUUgd29ya2luZyBpbiBEb20wIHdpdGggY3VycmVudAo+PiBMaW51eC4gRm9yIHRoZSBn
dWVzdCwgd2UgY2FuIHJlcXVpcmUgYSBtb3JlIHJlY2VudCBMaW51eCBpZiB0aGVyZSBhcmUKPj4g
bm8gb3RoZXIgc29sdXRpb24uCj4gCj4gT2theSwgSSdsbCB0YWtlIGEgbG9vayB3aGF0IGNhbiBi
ZSBkb25lLiBDYW4gSSBkbyB0aGlzIGluIGEgc2VwYXJhdGUgcGF0Y2g/CgpJIGFtIGZpbmUgd2l0
aCB0aGF0LiBQbGVhc2UgbWVudGlvbiBpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhvdWdoLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
