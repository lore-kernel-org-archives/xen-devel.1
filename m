From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: [PATCH 2/2] xen: xenbus: WARN_ON XS_TRANSACTION_{START,
	END} misuse
Date: Wed,  7 Feb 2018 23:22:36 +0100
Message-ID: <20180207222236.7434-2-simon__42979.2931689464$1518042216$gmane$org@invisiblethingslab.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wy8g=fb=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1ejY8q-0001Iq-0I
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 22:24:36 +0000
In-Reply-To: <20180207222236.7434-1-simon@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

QXMgdGhlIHByZXZpb3VzIGNvbW1pdCBzaG93cyBpdCdzIHF1aXRlIGVhc3kgdG8gY29uZnVzZSB0
aGUgdHJhbnNhY3Rpb24KcmVmZXJlbmNlIGNvdW50aW5nIGJ5IGVuZGluZyBhIHRyYW5zYWN0aW9u
IHR3aWNlLiBTbyBhdCBsZWFzdCB0cnkgdG8KZGV0ZWN0IGFuZCByZXBvcnQgaXQuCgpTaWduZWQt
b2ZmLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQog
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3hzLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMKaW5kZXggM2U1OTU5MGM3
MjU0Li5hZWQ5NTRiMDliOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
eHMuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMKQEAgLTEzNywxMSArMTM3
LDIwIEBAIHN0YXRpYyB1aW50MzJfdCB4c19yZXF1ZXN0X2VudGVyKHN0cnVjdCB4Yl9yZXFfZGF0
YSAqcmVxKQogCiB2b2lkIHhzX3JlcXVlc3RfZXhpdChzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkK
IHsKKwl1bnNpZ25lZCBpbnQgdXNlcnNfb2xkOworCiAJc3Bpbl9sb2NrKCZ4c19zdGF0ZV9sb2Nr
KTsKKwl1c2Vyc19vbGQgPSB4c19zdGF0ZV91c2VyczsKIAl4c19zdGF0ZV91c2Vycy0tOwogCWlm
ICgocmVxLT50eXBlID09IFhTX1RSQU5TQUNUSU9OX1NUQVJUICYmIHJlcS0+bXNnLnR5cGUgPT0g
WFNfRVJST1IpIHx8CiAJICAgIHJlcS0+dHlwZSA9PSBYU19UUkFOU0FDVElPTl9FTkQpCiAJCXhz
X3N0YXRlX3VzZXJzLS07CisJaWYgKFdBUk5fT04oeHNfc3RhdGVfdXNlcnMgPiB1c2Vyc19vbGQp
KQorCQkvKgorCQkgKiBTb21lb25lIG1pc3VzZWQgWFNfVFJBTlNBQ1RJT05fe1NUQVJULEVORH0u
IFJlc2V0IHRoZQorCQkgKiByZWZlcmVuY2UgY291bnRlciBzbyB3ZSBtaWdodCBzdXJ2aXZlLgor
CQkgKi8KKwkJeHNfc3RhdGVfdXNlcnMgPSAwOwogCXNwaW5fdW5sb2NrKCZ4c19zdGF0ZV9sb2Nr
KTsKIAogCWlmICh4c19zdXNwZW5kX2FjdGl2ZSAmJiAheHNfc3RhdGVfdXNlcnMpCi0tIAoyLjE1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
