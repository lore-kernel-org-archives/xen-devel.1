From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/srat: fix end calculation in
	nodes_cover_memory()
Date: Tue, 13 Feb 2018 10:11:12 -0700
Message-ID: <5A832A4002000078001A7764@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vshx=fh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ele6z-00016R-Q0
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 17:11:21 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxvbmcgdGhlIGxpbmVzIG9mIGNvbW1pdCA3MjI2NDg2NzY3ICgieDg2L3NyYXQ6IGZpeCB0aGUg
ZW5kIHBmbiBjaGVjawppbiB2YWxpZF9udW1hX3JhbmdlKCkiKSBub2Rlc19jb3Zlcl9tZW1vcnko
KSBhbHNvIGRvZXNuJ3QgY29uc2lzdGVudGx5CnVzZSAiZW5kIjogSXQncyBzZXQgdG8gYW4gaW5j
bHVzaXZlIHZhbHVlIGluaXRpYWxseSwgYnV0IHRoZW4gY29tcGFyZWQKdG8gdGhlIGV4Y2x1c2l2
ZSAiZW5kIiBmaWVsZCBvZiBzdHJ1Y3Qgbm9kZSBhbmQgYWxzbyBwb3NzaWJseSBzZXQgdG8Kbm9k
ZXNbal0uc3RhcnQsIG1ha2luZyBpdCBleGNsdXNpdmUgdG9vLiBDaGFuZ2UgdGhlIGluaXRpYWxp
emF0aW9uIHRvCm1ha2UgdGhlIHZhcmlhYmxlIGNvbnNpc3RlbnRseSBleGNsdXNpdmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJj
aC94ODYvc3JhdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMKQEAgLTM2OCw3ICszNjgsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBub2Rlc19jb3Zlcl9tZW1vcnkodm9pCiAJCX0KIAogCQlzdGFy
dCA9IGU4MjAubWFwW2ldLmFkZHI7Ci0JCWVuZCA9IGU4MjAubWFwW2ldLmFkZHIgKyBlODIwLm1h
cFtpXS5zaXplIC0gMTsKKwkJZW5kID0gZTgyMC5tYXBbaV0uYWRkciArIGU4MjAubWFwW2ldLnNp
emU7CiAKIAkJZG8gewogCQkJZm91bmQgPSAwOwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
