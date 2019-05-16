From: "Sironi, Filippo" <sironi@amazon.de>
Subject: Re: [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
Date: Thu, 16 May 2019 15:14:16 +0000
Message-ID: <649AEBAC-8408-4BC0-AA22-F721CC23648D__37627.7315824822$1558019726$gmane$org@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
 <7aae3e49-5b1c-96d1-466e-5b061305dc9d@citrix.com>
 <22fadfb1-e48d-ccb6-0e42-c105b7335d7a@amazon.com>
 <92f2f186-2e29-d798-84bd-7209e874f103@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XxdW=TQ=amazon.de=prvs=03221fa14=sironi@srs-us1.protection.inumbo.net>)
 id 1hRI5Q-0001fw-Mj
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:14:24 +0000
In-Reply-To: <92f2f186-2e29-d798-84bd-7209e874f103@oracle.com>
Content-Language: en-US
Content-ID: <6E2A8B9BB2A14F4E92BDE4A9FB721974@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Graf,
 Alexander" <graf@amazon.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Cj4gT24gMTYuIE1heSAyMDE5LCBhdCAxNzowMiwgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gCj4gT24gNS8xNi8xOSAxMDowOCBBTSwgQWxleGFu
ZGVyIEdyYWYgd3JvdGU6Cj4+IAo+PiBNeSBwb2ludCBpcyBtb3N0bHkgdGhhdCB3ZSBzaG91bGQg
YmUgYXMgY29tbW9uCj4+IGFzIHBvc3NpYmxlIHdoZW4gaXQgY29tZXMgdG8gL3N5cy9oeXBlcnZp
c29yLCBzbyB0aGF0IHRvb2xzIGRvbid0IGhhdmUKPj4gdG8gY2FyZSBhYm91dCB0aGUgSFYgdGhl
eSdyZSB3b3JraW5nIGFnYWluc3QuCj4gCj4gSXQgbWlnaHQgbWFrZSBzZW5zZSB0byBoYXZlIGEg
Y29tbW9uIHN5cy1oeXBlcnZpc29yLmMgZmlsZQo+IChkcml2ZXJzL2h5cGVydmlzb3Ivc3lzLWh5
cGVydmlzb3IuYyBvciBzb21lIHN1Y2gpLCB3aXRoCj4gaHlwZXJ2aXNvci1zcGVjaWZpYyBvcHMv
Y2FsbGJhY2tzL2V0Yy4KPiAKPiAtYm9yaXMKCgpZZXMsIGl0IGRlZmluaXRlbHkgZG9lcy4gSSB3
b3VsZCBmb2xsb3cgdXAgd2l0aCBmdXR1cmUgcGF0Y2hlcyB0byBtYWtlIGl0CmhhcHBlbi4KCkZp
bGlwcG8KCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVn
ZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
