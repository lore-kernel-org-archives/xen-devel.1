From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 7/8] tools/libvchan: libxenvchan_*_init: Promise
 an errno
Date: Fri, 2 Nov 2018 17:01:12 +0000
Message-ID: <20181102170113.11646-8-ian.jackson@eu.citrix.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIcpX-0004ZT-ON
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:01:55 +0000
In-Reply-To: <20181102170113.11646-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

VGhzZSBmdW5jdGlvc24gZG8gaW4gZmFjdCBsZWF2ZSBlcnJubyBzZXQuICBXZSBhcmUgZ29pbmcg
dG8gd2FudCB0bwp1c2UgdGhpcy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnZjaGFuL2xpYnhlbnZjaGFuLmggfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlidmNoYW4vbGlieGVudmNoYW4uaCBiL3Rvb2xzL2xpYnZjaGFu
L2xpYnhlbnZjaGFuLmgKaW5kZXggZDYwMTBiMTQ1ZC4uZTRjY2NhMWZmMCAxMDA2NDQKLS0tIGEv
dG9vbHMvbGlidmNoYW4vbGlieGVudmNoYW4uaAorKysgYi90b29scy9saWJ2Y2hhbi9saWJ4ZW52
Y2hhbi5oCkBAIC05NSw3ICs5NSw3IEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiB7CiAgKiBAcGFyYW0g
eHNfcGF0aCBCYXNlIHhlbnN0b3JlIHBhdGggZm9yIHN0b3JpbmcgcmluZy9ldmVudCBkYXRhCiAg
KiBAcGFyYW0gc2VuZF9taW4gVGhlIG1pbmltdW0gc2l6ZSAoaW4gYnl0ZXMpIG9mIHRoZSBzZW5k
IHJpbmcgKGxlZnQpCiAgKiBAcGFyYW0gcmVjdl9taW4gVGhlIG1pbmltdW0gc2l6ZSAoaW4gYnl0
ZXMpIG9mIHRoZSByZWNlaXZlIHJpbmcgKHJpZ2h0KQotICogQHJldHVybiBUaGUgc3RydWN0dXJl
LCBvciBOVUxMIGluIGNhc2Ugb2YgYW4gZXJyb3IKKyAqIEByZXR1cm4gVGhlIHN0cnVjdHVyZSwg
b3IgTlVMTCBpbiBjYXNlIG9mIGFuIGVycm9yIChzZXR0aW5nIGVycm5vKQogICovCiBzdHJ1Y3Qg
bGlieGVudmNoYW4gKmxpYnhlbnZjaGFuX3NlcnZlcl9pbml0KHN0cnVjdCB4ZW50b29sbG9nX2xv
Z2dlciAqbG9nZ2VyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgZG9tYWluLCBjb25zdCBjaGFyKiB4c19wYXRoLApAQCAtMTA4LDcgKzEwOCw3IEBAIHN0
cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fc2VydmVyX2luaXQoc3RydWN0IHhlbnRvb2xs
b2dfbG9nZ2VyICpsb2dnZXIsCiAgKiBAcGFyYW0gbG9nZ2VyIExvZ2dlciBmb3IgbGlieGMgZXJy
b3JzCiAgKiBAcGFyYW0gZG9tYWluIFRoZSBwZWVyIGRvbWFpbiB0byBjb25uZWN0IHRvCiAgKiBA
cGFyYW0geHNfcGF0aCBCYXNlIHhlbnN0b3JlIHBhdGggZm9yIHN0b3JpbmcgcmluZy9ldmVudCBk
YXRhCi0gKiBAcmV0dXJuIFRoZSBzdHJ1Y3R1cmUsIG9yIE5VTEwgaW4gY2FzZSBvZiBhbiBlcnJv
cgorICogQHJldHVybiBUaGUgc3RydWN0dXJlLCBvciBOVUxMIGluIGNhc2Ugb2YgYW4gZXJyb3Ig
KHNldHRpbmcgZXJybm8pCiAgKi8KIHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xp
ZW50X2luaXQoc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhz
X3BhdGgpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
