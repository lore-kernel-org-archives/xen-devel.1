From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 03/11] SUPPORT.md: Syntax: Provide a title
 rather than a spurious empty section
Date: Thu, 12 Apr 2018 13:28:28 +0100
Message-ID: <1523536116-31316-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+jx=hb=citrix.com=prvs=633689d9b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6bLM-0006No-Ay
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 12:28:48 +0000
In-Reply-To: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjb21taXRzIChtb3JlIG9yIGxlc3MpIHRoaXMgZmlsZSB0byBiZSBwcm9jZXNzZWQgd2l0
aCBwYW5kb2MsCnJhdGhlciB0aGFuIG90aGVyIG1hcmtkb3duIHByb2Nlc3NvcnMuICBUaGVyZSBp
cywgdW5mb3J0dW5hdGVseSwgbm8Kd2lkZWx5LWFjY2VwdGVkIHdheSB0byBkZWNsYXJlIGEgdGl0
bGUgZm9yIHRoZSBkb2N1bWVudC4KCkkgdGVzdGVkIGZlZWRpbmcgdGhlIGRvY3VtZW50IHRvIG1h
cmtkb3duKDEpIG9uIERlYmlhbiBqZXNzaWUgYW5kIGl0CnJlcHJvZHVjZWQgdGhlICUgbGluZSBh
cyBpZiBpdCB3ZXJlIHNpbXBsZSB0ZXh0LiAgSSBndWVzcyBtYW55IG90aGVyCm1hcmtkb3duIHBy
b2Nlc3NvcnMgd2lsbCBkbyBzb21ldGhpbmcgc2ltaWxhcmx5IHRvbGVyYWJsZS4gIE15CmludGVy
bmV0IHNlYXJjaGVzIGRpZCBub3QgZGlzY292ZXIgYSBtYXJrZG93biBwcm9jZXNzb3IgdGhhdCB1
c2VkCmxpbmVzIHN0YXJ0aW5nIHdpdGggJSBmb3Igc29tZXRoaW5nIGVsc2UuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KUmVsZWFzZS1hY2tl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpBY2tlZC1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpBY2tlZC1ieTogTGFycyBLdXJ0aCA8bGFy
cy5rdXJ0aEBjaXRyaXguY29tPgotLS0KdjI6IERpc2N1c3MgdGhlIGNvbXBhdGliaWxpdHkgcHJv
YmxlbXMgd2l0aCAmIGluIHRoZSBjb21taXQgbWVzc2FnZS4KLS0tCiBTVVBQT1JULm1kIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKaW5kZXggZTQ0NzA2OS4uMjY0YjIzZiAxMDA2
NDQKLS0tIGEvU1VQUE9SVC5tZAorKysgYi9TVVBQT1JULm1kCkBAIC0xLDQgKzEsNCBAQAotIyBT
dXBwb3J0IHN0YXRlbWVudCBmb3IgdGhpcyByZWxlYXNlCislIFN1cHBvcnQgc3RhdGVtZW50IGZv
ciB0aGlzIHJlbGVhc2UKIAogVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIHN1cHBvcnQgc3Rh
dHVzCiBhbmQgaW4gcGFydGljdWxhciB0aGUgc2VjdXJpdHkgc3VwcG9ydCBzdGF0dXMgb2YgdGhl
IFhlbiBicmFuY2gKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
