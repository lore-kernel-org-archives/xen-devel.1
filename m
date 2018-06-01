From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 26/31] libxl_qmp: Disable beautify for QMP
 generated cmd
Date: Fri, 1 Jun 2018 15:37:15 +0100
Message-ID: <20180601143720.24637-27-anthony.perard@citrix.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rmms=it=citrix.com=prvs=6833cd46b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fOlW6-0002bl-La
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 14:58:58 +0000
In-Reply-To: <20180601143720.24637-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbmVlZCBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8
IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCmluZGV4IDMw
MjE3OGM1ZjUuLmY0NGIzMTNhNWUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC02MDEsNiArNjAxLDExIEBAIHN0YXRp
YyBjaGFyICpxbXBfcHJlcGFyZV9xbXBfY21kKGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIHJldHVy
biBOVUxMOwogICAgIH0KIAorI2lmIEhBVkVfWUFKTF9WMgorICAgIC8qIERpc2FibGUgYmVhdXRp
ZnkgZm9yIGRhdGEgc2VudCB0byBRRU1VICovCisgICAgeWFqbF9nZW5fY29uZmlnKGhhbmQsIHlh
amxfZ2VuX2JlYXV0aWZ5LCAwKTsKKyNlbmRpZgorCiAgICAgeWFqbF9nZW5fbWFwX29wZW4oaGFu
ZCk7CiAgICAgbGlieGxfX3lhamxfZ2VuX2FzY2lpeihoYW5kLCAiZXhlY3V0ZSIpOwogICAgIGxp
YnhsX195YWpsX2dlbl9hc2NpaXooaGFuZCwgY21kKTsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
