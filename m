From: Michael Glasgow <glasgow@beer.net>
Subject: firmware/shim: fix build process to use POSIX find
	options
Date: Fri, 26 Jan 2018 13:54:30 -0600 (CST)
Message-ID: <201801261954.w0QJsVrb043842@dark.beer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=31wi=ev=beer.net=glasgow@srs-us1.protection.inumbo.net>)
 id 1efAVe-0001ti-NP
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 20:22:02 +0000
Received: from dark.beer.net (glasgow@localhost [127.0.0.1])
 by dark.beer.net (8.13.8/8.13.8) with ESMTP id w0QJsV48043843
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2018 13:54:31 -0600 (CST)
Received: (from glasgow@localhost)
 by dark.beer.net (8.13.8/8.13.8/Submit) id w0QJsVrb043842
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 13:54:31 -0600 (CST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZWNlbnQgcGF0Y2ggY2FuIGJlIHNpbXBsaWZpZWQgYSBiaXQuICAoVGhlIHBhdGNoIGJl
bG93IGlzCnVudGVzdGVkLCBqdXN0IGEgc3VnZ2VzdGlvbi4pCgoKZGlmZiAtdXIgYS90b29scy9m
aXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmls
ZQotLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCTIwMTgtMDEtMjYgMTE6NDA6
MDAuNzExMzg5NjA1IC0wNjAwCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUJ
MjAxOC0wMS0yNiAxMTo1MTo0MS4yNzk4MjUxNDIgLTA2MDAKQEAgLTIwLDkgKzIwLDggQEAKIAly
bSAtZiBsaW5rZmFybS5zdGFtcC50bXAKIAkkKGZvcmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCiAJ
CSAobWtkaXIgLXAgJChEKS8kKGQpOyBcCi0JCSAgY2QgJChEKS8kKGQpOyBcCi0JCSAgZmluZCAk
KFhFTl9ST09UKS8kKGQpLyAtdHlwZSBkIC1leGVjIHNoIC1jIFwKLQkJICAgICAgImVjaG8ge30g
fCBzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdzIG1rZGlyIC1wIiBcOyk7KQor
CQkgIGNkICQoRCkvJChkKSAmJiBcCisJCSAgKGNkICQoWEVOX1JPT1QpLyQoZCkgJiYgZmluZCAu
IC10eXBlIGQpIHwgeGFyZ3MgbWtkaXIgLXAgXDspOykKIAkkKGZvcmVhY2ggZCwgJChMSU5LX0RJ
UlMpLCBcCiAJCShjZCAkKFhFTl9ST09UKTsgXAogCQkgZmluZCAkKGQpICEgLXR5cGUgbCAtdHlw
ZSBmIFwKCgotLSAKTWljaGFlbCBHbGFzZ293IDxnbGFzZ293QGJlZXIubmV0PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
