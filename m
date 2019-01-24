From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/26] power handling: Break out
 power_cycle_parse_method
Date: Thu, 24 Jan 2019 18:45:52 +0000
Message-ID: <20190124184613.2720-6-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk19-0003eq-In
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:23 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDE0ICsrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCAyOTEwODQy
My4uNjhiNTE3MjggMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3Nz
dGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtOTE3LDEwICs5MTcsMTAgQEAgc3ViIHNlcmlhbF9mZXRj
aF9sb2dzICgkKSB7CiAKICMtLS0tLS0tLS0tIHBvd2VyIGN5Y2xpbmcgLS0tLS0tLS0tLQogCi1z
dWIgcG93ZXJfY3ljbGVfaG9zdF9zZXR1cCAoJCkgewotICAgIG15ICgkaG8pID0gQF87CitzdWIg
cG93ZXJfY3ljbGVfcGFyc2VfbWV0aG9kICgkJCkgeworICAgIG15ICgkaG8sICRzcGVjKSA9IEBf
OwogICAgIG15ICRtZXRob2JqcyA9IFsgXTsKLSAgICBmb3JlYWNoIG15ICRtZXRoIChzcGxpdCAv
XDtccyovLCAoJGhvLT57UG93ZXJ9IC8vICd1bnN1cHBvcnRlZCcpKSB7CisgICAgZm9yZWFjaCBt
eSAkbWV0aCAoc3BsaXQgL1w7XHMqLywgJHNwZWMpIHsKICAgICAgICAgaWYgKCRtZXRoIGVxICdu
ZXN0JykgewogICAgICAgICAgICAgcHVzaCBAJG1ldGhvYmpzLCAkbWV0aDsKICAgICAgICAgfSBl
bHNpZiAoJG1ldGggPX4gbXteKFxkKykoPzovKFxkKykpJH0pIHsKQEAgLTkzMCw3ICs5MzAsMTMg
QEAgc3ViIHBvd2VyX2N5Y2xlX2hvc3Rfc2V0dXAgKCQpIHsKICAgICAgICAgICAgIHB1c2ggQCRt
ZXRob2JqcywgZ2V0X2hvc3RfbWV0aG9kX29iamVjdCgkaG8sJ1BEVScsJG1ldGgpOwogICAgICAg
ICB9CiAgICAgfQotICAgICRoby0+e1Bvd2VyTWV0aG9ianN9ID0gJG1ldGhvYmpzOworICAgIHJl
dHVybiAkbWV0aG9ianM7Cit9CisKK3N1YiBwb3dlcl9jeWNsZV9ob3N0X3NldHVwICgkKSB7Cisg
ICAgbXkgKCRobykgPSBAXzsKKyAgICAkc3BlYyA9ICgkaG8tPntQb3dlcn0gLy8gJ3Vuc3VwcG9y
dGVkJyk7CisgICAgJGhvLT57UG93ZXJNZXRob2Jqc30gPSBwb3dlcl9jeWNsZV9wYXJzZV9tZXRo
b2QoJGhvLCRzcGVjKTsKIH0KIAogc3ViIHBvd2VyX2N5Y2xlX3NsZWVwICgkKSB7Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
