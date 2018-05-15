From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/3] docs/parse-support-md: Provide
 $sectnode->{RealSectNode}
Date: Tue, 15 May 2018 15:49:07 +0100
Message-ID: <1526395748-4279-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1526395748-4279-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ihpv=ic=citrix.com=prvs=6668be420=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fIbGV-0007HN-Lw
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:49:23 +0000
In-Reply-To: <1526395748-4279-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgeWV0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogZG9jcy9wYXJzZS1zdXBwb3J0LW1kIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9w
YXJzZS1zdXBwb3J0LW1kIGIvZG9jcy9wYXJzZS1zdXBwb3J0LW1kCmluZGV4IDhhZjNhY2MuLjI3
ODA3MmYgMTAwNzU1Ci0tLSBhL2RvY3MvcGFyc2Utc3VwcG9ydC1tZAorKysgYi9kb2NzL3BhcnNl
LXN1cHBvcnQtbWQKQEAgLTMzLDYgKzMzLDcgQEAgb3VyICR0b3BsZXZlbF9zZWN0bGlzdCA9IG5l
d19zZWN0bGlzdCgpOwogIyAkc2VjdGxpc3QtPntLRVl9e1N0YXR1c31bVkldID0gYWJzZW50IG9y
IG1hcmtkb3duIGNvbnRlbnQKICMgJHNlY3RsaXN0LT57S0VZfXtDaGlsZHJlbn0gPSBhIGZ1cnRo
ZXIgJHNlY3RsaXN0CiAjICRzZWN0bGlzdC0+e0tFWX17S2V5fSA9IEtFWQorIyAkc2VjdGxpc3Qt
PntLRVl9e1JlYWxTZWN0Tm9kZX0gPSB1cywgb3Igb3VyIHBhcmVudAogIyAkc2VjdGxpc3QtPntL
RVl9e0hhc0NhdmVhdH1bVkldID0gdHJ1ZWlzaCBpZmYgb3RoZXIgaW4gYSBQYXJhCiAjICRzZWN0
bGlzdC0+e0tFWX17UmVhbEluU2VjdH0gPSBjb250YWluaW5nIHJlYWwgc2VjdGlvbiBpbiBAaW5z
ZWN0aW9ucywgc28KICMgJHNlY3RsaXN0LT57S0VZfXtSZWFsSW5TZWN0fXtIYXNEZXNjcmlwdGlv
bn0gPSBWSSBmb3Igc29tZSBFbXBoIGluIFBhcmEKQEAgLTcxLDYgKzcyLDcgQEAgc3ViIGZpbmRf
Y3VycmVudF9zZWN0bm9kZSAoKSB7CiAKICAgICBteSAkc2VjdG5vZGU7CiAgICAgbXkgJHJlYWxp
bnNlY3Q7CisgICAgbXkgJHJlYWxzZWN0bm9kZTsKICAgICBmb3JlYWNoIG15ICRzIChAaW5zZWN0
aW9ucykgewogICAgICAgICBteSAkc2VjdGxpc3QgPSAkc2VjdG5vZGUKICAgICAgICAgICAgID8g
JHNlY3Rub2RlLT57Q2hpbGRyZW59IDogJHRvcGxldmVsX3NlY3RsaXN0OwpAQCAtODcsNiArODks
OCBAQCBzdWIgZmluZF9jdXJyZW50X3NlY3Rub2RlICgpIHsKICAgICAgICAgICAgICBIYXNDYXZl
YXQgPT4gW10sCiAgICAgICAgICAgICB9OwogICAgICAgICAkc2VjdG5vZGUgPSAkc2VjdGxpc3Qt
Pnska2V5fTsKKyAgICAgICAgJHJlYWxzZWN0bm9kZSA9ICRzZWN0bm9kZSBpZiAkcy0+e0FuY2hv
cn07CisgICAgICAgICRzZWN0bm9kZS0+e1JlYWxTZWN0Tm9kZX0gPSAkcmVhbHNlY3Rub2RlOwog
ICAgIH0KICAgICBkaWUgdW5sZXNzICRzZWN0bm9kZTsKICAgICByZXR1cm4gJHNlY3Rub2RlOwot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
