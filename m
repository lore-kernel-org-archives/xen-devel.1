From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/3] drm/xen-front: checking for NULL
 instead of IS_ERR
Date: Tue, 8 May 2018 12:34:13 +0300
Message-ID: <0d0ce12b-5dbc-dc36-b57b-6d93e98f3f04__4033.93545789204$1525771983$gmane$org@gmail.com>
References: <20180508092650.GA661@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180508092650.GA661@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDgvMjAxOCAxMjoyNiBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBkcm1fZGV2X2Fs
bG9jKCkgcmV0dXJucyBlcnJvciBwb2ludGVycywgaXQgbmV2ZXIgcmV0dXJucyBOVUxMLgo+Cj4g
Rml4ZXM6IGM1NzViN2VlYjg5ZiAoImRybS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBYZW4g
UFYgZGlzcGxheSBmcm9udGVuZCIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgpUaGFuayB5b3UsClJldmlld2VkLWJ5OiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYwo+IGluZGV4IDFiMGVhOWFjMzMwZS4uODYxNWU4NTIy
YzdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiBAQCAtNTQzLDggKzU0
Myw4IEBAIHN0YXRpYyBpbnQgeGVuX2RybV9kcnZfaW5pdChzdHJ1Y3QgeGVuX2RybV9mcm9udF9p
bmZvICpmcm9udF9pbmZvKQo+ICAgCWZyb250X2luZm8tPmRybV9pbmZvID0gZHJtX2luZm87Cj4g
ICAKPiAgIAlkcm1fZGV2ID0gZHJtX2Rldl9hbGxvYygmeGVuX2RybV9kcml2ZXIsIGRldik7Cj4g
LQlpZiAoIWRybV9kZXYpIHsKPiAtCQlyZXQgPSAtRU5PTUVNOwo+ICsJaWYgKElTX0VSUihkcm1f
ZGV2KSkgewo+ICsJCXJldCA9IFBUUl9FUlIoZHJtX2Rldik7Cj4gICAJCWdvdG8gZmFpbDsKPiAg
IAl9Cj4gICAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
