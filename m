From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V8 2/7] x86/p2m: switch global_logdirty from
 bool_t to bool
Date: Wed, 21 Nov 2018 12:19:49 +0200
Message-ID: <1542795594-4252-3-git-send-email-rcojocaru@bitdefender.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RqMg=OA=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPPg5-0002lf-M8
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:24:13 +0000
In-Reply-To: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgoKLS0tCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ0M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvcDJtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCmluZGV4IDZkODQ5YTUuLmI1MmZl
ZmQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wMm0uaApAQCAtMjIyLDcgKzIyMiw3IEBAIHN0cnVjdCBwMm1fZG9tYWluIHsK
ICAgICBzdHJ1Y3QgcmFuZ2VzZXQgICAqbG9nZGlydHlfcmFuZ2VzOwogCiAgICAgLyogSG9zdCBw
Mm06IEdsb2JhbCBsb2ctZGlydHkgbW9kZSBlbmFibGVkIGZvciB0aGUgZG9tYWluLiAqLwotICAg
IGJvb2xfdCAgICAgICAgICAgICBnbG9iYWxfbG9nZGlydHk7CisgICAgYm9vbCAgICAgICAgICAg
ICAgIGdsb2JhbF9sb2dkaXJ0eTsKIAogICAgIC8qIEhvc3QgcDJtOiB3aGVuIHRoaXMgZmxhZyBp
cyBzZXQsIGRvbid0IGZsdXNoIGFsbCB0aGUgbmVzdGVkLXAybSAKICAgICAgKiB0YWJsZXMgb24g
ZXZlcnkgaG9zdC1wMm0gY2hhbmdlLiAgVGhlIHNldHRlciBvZiB0aGlzIGZsYWcgCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
