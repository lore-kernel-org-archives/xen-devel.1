From: Chao Gao <chao.gao@intel.com>
Subject: [PATCH v6 02/12] microcode/intel: use union to get
 fields without shifting and masking
Date: Mon, 11 Mar 2019 15:57:26 +0800
Message-ID: <1552291056-20286-3-git-send-email-chao.gao@intel.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TXio=RO=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1h3Fke-0003lA-Jc
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 07:53:36 +0000
In-Reply-To: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvbWljcm9jb2RlX2ludGVsLmMgfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwu
YwppbmRleCA5NjU3NTc1Li4yMmZkZWNhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9j
b2RlX2ludGVsLmMKKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCkBAIC0zNyw3
ICszNywxNCBAQAogc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgewogICAgIHVuc2lnbmVk
IGludCBoZHJ2ZXI7CiAgICAgdW5zaWduZWQgaW50IHJldjsKLSAgICB1bnNpZ25lZCBpbnQgZGF0
ZTsKKyAgICB1bmlvbiB7CisgICAgICAgIHN0cnVjdCB7CisgICAgICAgICAgICB1aW50MTZfdCB5
ZWFyOworICAgICAgICAgICAgdWludDhfdCBkYXk7CisgICAgICAgICAgICB1aW50OF90IG1vbnRo
OworICAgICAgICB9OworICAgICAgICB1bnNpZ25lZCBpbnQgZGF0ZTsKKyAgICB9OwogICAgIHVu
c2lnbmVkIGludCBzaWc7CiAgICAgdW5zaWduZWQgaW50IGNrc3VtOwogICAgIHVuc2lnbmVkIGlu
dCBsZHJ2ZXI7CkBAIC0zMTYsOSArMzIzLDkgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUo
dW5zaWduZWQgaW50IGNwdSkKICAgICBwcmludGsoS0VSTl9JTkZPICJtaWNyb2NvZGU6IENQVSVk
IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAiCiAgICAgICAgICAgICIlI3ggdG8gJSN4LCBkYXRlID0g
JTA0eC0lMDJ4LSUwMnggXG4iLAogICAgICAgICAgICBjcHVfbnVtLCB1Y2ktPmNwdV9zaWcucmV2
LCB2YWxbMV0sCi0gICAgICAgICAgIHVjaS0+bWMubWNfaW50ZWwtPmhkci5kYXRlICYgMHhmZmZm
LAotICAgICAgICAgICB1Y2ktPm1jLm1jX2ludGVsLT5oZHIuZGF0ZSA+PiAyNCwKLSAgICAgICAg
ICAgKHVjaS0+bWMubWNfaW50ZWwtPmhkci5kYXRlID4+IDE2KSAmIDB4ZmYpOworICAgICAgICAg
ICB1Y2ktPm1jLm1jX2ludGVsLT5oZHIueWVhciwKKyAgICAgICAgICAgdWNpLT5tYy5tY19pbnRl
bC0+aGRyLm1vbnRoLAorICAgICAgICAgICB1Y2ktPm1jLm1jX2ludGVsLT5oZHIuZGF5KTsKICAg
ICB1Y2ktPmNwdV9zaWcucmV2ID0gdmFsWzFdOwogCiAgICAgcmV0dXJuIDA7Ci0tIAoxLjguMy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
