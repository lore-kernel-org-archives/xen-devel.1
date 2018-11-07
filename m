From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH for-3.2 v3 10/14] qdev-props: call
 object_apply_global_props()
Date: Wed,  7 Nov 2018 16:36:48 +0400
Message-ID: <20181107123652.23417-11-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zb54=ns=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1gKN6M-0005eE-Gr
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:38:30 +0000
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, dgilbert@redhat.com, Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

SXQncyBub3cgcG9zc2libGUgdG8gdXNlIHRoZSBjb21tb24gZnVuY3Rpb24uCgpUZWFjaCBvYmpl
Y3RfYXBwbHlfZ2xvYmFsX3Byb3BzKCkgdG8gd2FybiBpZiBFcnJvciBhcmd1bWVudCBpcyBOVUxM
LgoKU2lnbmVkLW9mZi1ieTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJl
ZGhhdC5jb20+Ci0tLQogaHcvY29yZS9xZGV2LXByb3BlcnRpZXMuYyB8IDI0ICsrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogcW9tL29iamVjdC5jICAgICAgICAgICAgICB8ICA2ICsrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2h3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLmMgYi9ody9jb3JlL3FkZXYtcHJvcGVydGllcy5j
CmluZGV4IDg3MjhjYmFiOWYuLjIzOTUzNWE0Y2IgMTAwNjQ0Ci0tLSBhL2h3L2NvcmUvcWRldi1w
cm9wZXJ0aWVzLmMKKysrIGIvaHcvY29yZS9xZGV2LXByb3BlcnRpZXMuYwpAQCAtMTIyMywyOCAr
MTIyMyw4IEBAIGludCBxZGV2X3Byb3BfY2hlY2tfZ2xvYmFscyh2b2lkKQogCiB2b2lkIHFkZXZf
cHJvcF9zZXRfZ2xvYmFscyhEZXZpY2VTdGF0ZSAqZGV2KQogewotICAgIGludCBpOwotCi0gICAg
Zm9yIChpID0gMDsgaSA8IGdsb2JhbF9wcm9wcygpLT5sZW47IGkrKykgewotICAgICAgICBHbG9i
YWxQcm9wZXJ0eSAqcHJvcDsKLSAgICAgICAgRXJyb3IgKmVyciA9IE5VTEw7Ci0KLSAgICAgICAg
cHJvcCA9IGdfYXJyYXlfaW5kZXgoZ2xvYmFsX3Byb3BzKCksIEdsb2JhbFByb3BlcnR5ICosIGkp
OwotICAgICAgICBpZiAob2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoZGV2KSwgcHJvcC0+ZHJp
dmVyKSA9PSBOVUxMKSB7Ci0gICAgICAgICAgICBjb250aW51ZTsKLSAgICAgICAgfQotICAgICAg
ICBwcm9wLT51c2VkID0gdHJ1ZTsKLSAgICAgICAgb2JqZWN0X3Byb3BlcnR5X3BhcnNlKE9CSkVD
VChkZXYpLCBwcm9wLT52YWx1ZSwgcHJvcC0+cHJvcGVydHksICZlcnIpOwotICAgICAgICBpZiAo
ZXJyICE9IE5VTEwpIHsKLSAgICAgICAgICAgIGVycm9yX3ByZXBlbmQoJmVyciwgImNhbid0IGFw
cGx5IGdsb2JhbCAlcy4lcz0lczogIiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvcC0+
ZHJpdmVyLCBwcm9wLT5wcm9wZXJ0eSwgcHJvcC0+dmFsdWUpOwotICAgICAgICAgICAgaWYgKCFk
ZXYtPmhvdHBsdWdnZWQpIHsKLSAgICAgICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUoJmVycm9y
X2ZhdGFsLCBlcnIpOwotICAgICAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgICAgICB3YXJu
X3JlcG9ydF9lcnIoZXJyKTsKLSAgICAgICAgICAgIH0KLSAgICAgICAgfQotICAgIH0KKyAgICBv
YmplY3RfYXBwbHlfZ2xvYmFsX3Byb3BzKE9CSkVDVChkZXYpLCBnbG9iYWxfcHJvcHMoKSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+aG90cGx1Z2dlZCA/IE5VTEwgOiAmZXJy
b3JfZmF0YWwpOwogfQogCiAvKiAtLS0gNjRiaXQgdW5zaWduZWQgaW50ICdzaXplJyB0eXBlIC0t
LSAqLwpkaWZmIC0tZ2l0IGEvcW9tL29iamVjdC5jIGIvcW9tL29iamVjdC5jCmluZGV4IDlhY2Rm
OWUxNmQuLmIxYTdmNzA1NTAgMTAwNjQ0Ci0tLSBhL3FvbS9vYmplY3QuYworKysgYi9xb20vb2Jq
ZWN0LmMKQEAgLTM5Miw3ICszOTIsMTEgQEAgdm9pZCBvYmplY3RfYXBwbHlfZ2xvYmFsX3Byb3Bz
KE9iamVjdCAqb2JqLCBHQXJyYXkgKnByb3BzLCBFcnJvciAqKmVycnApCiAgICAgICAgIGlmIChl
cnIgIT0gTlVMTCkgewogICAgICAgICAgICAgZXJyb3JfcHJlcGVuZCgmZXJyLCAiY2FuJ3QgYXBw
bHkgZ2xvYmFsICVzLiVzPSVzOiAiLAogICAgICAgICAgICAgICAgICAgICAgICAgICBwLT5kcml2
ZXIsIHAtPnByb3BlcnR5LCBwLT52YWx1ZSk7Ci0gICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUo
ZXJycCwgZXJyKTsKKyAgICAgICAgICAgIGlmIChlcnJwKSB7CisgICAgICAgICAgICAgICAgZXJy
b3JfcHJvcGFnYXRlKGVycnAsIGVycik7CisgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAg
ICAgICAgIHdhcm5fcmVwb3J0X2VycihlcnIpOworICAgICAgICAgICAgfQogICAgICAgICB9CiAg
ICAgfQogfQotLSAKMi4xOS4xLjcwOC5nNGVkZTNkNDJkZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
