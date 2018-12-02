From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] xen-paciback: Fixes for PCI passthrough of
 AMD GPU.
Date: Sun,  2 Dec 2018 18:47:31 +0100
Message-ID: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek__21204.7007088133$1543772992$gmane$org@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9eyo=ol=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gTVte-0003ER-JP
 for xen-devel@lists.xenproject.org; Sun, 02 Dec 2018 17:51:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Dwayne Litzenberger <dlitz@dlitz.net>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

SSd2ZSBnb3QgdGhpcyBwYXRjaCBzZXJpZXMgZnJvbSBEd2F5bmUgTGl0emVuYmVyZ2VyLCBhcyBh
IGZpeCBmb3IgQU1EIEdQVQpwYXNzdGhyb3VnaC4gSSBkb24ndCBoYXZlIHRoaXMgaGFyZHdhcmUg
bXlzZWxmLCBzbyBJIGNhbid0IHRlc3QgdGhpcywgYnV0IGhlCmNsYWltcyBpdCB3b3Jrcy4gSSdt
IG5vdCBzdXJlIGlmIGFsbG93aW5nIGd1ZXN0IHRvIGVuYWJsZS9kaXNhYmxlIGV4cGFuc2lvbiBS
T00KaXMgc2FmZSB0aGluZyB0byBkbywgYnV0IHRoZSBjb21tZW50IGluIHJvbV93cml0ZSBmb3Ig
bWUgc3VnZ2VzdHMgaXQgaXMgYnV0Cndhc24ndCBjb25zaWRlcmVkIG5lY2Vzc2FyeS4gT3RoZXIg
dGhhbiB0aGlzIHVuY2VydGFpbnR5LCB0aGUgcGF0Y2hlcyBsb29rcwpnb29kIGZvciBtZS4KCk9y
aWdpbmFsbHkgcG9zdGVkIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9tYXJtYXJlay9xdWJlcy1s
aW51eC1rZXJuZWwvcHVsbHMvMQoKQ2M6IER3YXluZSBMaXR6ZW5iZXJnZXIgPGRsaXR6QGRsaXR6
Lm5ldD4KCkR3YXluZSBMaXR6ZW5iZXJnZXIgKDIpOgogIHhlbi1wY2liYWNrOiBGaXggZXJyb3Ig
cmV0dXJuIGluIGJhcl93cml0ZSgpIGFuZCByb21fd3JpdGUoKQogIHhlbi1wY2liYWNrOiBBbGxv
dyBlbmFibGluZy9kaXNhYmxpbmcgZXhwYW5zaW9uIFJPTQoKIGRyaXZlcnMveGVuL3hlbi1wY2li
YWNrL2NvbmZfc3BhY2VfaGVhZGVyLmMgfCAzNCArKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1p
dDogMmU2ZTkwMmQxODUwMjdmOGUzY2I4YjczMDUyMzhmN2UzNWQ2YTQzNgotLSAKZ2l0LXNlcmll
cyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
