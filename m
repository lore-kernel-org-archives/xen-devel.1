From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 3/9] SUPPORT.md: Syntax: Provide a title rather
 than a spurious empty section
Date: Wed, 25 Apr 2018 13:59:59 +0100
Message-ID: <1524661205-7088-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fg/1=ho=citrix.com=prvs=6464c4f88=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBK1x-00038q-Pn
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 13:00:17 +0000
In-Reply-To: <1524661205-7088-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
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
cy5rdXJ0aEBjaXRyaXguY29tPgooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBhNTY5YzZmODE1
ZmI2YTE4YzY0YjhmMTIyZjVlMmJiZWNkNDQ0NDMyKQotLS0KIFNVUFBPUlQubWQgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZAppbmRleCA5MmM2YTJjLi4yMDFlNWEzIDEwMDY0NAot
LS0gYS9TVVBQT1JULm1kCisrKyBiL1NVUFBPUlQubWQKQEAgLTEsNCArMSw0IEBACi0jIFN1cHBv
cnQgc3RhdGVtZW50IGZvciB0aGlzIHJlbGVhc2UKKyUgU3VwcG9ydCBzdGF0ZW1lbnQgZm9yIHRo
aXMgcmVsZWFzZQogCiBUaGlzIGRvY3VtZW50IGRlc2NyaWJlcyB0aGUgc3VwcG9ydCBzdGF0dXMK
IGFuZCBpbiBwYXJ0aWN1bGFyIHRoZSBzZWN1cml0eSBzdXBwb3J0IHN0YXR1cyBvZiB0aGUgWGVu
IGJyYW5jaAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
