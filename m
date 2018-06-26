From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH for-4.11 v2 2/3] x86: guard against #NM
Date: Tue, 26 Jun 2018 00:36:53 -0600
Message-ID: <5B31DF0502000078001CDC14@prv1-mh.provo.novell.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXhay-0007vO-Dj
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 06:36:56 +0000
In-Reply-To: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVzdCBpbiBjYXNlIHdlIHN0aWxsIGRvbid0IGdldCBDUjAuVFMgaGFuZGxpbmcgcmlnaHQsIHBy
ZXZlbnQgYSBob3N0CmNyYXNoIGJ5IGhvbm9yaW5nIGV4Y2VwdGlvbiBmaXh1cHMgaW4gZG9fZGV2
aWNlX25vdF9hdmFpbGFibGUoKS4gVGhpcwp3b3VsZCBpbiBwYXJ0aWN1bGFyIGNvdmVyIGVtdWxh
dG9yIHN0dWJzIHJhaXNpbmcgI05NLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgotLS0KdjI6IEFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKS4KCi0tLSBhL3hl
bi9hcmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xNzQ5LDcg
KzE3NDksMjEgQEAgdm9pZCBkb19kZXZpY2Vfbm90X2F2YWlsYWJsZShzdHJ1Y3QgY3B1Xwogewog
ICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsKIAotICAgIEJVR19PTighZ3Vlc3RfbW9k
ZShyZWdzKSk7CisgICAgaWYgKCAhZ3Vlc3RfbW9kZShyZWdzKSApCisgICAgeworICAgICAgICB1
bnNpZ25lZCBsb25nIGZpeHVwID0gc2VhcmNoX2V4Y2VwdGlvbl90YWJsZShyZWdzKTsKKworICAg
ICAgICBkcHJpbnRrKFhFTkxPR19FUlIsICIjTk06ICVwIFslcHNdIC0+ICVwXG4iLAorICAgICAg
ICAgICAgICAgIF9wKHJlZ3MtPnJpcCksIF9wKHJlZ3MtPnJpcCksIF9wKGZpeHVwKSk7CisgICAg
ICAgIC8qCisgICAgICAgICAqIFdlIG11c3RuJ3QgY29tZSBoZXJlLCBidXQgZm9yIHJlbGVhc2Ug
YnVpbGRzIGhhdmUgdGhlIHJlY292ZXJ5CisgICAgICAgICAqIGxvZ2ljIGluIHBsYWNlIG5ldmVy
dGhlbGVzcy4KKyAgICAgICAgICovCisgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAg
ICAgICBCVUdfT04oIWZpeHVwKTsKKyAgICAgICAgcmVncy0+cmlwID0gZml4dXA7CisgICAgICAg
IHJldHVybjsKKyAgICB9CiAKICAgICB2Y3B1X3Jlc3RvcmVfZnB1X2xhenkoY3Vycik7CiAKCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
