From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 06/32] libxl_qmp: Add a warning to not trust
 QEMU
Date: Fri, 27 Jul 2018 15:05:48 +0100
Message-ID: <20180727140614.13256-7-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3Ns-0005Ro-TZ
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:06:20 +0000
In-Reply-To: <20180727140614.13256-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIGV2ZW4gaWYgaXQgaXMgbm90IHRoZSBjYXNlIGZvciB0aGUgY3VycmVudCBjb2RlLgoKU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFj
a2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29s
cy9saWJ4bC9saWJ4bF9xbXAuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9xbXAuYwppbmRleCA1YjYwOGY0N2U1Li45ODdiZjAyMzJlIDEwMDY0NAotLS0gYS90b29s
cy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwpAQCAtMTYs
NiArMTYsOSBAQAogLyoKICAqIFRoaXMgZmlsZSBpbXBsZW1lbnQgYSBjbGllbnQgZm9yIFFNUCAo
UUVNVSBNb25pdG9yIFByb3RvY29sKS4gRm9yIHRoZQogICogU3BlY2lmaWNhdGlvbiwgc2VlIGlu
IHRoZSBRRU1VIHJlcG9zaXRvcnkuCisgKgorICogV0FSTklORyAtIERvIG5vdCB0cnVzdCBRRU1V
IHdoZW4gd3JpdGluZyBjb2RlcyBmb3IgbmV3IGNvbW1hbmRzIG9yIHdoZW4KKyAqICAgICAgICAg
ICBpbXByb3ZpbmcgdGhlIGNsaWVudCBjb2RlLgogICovCiAKIC8qCi0tIApBbnRob255IFBFUkFS
RAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
