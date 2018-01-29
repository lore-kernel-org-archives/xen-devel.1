From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/2] mg-hosts: Call db_readonly_report
	inside, not outside, db_retry
Date: Mon, 29 Jan 2018 17:29:07 +0000
Message-ID: <1517246947-24154-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1517246947-24154-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ept7=ey=citrix.com=prvs=56019719f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1egDFO-0003Wj-BN
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 17:29:34 +0000
In-Reply-To: <1517246947-24154-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

TmV3ZXIgcG9zdGdyZXNxbCBwcmludHM6CiAgV0FSTklORzogIFNFVCBUUkFOU0FDVElPTiBjYW4g
b25seSBiZSB1c2VkIGluIHRyYW5zYWN0aW9uIGJsb2NrcwphbmQgaXQgaXMgcmlnaHQuCgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBt
Zy1mb3JjZS1wdXNoIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWctZm9yY2UtcHVzaCBiL21nLWZvcmNlLXB1c2gKaW5k
ZXggMDljMTg5NC4uMTA2NmEzMCAxMDA3NTUKLS0tIGEvbWctZm9yY2UtcHVzaAorKysgYi9tZy1m
b3JjZS1wdXNoCkBAIC02Miw4ICs2Miw4IEBAIEVORAogICAgIG15ICVyZXZ1c2VzOwogICAgIHBy
aW50ZiAiY2hlY2tpbmcgcmV2aXNpb25zIHVzZWQgaW4gJXMuLi5cbiIsICRmbGlnaHQ7CiAKLSAg
ICBkYl9yZWFkb25seV9yZXBvcnQoKTsKICAgICBkYl9yZXRyeSgkZGJoX3Rlc3RzLCBbXSwgc3Vi
IHsKKyAgICAgICAgZGJfcmVhZG9ubHlfcmVwb3J0KCk7CiAgICAgICAgICRmbHRfcS0+ZXhlY3V0
ZSgkZmxpZ2h0KTsKICAgICAgICAgbXkgJGZsdF9yb3cgPSAkZmx0X3EtPmZldGNocm93X2hhc2hy
ZWYoKTsKICAgICAgICAgJGZsdF9yb3ctPntibGVzc2luZ30gZXEgJ3JlYWwnIG9yIGRpZSAiJGZs
dF9yb3ctPntibGVzc2luZ30gPyI7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
