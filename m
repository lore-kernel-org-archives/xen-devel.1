From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 01/23] Osstest/Debian.pm: Remove a
 spurious `my $kernel'.
Date: Wed, 23 May 2018 17:15:48 +0100
Message-ID: <1527092170-4111-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR3-0000Nm-Bh
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:21 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB2YXJpYWJsZSBpcyBub3QgdXNlZCwgYW5kIGlzIHNoYWRvd2VkIGJ5IHRoZSBvbmUgd2hp
Y2ggaXMKaW5pdGlhbGlzZWQgYSBmZXcgbGluZXMgbGF0ZXIuICBUaGlzIHByb2R1Y2VzIGEgd2Fy
bmluZy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVzdC9EZWJpYW4u
cG0KaW5kZXggYjQ2ZDIyMi4uZWFmYzZjZCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0K
KysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTEwNjMsNyArMTA2Myw2IEBAIHN1YiBkaV9zcGVj
aWFsX2tlcm5lbCAoJCQpIHsKICAgICBteSAkZF9pID0gZGlfaW5zdGFsbGVyX3BhdGgoJGhvKTsK
ICAgICBteSAkdHAgPSAkaG8tPntUZnRwfXtQYXRofTsKICAgICBmb3JlYWNoIG15ICRrcCAoa2V5
cyAleyAkaG8tPntGbGFnc30gfSkgewotICAgICAgICBteSAka2VybmVsOwogICAgICAgICAjIEJh
Y2t3YXJkcyBjb21wYXRpYmlsaXR5CiAgICAgICAgICRrcCA9ICJuZWVkLWtlcm5lbC1kZWItd2hl
ZXp5LWJhY2twb3J0cyIgaWYgJGtwIGVxICJuZWVkLWtlcm5lbC1kZWItYXJtbXAiOwogICAgICAg
ICAka3AgPX4gcy9uZWVkLWtlcm5lbC1kZWItJGhvLT57U3VpdGV9LS8vIG9yIG5leHQ7Ci0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
