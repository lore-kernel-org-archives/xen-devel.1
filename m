From: Alexey Gerasimenko <x1917x@gmail.com>
Subject: [RFC PATCH 04/12] hvmloader: add ACPI enabling for Q35
Date: Tue, 13 Mar 2018 04:33:49 +1000
Message-ID: <ba3b25a03bc5f6d51988555ad71b7bea131ee4bc.1520867741.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z5vn=gc=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1evSHV-00076J-Vg
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 18:34:46 +0000
Received: by mail-pl0-x241.google.com with SMTP id d9-v6so9816173plo.8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 11:34:44 -0700 (PDT)
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Alexey Gerasimenko <x1917x@gmail.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gb3JkZXIgdG8gdHVybiBvbiBBQ1BJIGZvciBPUywgd2UgbmVlZCB0byB3cml0ZSBhIGNoaXBz
ZXQtc3BlY2lmaWMgdmFsdWUKdG8gU01JX0NNRCByZWdpc3RlciAoc29ydCBvZiBpbWl0YXRpb24g
b2YgdGhlIEFQTS0+QUNQSSBzd2l0Y2ggb24gcmVhbApzeXN0ZW1zKS4gTW9kaWZ5IGFjcGlfZW5h
YmxlX3NjaSgpIGZ1bmN0aW9uIHRvIHN1cHBvcnQgYm90aCBpNDQwIGFuZCBRMzUKZW11bGF0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQWxleGV5IEdlcmFzaW1lbmtvIDx4MTkxN3hAZ21haWwuY29tPgot
LS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYyB8IDExICsrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYyBiL3Rvb2xzL2Zpcm13
YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYwppbmRleCBmNjAzZjY4ZGVkLi4wNzA2OTg0NDBlIDEw
MDY0NAotLS0gYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMKKysrIGIvdG9v
bHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jCkBAIC0yNTcsOSArMjU3LDE2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYmlvc19jb25maWcgKmRldGVjdF9iaW9zKHZvaWQpCiBzdGF0aWMg
dm9pZCBhY3BpX2VuYWJsZV9zY2kodm9pZCkKIHsKICAgICB1aW50OF90IHBtMWFfY250X3ZhbDsK
KyAgICB1aW50OF90IGFjcGlfZW5hYmxlX3ZhbDsKIAotI2RlZmluZSBQSUlYNF9TTUlfQ01EX0lP
UE9SVCAweGIyCisjZGVmaW5lIFNNSV9DTURfSU9QT1JUICAgICAgIDB4YjIKICNkZWZpbmUgUElJ
WDRfQUNQSV9FTkFCTEUgICAgMHhmMQorI2RlZmluZSBJQ0g5X0FDUElfRU5BQkxFICAgICAweDAy
CisKKyAgICBpZiAoZ2V0X3BjX21hY2hpbmVfdHlwZSgpID09IE1BQ0hJTkVfVFlQRV9RMzUpCisg
ICAgICAgIGFjcGlfZW5hYmxlX3ZhbCA9IElDSDlfQUNQSV9FTkFCTEU7CisgICAgZWxzZQorICAg
ICAgICBhY3BpX2VuYWJsZV92YWwgPSBQSUlYNF9BQ1BJX0VOQUJMRTsKIAogICAgIC8qCiAgICAg
ICogUElJWDQgZW11bGF0aW9uIGluIFFFTVUgaGFzIFNDSV9FTj0wIGJ5IGRlZmF1bHQuIFdlIGhh
dmUgbm8gbGVnYWN5CkBAIC0yNjcsNyArMjc0LDcgQEAgc3RhdGljIHZvaWQgYWNwaV9lbmFibGVf
c2NpKHZvaWQpCiAgICAgICovCiAgICAgcG0xYV9jbnRfdmFsID0gaW5iKEFDUElfUE0xQV9DTlRf
QkxLX0FERFJFU1NfVjEpOwogICAgIGlmICggIShwbTFhX2NudF92YWwgJiBBQ1BJX1BNMUNfU0NJ
X0VOKSApCi0gICAgICAgIG91dGIoUElJWDRfU01JX0NNRF9JT1BPUlQsIFBJSVg0X0FDUElfRU5B
QkxFKTsKKyAgICAgICAgb3V0YihTTUlfQ01EX0lPUE9SVCwgYWNwaV9lbmFibGVfdmFsKTsKIAog
ICAgIHBtMWFfY250X3ZhbCA9IGluYihBQ1BJX1BNMUFfQ05UX0JMS19BRERSRVNTX1YxKTsKICAg
ICBCVUdfT04oIShwbTFhX2NudF92YWwgJiBBQ1BJX1BNMUNfU0NJX0VOKSk7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
