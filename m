From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 2/7] trace: avoid SystemTap dtrace(1) warnings on
 empty files
Date: Mon, 25 Mar 2019 15:58:52 +0000
Message-ID: <20190325155857.10661-3-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1h8S0k-0000kS-Fh
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 15:59:42 +0000
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

dGFyZ2V0L2hwcGEvdHJhY2UtZXZlbnRzIG9ubHkgY29udGFpbnMgZGlzYWJsZWQgZXZlbnRzLCBy
ZXN1bHRpbmcgaW4gYQp0cmFjZS1kdHJhY2UuZHRyYWNlIGZpbGUgdGhhdCBzYXlzICJwcm92aWRl
ciBxZW11IHt9Ii4gIFN5c3RlbVRhcCdzCmR0cmFjZSgxKSB0b29sIHByaW50cyBhIHdhcm5pbmcg
d2hlbiBwcm9jZXNzaW5nIHRoaXMgaW5wdXQgZmlsZS4KClRoaXMgcGF0Y2ggYXZvaWRzIHRoZSBl
cnJvciBieSBlbWl0dGluZyBhbiBlbXB0eSBmaWxlIGluc3RlYWQgb2YKInByb3ZpZGVyIHFlbXUg
e30iIHdoZW4gdGhlcmUgYXJlIG5vIGVuYWJsZWQgdHJhY2UgZXZlbnRzLgoKRml4ZXM6IDIzYzNk
NTY5ZjQ0Mjg0MDY2NzE0ZmY3YzQ2YmM0ZjE5ZTYzMDU4M2YgKCJ0YXJnZXQvaHBwYTogYWRkIFRM
QiB0cmFjZSBldmVudHMiKQpSZXBvcnRlZC1ieTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUBy
ZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+ClJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+
ClJldmlld2VkLWJ5OiBMaWFtIE1lcndpY2sgPGxpYW0ubWVyd2lja0BvcmFjbGUuY29tPgpNZXNz
YWdlLWlkOiAyMDE5MDMyMTE3MDgzMS42NTM5LTMtc3RlZmFuaGFAcmVkaGF0LmNvbQpNZXNzYWdl
LUlkOiA8MjAxOTAzMjExNzA4MzEuNjUzOS0zLXN0ZWZhbmhhQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRz
L3RyYWNldG9vbC9mb3JtYXQvZC5weSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNldG9vbC9mb3JtYXQvZC5weSBiL3Nj
cmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9kLnB5CmluZGV4IDc4Mzk3YzI0ZDIuLmM3Y2IyYTkzYTYg
MTAwNjQ0Ci0tLSBhL3NjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9kLnB5CisrKyBiL3NjcmlwdHMv
dHJhY2V0b29sL2Zvcm1hdC9kLnB5CkBAIC0zMyw2ICszMywxMSBAQCBkZWYgZ2VuZXJhdGUoZXZl
bnRzLCBiYWNrZW5kLCBncm91cCk6CiAgICAgZXZlbnRzID0gW2UgZm9yIGUgaW4gZXZlbnRzCiAg
ICAgICAgICAgICAgIGlmICJkaXNhYmxlIiBub3QgaW4gZS5wcm9wZXJ0aWVzXQogCisgICAgIyBT
eXN0ZW1UYXAncyBkdHJhY2UoMSkgd2FybnMgYWJvdXQgZW1wdHkgInByb3ZpZGVyIHFlbXUge30i
IGJ1dCBpcyBoYXBweQorICAgICMgd2l0aCBhbiBlbXB0eSBmaWxlLiAgQXZvaWQgdGhlIHdhcm5p
bmcuCisgICAgaWYgbm90IGV2ZW50czoKKyAgICAgICAgcmV0dXJuCisKICAgICBvdXQoJy8qIFRo
aXMgZmlsZSBpcyBhdXRvZ2VuZXJhdGVkIGJ5IHRyYWNldG9vbCwgZG8gbm90IGVkaXQuICovJwog
ICAgICAgICAnJywKICAgICAgICAgJ3Byb3ZpZGVyIHFlbXUgeycpCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
