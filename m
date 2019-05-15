From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH v2 01/10] xen: add a p2mt parameter to
 map_mmio_regions
Date: Wed, 15 May 2019 16:39:27 +0300
Message-ID: <2d610735-2354-ac4b-980a-7961d689a5af@gmail.com>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzW7=TP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hQu83-0005ex-Ki
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 13:39:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id r76so2520320lja.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 06:39:30 -0700 (PDT)
In-Reply-To: <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, JBeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

Ck9uIDAxLjA1LjE5IDAwOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSwgU3RlZmFu
bwoKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMKPiBpbmRleCBlZmI2Y2E5Li42YWRmYTU1IDEwMDY0NAo+IC0tLSBhL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
Cj4gQEAgLTUyLDcgKzUyLDggQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9uZyBz
LCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsCj4gICAgICAgICAgICAqIC0ge3VufW1hcF9t
bWlvX3JlZ2lvbnMgZG9lc24ndCBzdXBwb3J0IHByZWVtcHRpb24uCj4gICAgICAgICAgICAqLwo+
ICAgCj4gLSAgICAgICAgcmMgPSBtYXAtPm1hcCA/IG1hcF9tbWlvX3JlZ2lvbnMobWFwLT5kLCBf
Z2ZuKHMpLCBzaXplLCBfbWZuKHMpKQo+ICsgICAgICAgIHJjID0gbWFwLT5tYXAgPyBtYXBfbW1p
b19yZWdpb25zKG1hcC0+ZCwgX2dmbihzKSwgc2l6ZSwgX21mbihzKSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fbW1pb19kaXJlY3QpCgpOb3QgcmVhbGx5
IHN1cmUgdGhlIFZQQ0kgaXMgdXNlZCBvbiBBUk0sIGJ1dCB4ZW4vZHJpdmVycy92cGNpLyBsb29r
cyAKbGlrZSBhIGNvbW1vbiBjb2RlLgoKQnV0LCBhY2NvcmRpbmcgdG8gdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbiwgd2Ugc2hvdWxkIHBhc3MgCiJwMm1fbW1pb19kaXJlY3QiIG9uIHg4NiBhbmQgInAy
bV9tbWlvX2RpcmVjdF9kZXYiIG9uIEFSTS4uLgoKPiAgICAgICAgICAgICAgICAgICAgICAgICA6
IHVubWFwX21taW9fcmVnaW9ucyhtYXAtPmQsIF9nZm4ocyksIHNpemUsIF9tZm4ocykpOwo+ICAg
ICAgICAgICBpZiAoIHJjID09IDAgKQo+ICAgICAgICAgICB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oCgotLSAKUmVn
YXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
