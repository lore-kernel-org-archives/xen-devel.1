From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/time: Identify the platform timer before
 attempting to probe it
Date: Thu, 15 Nov 2018 16:22:29 +0000
Message-ID: <1542298949-29441-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBwbGF0Zm9ybSB0aW1lciBpbml0aWFsaXNhdGlvbiBmYWlscyBkdWUgdG8gbWlzc2luZyBp
bnRlcnJ1cHRzLCBoYXJkd2FyZQp0ZW5kcyB0byBsaXZlbG9jayB3aXRob3V0IGlkZW50aWZ5aW5n
IHRoZSB0aW1lciBpbiB1c2UuCgpMZWF2ZSBhIHRyYWNlIGFyb3VuZCB0byBoZWxwIGRlYnVnZ2lu
Zy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDQzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L3RpbWUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKaW5kZXgg
MjRkNGMyNy4uOTkyNTQwYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYworKysgYi94
ZW4vYXJjaC94ODYvdGltZS5jCkBAIC03OTUsNiArNzk1LDcgQEAgc3RhdGljIHU2NCBfX2luaXQg
aW5pdF9wbGF0Zm9ybV90aW1lcih2b2lkKQogICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZ
X1NJWkUocGx0X3RpbWVycyk7IGkrKyApCiAgICAgICAgIHsKICAgICAgICAgICAgIHB0cyA9IHBs
dF90aW1lcnNbaV07CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJQcm9iaW5nIHBs
YXRmb3JtIHRpbWVyICVzXG4iLCBwdHMtPm5hbWUpOwogICAgICAgICAgICAgaWYgKCAocmMgPSB0
cnlfcGxhdGZvcm1fdGltZXIocHRzKSkgPiAwICkKICAgICAgICAgICAgICAgICBicmVhazsKICAg
ICAgICAgfQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
