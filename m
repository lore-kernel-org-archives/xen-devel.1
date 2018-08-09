From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 4/4] xen/arm: Reuse R-Car Gen2 platform
 code for Stout board
Date: Thu, 9 Aug 2018 17:20:54 +0100
Message-ID: <dc8d828c-eef0-7c30-6766-865d80e465e8@arm.com>
References: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
 <1533580552-938-5-git-send-email-olekstysh@gmail.com>
 <fd405643-3ae8-de5d-ed4f-7acd6e3b70b3@arm.com>
 <CAPD2p-m_K4CQzWbVuFp0FWh=kFjrHkLpwZagx0+UO4n0kV-egw@mail.gmail.com>
 <adfc68b1-f061-5c70-9083-3ef7d51d6457@arm.com>
 <CAPD2p-=pJmEqRzShLzudpLh2Ymd0KuDMBgyKfM+gSRyPcR2apA@mail.gmail.com>
 <ac28cd7b-71c4-b1c5-5b2c-7fe0aaf93b54@arm.com>
 <CAPD2p-kwLaF_wMtPSyMT8iYRFHf=dLELBbc0cZbenH1v89BrEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bsm9=ky=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fnngK-0000LA-4U
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 16:21:00 +0000
In-Reply-To: <CAPD2p-kwLaF_wMtPSyMT8iYRFHf=dLELBbc0cZbenH1v89BrEA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOC8wOS8yMDE4IDA1OjE4IFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBP
biBUaHUsIEF1ZyA5LCAyMDE4IGF0IDc6MTAgUE0sIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+PiBTb21laG93IEkgdGhvdWdodCB0aGUgcGxhdGZvcm0gd2FzIDY0
LWJpdCBhbmQgZm91bmQgYSBTT0MgbmFtZSB2ZXJ5IHNpbWlsYXIKPj4gdG8gaXQuIFNvcnJ5IGZv
ciB0aGUgY29uZnVzaW9uLiBQU0NJIHNlZW1zIGluZGVlZCBub3Qgc3VwcG9ydGVkIGZvciB0aGF0
Cj4+IHBsYXRmb3JtLgo+IFItQ2FyIEdlbjMgaXMgQVJNNjQgKEgyIFNvQyAtPiByOGE3NzkwKSBh
bmQgZG9lcyBzdXBwb3J0IFBTQ0kuCj4gQnV0IFItQ2FyIEdlbjIgaXMgQVJNMzIgKEgyIFNvQyAt
PiByOGE3NzkwKQo+IAo+Pgo+PiBIb3dldmVyLCB0aGUgY29kZSBsb29rcyBmYWlybHkgZGlmZmVy
ZW50IHRoYW4gd2hhdCB3ZSBoYXZlIGluIFhlbi4gRm9yCj4+IGluc3RhbmNlIHNlY29uZGFyeSBD
UFUgc2VlbXMgdG8gcmVxdWlyZSB0byBpbml0aWFsaXplIENOVFZPRkYsIHRoZSBmdW5jdGlvbgo+
PiB0byBwb3dlciBvbiBhIENQVSBhbHNvIGxvb2tzIGRpZmZlcmVudC4KPiBTb3JyeSwgd2hpY2gg
Y29kZSB5b3UgYXJlIHRha2luZyBhYm91dCwgVS1Cb290IG9yIExpbnV4PwoKVGhlIFNNUCBjb2Rl
IGluIExpbnV4IHZzIHRoZSBTTVAgY29kZSBpbiBYZW4gZm9yIHRoZSBSLUNhci4gSW4gbW9zdCBv
ZiAKdGhlIGNhc2VzLCBYZW4gc2hvdWxkIHJlcGxpY2F0ZSB3aGF0IExpbnV4IGRvZXMuCgpJIGFt
IHRyeWluZyB0byB1bmRlcnN0YW5kIHdoeSBzdWNoIGRpZmZlcmVuY2VzIGF0IHRoZSBtb21lbnQu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
