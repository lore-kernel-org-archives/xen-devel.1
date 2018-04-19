From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 15/16] os-posix: cleanup: Replace perror with
 error_report
Date: Thu, 19 Apr 2018 17:45:18 +0100
Message-ID: <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9Ch1-0004H7-00
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:45:55 +0000
In-Reply-To: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair.francis@xilinx.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

cGVycm9yKCkgaXMgZGVmaW5lZCB0byBmcHJpbnRmKHN0ZGVyciwuLi4pLiAgSEFDS0lORyBzYXlz
CmZwcmludGYoc3RkZXJyLC4uLikgaXMgd3JvbmcuICBTbyBwZXJyb3IoKSBpcyB0b28uCgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNDOiBNYXJrdXMgQXJtYnJ1c3RlciA8
YXJtYnJ1QHJlZGhhdC5jb20+CkNDOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhh
dC5jb20+CkNDOiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PgpDQzogQWxpc3RhaXIg
RnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B4aWxpbnguY29tPgotLS0Kdjc6IE5ldyBwYXRjaAot
LS0KIG9zLXBvc2l4LmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5j
CmluZGV4IGQ0Y2Y0NjYuLjAxMDgwMjggMTAwNjQ0Ci0tLSBhL29zLXBvc2l4LmMKKysrIGIvb3Mt
cG9zaXguYwpAQCAtMTI1LDcgKzEyNSw3IEBAIHZvaWQgb3Nfc2V0X3Byb2NfbmFtZShjb25zdCBj
aGFyICpzKQogICAgIC8qIENvdWxkIHJld3JpdGUgYXJndlswXSB0b28sIGJ1dCB0aGF0J3MgYSBi
aXQgbW9yZSBjb21wbGljYXRlZC4KICAgICAgICBUaGlzIHNpbXBsZSB3YXkgaXMgZW5vdWdoIGZv
ciBgdG9wJy4gKi8KICAgICBpZiAocHJjdGwoUFJfU0VUX05BTUUsIG5hbWUpKSB7Ci0gICAgICAg
IHBlcnJvcigidW5hYmxlIHRvIGNoYW5nZSBwcm9jZXNzIG5hbWUiKTsKKyAgICAgICAgZXJyb3Jf
cmVwb3J0KCJ1bmFibGUgdG8gY2hhbmdlIHByb2Nlc3MgbmFtZTogJXMiLCBzdHJlcnJvcihlcnJu
bykpOwogICAgICAgICBleGl0KDEpOwogICAgIH0KICNlbHNlCkBAIC0yNDcsNyArMjQ3LDcgQEAg
c3RhdGljIHZvaWQgY2hhbmdlX3Jvb3Qodm9pZCkKICAgICAgICAgICAgIGV4aXQoMSk7CiAgICAg
ICAgIH0KICAgICAgICAgaWYgKGNoZGlyKCIvIikpIHsKLSAgICAgICAgICAgIHBlcnJvcigibm90
IGFibGUgdG8gY2hkaXIgdG8gLyIpOworICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJub3QgYWJs
ZSB0byBjaGRpciB0byAvOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7CiAgICAgICAgICAgICBleGl0
KDEpOwogICAgICAgICB9CiAgICAgfQpAQCAtMzA5LDcgKzMwOSw3IEBAIHZvaWQgb3Nfc2V0dXBf
cG9zdCh2b2lkKQogCiAgICAgaWYgKGRhZW1vbml6ZSkgewogICAgICAgICBpZiAoY2hkaXIoIi8i
KSkgewotICAgICAgICAgICAgcGVycm9yKCJub3QgYWJsZSB0byBjaGRpciB0byAvIik7CisgICAg
ICAgICAgICBlcnJvcl9yZXBvcnQoIm5vdCBhYmxlIHRvIGNoZGlyIHRvIC86ICVzIiwgc3RyZXJy
b3IoZXJybm8pKTsKICAgICAgICAgICAgIGV4aXQoMSk7CiAgICAgICAgIH0KICAgICAgICAgVEZS
KGZkID0gcWVtdV9vcGVuKCIvZGV2L251bGwiLCBPX1JEV1IpKTsKQEAgLTM4Myw3ICszODMsNyBA
QCBpbnQgb3NfbWxvY2sodm9pZCkKIAogICAgIHJldCA9IG1sb2NrYWxsKE1DTF9DVVJSRU5UIHwg
TUNMX0ZVVFVSRSk7CiAgICAgaWYgKHJldCA8IDApIHsKLSAgICAgICAgcGVycm9yKCJtbG9ja2Fs
bCIpOworICAgICAgICBlcnJvcl9yZXBvcnQoIm1sb2NrYWxsOiAlcyIsIHN0cmVycm9yKGVycm5v
KSk7CiAgICAgfQogCiAgICAgcmV0dXJuIHJldDsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
