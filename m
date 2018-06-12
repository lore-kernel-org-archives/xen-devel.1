From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v5 0/3] Input: xen-kbdfront - allow better
 run-time configuration
Date: Tue, 12 Jun 2018 10:48:53 +0300
Message-ID: <20180612074856.28451-1-andr2000__39747.5382582799$1528789693$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=byzt=i6=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fSe3F-0005HN-C3
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 07:49:13 +0000
Received: by mail-lf0-x241.google.com with SMTP id i15-v6so24214945lfc.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 00:49:11 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, jgross@suse.com, lyan@suse.com, boris.ostrovsky@oracle.com
Cc: andr2000@gmail.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, andrii_chepurnyi@epam.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKSGksIGFsbCEKClRoaXMgcGF0Y2ggc2VyaWVzIHN5bmNocm9uaXplcyBYZW4gY2Fu
b25pY2FsIHByb3RvY29sIGRlZmluaXRpb25zCndoaWNoIGFsbG93IHRoZSBsYXN0IHR3byBwYXRj
aGVzIGluIHRoZSBzZXJpZXMgdG8gdXBkYXRlIFhlbgprYmRmcm9udCBkcml2ZXIgd2l0aCBhIGZp
eCBhbmQgdjUgb2YgdGhlIHBhdGNoIHRvIGFsbG93IGJldHRlcgpydW4tdGltZSBjb25maWd1cmF0
aW9uIGZvciB4ZW4ta2JkZnJvbnQuCgpBcyB4ZW4ta2JkZnJvbnQgcGF0Y2hlcyByZWx5IG9uIHBy
b3RvY29sIGNoYW5nZXMgZnJvbSBwYXRjaCAxIEkgYW0Kc2VuZGluZyB0aGVzZSBhbGwgdG9nZXRo
ZXI6IEJvcmlzLCBKdWVyZ2VuLCBpZiB5b3UgYW5kIERtaXRyeSBkbyBub3QKbWluZCwgY2FuIHdl
IGhhdmUgcGF0Y2ggMSBhcHBsaWVkIHRocm91Z2ggRG1pdHJ5J3MgdHJlZT8KClRoYW5rIHlvdSwK
T2xla3NhbmRyCgpDaGFuZ2VzIHNpbmNlIHY0OgotIEFkZGVkIHJlcXVpcmVkIGNoYW5nZXMgdG8g
WGVuIHByb3RvY29scwotIEFkZGVkIGEgZml4IGZvciBtdWx0aS10b3VjaCBYZW5TdG9yZSBub2Rl
J3MgbG9jYXRpb25zCi0gTm8gY2hhbmdlcyB0byAiSW5wdXQ6IHhlbi1rYmRmcm9udCAtIGFsbG93
IGJldHRlciBydW4tdGltZQogIGNvbmZpZ3VyYXRpb24iCgpDaGFuZ2VzIHNpbmNlIHYzOgotIGRv
IG5vdCBjb25uZWN0IGJhY2tlbmQgaWYgYWxsIHZpcnR1YWwgZGV2aWNlcyBhcmUgZGlzYWJsZWQg
KERtaXRyeSkKCkNoYW5nZXMgc2luY2UgdjI6Ci0gYmFzZWQgb24gWGVuU3RvcmUga2JkaWYgZmVh
dHVyZXMgdG8gY29udHJvbCB3aGljaCBkZXZpY2VzIGFyZQogIGV4cG9zZWQgaW5zdGVhZCBvZiBt
b2R1bGUgcGFyYW1ldGVycy4KCk9sZWtzYW5kciBBbmRydXNoY2hlbmtvICgzKToKICB4ZW46IFN5
bmMgdXAgd2l0aCB0aGUgY2Fub25pY2FsIHByb3RvY29sIGRlZmluaXRpb25zIGluIFhlbgogIElu
cHV0OiB4ZW4ta2JkZnJvbnQgLSBmaXggbXVsdGktdG91Y2ggWGVuU3RvcmUgbm9kZSdzIGxvY2F0
aW9ucwogIElucHV0OiB4ZW4ta2JkZnJvbnQgLSBhbGxvdyBiZXR0ZXIgcnVuLXRpbWUgY29uZmln
dXJhdGlvbgoKIGRyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYyAgfCAxODMgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0KIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9kaXNwbGlm
LmggfCAgIDggKysKIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9rYmRpZi5oICAgfCAgNzggKysr
KysrKysrLS0tCiBpbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vc25kaWYuaCAgIHwgIDEwICstCiA0
IGZpbGVzIGNoYW5nZWQsIDE4MCBpbnNlcnRpb25zKCspLCA5OSBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
