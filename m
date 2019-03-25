From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 1/7] trace: handle tracefs path truncation
Date: Mon, 25 Mar 2019 15:58:51 +0000
Message-ID: <20190325155857.10661-2-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1h8S0j-0000k8-7w
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 15:59:41 +0000
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>, Liam Merwick <liam.merwick@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redh>
List-Id: xen-devel@lists.xenproject.org

SWYgdGhlIHRyYWNlZnMgbW91bnRwb2ludCBoYXMgYSB2ZXJ5IGxvbmcgcGF0aCB3ZSBtYXkgZXhj
ZWVkIFBBVEhfTUFYLgpUaGlzIGlzIGEgc3lzdGVtIG1pc2NvbmZpZ3VyYXRpb24gYW5kIHRoZSB1
c2VyIG11c3QgcmVzb2x2ZSBpdCBzbyB0aGF0CmFwcGxpY2F0aW9ucyBjYW4gcGVyZm9ybSBwYXRo
LWJhc2VkIHN5c3RlbSBjYWxscyBzdWNjZXNzZnVsbHkuCgpUaGlzIGlzc3VlIGRvZXMgbm90IG9j
Y3VyIG9uIHJlYWwtd29ybGQgc3lzdGVtcyBzaW5jZSB0cmFjZWZzIGlzIG1vdW50ZWQKb24gL3N5
cy9rZXJuZWwvZGVidWcvdHJhY2luZy8sIGJ1dCB0aGUgY29tcGlsZXIgaXMgc21hcnQgZW5vdWdo
IHRvCmZvcmVzZWUgdGhlIHBvc3NpYmlsaXR5IGFuZCB3YXJuIGFib3V0IHRoZSB1bmNoZWNrZWQg
c25wcmludGYoMykgcmV0dXJuCnZhbHVlLiAgVGhpcyBwYXRjaCBmaXhlcyB0aGUgY29tcGlsZXIg
d2FybmluZy4KClJlcG9ydGVkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IExpYW0gTWVyd2ljayA8bGlhbS5tZXJ3aWNrQG9yYWNsZS5jb20+Ck1lc3NhZ2UtaWQ6
IDIwMTkwMzIxMTcwODMxLjY1MzktMi1zdGVmYW5oYUByZWRoYXQuY29tCk1lc3NhZ2UtSWQ6IDwy
MDE5MDMyMTE3MDgzMS42NTM5LTItc3RlZmFuaGFAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTog
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRyYWNlL2Z0cmFjZS5j
IHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90cmFjZS9mdHJhY2UuYyBiL3RyYWNlL2Z0cmFjZS5j
CmluZGV4IDYxNjkyYTg2ODIuLjk3NDk1NDNkOWIgMTAwNjQ0Ci0tLSBhL3RyYWNlL2Z0cmFjZS5j
CisrKyBiL3RyYWNlL2Z0cmFjZS5jCkBAIC01Myw3ICs1MywxMSBAQCBib29sIGZ0cmFjZV9pbml0
KHZvaWQpCiAgICAgfQogCiAgICAgaWYgKHRyYWNlZnNfZm91bmQpIHsKLSAgICAgICAgc25wcmlu
dGYocGF0aCwgUEFUSF9NQVgsICIlcyVzL3RyYWNpbmdfb24iLCBtb3VudF9wb2ludCwgc3ViZGly
KTsKKyAgICAgICAgaWYgKHNucHJpbnRmKHBhdGgsIFBBVEhfTUFYLCAiJXMlcy90cmFjaW5nX29u
IiwgbW91bnRfcG9pbnQsIHN1YmRpcikKKyAgICAgICAgICAgICAgICA+PSBzaXplb2YocGF0aCkp
IHsKKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiVXNpbmcgdHJhY2VmcyBtb3VudHBvaW50
IHdvdWxkIGV4Y2VlZCBQQVRIX01BWFxuIik7CisgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cisg
ICAgICAgIH0KICAgICAgICAgdHJhY2VfZmQgPSBvcGVuKHBhdGgsIE9fV1JPTkxZKTsKICAgICAg
ICAgaWYgKHRyYWNlX2ZkIDwgMCkgewogICAgICAgICAgICAgaWYgKGVycm5vID09IEVBQ0NFUykg
ewpAQCAtNzIsNyArNzYsMTEgQEAgYm9vbCBmdHJhY2VfaW5pdCh2b2lkKQogICAgICAgICAgICAg
fQogICAgICAgICAgICAgY2xvc2UodHJhY2VfZmQpOwogICAgICAgICB9Ci0gICAgICAgIHNucHJp
bnRmKHBhdGgsIFBBVEhfTUFYLCAiJXMlcy90cmFjZV9tYXJrZXIiLCBtb3VudF9wb2ludCwgc3Vi
ZGlyKTsKKyAgICAgICAgaWYgKHNucHJpbnRmKHBhdGgsIFBBVEhfTUFYLCAiJXMlcy90cmFjZV9t
YXJrZXIiLCBtb3VudF9wb2ludCwgc3ViZGlyKQorICAgICAgICAgICAgICAgID49IHNpemVvZihw
YXRoKSkgeworICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJVc2luZyB0cmFjZWZzIG1vdW50
cG9pbnQgd291bGQgZXhjZWVkIFBBVEhfTUFYXG4iKTsKKyAgICAgICAgICAgIHJldHVybiBmYWxz
ZTsKKyAgICAgICAgfQogICAgICAgICB0cmFjZV9tYXJrZXJfZmQgPSBvcGVuKHBhdGgsIE9fV1JP
TkxZKTsKICAgICAgICAgaWYgKHRyYWNlX21hcmtlcl9mZCA8IDApIHsKICAgICAgICAgICAgIHBl
cnJvcigiQ291bGQgbm90IG9wZW4gZnRyYWNlICd0cmFjZV9tYXJrZXInIGZpbGUiKTsKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
