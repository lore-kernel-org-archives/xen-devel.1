From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
Date: Tue, 2 Apr 2019 18:49:05 +0100
Message-ID: <68f3392e-9bc5-422b-787b-38f5a82c0fa0@citrix.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBNaC-0004U9-8t
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 17:52:24 +0000
In-Reply-To: <20190402164238.1815-3-julien.grall@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAxNzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZWFybHlfcHJpbnRrLmMgYi94ZW4vYXJjaC9hcm0vZWFybHlfcHJpbnRrLmMK
PiBpbmRleCA5NzQ2NmExMmIxLi4zNWE0N2M3MjI5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9lYXJseV9wcmludGsuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9lYXJseV9wcmludGsuYwo+IEBA
IC0xNyw5ICsxNywxMCBAQAo+ICB2b2lkIGVhcmx5X3B1dGNoKGNoYXIgYyk7Cj4gIHZvaWQgZWFy
bHlfZmx1c2godm9pZCk7Cj4gIAo+IC12b2lkIGVhcmx5X3B1dHMoY29uc3QgY2hhciAqcykKPiAr
dm9pZCBlYXJseV9wdXRzKGNvbnN0IGNoYXIgKnMsIHVuc2lnbmVkIGludCBucikKCnNpemVfdCBo
ZXJlIGFuZCBlbHNld2hlcmUgcGxlYXNlLCBiZWNhdXNlLi4uCgo+IEBAIC02NjYsMTYgKzY2NCwx
NiBAQCBzdGF0aWMgYm9vbF90IGNvbnNvbGVfbG9ja3NfYnVzdGVkOwo+ICAKPiAgc3RhdGljIHZv
aWQgX19wdXRzdHIoY29uc3QgY2hhciAqc3RyKQo+ICB7Cj4gKyAgICBzaXplX3QgbGVuID0gc3Ry
bGVuKHN0cik7Cj4gKwo+ICAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZjb25zb2xlX2xvY2sp
KTsKPiAgCj4gLSAgICBzZXJjb25fcHV0cyhzdHIpOwo+IC0gICAgdmlkZW9fcHV0cyhzdHIpOwo+
ICsgICAgc2VyY29uX3B1dHMoc3RyLCBsZW4pOwo+ICsgICAgdmlkZW9fcHV0cyhzdHIsIGxlbik7
CgouLi4gdGhpcyBpbnRyb2R1Y2VzIGEgdHJ1bmNhdGlvbiBidWcgZm9yIDY0Yml0IGJ1aWxkcy4K
CkkgZG9uJ3QgZXhwZWN0IGEgNEcgYnVmZmVyIHRvIGJlIHBhc3NlZCwgYnV0IGl0IGlzIG5vdCB3
b3J0aCBpbnRyb2R1Y2luZwp0aGUgcG9zc2liaWxpdHkgZm9yIHN1Y2ggYSBzdWJ0bGUgYnVnIGlu
IHRoZSBmaXJzdCBwbGFjZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
