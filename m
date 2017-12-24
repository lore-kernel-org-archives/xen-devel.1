From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: [PATCH] x86/xen/time: fix section mismatch for
	xen_init_time_ops()
Date: Sat, 23 Dec 2017 21:50:13 -0500
Message-ID: <1514083813-27047-1-git-send-email-nick.desaulniers__40522.9373639033$1514096428$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=y6va=du=gmail.com=nick.desaulniers@srs-us1.protection.inumbo.net>)
 id 1eSwMu-0004G5-So
 for xen-devel@lists.xenproject.org; Sun, 24 Dec 2017 02:50:28 +0000
Received: by mail-ua0-x243.google.com with SMTP id 34so3041446uav.5
 for <xen-devel@lists.xenproject.org>; Sat, 23 Dec 2017 18:50:25 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, Nick Desaulniers <nick.desaulniers@gmail.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

VGhlIGhlYWRlciBkZWNsYXJlcyB0aGlzIGZ1bmN0aW9uIGFzIF9faW5pdCBidXQgaXMgZGVmaW5l
ZCBpbiBfX3JlZgpzZWN0aW9uLgoKU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmlj
ay5kZXNhdWxuaWVyc0BnbWFpbC5jb20+Ci0tLQogYXJjaC94ODYveGVuL3hlbi1vcHMuaCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4Ni94ZW4veGVuLW9wcy5oCmlu
ZGV4IDc1MDExYjguLjNiMzQ3NDUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmgK
KysrIGIvYXJjaC94ODYveGVuL3hlbi1vcHMuaApAQCAtNzIsNyArNzIsNyBAQCB1NjQgeGVuX2Ns
b2Nrc291cmNlX3JlYWQodm9pZCk7CiB2b2lkIHhlbl9zZXR1cF9jcHVfY2xvY2tldmVudHModm9p
ZCk7CiB2b2lkIHhlbl9zYXZlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCk7CiB2b2lkIHhlbl9yZXN0
b3JlX3RpbWVfbWVtb3J5X2FyZWEodm9pZCk7Ci12b2lkIF9faW5pdCB4ZW5faW5pdF90aW1lX29w
cyh2b2lkKTsKK3ZvaWQgX19yZWYgeGVuX2luaXRfdGltZV9vcHModm9pZCk7CiB2b2lkIF9faW5p
dCB4ZW5faHZtX2luaXRfdGltZV9vcHModm9pZCk7CiAKIGlycXJldHVybl90IHhlbl9kZWJ1Z19p
bnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKTsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
