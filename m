From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 06/15] xen/arm: introduce
 guest_handle_for_field()
Date: Sun,  6 Jan 2019 23:42:39 -0800
Message-ID: <1546846968-7372-7-git-send-email-christopher.w.clark@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x9VP=PP=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ggPZ7-0004gd-Ee
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 07:43:17 +0000
Received: by mail-pl1-x641.google.com with SMTP id e11so20478787plt.11
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jan 2019 23:43:15 -0800 (PST)
In-Reply-To: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QVJNIHBvcnQgb2YgYy9zIGJiNTQ0NTg1OiAiaW50cm9kdWNlIGd1ZXN0X2hhbmRsZV9mb3JfZmll
bGQoKSIKClRoaXMgaGVscGVyIHR1cm5zIGEgZmllbGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBh
IEdVRVNUX0hBTkRMRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNj
ZXNzLmggfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNjZXNzLmggYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2d1ZXN0X2FjY2Vzcy5oCmluZGV4IDIyNGQyYTAuLjg5OTdhMWMgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNjZXNzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9ndWVzdF9hY2Nlc3MuaApAQCAtNjMsNiArNjMsOSBAQCBpbnQgYWNjZXNzX2d1ZXN0X21lbW9y
eV9ieV9pcGEoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBpcGEsIHZvaWQgKmJ1ZiwKICAgICBf
eTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
IH0pCiAKKyNkZWZpbmUgZ3Vlc3RfaGFuZGxlX2Zvcl9maWVsZChobmQsIHR5cGUsIGZsZCkgICAg
ICAgICAgXAorICAgICgoWEVOX0dVRVNUX0hBTkRMRSh0eXBlKSkgeyAmKGhuZCkucC0+ZmxkIH0p
CisKICNkZWZpbmUgZ3Vlc3RfaGFuZGxlX2Zyb21fcHRyKHB0ciwgdHlwZSkgICAgICAgIFwKICAg
ICAoKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odHlwZSkpIHsgKHR5cGUgKilwdHIgfSkKICNkZWZp
bmUgY29uc3RfZ3Vlc3RfaGFuZGxlX2Zyb21fcHRyKHB0ciwgdHlwZSkgIFwKLS0gCjIuNy40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
