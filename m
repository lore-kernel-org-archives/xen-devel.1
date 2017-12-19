From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 23/60] hyper_dmabuf: use
	CONFIG_HYPER_DMABUF_XEN instead of CONFIG_XEN
Date: Tue, 19 Dec 2017 11:29:39 -0800
Message-ID: <1513711816-2618-23-git-send-email-dongwon.kim__4894.25774799219$1513712279$gmane$org@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNjr-0001Lo-G7
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:39:43 +0000
In-Reply-To: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, mateuszx.potrola@intel.com, dri-devel@lists.freedesktop.org, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

Tm93LCB1c2UgQ09ORklHX0hZUEVSX0RNQUJVRl9YRU4gYXMgYSBjb25maWd1cmF0aW9uIG9wdGlv
bgpmb3IgYnVpbGRpbmcgaHlwZXJfZG1hYnVmIGZvciBYZW4gaHlwZXJ2aXNvci4KClNpZ25lZC1v
ZmYtYnk6IERvbmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy94
ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9kcnYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2Rydi5jIGIvZHJpdmVycy94ZW4vaHlwZXJf
ZG1hYnVmL2h5cGVyX2RtYWJ1Zl9kcnYuYwppbmRleCA0ZTBjY2RkLi41NjliOTVlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2Rydi5jCisrKyBiL2Ry
aXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfZHJ2LmMKQEAgLTM2LDcgKzM2LDcg
QEAKICNpbmNsdWRlICJoeXBlcl9kbWFidWZfbGlzdC5oIgogI2luY2x1ZGUgImh5cGVyX2RtYWJ1
Zl9pZC5oIgogCi0jaWZkZWYgQ09ORklHX1hFTgorI2lmZGVmIENPTkZJR19IWVBFUl9ETUFCVUZf
WEVOCiAjaW5jbHVkZSAieGVuL2h5cGVyX2RtYWJ1Zl94ZW5fZHJ2LmgiCiBleHRlcm4gc3RydWN0
IGh5cGVyX2RtYWJ1Zl9iYWNrZW5kX29wcyB4ZW5fYmFja2VuZF9vcHM7CiAjZW5kaWYKQEAgLTYx
LDcgKzYxLDcgQEAgc3RhdGljIGludCBfX2luaXQgaHlwZXJfZG1hYnVmX2Rydl9pbml0KHZvaWQp
CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotI2lmZGVmIENPTkZJR19YRU4KKyNpZmRlZiBDT05G
SUdfSFlQRVJfRE1BQlVGX1hFTgogCWh5cGVyX2RtYWJ1Zl9wcml2YXRlLmJhY2tlbmRfb3BzID0g
Jnhlbl9iYWNrZW5kX29wczsKICNlbmRpZgogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
