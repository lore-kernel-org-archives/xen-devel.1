From: Oleksandr Grytsov <al1img@gmail.com>
Subject: [PATCH v1 0/4] libxl: use libxl__device_kind string to
	access device
Date: Wed, 24 Jan 2018 19:19:55 +0200
Message-ID: <1516814399-8597-1-git-send-email-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gxxs=et=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eeOiW-0001uN-Sc
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 17:20:08 +0000
Received: by mail-lf0-x244.google.com with SMTP id x196so6197600lfd.12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 09:20:07 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQ2hh
bmdlcyBzaW5jZSBpbml0aWFsIHZlcnNpb246CiAgKiBhZGQgbGlieGxfX2RvbWFpbl9kZXZpY2Vf
Li4uX3BhdGggZnVuY3Rpb25zIHRvIGdldCBiYWNrZW5kLCBmcm9udGVuZCwKICAgIGxpYnhsIGRl
dmljZSBwYXRoJ3MgZnJvbSBkZXZpY2UgdHlwZSwgZG9tYWluIGlkIGFuZCBkZXZpY2UgaWQKICAq
IHJlYmFzZQoKT2xla3NhbmRyIEdyeXRzb3YgKDQpOgogIGxpYnhsOiB1c2UgbGlieGxfX2Rldmlj
ZV9raW5kIHRvIGdldCBkZXZpY2UgWFMgZW50cnkKICBsaWJ4bDogdXNlIGxpYnhsX19kZXZpY2Vf
a2luZCBpbiBMSUJYTF9ERUZJTkVfVVBEQVRFX0RFVklECiAgbGlieGw6IG1vdmUgbGlieGxfX2Rl
dmljZV9mcm9tXyB0byBMSUJYTF9ERUZJTkVfREVWSUNFX0ZST01fVFlQRQogIGxpYnhsOiBtb3Zl
IGlieGxfZGV2aWRfdG9fZGV2aWNlXy4uLiB0byBMSUJYTF9ERUZJTkVfREVWSURfVE9fREVWSUNF
CgogdG9vbHMvbGlieGwvbGlieGxfOXBmcy5jICAgICAgfCAyMSArKystLS0tLS0tLQogdG9vbHMv
bGlieGwvbGlieGxfY29sb19uaWMuYyAgfCAgNSArLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NvbnNv
bGUuYyAgIHwgNTAgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jICAgIHwgIDQgKy0tCiB0b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYyAgICB8IDQ2
ICsrKysrKysrKysrKysrKysrKysrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZGlzay5jICAgICAg
fCA0MiArKysrKysrKysrLS0tLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAg
ICB8ICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICB8IDg0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX25ldGJ1
ZmZlci5jIHwgIDYgKystLQogdG9vbHMvbGlieGwvbGlieGxfbmljLmMgICAgICAgfCA1NSArKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgICB8
IDE4ICsrKysrKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3VzYi5jICAgICAgIHwgNTcgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3ZkaXNwbC5jICAgIHwg
NjcgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxf
dnRwbS5jICAgICAgfCAzMyArKysrKystLS0tLS0tLS0tLQogMTQgZmlsZXMgY2hhbmdlZCwgMjM5
IGluc2VydGlvbnMoKyksIDI1MSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
