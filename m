From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH for-4.11 v3 0/1] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Fri,  4 May 2018 09:36:51 +0100
Message-ID: <cover.1525421849.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgm7=hx=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fEWDA-0001jW-IH
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 08:37:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzIGFkZHJlc3NlcyBhbGwgY29tbWVudHMgb24gdGhl
IG1haWxpbmcgbGlzdCwgYXMgd2VsbAphcyBzb21lIGZlZWRiYWNrIEkgZ290IGluIHZhcmlvdXMg
cGVyc29uYWwgY29udmVyc2F0aW9ucyBhbmQvb3Igb24gSVJDLiBGb3IKdGhlIHBlb3BsZSB3aG8g
YXNrZWQgZm9yIHNwZWNpZmljIGZlYXR1cmVzL3dvcmtmbG93czoKCklhbiBKYWNrc29uOiB1c2Ug
Li9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCAtcCBub25lIFstYyB0b3BdClJlYWRzIENDcyBm
cm9tIHVubW9kaWZpZWQgKi5wYXRjaCBmaWxlcyBhbmQgaW5zZXJ0cyB0aGVtIGludG8gdGhlIGNv
dmVyIGxldHRlcgoKR2VvcmdlIER1bmxhcDogdXNlIC4vc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMu
cGwgLXAgY2MtLS0KVGVuZHMgdG8gYWRkIENDIGJsb2NrcyBhZnRlciB0aGUgLS0tIGxpbmUgaW4g
Ki5wYXRjaGVzLiBUaGlzIG9wdGlvbiBhY2hpZXZlcwp0aGlzIGJlaGF2aW9yLwoKSnVsaWVuIEdy
YWxsOiB1c2UgLi9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCAtYyBjY2VuZApBcyBmYXIgYXMg
SSByZWNhbGwsIEp1bGllbiBhZGRzIENDIGJsb2NrcyBpbnRvIHRoZSBib2R5IG9mIHRoZSBjb3Zl
ciBsZXR0ZXIuClRoaXMgb3B0aW9uIGFjaGlldmVzIHRoaXMsIGJ1dCB0aGVyZSBpcyBubyBwbGFj
ZSB0aGF0IGFsd2F5cyBleGlzdHMgb3RoZXIKdGhhbiBiZWZvcmUgIi0tICIgd2hlcmUgdGhlIEND
IGJsb2NrIGNhbiBiZSBpbnN0ZXJ0ZWQuCgpJIG1hZGUgdGhlIHByb2Nlc3NpbmcgY29kZSBlYXNp
bHkgZXh0ZW5kYWJsZSB2aWEgcG9saWNpZXMuIFNvIGlmIHRoZXJlIGlzIGFueQptaXNzZWQgYmVo
YXZpb3IsIHRoZSB0b29sIGNhbiBlYXNpbHkgYmUgZXh0ZW5kZWQuCgpBbHNvIG5vdGUgdGhhdCBn
aXQgc2VuZC1lbWFpbCBkb2VzIG5vdCBhdXRvbWF0aWNhbGx5IGFkZCBwZW9wbGUgaW4gKj1ieToK
dGFncyB0byBDQyBsaXN0cyAod2l0aCB0aGUgZXhjZXB0aW9uIG9mIFNpbmdlZC1vZmYtYnkpLiBG
b3IgdGhpcyBJIGFkZGVkCnRoZSBvcHRpb25zIC10fC0tdGFncyBhbmQgLS10YWdzY2MuCgp2MiBv
ZiB0aGlzIHBhdGNoIGNvbnRhaW5lZCBzb21lIGNsZWFudXAgdG8gTUFJTlRBSU5FUlMgd2hpY2gg
aGFzIGJlZW4gYnJva2VuCm91dCBpbnRvIGEgc2VwYXJhdGUgc2VyaWVzOiBzZWUKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA1L3RocmVh
ZHMuaHRtbCMwMDAyOAoKTGFycyBLdXJ0aCAoMSk6CiAgQWRkIG5ldyBhZGRfbWFpbnRhaW5lcnMu
cGwgc2NyaXB0IHRvIG9wdGltaXNlIHRoZSB3b3JrZmxvdyB3aGVuIHVzaW5nCiAgICBnaXQgZm9y
bWF0LXBhdGNoIHdpdGggZ2V0X21haW50YWluZXIucGwKCiBzY3JpcHRzL2FkZF9tYWludGFpbmVy
cy5wbCB8IDUxMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1MTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNzU1IHNj
cmlwdHMvYWRkX21haW50YWluZXJzLnBsCgotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
