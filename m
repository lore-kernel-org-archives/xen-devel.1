From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/6] x86: fix OLDINSTR_2()
Date: Tue, 13 Mar 2018 08:14:51 -0600
Message-ID: <5AA7EAEB02000078001B0FC8@prv-mh.provo.novell.com>
References: <5AA7E79302000078001B0FAB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evkhd-0004m4-9N
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 14:14:57 +0000
In-Reply-To: <5AA7E79302000078001B0FAB@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXRzIGFzX21heCgpIGludm9jYXRpb24gd2FzIHdyb25nbHkgcGFyZW50aGVzaXplZC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBOZXcuCgot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FsdGVybmF0aXZlLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9hbHRlcm5hdGl2ZS5oCkBAIC01NCw4ICs1NCw4IEBAIGV4dGVybiB2b2lkIGFsdGVy
bmF0aXZlX2luc3RydWN0aW9ucyh2b2kKIAogI2RlZmluZSBPTERJTlNUUl8yKG9sZGluc3RyLCBu
MSwgbjIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgT0xESU5TVFIob2xkaW5z
dHIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAg
ICAgICBhc19tYXgoKGFsdF9yZXBsX2xlbihuMSksICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAotICAgICAgICAgICAgICAgICAgICAgYWx0X3JlcGxfbGVuKG4yKSkgIi0iIGFsdF9vcmlnX2xl
bikpCisgICAgICAgICAgICAgYXNfbWF4KGFsdF9yZXBsX2xlbihuMSksICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgYWx0X3JlcGxfbGVuKG4yKSkgIi0i
IGFsdF9vcmlnX2xlbikKIAogI2RlZmluZSBBTFRJTlNUUl9FTlRSWShmZWF0dXJlLCBudW0pICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAiIC5sb25nIC5MWEVO
JT1fb3JpZ19zIC0gLlxuIiAgICAgICAgICAgICAvKiBsYWJlbCAgICAgICAgICAgKi8gXAoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
