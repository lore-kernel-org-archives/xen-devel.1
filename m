From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 06/25] gdbstub: Use size_t to hold
 GDBState::last_packet_len
Date: Wed, 20 Feb 2019 02:02:13 +0100
Message-ID: <20190220010232.18731-7-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGK6-0000dK-6Z
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:05:18 +0000
In-Reply-To: <20190220010232.18731-1-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, Prasad J Pandit <pjp@fedoraproject.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Corey Minyard <minyard@acm.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefan Berger <stefanb@linux.ibm.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: xen-devel@lists.xenproject.org

SW4gcHV0X3BhY2tldF9iaW5hcnkoKSB3ZSBoYXZlOgoKICAgIHVpbnQ4X3QgKnA7CiAgICBmb3Io
OzspIHsKICAgICAgICBwID0gcy0+bGFzdF9wYWNrZXQ7CiAgICAgICAgKihwKyspID0gLi4uCiAg
ICAgICAgcy0+bGFzdF9wYWNrZXRfbGVuID0gcCAtIHMtPmxhc3RfcGFja2V0OwogICAgICAgIHB1
dF9idWZmZXIocywgKHVpbnQ4X3QgKilzLT5sYXN0X3BhY2tldCwgcy0+bGFzdF9wYWNrZXRfbGVu
KTsKClRoZSAncCcgcG9pbnRlciBzdGFydCBhdCBzLT5sYXN0X3BhY2tldCwgdGhlbiBpcyBvbmx5
IGluY3JlbWVudGVkLgpTaW5jZSB3ZSBoYXZlICJwID49IHMtPmxhc3RfcGFja2V0Iiwgd2UgYXJl
IHN1cmUgdGhhbgoicCAtIHMtPmxhc3RfcGFja2V0ID49IDAiLCB0aHVzICJwIC0gcy0+bGFzdF9w
YWNrZXQiIGlzIHBvc2l0aXZlLgoKVGhlIGZldyBvdGhlciBwbGFjZXMgd2hlcmUgcy0+bGFzdF9w
YWNrZXRfbGVuIGlzIHNldCBpcyB3aXRoIGNvbnN0YW50CnBvc2l0aXZlIHZhbHVlcy4KCkl0IG1h
a2VzIHNlbnNlIHRvIHVzZSBzaXplX3QgdG8gaG9sZCBsYXN0X3BhY2tldF9sZW4gdmFsdWVzLgoK
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgotLS0KIGdkYnN0dWIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2dkYnN0dWIuYyBiL2dkYnN0dWIuYwppbmRleCA3
NmVjYTNiYjdlLi42OTM0MGQ3Y2QxIDEwMDY0NAotLS0gYS9nZGJzdHViLmMKKysrIGIvZ2Ric3R1
Yi5jCkBAIC0zMjMsNyArMzIzLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgR0RCU3RhdGUgewogICAgIGlu
dCBsaW5lX3N1bTsgLyogcnVubmluZyBjaGVja3N1bSAqLwogICAgIGludCBsaW5lX2NzdW07IC8q
IGNoZWNrc3VtIGF0IHRoZSBlbmQgb2YgdGhlIHBhY2tldCAqLwogICAgIHVpbnQ4X3QgbGFzdF9w
YWNrZXRbTUFYX1BBQ0tFVF9MRU5HVEggKyA0XTsKLSAgICBpbnQgbGFzdF9wYWNrZXRfbGVuOwor
ICAgIHNpemVfdCBsYXN0X3BhY2tldF9sZW47CiAgICAgaW50IHNpZ25hbDsKICNpZmRlZiBDT05G
SUdfVVNFUl9PTkxZCiAgICAgaW50IGZkOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
