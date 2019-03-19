From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 2/2] x86/pvshim: use 2M alignment
Date: Tue, 19 Mar 2019 13:05:50 +0000
Message-ID: <20190319130550.32570-3-wei.liu2@citrix.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6ERR-0007bz-TV
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:06:05 +0000
In-Reply-To: <20190319130550.32570-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHB2c2hpbSBpcyBsb2FkZWQgZGlyZWN0bHkgYnkgdG9vbHN0YWNrLiBVc2UgMk0gYWxpZ25t
ZW50IGZvcgpwb3RlbnRpYWxseSBiZXR0ZXIgcGVyZm9ybWFuY2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jb25maWdzL3B2
c2hpbV9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcgYi94ZW4vYXJj
aC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCmluZGV4IGExMmUzZDA0NjUuLjhlNTBiNjBj
ZGEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKKysr
IGIveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZwpAQCAtNSw2ICs1LDcgQEAg
Q09ORklHX1BWSF9HVUVTVD15CiBDT05GSUdfUFZfU0hJTT15CiBDT05GSUdfUFZfU0hJTV9FWENM
VVNJVkU9eQogQ09ORklHX05SX0NQVVM9MzIKK0NPTkZJR19YRU5fQUxJR05fMk09eQogIyBEaXNh
YmxlIGZlYXR1cmVzIG5vdCB1c2VkIGJ5IHRoZSBQViBzaGltCiAjIENPTkZJR19TSEFET1dfUEFH
SU5HIGlzIG5vdCBzZXQKICMgQ09ORklHX0JJR01FTSBpcyBub3Qgc2V0Ci0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
