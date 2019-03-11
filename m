From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/7] Arm/atomic: correct asm() constraints in
 build_add_sized()
Date: Mon, 11 Mar 2019 10:49:36 -0600
Message-ID: <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3O7X-0001G4-9V
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:49:47 +0000
In-Reply-To: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1lbW9yeSBvcGVyYW5kIGlzIGFuIGluL291dCBvbmUsIGFuZCB0aGUgYXV4aWxpYXJ5IHJl
Z2lzdGVyIGdldHMKd3JpdHRlbiB0byBlYXJseS4KClRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBh
bHNvIGRyb3AgdGhlIHJlZHVuZGFudCBjYXN0ICh0aGUgaW5saW5lCmZ1bmN0aW9ucycgcGFyYW1l
dGVycyBhcmUgYWxyZWFkeSBvZiB0aGUgY2FzdGVkLXRvIHR5cGUpLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9hdG9taWMuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2F0b21pYy5oCkBAIC0zMCw3ICsz
MCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBuYW1lKHZvbGF0aWxlIHR5cGUgKmEKICAgICBhc20g
dm9sYXRpbGUoImxkciIgc2l6ZSAiICUid2lkdGgiMSwlMFxuIiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAgICAgICAgICAgICAgICAgImFkZCAlIndpZHRoIjEsJSJ3aWR0aCIxLCUid2lk
dGgiMlxuIiAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgInN0ciIgc2l6ZSAi
ICUid2lkdGgiMSwlMCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgICAg
ICAgICAgOiAiPW0iICgqKHZvbGF0aWxlIHR5cGUgKilhZGRyKSwgIj1yIiAodCkgICAgICAgICAg
ICAgIFwKKyAgICAgICAgICAgICAgICAgOiAiK20iICgqYWRkciksICI9JnIiICh0KSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgOiByZWcgKHZhbCkpOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIH0KIAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
