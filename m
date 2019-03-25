From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 5/7] scripts/cleanup-trace-events: Update for
 current practice
Date: Mon, 25 Mar 2019 15:58:55 +0000
Message-ID: <20190325155857.10661-6-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmOE=R4=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1h8S1l-00025W-Ew
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 16:00:45 +0000
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, David Gibson <david@gibson.drop>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgoKRW1pdCBjb21tZW50
cyB3aXRoIHNob3J0ZW5lZCBmaWxlIG5hbWVzIChwcmV2aW91cyBjb21taXQpLgoKTGltaXQgc2Vh
cmNoIHRvIHRoZSBpbnB1dCBmaWxlJ3MgZGlyZWN0b3J5LgoKQ29wZSB3aXRoIHByb3BlcnRpZXMg
dGNnIChjb21taXQgYjJiMzZjMjJiZDgpIGFuZCB2Y3B1IChjb21taXQKM2QyMTFkOWY0ZGIpLgoK
Q29wZSB3aXRoIGNhcGl0YWwgbGV0dGVycyBpbiBmdW5jdGlvbiBuYW1lcy4KClNpZ25lZC1vZmYt
Ynk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAx
OTAzMTQxODA5MjkuMjc3MjItNC1hcm1icnVAcmVkaGF0LmNvbQpNZXNzYWdlLUlkOiA8MjAxOTAz
MTQxODA5MjkuMjc3MjItNC1hcm1icnVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHNjcmlwdHMvY2xlYW51cC10cmFj
ZS1ldmVudHMucGwgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NsZWFu
dXAtdHJhY2UtZXZlbnRzLnBsIGIvc2NyaXB0cy9jbGVhbnVwLXRyYWNlLWV2ZW50cy5wbAppbmRl
eCBlOTNhYmMwMGRhLi5kNGYwZTRjYWI1IDEwMDc1NQotLS0gYS9zY3JpcHRzL2NsZWFudXAtdHJh
Y2UtZXZlbnRzLnBsCisrKyBiL3NjcmlwdHMvY2xlYW51cC10cmFjZS1ldmVudHMucGwKQEAgLTEz
LDYgKzEzLDcgQEAKIAogdXNlIHdhcm5pbmdzOwogdXNlIHN0cmljdDsKK3VzZSBGaWxlOjpCYXNl
bmFtZTsKIAogbXkgJGJ1ZiA9ICcnOwogbXkgJXNlZW4gPSAoKTsKQEAgLTIzLDEyICsyNCwxOSBA
QCBzdWIgb3V0IHsKICAgICAlc2VlbiA9ICgpOwogfQogCi13aGlsZSAoPD4pIHsKLSAgICBpZiAo
L14oZGlzYWJsZSApPyhbYS16XzAtOV0rKVwoLykgewotICAgICAgICBvcGVuIEdSRVAsICctfCcs
ICdnaXQnLCAnZ3JlcCcsICctbHcnLCAidHJhY2VfJDIiCiskI0FSR1YgPT0gMCBvciBkaWUgInVz
YWdlOiAkMCBGSUxFIjsKK215ICRpbiA9ICRBUkdWWzBdOworbXkgJGRpciA9IGRpcm5hbWUoJGlu
KTsKK29wZW4oSU4sICRpbikgb3IgZGllICJvcGVuICRpbjogJCEiOworY2hkaXIoJGRpcikgb3Ig
ZGllICJjaGRpciAkZGlyOiAkISI7CisKK3doaWxlICg8SU4+KSB7CisgICAgaWYgKC9eKGRpc2Fi
bGUgfCh0Y2cpIHx2Y3B1ICkqKFthLXpfMC05XSspXCgvaSkgeworICAgICAgICBteSAkcGF0ID0g
InRyYWNlXyQzIjsKKyAgICAgICAgJHBhdCAuPSAnX3RjZycgaWYgKGRlZmluZWQgJDIpOworICAg
ICAgICBvcGVuIEdSRVAsICctfCcsICdnaXQnLCAnZ3JlcCcsICctbHcnLCAnLS1tYXgtZGVwdGgn
LCAnMScsICRwYXQKICAgICAgICAgICAgIG9yIGRpZSAicnVuIGdpdCBncmVwOiAkISI7Ci0gICAg
ICAgIG15ICRmbmFtZTsKLSAgICAgICAgd2hpbGUgKCRmbmFtZSA9IDxHUkVQPikgeworICAgICAg
ICB3aGlsZSAobXkgJGZuYW1lID0gPEdSRVA+KSB7CiAgICAgICAgICAgICBjaG9tcCAkZm5hbWU7
CiAgICAgICAgICAgICBuZXh0IGlmICRzZWVueyRmbmFtZX0gfHwgJGZuYW1lIGVxICd0cmFjZS1l
dmVudHMnOwogICAgICAgICAgICAgJHNlZW57JGZuYW1lfSA9IDE7CkBAIC00OSwzICs1Nyw0IEBA
IHdoaWxlICg8PikgewogfQogCiBvdXQ7CitjbG9zZShJTikgb3IgZGllICJjbG9zZSAkaW46ICQh
IjsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
