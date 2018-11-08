From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 05/11] tools/xenstore: Document that
 xs_close(0) is OK.
Date: Thu, 8 Nov 2018 17:07:59 +0000
Message-ID: <20181108170805.12774-6-ian.jackson@eu.citrix.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t5pf=nt=citrix.com=prvs=843e771e9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gKnnB-0000dn-5r
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:08:29 +0000
In-Reply-To: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFj
a2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHRvb2xzL3hlbnN0b3Jl
L2luY2x1ZGUveGVuc3RvcmUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL2luY2x1ZGUveGVu
c3RvcmUuaCBiL3Rvb2xzL3hlbnN0b3JlL2luY2x1ZGUveGVuc3RvcmUuaAppbmRleCAwNjRiNjJj
NDU1Li44ODlkYzIzODYzIDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS9pbmNsdWRlL3hlbnN0
b3JlLmgKKysrIGIvdG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5oCkBAIC03Nyw3ICs3
Nyw3IEBAIHR5cGVkZWYgdWludDMyX3QgeHNfdHJhbnNhY3Rpb25fdDsKIHN0cnVjdCB4c19oYW5k
bGUgKnhzX29wZW4odW5zaWduZWQgbG9uZyBmbGFncyk7CiAKIC8qIENsb3NlIHRoZSBjb25uZWN0
aW9uIHRvIHRoZSB4cyBkYWVtb24uICovCi12b2lkIHhzX2Nsb3NlKHN0cnVjdCB4c19oYW5kbGUg
KnhzaCk7Cit2b2lkIHhzX2Nsb3NlKHN0cnVjdCB4c19oYW5kbGUgKnhzaCAvKiBOVUxMIG9rICov
KTsKIAogLyogQ29ubmVjdCB0byB0aGUgeHMgZGFlbW9uLgogICogUmV0dXJucyBhIGhhbmRsZSBv
ciBOVUxMLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
