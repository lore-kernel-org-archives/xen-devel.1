From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/Xen: mark xen_setup_gdt() __init
Date: Mon, 25 Jun 2018 04:34:01 -0600
Message-ID: <5B30C51902000078001CD6F5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXOoy-0002CV-Vz
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 10:34:09 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SXRzIG9ubHkgY2FsbGVyIGlzIF9faW5pdCwgc28gdG8gYXZvaWQgc2VjdGlvbiBtaXNtYXRjaCB3
YXJuaW5ncyB3aGVuIGEKY29tcGlsZXIgZGVjaWRlcyB0byBub3QgaW5saW5lIHRoZSBmdW5jdGlv
biBtYXJrZSB0aGlzIGZ1bmN0aW9uIHNvIGFzCndlbGwuIFRha2UgdGhlIG9wcG9ydHVuaXR5IGFu
ZCBhbHNvIG1ha2UgdGhlIGZ1bmN0aW9uIGFjdHVhbGx5IHVzZSBpdHMKYXJndW1lbnQ6IFRoZSBz
b2xlIGNhbGxlciBwYXNzZXMgaW4gemVybyBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5j
IHwgICAgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgotLS0gNC4xOC1yYzIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCisrKyA0LjE4
LXJjMi14ZW4tc2V0dXAtR0RULWluaXQvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBAIC0x
MTc1LDEzICsxMTc1LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5fYm9vdF9wYXJhbXNfaW5p
dF8KICAqIHdlIGRvIHRoaXMsIHdlIGhhdmUgdG8gYmUgY2FyZWZ1bCBub3QgdG8gY2FsbCBhbnkg
c3RhY2stcHJvdGVjdGVkCiAgKiBmdW5jdGlvbiwgd2hpY2ggaXMgbW9zdCBvZiB0aGUga2VybmVs
LgogICovCi1zdGF0aWMgdm9pZCB4ZW5fc2V0dXBfZ2R0KGludCBjcHUpCitzdGF0aWMgdm9pZCBf
X2luaXQgeGVuX3NldHVwX2dkdChpbnQgY3B1KQogewogCXB2X2NwdV9vcHMud3JpdGVfZ2R0X2Vu
dHJ5ID0geGVuX3dyaXRlX2dkdF9lbnRyeV9ib290OwogCXB2X2NwdV9vcHMubG9hZF9nZHQgPSB4
ZW5fbG9hZF9nZHRfYm9vdDsKIAotCXNldHVwX3N0YWNrX2NhbmFyeV9zZWdtZW50KDApOwotCXN3
aXRjaF90b19uZXdfZ2R0KDApOworCXNldHVwX3N0YWNrX2NhbmFyeV9zZWdtZW50KGNwdSk7CisJ
c3dpdGNoX3RvX25ld19nZHQoY3B1KTsKIAogCXB2X2NwdV9vcHMud3JpdGVfZ2R0X2VudHJ5ID0g
eGVuX3dyaXRlX2dkdF9lbnRyeTsKIAlwdl9jcHVfb3BzLmxvYWRfZ2R0ID0geGVuX2xvYWRfZ2R0
OwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
