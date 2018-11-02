From: Liam Merwick <Liam.Merwick@oracle.com>
Subject: [PATCH] xen/grant-table: Fix incorrect
 gnttab_dma_free_pages() pr_debug message
Date: Fri,  2 Nov 2018 14:04:23 +0000
Message-ID: <1541167463-32024-1-git-send-email-Liam.Merwick__24777.4119525731$1541167634$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ated=nn=oracle.com=liam.merwick@srs-us1.protection.inumbo.net>)
 id 1gIa3e-0002kj-1e
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:04:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, liam.merwick@oracle.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SWYgYSBjYWxsIHRvIHhlbm1lbV9yZXNlcnZhdGlvbl9pbmNyZWFzZSgpIGluIGdudHRhYl9kbWFf
ZnJlZV9wYWdlcygpCmZhaWxzIGl0IHRyaWdnZXJzIGEgbWVzc2FnZSAiRmFpbGVkIHRvIGRlY3Jl
YXNlIHJlc2VydmF0aW9uLi4uIiB3aGljaApzaG91bGQgYmUgIkZhaWxlZCB0byBpbmNyZWFzZSBy
ZXNlcnZhdGlvbi4uLiIKCkZpeGVzOiA5YmRjNzMwNGY1MzYgKCd4ZW4vZ3JhbnQtdGFibGU6IEFs
bG93IGFsbG9jYXRpbmcgYnVmZmVycyBzdWl0YWJsZSBmb3IgRE1BJykKUmVwb3J0ZWQtYnk6IFJv
c3MgUGhpbGlwc29uIDxyb3NzLnBoaWxpcHNvbkBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBM
aWFtIE1lcndpY2sgPGxpYW0ubWVyd2lja0BvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTogTWFyayBL
YW5kYSA8bWFyay5rYW5kYUBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMveGVuL2dyYW50LXRhYmxl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIGIvZHJpdmVycy94ZW4vZ3Jh
bnQtdGFibGUuYwppbmRleCA4NDU3NWJhY2VlYmMuLjk3MzQxZmE3NTQ1OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYworKysgYi9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5j
CkBAIC05MTQsNyArOTE0LDcgQEAgaW50IGdudHRhYl9kbWFfZnJlZV9wYWdlcyhzdHJ1Y3QgZ250
dGFiX2RtYV9hbGxvY19hcmdzICphcmdzKQogCiAJcmV0ID0geGVubWVtX3Jlc2VydmF0aW9uX2lu
Y3JlYXNlKGFyZ3MtPm5yX3BhZ2VzLCBhcmdzLT5mcmFtZXMpOwogCWlmIChyZXQgIT0gYXJncy0+
bnJfcGFnZXMpIHsKLQkJcHJfZGVidWcoIkZhaWxlZCB0byBkZWNyZWFzZSByZXNlcnZhdGlvbiBm
b3IgRE1BIGJ1ZmZlclxuIik7CisJCXByX2RlYnVnKCJGYWlsZWQgdG8gaW5jcmVhc2UgcmVzZXJ2
YXRpb24gZm9yIERNQSBidWZmZXJcbiIpOwogCQlyZXQgPSAtRUZBVUxUOwogCX0gZWxzZSB7CiAJ
CXJldCA9IDA7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
