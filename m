From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 05/11] optee: add fast calls handling
Date: Thu, 17 Jan 2019 19:22:47 +0000
Message-ID: <87sgxrt7g8.fsf@epam.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-6-volodymyr_babchuk@epam.com>
 <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dvot=PZ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1gkDFc-0000Qz-2A
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 19:22:52 +0000
In-Reply-To: <fd3e26a9-6644-06c8-8acd-4e19b36aa5af@arm.com>
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

CkhlbGxvIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6CgpbLi4uXQo+PiBCZWNhdXNlIG1l
ZGlhdG9yIGNhbid0IHNoYXJlIG9uZSBzdGF0aWMgU0hNIHJlZ2lvbiB3aXRoIGFsbCBndWVzdHMs
Cj4+IGl0IGp1c3QgZGlzYWJsZXMgaXQgZm9yIGFsbC4KPgo+IEkgaGF2ZW4ndCBzZWVuIGFuIGFu
c3dlciB0byBteSBxdWVzdGlvbiBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbi4gRm9yIHJlbWluZGVy
OgpJJ20gc29ycnksIEkgbWlzc2VkIHRoaXMgc29tZWhvdy4KCgo+IFdvdWxkIGl0IG1ha2Ugc2Vu
c2UgdG8gc3RpbGwgYWxsb3cgdGhlIGhhcmR3YXJlIGRvbWFpbiB0byBhY2Nlc3Mgc3RhdGljIFNI
TT8KTm90IHJlYWxseS4gSWYgbGludXggZHJpdmVycyBzZWVzIHRoYXQgT1AtVEVFIHN1cHBvcnQg
ZHluYW1pYyBTSE0sIGl0CnVzZXMgaXQgYnkgZGVmYXVsdC4gQW5kIGFsbCBuZXcgdmVyc2lvbnMg
b2YgT1AtVEVFIHN1cHBvcnQgZHluYW1pYyBTSE0uCgpTbywgaXQgd2lsbCBhZGQgdW5uZWNlc3Nh
cnkgY29kZSB0byBlbmFibGUgZmVhdHVyZSB3aGljaCB3aWxsIG5vdCBiZSB1c2VkLgoKQnV0LCBh
Y3R1YWxseSwgdGhlcmUgaXMgYSBjYXZlYXQuIFJpZ2h0IG5vdyBsaW51eCBkcml2ZXIgcmVxdWly
ZXMgc3RhdGljIFNITSwKZXZlbiBpZiBpdCB3aWxsIG5vdCB1c2UgaXQuIEkgaGF2ZSBzdWJtaXR0
ZWQgcGF0Y2ggdGhhdCBmaXhlcyBpdCwgYnV0Cml0IHN0aWxsIG5vdCBtZXJnZWQuCgpTby4uLiB3
aGF0IGRvIHlvdSB0aGluaz8gU2hvdWxkIEkgYWRkIHBpZWNlIG9mIGNvZGUgd2hpY2ggaXMgbmVl
ZGVkCnJpZ2h0IG5vdywgYnV0IHdpbGwgbm90IGJlIHVzZWQgbGF0ZXI/CgotLQpCZXN0IHJlZ2Fy
ZHMsIFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
