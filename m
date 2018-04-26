From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/2] docs/process/release-checklist.txt
Date: Thu, 26 Apr 2018 11:52:53 +0100
Message-ID: <1524739973-21614-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1524739973-21614-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBeWO-0006uK-1R
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 10:53:04 +0000
In-Reply-To: <1524739973-21614-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q2xhcmlmeSB3aGF0IGlzIGV4cGVjdGVkIG9mIHRoZSByZWxlYXNlIHRlY2huaWNpYW4gZm9yIFNV
UFBPUlQubWQ6IGZpeAp0aGUgdmVyc2lvbiBudW1iZXIgZmllbGQuICBUaGUgc3VwcG9ydCBkYXRl
cyB3aWxsIGJlIHNldCBieSB0aGUKcmVsZWFzZSBtYW5hZ2Vlci4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgotLS0KIGRvY3MvcHJvY2Vzcy9yZWxlYXNlLXRlY2huaWNpYW4tY2hl
Y2tsaXN0LnR4dCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1j
aGVja2xpc3QudHh0IGIvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3Qu
dHh0CmluZGV4IGM3OTFhZDIuLjBmZGNkNmYgMTAwNjQ0Ci0tLSBhL2RvY3MvcHJvY2Vzcy9yZWxl
YXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dAorKysgYi9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10
ZWNobmljaWFuLWNoZWNrbGlzdC50eHQKQEAgLTUwLDcgKzUwLDggQEAgdD1SRUxFQVNFLSRyCiAK
ICogY2hhbmdlIHhlbi11bnN0YWJsZSBSRUFETUUgKHNob3VsZCBzYXkgIlhlbiA0LjUiIGluIHJl
bGVhc2VzIGFuZCBvbiBzdGFibGUgYnJhbmNoZXMsICJYZW4gNC41LXVuc3RhYmxlIiBvbiB1bnN0
YWJsZSkKICogY2hhbmdlIHhlbi11bnN0YWJsZSBDb25maWcubWsgKFFFTVVfVVBTVFJFQU1fUkVW
SVNJT04sIFFFTVVfVFJBRElUSU9OQUxfUkVWSVNJT04sIE1JTklPU19VUFNUUkVBTV9SRVZJU0lP
TikKLSogY2hhbmdlIFNVUFBPUlQubWQgaGVhZGluZworKiBjaGFuZ2UgU1VQUE9SVC5tZCBoZWFk
aW5nIHZlcnNpb24gbnVtYmVyOyAtdW5zdGFibGUgb3IgLXJjIHRhZworKiAgICAgKGVtcHR5IGlu
IHN0YWJsZSBicmFuY2hlcyBhZnRlciAuMCByZWxlYXNlKS4KICogY2hhbmdlIHhlbi11bnN0YWJs
ZSB4ZW4vTWFrZWZpbGUgWEVOX0VYVFJBVkVSU0lPTgogIyBpZiBtYWluIHZlcnNpb24gbnVtYmVy
IGhhcyBjaGFuZ2VkIChlZyA0LjcgLT4gNC44KSByZXJ1biAuL2F1dG9nZW4uc2gKICogcmVydW4g
Li9hdXRvZ2VuLnNoIHRvIHVwZGF0ZSB2ZXJzaW9uIG51bWJlciBpbiBjb25maWd1cmUKLS0gCjIu
MS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
