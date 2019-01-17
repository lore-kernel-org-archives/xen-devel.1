From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 05/11] optee: add fast calls handling
Date: Thu, 17 Jan 2019 20:02:16 +0000
Message-ID: <78806e0f-4478-1841-1be9-17bc8147b497@arm.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-6-volodymyr_babchuk@epam.com>
 <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com> <87sgxrt7g8.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HtQs=PZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkDro-0003rt-Qr
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 20:02:20 +0000
In-Reply-To: <87sgxrt7g8.fsf@epam.com>
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

SGksCgpPbiAxLzE3LzE5IDc6MjIgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IEp1bGll
biBHcmFsbCB3cml0ZXM6Cj4gCj4gWy4uLl0KPj4+IEJlY2F1c2UgbWVkaWF0b3IgY2FuJ3Qgc2hh
cmUgb25lIHN0YXRpYyBTSE0gcmVnaW9uIHdpdGggYWxsIGd1ZXN0cywKPj4+IGl0IGp1c3QgZGlz
YWJsZXMgaXQgZm9yIGFsbC4KPj4KPj4gSSBoYXZlbid0IHNlZW4gYW4gYW5zd2VyIHRvIG15IHF1
ZXN0aW9uIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLiBGb3IgcmVtaW5kZXI6Cj4gSSdtIHNvcnJ5
LCBJIG1pc3NlZCB0aGlzIHNvbWVob3cuCj4gCj4gCj4+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8g
c3RpbGwgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBhY2Nlc3Mgc3RhdGljIFNITT8KPiBO
b3QgcmVhbGx5LiBJZiBsaW51eCBkcml2ZXJzIHNlZXMgdGhhdCBPUC1URUUgc3VwcG9ydCBkeW5h
bWljIFNITSwgaXQKPiB1c2VzIGl0IGJ5IGRlZmF1bHQuIEFuZCBhbGwgbmV3IHZlcnNpb25zIG9m
IE9QLVRFRSBzdXBwb3J0IGR5bmFtaWMgU0hNLgo+IAo+IFNvLCBpdCB3aWxsIGFkZCB1bm5lY2Vz
c2FyeSBjb2RlIHRvIGVuYWJsZSBmZWF0dXJlIHdoaWNoIHdpbGwgbm90IGJlIHVzZWQuCj4gCj4g
QnV0LCBhY3R1YWxseSwgdGhlcmUgaXMgYSBjYXZlYXQuIFJpZ2h0IG5vdyBsaW51eCBkcml2ZXIg
cmVxdWlyZXMgc3RhdGljIFNITSwKPiBldmVuIGlmIGl0IHdpbGwgbm90IHVzZSBpdC4gSSBoYXZl
IHN1Ym1pdHRlZCBwYXRjaCB0aGF0IGZpeGVzIGl0LCBidXQKPiBpdCBzdGlsbCBub3QgbWVyZ2Vk
Lgo+IAo+IFNvLi4uIHdoYXQgZG8geW91IHRoaW5rPyBTaG91bGQgSSBhZGQgcGllY2Ugb2YgY29k
ZSB3aGljaCBpcyBuZWVkZWQKPiByaWdodCBub3csIGJ1dCB3aWxsIG5vdCBiZSB1c2VkIGxhdGVy
PwoKSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgT1AtVEVFIHdvcmtpbmcgaW4gRG9t
MCB3aXRoIGN1cnJlbnQgCkxpbnV4LiBGb3IgdGhlIGd1ZXN0LCB3ZSBjYW4gcmVxdWlyZSBhIG1v
cmUgcmVjZW50IExpbnV4IGlmIHRoZXJlIGFyZSBubyAKb3RoZXIgc29sdXRpb24uCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
