From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/shadow: don't pass wrong L4 MFN to
 guest_walk_tables()
Date: Tue, 19 Feb 2019 05:01:47 -0700
Message-ID: <5C6BF02B0200007800217F32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gw45w-0001z8-Vz
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 12:01:53 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

NjQtYml0IFBWIGd1ZXN0IHVzZXIgbW9kZSBydW5zIG9uIGEgZGlmZmVyZW50IEw0IHRhYmxlLiBN
YWtlIHN1cmUKLSB0aGUgYWNjZXNzZWQgYml0IGdldHMgc2V0IGluIHRoZSBjb3JyZWN0IHRhYmxl
IChhbmQgaW4gbG9nLWRpcnR5CiAgbW9kZSB0aGUgY29ycmVjdCBwYWdlIGdldHMgbWFya2VkIGRp
cnR5KSBkdXJpbmcgZ3Vlc3Qgd2Fsa3MsCi0gdGhlIGNvcnJlY3QgdGFibGUgZ2V0cyBhdWRpdGVk
IGJ5IHNoX2F1ZGl0X2d3KCksCi0gY29ycmVjdCBpbmZvIGdldHMgbG9nZ2VkIGJ5IHByaW50X2d3
KCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0g
YS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3No
YWRvdy9tdWx0aS5jCkBAIC0xODAsNyArMTgwLDEwIEBAIHNoX3dhbGtfZ3Vlc3RfdGFibGVzKHN0
cnVjdCB2Y3B1ICp2LCB1bnMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU5WQUxJRF9N
Rk4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYtPmFyY2gucGFnaW5nLnNoYWRvdy5n
bDNlCiAjZWxzZSAvKiAzMiBvciA2NCAqLwotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YWdldGFibGVfZ2V0X21mbih2LT5hcmNoLmd1ZXN0X3RhYmxlKSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKCgodi0+YXJjaC5mbGFncyAmIFRGX2tlcm5lbF9tb2RlKSB8fAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlzX3B2XzMyYml0X3ZjcHUodikpCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA/IHBhZ2V0YWJsZV9nZXRfbWZuKHYtPmFyY2guZ3Vlc3RfdGFi
bGUpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IHBhZ2V0YWJsZV9nZXRfbWZuKHYt
PmFyY2guZ3Vlc3RfdGFibGVfdXNlcikpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
LT5hcmNoLnBhZ2luZy5zaGFkb3cuZ3Vlc3RfdnRhYmxlCiAjZW5kaWYKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
