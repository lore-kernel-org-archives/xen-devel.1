From: Joe Jin <joe.jin@oracle.com>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Mon, 29 Oct 2018 19:51:51 -0700
Message-ID: <3e65208c-cb11-d918-00eb-012a97e56fec__35204.7602799304$1540867862$gmane$org@oracle.com>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9qeq=nk=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1gHK8N-0008PN-Is
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 02:51:59 +0000
In-Reply-To: <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org\"" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjUvMTggMTE6NTYgQU0sIEpvZSBKaW4gd3JvdGU6Cj4gSSBqdXN0IGRpc2N1c3NlZCB0
aGlzIHBhdGNoIHdpdGggQm9yaXMgaW4gcHJpdmF0ZSwgaGlzIG9waW5pb25zKEJvcmlzLAo+IHBs
ZWFzZSBjb3JyZWN0IG1lIGlmIGFueSBtaXN1bmRlcnN0b29kKSBhcmU6Cj4gCj4gMS4gV2l0aC93
aXRob3V0IHRoZSBjaGVjaywgYm90aCBhcmUgaW5jb3JyZWN0LCBoZSB0aG91Z2h0IHdlIG5lZWQg
dG8KPiAgICBwcmV2ZW50ZWQgdW5hbGxvYydkIGZyZWUgYXQgaGVyZS4gCj4gMi4gT24gZnJlZWlu
ZywgaWYgdXBwZXIgbGF5ZXIgYWxyZWFkeSBjaGVja2VkIHRoZSBtZW1vcnkgd2FzIERNQS1hYmxl
LAo+ICAgIHRoZSBjaGVja2luZyBhdCBoZXJlIGRvZXMgbm90IG1ha2Ugc2Vuc2UsIHdlIGNhbiBy
ZW1vdmUgYWxsIGNoZWNrcy4KPiAzLiB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkgYW5k
IHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkKPiAgICB0byBjb21lIGluIHBhaXJzLgpJ
IHRyaWVkIHRvIGFkZGVkIHJhZGl4X3RyZWUgdG8gdHJhY2sgYWxsb2NhdGluZy9mcmVlaW5nIGFu
ZCBJIGZvdW5kIHNvbWUKbWVtb3J5IG9ubHkgYWxsb2NhdGVkIGJ1dCB3YXMgbm90IGZyZWVkLCBJ
IGd1ZXNzIGl0IGNhdXNlZCBieSBkcml2ZXIgdXNlZApkbWFfcG9vbCwgdGhhdCBtZWFucyBpZiBs
b3RzIG9mIHN1Y2ggcmVxdWVzdHMsIHRoZSBsaXN0IHdpbGwgY29uc3VtZSBsb3QKb2YgbWVtb3J5
IGZvciBpdC4gV2lsbCBjb250aW51ZSB0byB3b3JrIG9uIGl0LCBpZiBhbnlvbmUgaGF2ZSBnb29k
IGlkZWEKZm9yIGl0IHBsZWFzZSBsZXQgbWUga25vdywgSSdkIGxpa2UgdG8gdHJ5IGl0LgoKVGhh
bmtzLApKb2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
