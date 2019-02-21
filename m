From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 06/14] x86/apic: Add Hygon Dhyana support
Date: Thu, 21 Feb 2019 17:51:59 +0800
Message-ID: <7eb53b4927793ed31d861d46193fccfa789bc036.1550647742.git.puwen@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hIO5=Q4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gwl3M-0001nC-RY
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:54:04 +0000
In-Reply-To: <cover.1550647742.git.puwen@hygon.cn>
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
Ynk6IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+Ci0tLQogeGVuL2FyY2gveDg2L2FwaWMuYyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRleCAyYTI0MzI2Li4wMDRk
Njg1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9h
cGljLmMKQEAgLTkyLDYgKzkyLDExIEBAIHN0YXRpYyBpbnQgbW9kZXJuX2FwaWModm9pZCkKICAg
ICBpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EICYmCiAgICAg
ICAgIGJvb3RfY3B1X2RhdGEueDg2ID49IDB4ZikKICAgICAgICAgcmV0dXJuIDE7CisKKyAgICAv
KiBIeWdvbiBzeXN0ZW1zIHVzZSBtb2Rlcm4gQVBJQyAqLworICAgIGlmIChib290X2NwdV9kYXRh
Lng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9IWUdPTikKKyAgICAgICAgcmV0dXJuIDE7CisKICAg
ICBsdnIgPSBhcGljX3JlYWQoQVBJQ19MVlIpOwogICAgIHZlcnNpb24gPSBHRVRfQVBJQ19WRVJT
SU9OKGx2cik7CiAgICAgcmV0dXJuIHZlcnNpb24gPj0gMHgxNDsKLS0gCjIuNy40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
