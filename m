From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 17/62] x86: introduce ELFNOTE macro
Date: Fri, 12 Jan 2018 11:28:25 +0000
Message-ID: <20180112112910.16762-18-wei.liu2@citrix.com>
References: <20180112112910.16762-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=clhg=eh=citrix.com=prvs=54360ad83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZxzU-00041T-UZ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 11:59:20 +0000
In-Reply-To: <20180112112910.16762-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgbmVlZGVkIGxhdGVyIGZvciBpbnRyb2R1Y2luZyBQVkggZW50cnkgcG9pbnQuCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KdjI6CjEuIFNwZWNp
Znkgc2VjdGlvbiBhdHRyaWJ1dGUgYW5kIHR5cGUuCjIuIFVzZSBwMmFsaWduLgozLiBBbGlnbiBp
bnN0cnVjdGlvbnMuCjQuIEhhdmVuJ3QgdXNlZCAuTCBvciB0dXJuZWQgaXQgaW50byBhc3NlbWJs
eSBtYWNyby4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oIHwgMTIgKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9k
ZWZucy5oCmluZGV4IDdlODgzOGU0OWIuLmViMjUwOTdkZTUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVm
bnMuaApAQCAtMzM2LDQgKzMzNiwxNiBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIHN0YWMo
dm9pZCkKICNkZWZpbmUgUkVYNjRfUFJFRklYICJyZXg2NC8iCiAjZW5kaWYKIAorI2RlZmluZSBF
TEZOT1RFKG5hbWUsIHR5cGUsIGRlc2MpICAgICAgICAgICBcCisgICAgLnB1c2hzZWN0aW9uIC5u
b3RlLm5hbWUsICJhIiwgQG5vdGUgICA7IFwKKyAgICAucDJhbGlnbiAyICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDsgXAorICAgIC5sb25nIDJmIC0gMWYgICAgICAgLyogbmFtZXN6ICovICAg
ICAgOyBcCisgICAgLmxvbmcgNGYgLSAzZiAgICAgICAvKiBkZXNjc3ogKi8gICAgICA7IFwKKyAg
ICAubG9uZyB0eXBlICAgICAgICAgIC8qIHR5cGUgICAqLyAgICAgIDsgXAorMTogIC5hc2NpeiAj
bmFtZSAgICAgICAgLyogbmFtZSAgICovICAgICAgOyBcCisyOiAgLnAyYWxpZ24gMiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA7IFwKKzM6ICBkZXNjICAgICAgICAgICAgICAgIC8qIGRlc2Mg
ICAqLyAgICAgIDsgXAorNDogIC5wMmFsaWduIDIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
OyBcCisgICAgLnBvcHNlY3Rpb24KKwogI2VuZGlmIC8qIF9fWDg2X0FTTV9ERUZOU19IX18gKi8K
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
