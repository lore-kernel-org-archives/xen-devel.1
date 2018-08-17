From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/5] x86: improve PDX <-> PFN and alike
 translations
Date: Fri, 17 Aug 2018 01:06:48 -0600
Message-ID: <5B76740802000078001DF345@prv1-mh.provo.novell.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqYqP-0000Cs-Uk
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 07:06:49 +0000
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

MTogcmVtb3ZlIHBhZ2UuaCBhbmQgcHJvY2Vzc29yLmggaW5jbHVzaW9uIGZyb20gYXNtX2RlZm5z
LmgKMjogdXNlIFBERVAvUEVYVCBmb3IgbWFkZHIvZGlyZWN0LW1hcC1vZmZzZXQgY29udmVyc2lv
biB3aGVuIGF2YWlsYWJsZQozOiB1c2UgUERFUC9QRVhUIGZvciBQRk4vUERYIGNvbnZlcnNpb24g
d2hlbiBhdmFpbGFibGUKNDogdXNlIE1PViBmb3IgUEZOL1BEWCBjb252ZXJzaW9uIHdoZW4gcG9z
c2libGUKNTogdXNlIFBERVAgZm9yIFBURSBmbGFncyBpbnNlcnRpb24gd2hlbiBhdmFpbGFibGUK
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBS
ZS1vcmRlciBzZXJpZXMuIFJlLWJhc2UuCnYyOiBFeHRlbnNpdmUgcmUtYmFzZS4KCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
