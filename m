From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v3 06/14] x86/apic: Add Hygon Dhyana support
Date: Mon, 25 Mar 2019 21:30:47 +0800
Message-ID: <e5cd95f0fe76b85bf9ef511ba46b3ea720b0eddf.1553520193.git.puwen@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Lz9=R4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h8Pkn-00033Y-9m
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:35:05 +0000
In-Reply-To: <cover.1553520193.git.puwen@hygon.cn>
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
IGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRleCAyYTI0MzI2Li4wMDRkNjg1IDEwMDY0NAotLS0g
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
