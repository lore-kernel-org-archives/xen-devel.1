From: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 1/4] x86_emulator: Add PHONY uninstall target
Date: Thu, 13 Sep 2018 18:01:57 +0300
Message-ID: <ae62f13a325e930d702b34d31b002a6242173801.1536850239.git.ppircalabu@bitdefender.com>
References: <cover.1536850239.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wyui=l3=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1g0T8A-000669-Tr
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 15:02:06 +0000
In-Reply-To: <cover.1536850239.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1536850239.git.ppircalabu@bitdefender.com>
References: <cover.1536850239.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1pc3NpbmcgdW5pbnN0YWxsIHRhcmdldCBicmVha3MgdGhlIHRvcCAndG9vbHMnIHVuaW5z
dGFsbCB0YXJnZXQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVA
Yml0ZGVmZW5kZXIuY29tPgotLS0KIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZSB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9y
L01ha2VmaWxlCmluZGV4IGU4YTNlOTAuLjg2OTZhNjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rz
L3g4Nl9lbXVsYXRvci9NYWtlZmlsZQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFr
ZWZpbGUKQEAgLTEyNiw2ICsxMjYsOSBAQCBkaXN0Y2xlYW46IGNsZWFuCiAuUEhPTlk6IGluc3Rh
bGwgdW5pbnN0YWxsCiBpbnN0YWxsIHVuaW5zdGFsbDoKIAorLlBIT05ZOiB1bmluc3RhbGwKK3Vu
aW5zdGFsbDoKKwogeDg2X2VtdWxhdGU6CiAJWyAtTCAkQCBdIHx8IGxuIC1zZiAkKFhFTl9ST09U
KS94ZW4vYXJjaC94ODYvJEAKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
