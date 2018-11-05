From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: put x86emul_{read,
 write}_dr under CONFIG_PV
Date: Mon, 5 Nov 2018 17:38:58 +0000
Message-ID: <20181105173858.30786-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtqo=nq=citrix.com=prvs=8406a2984=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJiq7-0006En-8y
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 17:39:03 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QSBidWlsZCBicmVha2FnZSBpcyBkaXNjb3ZlcmVkIGJ5IGEgbm9uLWRlYnVnIGJ1aWxkLiBEZWJ1
ZyBidWlsZAp3b3JrZWQgYmVjYXVzZSB0aGUgQVNTRVJUIG1hZGUgdGhlIGNvbXBpbGVyIGVsaW1p
bmF0ZSB0aGUgcmVzdCBvZiB0aGUKZnVuY3Rpb25zLgoKQ3VycmVudGx5IHRoZXkgYXJlIFBWIG9u
bHkuIFRoZXJlIGFyZSBjb21tZW50cyBhbGx1ZGluZyB0byBwb3NzaWJsZQpmdXR1cmUgSFZNIHN1
cHBvcnQgYnV0IHdlIGNhbiBjcm9zcyB0aGUgYnJpZGUgd2hlbiB3ZSBnZXQgdGhlcmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS5jIGIveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlLmMKaW5kZXggODg2YmQ4N2U1OS4uYjFkZmM5ZjI2MSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMK
QEAgLTg5LDYgKzg5LDcgQEAgaW50IHg4NmVtdWxfd3JpdGVfeGNyKHVuc2lnbmVkIGludCByZWcs
IHVpbnQ2NF90IHZhbCwKICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwogfQogCisjaWZkZWYgQ09O
RklHX1BWCiAvKiBDYWxsZWQgd2l0aCBOVUxMIGN0eHQgaW4gaHlwZXJjYWxsIGNvbnRleHQuICov
CiBpbnQgeDg2ZW11bF9yZWFkX2RyKHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGxvbmcgKnZh
bCwKICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCkBA
IC0xNTUsNiArMTU2LDcgQEAgaW50IHg4NmVtdWxfd3JpdGVfZHIodW5zaWduZWQgaW50IHJlZywg
dW5zaWduZWQgbG9uZyB2YWwsCiAgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsKICAg
ICB9CiB9CisjZW5kaWYgLyogQ09ORklHX1BWICovCiAKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
