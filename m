From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] xen-netfront: fix xennet_start_xmit()'s return
 type
Date: Tue, 24 Apr 2018 15:18:14 +0200
Message-ID: <20180424131815.5064-1-luc.vanoostenryck@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+4n8=hn=gmail.com=luc.vanoostenryck@srs-us1.protection.inumbo.net>)
 id 1fAxpq-00064B-6u
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 13:18:18 +0000
Received: by mail-wm0-x242.google.com with SMTP id o78so809985wmg.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 06:18:17 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBidXQgdGhl
IGltcGxlbWVudGF0aW9uIGluIHRoaXMKZHJpdmVyIHJldHVybnMgYW4gJ2ludCcuCgpGaXggdGhp
cyBieSByZXR1cm5pbmcgJ25ldGRldl90eF90JyBpbiB0aGlzIGRyaXZlciB0b28uCgpTaWduZWQt
b2ZmLWJ5OiBMdWMgVmFuIE9vc3RlbnJ5Y2sgPGx1Yy52YW5vb3N0ZW5yeWNrQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKaW5kZXggNGRkMDY2ODAw
Li42NzlkYTFhYmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBi
L2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCkBAIC01NjQsNyArNTY0LDcgQEAgc3RhdGljIHUx
NiB4ZW5uZXRfc2VsZWN0X3F1ZXVlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBza19i
dWZmICpza2IsCiAKICNkZWZpbmUgTUFYX1hFTl9TS0JfRlJBR1MgKDY1NTM2IC8gWEVOX1BBR0Vf
U0laRSArIDEpCiAKLXN0YXRpYyBpbnQgeGVubmV0X3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKK3N0YXRpYyBuZXRkZXZfdHhfdCB4ZW5uZXRf
c3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQog
ewogCXN0cnVjdCBuZXRmcm9udF9pbmZvICpucCA9IG5ldGRldl9wcml2KGRldik7CiAJc3RydWN0
IG5ldGZyb250X3N0YXRzICp0eF9zdGF0cyA9IHRoaXNfY3B1X3B0cihucC0+dHhfc3RhdHMpOwot
LSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
