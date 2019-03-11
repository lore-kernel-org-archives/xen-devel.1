From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/HVM: don't crash guest in
 hvmemul_find_mmio_cache()
Date: Mon, 11 Mar 2019 03:55:35 -0600
Message-ID: <5C863097020000780021D1CD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3Heo-0004TN-9t
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 09:55:42 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDM1YTYxYzA1ZWEgKCJ4ODZlbXVsOiBhZGp1c3QgaGFuZGxpbmcgb2YgQVZYMiBnYXRo
ZXJzIikgYnVpbGRzCnVwb24gdGhlIGZhY3QgdGhhdCB0aGUgZG9tYWluIHdpbGwgYWN0dWFsbHkg
c3Vydml2ZSBydW5uaW5nIG91dCBvZiBNTUlPCnJlc3VsdCBidWZmZXIgc3BhY2UuIERyb3AgdGhl
IGRvbWFpbl9jcmFzaCgpIGludm9jYXRpb24uIEFsc28gZGVsYXkKaW5jcmVtZW50aW5nIG9mIHRo
ZSB1c2FnZSBjb3VudGVyLCBzdWNoIHRoYXQgdGhlIGZ1bmN0aW9uIGNhbid0IHBvc3NpYmx5CnVz
ZS9yZXR1cm4gYW4gb3V0LW9mLWJvdW5kcyBzbG90L3BvaW50ZXIgaW4gY2FzZSBleGVjdXRpb24g
c3Vic2VxdWVudGx5Cm1ha2VzIGl0IGludG8gdGhlIGZ1bmN0aW9uIGFnYWluIHdpdGhvdXQgYSBw
cmlvciByZXNldCBvZiBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC05NjYsMTIgKzk2NiwxMSBAQCBzdGF0aWMgc3RydWN0
IGh2bV9tbWlvX2NhY2hlICpodm1lbXVsX2ZpCiAgICAgICAgICAgICByZXR1cm4gY2FjaGU7CiAg
ICAgfQogCi0gICAgaSA9IHZpby0+bW1pb19jYWNoZV9jb3VudCsrOworICAgIGkgPSB2aW8tPm1t
aW9fY2FjaGVfY291bnQ7CiAgICAgaWYoIGkgPT0gQVJSQVlfU0laRSh2aW8tPm1taW9fY2FjaGUp
ICkKLSAgICB7Ci0gICAgICAgIGRvbWFpbl9jcmFzaChjdXJyZW50LT5kb21haW4pOwogICAgICAg
ICByZXR1cm4gTlVMTDsKLSAgICB9CisKKyAgICArK3Zpby0+bW1pb19jYWNoZV9jb3VudDsKIAog
ICAgIGNhY2hlID0gJnZpby0+bW1pb19jYWNoZVtpXTsKICAgICBtZW1zZXQoY2FjaGUsIDAsIHNp
emVvZiAoKmNhY2hlKSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
