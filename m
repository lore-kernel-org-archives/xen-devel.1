From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 14/18] gdbsx: Honour LDFLAGS when linking
Date: Fri,  5 Oct 2018 18:29:13 +0100
Message-ID: <20181005172917.11963-15-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U3c-00068F-UU
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:32 +0000
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <ian.jackson@citrix.com>, Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjb21tYW5kIGRvZXMgdGhlIGxpbmssIHNvIGl0IG5lZWRzIExERkxBR1MuCgpTaWduZWQt
b2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KLS0tCiB0b29scy9k
ZWJ1Z2dlci9nZGJzeC9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2RlYnVnZ2VyL2dkYnN4L01h
a2VmaWxlIGIvdG9vbHMvZGVidWdnZXIvZ2Ric3gvTWFrZWZpbGUKaW5kZXggNzIzYTI3NDNjYy4u
OGQ3Y2Q5NGEzMSAxMDA2NDQKLS0tIGEvdG9vbHMvZGVidWdnZXIvZ2Ric3gvTWFrZWZpbGUKKysr
IGIvdG9vbHMvZGVidWdnZXIvZ2Ric3gvTWFrZWZpbGUKQEAgLTI2LDcgKzI2LDcgQEAgdW5pbnN0
YWxsOgogCXJtIC1mICQoREVTVERJUikkKHNiaW5kaXIpL2dkYnN4CiAKIGdkYnN4OiBneC9neF9h
bGwuYSB4Zy94Z19hbGwuYSAKLQkkKENDKSAtbyAkQCAkXgorCSQoQ0MpICQoTERGTEFHUykgLW8g
JEAgJF4KIAogeGcveGdfYWxsLmE6CiAJJChNQUtFKSAtQyB4ZwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
