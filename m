From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH] fix potential null dereference
Date: Sat, 13 Jan 2018 06:21:31 +0000
Message-ID: <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zhuf=ei=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eaFCY-0000wn-QX
 for xen-devel@lists.xenproject.org; Sat, 13 Jan 2018 06:21:58 +0000
Received: by mail-wm0-x244.google.com with SMTP id f140so15427285wmd.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2018 22:21:57 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

KENDIHRoZSBSRVNUIG1haW50YWluZXJzKQoKT24gMDEvMTIvMjAxOCAxMTo0MCBQTSwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOgo+IGhhbmRsZXMgY2FuIHRoZW9yZXRpY2FsbHkgYmUgTlVMTCwg
Y2hlY2sgZm9yIGl0IGV4cGxpY2l0bHkgYmVmb3JlCj4gZGVyZWZlcmVuY2luZyBpdC4KCkkgZG91
YnQgaGFuZGxlcyBjb3VsZCBiZSBOVUxMIGlmIExvY2F0ZUhhbmRsZSBzdWNjZWVkLiBUaGlzIHNl
ZW1zIHRvIGJlIApjb25maXJtZWQgYnkgdGhlIHNwZWMgKFBhZ2UgMjA4IGluIFVFRkkgc3BlYyAy
LjcpLgoKU28gSSBhbSBub3QgZW50aXJlbHkgY29udmluY2Ugd2Ugc2hvdWxkIGFkZCB5ZXQgYW5v
dGhlciBjaGVjayBpbiB0aGUgCmNvZGUuIEFuIEFTU0VSVCBtaWdodCBiZSBiZXR0ZXIuCgpDaGVl
cnMsCgo+IAo+IENJRDogMTM4MTgzOAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9l
ZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gaW5kZXggNDY5YmY5OC4uNDMxZmUy
ZSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMKPiArKysgYi94ZW4vY29tbW9u
L2VmaS9ib290LmMKPiBAQCAtNzI5LDcgKzcyOSw3IEBAIHN0YXRpYyBFRklfR1JBUEhJQ1NfT1VU
UFVUX1BST1RPQ09MIF9faW5pdCAqZWZpX2dldF9nb3Aodm9pZCkKPiAgICAgICBpZiAoICFFRklf
RVJST1Ioc3RhdHVzKSApCj4gICAgICAgICAgIHN0YXR1cyA9IGVmaV9icy0+TG9jYXRlSGFuZGxl
KEJ5UHJvdG9jb2wsICZnb3BfZ3VpZCwgTlVMTCwgJnNpemUsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGhhbmRsZXMpOwo+IC0gICAgaWYgKCBFRklfRVJST1Ioc3Rh
dHVzKSApCj4gKyAgICBpZiAoIEVGSV9FUlJPUihzdGF0dXMpIHx8IGhhbmRsZXMgPT0gTlVMTCAp
Cj4gICAgICAgICAgIHNpemUgPSAwOwo+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgc2l6ZSAvIHNp
emVvZigqaGFuZGxlcyk7ICsraSApCj4gICAgICAgewo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
