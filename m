From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 08/18] xen/arm: introduce
 guest_handle_for_field()
Date: Wed, 19 Dec 2018 22:39:05 -0800
Message-ID: <1545287955-27684-9-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrzr-0005x3-8L
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:39:51 +0000
Received: by mail-io1-xd44.google.com with SMTP id m19so493622ioh.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:39:49 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

QVJNIHBvcnQgb2YgYy9zIGJiNTQ0NTg1OiAiaW50cm9kdWNlIGd1ZXN0X2hhbmRsZV9mb3JfZmll
bGQoKSIKClRoaXMgaGVscGVyIHR1cm5zIGEgZmllbGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBh
IEdVRVNUX0hBTkRMRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KdjEgMTAgZmVlZGJhY2sgUGF1bDogaW1wcm92ZSBj
b21taXQgbWVzc2FnZSwgYWRkIFItYnkKCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vz
cy5oIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9ndWVzdF9hY2Nlc3MuaAppbmRleCA4NzIyODU4Li43MjlmNzFlIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
Z3Vlc3RfYWNjZXNzLmgKQEAgLTYzLDYgKzYzLDkgQEAgaW50IGFjY2Vzc19ndWVzdF9tZW1vcnlf
YnlfaXBhKHN0cnVjdCBkb21haW4gKmQsIHBhZGRyX3QgaXBhLCB2b2lkICpidWYsCiAgICAgX3k7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9
KQogCisjZGVmaW5lIGd1ZXN0X2hhbmRsZV9mb3JfZmllbGQoaG5kLCB0eXBlLCBmbGQpICAgICAg
ICAgIFwKKyAgICAoKFhFTl9HVUVTVF9IQU5ETEUodHlwZSkpIHsgJihobmQpLnAtPmZsZCB9KQor
CiAjZGVmaW5lIGd1ZXN0X2hhbmRsZV9mcm9tX3B0cihwdHIsIHR5cGUpICAgICAgICBcCiAgICAg
KChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHR5cGUpKSB7ICh0eXBlICopcHRyIH0pCiAjZGVmaW5l
IGNvbnN0X2d1ZXN0X2hhbmRsZV9mcm9tX3B0cihwdHIsIHR5cGUpICBcCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
