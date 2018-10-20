From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 06/23] xen/arm: don't add duplicate boot
 modules, introduce domU flag
Date: Sat, 20 Oct 2018 13:10:09 +0100
Message-ID: <55c447a6-748f-5caa-be42-71551723c960@arm.com>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-6-git-send-email-sstabellini@kernel.org>
 <92df9337-8da5-5c79-5bc5-8763b6beb719@arm.com>
 <alpine.DEB.2.10.1810191629250.31582@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1810191629250.31582@sstabellini-ThinkPad-X260>
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEwLzIwLzE4IDEyOjM2IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gT24gVHVlLCA5IE9jdCAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+Pj4gaW5k
ZXggYmM3ZGQ5Ny4uZGJhYjIzMiAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5j
Cj4+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+Pj4gQEAgLTIwMSwxMCArMjAxLDEyIEBA
IHZvaWQgX19pbml0IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBhZGRyX3QKPj4+
IGUsCj4+PiAgICB9Cj4+PiAgICAgIHN0cnVjdCBib290bW9kdWxlIF9faW5pdCAqYWRkX2Jvb3Rf
bW9kdWxlKGJvb3Rtb2R1bGVfa2luZCBraW5kLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3Qgc2l6ZSkKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHN0YXJ0LCBwYWRk
cl90IHNpemUsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ym9vbCBkb21VKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVjdCBib290bW9kdWxlcyAqbW9kcyA9
ICZib290aW5mby5tb2R1bGVzOwo+Pj4gICAgICAgIHN0cnVjdCBib290bW9kdWxlICptb2Q7Cj4+
IFRoaXMgYXQgbGVhc3QgbmVlZCB0byBiZSByZXBsaWNhCj4gCj4gSSB0YWtlIHRoaXMgd2FzIGEg
dHlwbz8KCkkgY2FuJ3QgcmVtZW1iZXIuIExldCdzIGNvbnNpZGVyIGEgdHlwbyB1bnRpbCB0aGUg
bmV4dCB2ZXJzaW9uIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
