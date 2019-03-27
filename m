From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 06/12] xen/arm64: sysreg: Implement the
 32-bit helpers using the 64-bit helpers
Date: Wed, 27 Mar 2019 19:15:39 +0000
Message-ID: <a74aba5f-823f-c49c-4852-c832dcdb8ecf@citrix.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-7-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kI0R=R6=citrix.com=prvs=9824fb700=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9E1c-0005l6-A3
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 19:15:48 +0000
In-Reply-To: <20190327184531.30986-7-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxODo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIGlzIHBpY2tp
ZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4g
ZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPgo+IFRo
ZSBpbnN0cnVjdGlvbnMgbXNyL21ycyBhcmUgZXhwZWN0aW5nIGEgNjQtYml0IHJlZ2lzdGVyLiBU
aGlzIG1lYW5zIHRoZQo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSAzMi1iaXQgaGVscGVycyBpcyBu
b3QgY29ycmVjdC4gVGhlIGVhc2llc3QKPiBzb2x1dGlvbiBpcyB0byBpbXBsZW1lbnQgdGhlIDMy
LWJpdCBoZWxwZXJzIHVzaW5nIHRoZSA2NC1iaXQgaGVscGVycy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgooSSBkb24ndCBoYXZlIGFuIG9w
aW5pb24gb24gaG93IHRvIGZpeCB0aGUgaXNzdWUsIGJ1dCkKCkFyZSBTWVNSRUdTIGFjdHVhbGx5
IGFsd2F5cyA2NCBiaXRzIGV2ZW4gb24gYXJtMzIsIGFuZCB0aGVzZSBoZWxwZXJzCmp1c3QgYSBz
aG9ydGhhbmQgZm9yIHRoZSBsb3dlciAzMiBiaXRzLCBvciBpcyB0aGlzIGFuCmVmZmVjdGl2ZWx5
LXVubmVjZXNzYXJ5IGNvbnN0cmFpbnQgaW1wb3NlZCBieSBDbGFuZz8KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
