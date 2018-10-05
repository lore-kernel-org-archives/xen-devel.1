From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 13/18] tools/xenstat: Fix shared library version
Date: Fri,  5 Oct 2018 18:29:12 +0100
Message-ID: <20181005172917.11963-14-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U3B-0005sy-Ox
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:05 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Bastian Blank <waldi@debian.org>, Wei Liu <wei.liu2@citrix.com>, Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmFzdGlhbiBCbGFuayA8d2FsZGlAZGViaWFuLm9yZz4KCmxpYnhlbnN0YXQgZG9lcyBu
b3QgaGF2ZSBhIHN0YWJsZSBBQkkuICBTZXQgaXRzIHZlcnNpb24gdG8gdGhlIGN1cnJlbnQKWGVu
IHJlbGVhc2UgdmVyc2lvbi4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPgotLS0KIHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZSBiL3Rvb2xzL3hlbnN0YXQv
bGlieGVuc3RhdC9NYWtlZmlsZQppbmRleCA4OTc5ZmExNTgzLi44YzZkZGY4NmU4IDEwMDY0NAot
LS0gYS90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUKKysrIGIvdG9vbHMveGVuc3Rh
dC9saWJ4ZW5zdGF0L01ha2VmaWxlCkBAIC0xOCw3ICsxOCw3IEBAIGluY2x1ZGUgJChYRU5fUk9P
VCkvdG9vbHMvUnVsZXMubWsKIExEQ09ORklHPWxkY29uZmlnCiBNQUtFX0xJTks9bG4gLXNmCiAK
LU1BSk9SPTAKK01BSk9SPTQuMTEKIE1JTk9SPTAKIAogTElCPXNyYy9saWJ4ZW5zdGF0LmEKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
