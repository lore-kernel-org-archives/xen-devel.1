From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v5 07/15] x86/apic: Add Hygon Dhyana support
Date: Thu, 4 Apr 2019 21:46:42 +0800
Message-ID: <209875aa9ca078be9f40d6e2356402cd4e46afbb.1554382869.git.puwen@hygon.cn>
References: <cover.1554382869.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2cXD=SG=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hC2lI-000849-ET
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:50:36 +0000
In-Reply-To: <cover.1554382869.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pu Wen <puwen@hygon.cn>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IHRvIHVzZSBtb2Rlcm4gQVBJQy4KClNpZ25lZC1vZmYt
Ynk6IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FwaWMuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5j
IGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRleCBlNjEzMGNmLi42NTIyOGNiIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKQEAgLTkyLDYg
KzkyLDExIEBAIHN0YXRpYyBpbnQgbW9kZXJuX2FwaWModm9pZCkKICAgICBpZiAoYm9vdF9jcHVf
ZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EICYmCiAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2ID49IDB4ZikKICAgICAgICAgcmV0dXJuIDE7CisKKyAgICAvKiBIeWdvbiBzeXN0ZW1z
IHVzZSBtb2Rlcm4gQVBJQyAqLworICAgIGlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0g
WDg2X1ZFTkRPUl9IWUdPTikKKyAgICAgICAgcmV0dXJuIDE7CisKICAgICBsdnIgPSBhcGljX3Jl
YWQoQVBJQ19MVlIpOwogICAgIHZlcnNpb24gPSBHRVRfQVBJQ19WRVJTSU9OKGx2cik7CiAgICAg
cmV0dXJuIHZlcnNpb24gPj0gMHgxNDsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
