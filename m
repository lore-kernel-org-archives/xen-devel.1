From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 08/17] x86: make construct_dom0 build with
 !CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:27 +0100
Message-ID: <c3dca1d3b314660f15aa886c410815c6ae10dc8a.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g85mx-00050d-AI
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:43:43 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZG9tMF9idWlsZC5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
ZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCA4NmViN2RiLi40
NTc3MTExIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9kb20wX2J1aWxkLmMKQEAgLTUwOSw4ICs1MDksMTYgQEAgaW50IF9faW5pdCBjb25z
dHJ1Y3RfZG9tMChzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBtb2R1bGVfdCAqaW1hZ2UsCiAgICAg
fQogI2VuZGlmCiAKLSAgICByYyA9IChpc19odm1fZG9tYWluKGQpID8gZG9tMF9jb25zdHJ1Y3Rf
cHZoIDogZG9tMF9jb25zdHJ1Y3RfcHYpCi0gICAgICAgICAoZCwgaW1hZ2UsIGltYWdlX2hlYWRy
b29tLCBpbml0cmQsIGNtZGxpbmUpOworICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCisgICAg
ICAgIHJjID0gZG9tMF9jb25zdHJ1Y3RfcHZoKGQsIGltYWdlLCBpbWFnZV9oZWFkcm9vbSwgaW5p
dHJkLCBjbWRsaW5lKTsKKyAgICBlbHNlIGlmICggaXNfcHZfZG9tYWluKGQpICkKKyAgICAgICAg
cmMgPSBkb20wX2NvbnN0cnVjdF9wdihkLCBpbWFnZSwgaW1hZ2VfaGVhZHJvb20sIGluaXRyZCwg
Y21kbGluZSk7CisgICAgZWxzZQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
CisgICAgICAgIHJjID0gLUVJTlZBTDsKKyAgICB9CisKICAgICBpZiAoIHJjICkKICAgICAgICAg
cmV0dXJuIHJjOwogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
