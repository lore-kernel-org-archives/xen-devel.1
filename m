From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 14/25] virtio-serial: Let
 VirtIOSerialPortClass::have_data() use size_t
Date: Wed, 20 Feb 2019 02:02:21 +0100
Message-ID: <20190220010232.18731-15-philmd@redhat.com>
References: <20190220010232.18731-1-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O+CU=Q3=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gwGLG-0001Cm-VP
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 01:06:30 +0000
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

Qm90aCBjYWxsZXJzIGluIGh3L2NoYXIvdmlydGlvLXNlcmlhbC1idXMuYyBwcm92aWRlIHVuc2ln
bmVkIHZhbHVlcywKZXZlbiB0aGUgdHJhY2UgZXZlbnQgZGlzcGxheSBhbiB1bnNpZ25lZCB2YWx1
ZS4KQ29udmVydCB0aGUgaGF2ZV9kYXRhKCkgaGFuZGxlciB0byB0YWtlIGFuIHVuc2lnbmVkIHZh
bHVlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgotLS0KSXQgaXMgZnVubnkvc2NhcnkgdGhhdCB0aGVyZSBhcmUgYmlnIGNvbW1lbnRz
IGFib3V0IGhvdyB0byB0cmVhdAplcnJvcnMgdG8gc2V0IHRoZSByZXR1cm4gdmFsdWUsIHRoZW4g
dGhlIHJldHVybiB2YWx1ZSBpcyBzaW1wbHkKaWdub3JlZCBieSB0aGUgY2FsbGVyLgotLS0KIGh3
L2NoYXIvdmlydGlvLWNvbnNvbGUuYyAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvaHcvdmlydGlv
L3ZpcnRpby1zZXJpYWwuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2NoYXIvdmlydGlvLWNvbnNvbGUuYyBi
L2h3L2NoYXIvdmlydGlvLWNvbnNvbGUuYwppbmRleCAyY2JlMWQ0ZWQ1Li4xOTYzOWRjYTNiIDEw
MDY0NAotLS0gYS9ody9jaGFyL3ZpcnRpby1jb25zb2xlLmMKKysrIGIvaHcvY2hhci92aXJ0aW8t
Y29uc29sZS5jCkBAIC00NSw3ICs0NSw3IEBAIHN0YXRpYyBnYm9vbGVhbiBjaHJfd3JpdGVfdW5i
bG9ja2VkKEdJT0NoYW5uZWwgKmNoYW4sIEdJT0NvbmRpdGlvbiBjb25kLAogCiAvKiBDYWxsYmFj
ayBmdW5jdGlvbiB0aGF0J3MgY2FsbGVkIHdoZW4gdGhlIGd1ZXN0IHNlbmRzIHVzIGRhdGEgKi8K
IHN0YXRpYyBzc2l6ZV90IGZsdXNoX2J1ZihWaXJ0SU9TZXJpYWxQb3J0ICpwb3J0LAotICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJ1Ziwgc3NpemVfdCBsZW4pCisgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqYnVmLCBzaXplX3QgbGVuKQogewog
ICAgIFZpcnRDb25zb2xlICp2Y29uID0gVklSVElPX0NPTlNPTEUocG9ydCk7CiAgICAgc3NpemVf
dCByZXQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tc2VyaWFsLmggYi9p
bmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tc2VyaWFsLmgKaW5kZXggMTI2NTdhOWYzOS4uZjFhNWNj
ZjRmNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLXNlcmlhbC5oCisrKyBi
L2luY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby1zZXJpYWwuaApAQCAtODEsNyArODEsNyBAQCB0eXBl
ZGVmIHN0cnVjdCBWaXJ0SU9TZXJpYWxQb3J0Q2xhc3MgewogICAgICAqICdsZW4nLiAgSW4gdGhp
cyBjYXNlLCB0aHJvdHRsaW5nIHdpbGwgYmUgZW5hYmxlZCBmb3IgdGhpcyBwb3J0LgogICAgICAq
LwogICAgIHNzaXplX3QgKCpoYXZlX2RhdGEpKFZpcnRJT1NlcmlhbFBvcnQgKnBvcnQsIGNvbnN0
IHVpbnQ4X3QgKmJ1ZiwKLSAgICAgICAgICAgICAgICAgICAgICAgICBzc2l6ZV90IGxlbik7Cisg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbik7CiB9IFZpcnRJT1NlcmlhbFBvcnRD
bGFzczsKIAogLyoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
