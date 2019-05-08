From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V5 3/4] xen/arm: Extend SCIF early prink
 code to handle other interfaces
Date: Wed, 8 May 2019 12:20:48 +0300
Message-ID: <81ae5be3-42ea-ab0e-f887-0ccc1e9dcfb6@gmail.com>
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <1556816422-25185-4-git-send-email-olekstysh@gmail.com>
 <06cd7a91-e70b-1eeb-bafb-d59a7f5d4d2b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TsEx=TI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hOIku-0002rq-JW
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 09:20:52 +0000
Received: by mail-lf1-x141.google.com with SMTP id w23so13991484lfc.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 02:20:51 -0700 (PDT)
In-Reply-To: <06cd7a91-e70b-1eeb-bafb-d59a7f5d4d2b@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDA3LjA1LjE5IDE5OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+IE9uIDUvMi8xOSA2OjAwIFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
wqAgZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0wqDCoMKgIHzCoCA1ICsrKysrCj4+IMKg
IHhlbi9hcmNoL2FybS9SdWxlcy5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKysr
KysrCj4+IMKgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8IDE3ICsrKysrKysr
KysrLS0tLS0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4
dCAKPj4gYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKPj4gaW5kZXggYjIzYzU0Zi4u
ODllMDgxZSAxMDA2NDQKPj4gLS0tIGEvZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0Cj4+
ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+PiBAQCAtMjcsNiArMjcsMTEg
QEAgCj4+IENPTkZJR19FQVJMWV9QUklOVEs9PElOQz4sPEJBU0VfQUREUkVTUz4sPE9USEVSX09Q
VElPTlM+Cj4+IMKgwqDCoMKgwqDCoMKgIElmIDxCQVVEX1JBVEU+IGlzIG5vdCBnaXZlbiB0aGVu
IHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwo+PiDCoMKgwqDCoMKgwqDCoCBpbml0aWFsaXplIHRo
ZSBVQVJULCBzbyB0aGF0IGJvb3Rsb2FkZXIgb3IgZmlybXdhcmUgc2V0dGluZ3MgY2FuCj4+IMKg
wqDCoMKgwqDCoCBiZSB1c2VkIGZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHkuCj4+ICvCoCAtIHNj
aWYsPEJBU0VfQUREUkVTUz4sPFZFUlNJT04+Cj4+ICvCoMKgwqAgLSBTQ0lGPFZFUlNJT04+IGlz
LCBvcHRpb25hbGx5LCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gb2YgdGhlIFVBUlQuCj4+ICsKPj4g
K8KgwqDCoMKgwqAgSWYgPFZFUlNJT04+IGlzIG5vdCBnaXZlbiB0aGVuIHRoZSBkZWZhdWx0IGlu
dGVyZmFjZSB2ZXJzaW9uIAo+PiAoU0NJRikKPj4gK8KgwqDCoMKgwqAgd2lsbCBiZSB1c2VkLgo+
Cj4gVGhpcyBwYXRjaCBub3cgbG9va3MgZ29vZC4gSSB3b3VsZCBsaWtlIHNvbWUgaW5wdXQgZnJv
bSBTdGVmYW5vIG9uIHRoZSAKPiB3b3JkaW5nIGhlcmUgYmVmb3JlIGl0IGdldHMgbWVyZ2VkLgpJ
IHVuZGVyc3RhbmQuIFRoYW5rIHlvdS4KCgo+Cj4gQ2hlZXJzLAo+Ci0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
