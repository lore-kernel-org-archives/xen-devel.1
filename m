From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: enable building rombios with clang
Date: Tue, 17 Jul 2018 09:39:35 +0100
Message-ID: <20180717083935.25964-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nrmi=kb=citrix.com=prvs=729c61eb8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffLWF-0003ol-HS
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 08:39:39 +0000
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

UHJldmlvdXNseSBpdCBpcyBkaXNhYmxlZCBiZWNhdXNlIHRoZSBlbWJlZGRlZCBpcHhlIGNhbid0
IGJlIGJ1aWx0CndpdGggY2xhbmcuIE5vdyB0aGF0IGlweGUgaXMgc3BsaXQgb3V0IHdlIGNhbiB1
c2UgLS13aXRoLXN5c3RlbS1pcHhlCnRvIHdvcmsgYXJvdW5kIHRoZSBpc3N1ZS4KClNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpEZXBlbmRzIG9uIHRoZSBp
cHhlIHNlcmllcyBqdXN0IGNvbW1pdHRlZC4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIGIvYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkCmluZGV4IDA1NDIyNmJkNzMuLjRkY2FhYmY0YmQgMTAwNzU1Ci0tLSBhL2F1dG9t
YXRpb24vc2NyaXB0cy9idWlsZAorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKQEAgLTE2
LDggKzE2LDggQEAgY2ZnYXJncys9KCItLWVuYWJsZS1kb2NzIikKIGlmIFtbICIke0NDfSIgPT0g
ImNsYW5nIiBdXTsgdGhlbgogICAgICMgU2VhQklPUyBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFu
ZwogICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1zZWFiaW9zPS91c3Ivc2hhcmUvc2VhYmlv
cy9iaW9zLmJpbiIpCi0gICAgIyBpUFhFIGNhbm5vdCBiZSBidWlsdCB3aXRoIGNsYW5nIHNvIHdl
IGNhbm5vdCBidWlsZCByb21iaW9zCi0gICAgY2ZnYXJncys9KCItLWRpc2FibGUtcm9tYmlvcyIp
CisgICAgIyBpUFhFIGNhbm5vdCBiZSBidWlsdCB3aXRoIGNsYW5nCisgICAgY2ZnYXJncys9KCIt
LXdpdGgtc3lzdGVtLWlweGU9L3Vzci9zaGFyZS9pcHhlL2lweGUuYmluIikKICAgICAjIG5ld2xp
YiBjYW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZyBzbyB3ZSBjYW5ub3QgYnVpbGQgc3R1YmRvbXMK
ICAgICBjZmdhcmdzKz0oIi0tZGlzYWJsZS1zdHViZG9tIikKIGZpCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
