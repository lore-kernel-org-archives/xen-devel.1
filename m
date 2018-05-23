From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 2/3] automation: build stubdom and rombios,
 and tools on 32 bit
Date: Wed, 23 May 2018 11:20:39 +0100
Message-ID: <20180523102040.16299-3-wei.liu2@citrix.com>
References: <20180523102040.16299-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x+ah=ik=citrix.com=prvs=674237c1e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fLQt4-0004eB-5Z
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 10:20:54 +0000
In-Reply-To: <20180523102040.16299-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHdlJ3JlIHVzaW5nIGRvY2tlciB0byBidWlsZC4gVGhleSBzaG91bGRuJ3QgYmUgYSBwcm9i
bGVtIGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLS0KUkZDIGJlY2F1c2UgSSBoYXZlbid0IHRlc3RlZCBpZiBvdGhlciBkb2NrZXJmaWxlcyBu
ZWVkIGNoYW5nZXMuCi0tLQogYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIHwgOCAtLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9z
Y3JpcHRzL2J1aWxkIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCmluZGV4IGI5MGZjNDNkMjYu
LjIxZmIwMjllOGEgMTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZAorKysgYi9h
dXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKQEAgLTExLDggKzExLDYgQEAgZmkKIAogIyBidWlsZCB1
cCBvdXIgY29uZmlndXJlIG9wdGlvbnMKIGNmZ2FyZ3M9KCkKLWNmZ2FyZ3MrPSgiLS1kaXNhYmxl
LXN0dWJkb20iKSAjIG1vcmUgd29yayBuZWVkZWQgaW50byBidWlsZGluZyB0aGlzCi1jZmdhcmdz
Kz0oIi0tZGlzYWJsZS1yb21iaW9zIikKIGNmZ2FyZ3MrPSgiLS1lbmFibGUtZG9jcyIpCiAKICMg
U2VhQklPUyBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZwpAQCAtMjAsMTIgKzE4LDYgQEAgaWYg
W1sgIiR7Q0N9IiA9PSAiY2xhbmciIF1dOyB0aGVuCiAgICAgY2ZnYXJncys9KCItLXdpdGgtc3lz
dGVtLXNlYWJpb3M9L3Vzci9zaGFyZS9zZWFiaW9zL2Jpb3MuYmluIikKIGZpCiAKLWlmIFtbICIk
e1hFTl9UQVJHRVRfQVJDSH0iID09ICJ4ODZfNjQiIF1dOyB0aGVuCi0gICAgY2ZnYXJncys9KCIt
LWVuYWJsZS10b29scyIpCi1lbHNlCi0gICAgY2ZnYXJncys9KCItLWRpc2FibGUtdG9vbHMiKSAj
IHdlIGRvbid0IGhhdmUgdGhlIGNyb3NzIGRlcGVuZHMgaW5zdGFsbGVkCi1maQotCiAuL2NvbmZp
Z3VyZSAiJHtjZmdhcmdzW0BdfSIKIAogbWFrZSBkaXN0Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
