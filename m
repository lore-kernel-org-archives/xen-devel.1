From: "Jan Beulich" <JBeulich@suse.com>
Subject: x86's stac()/clac() use in privcmd_call()
Date: Wed, 13 Jun 2018 01:36:36 -0600
Message-ID: <5B20C98402000078001CABA0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bhoq=i7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fT0Ke-0007gt-UW
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 07:36:40 +0000
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

SsO8cmdlbiwgQm9yaXMsCgpoYXZpbmcgbG9va2VkIGF0IHRoYXQgaW4gdGhlIG90aGVyIGNvbnRl
eHQsIEkndmUgY29tZSBhY3Jvc3MgdGhlIG90aGVyCmludm9jYXRpb24gb2YgdGhlIGZ1bmN0aW9u
IGZyb20geGVuX21jX2ZsdXNoKCkuIEknbSBwcmV0dHkgc3VyZSB0aGUKc3RhYygpL2NsYWMoKSB1
c2UgaXMgbm90IGludGVuZGVkIGluIHRoaXMgY29udGV4dCwgYW5kIEkgZG9uJ3QgdGhpbmsKTWFy
ZWsgaGFkIGludGVuZGVkIHRoaXMgc2lkZSBlZmZlY3QgaW4gYzU0NTkwY2FjNSAtIGFmdGVyIGFs
bCB0aGUgdXNlCm9mIHByaXZjbWRfY2FsbCgpIGhlcmUgbG9va3MgbW9yZSBsaWtlIGFuIGFidXNl
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
