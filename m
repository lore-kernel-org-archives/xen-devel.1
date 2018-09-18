From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 0/4] x86: improve PDX <-> PFN and alike
 translations
Date: Tue, 18 Sep 2018 06:34:32 -0600
Message-ID: <5BA0F0D802000078001E96D4@prv1-mh.provo.novell.com>
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
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2FDA-0004a7-7o
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 12:34:36 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogdXNlIFBERVAvUEVYVCBmb3IgbWFkZHIvZGlyZWN0LW1hcC1vZmZzZXQgY29udmVyc2lvbiB3
aGVuIGF2YWlsYWJsZQoyOiB1c2UgUERFUC9QRVhUIGZvciBQRk4vUERYIGNvbnZlcnNpb24gd2hl
biBhdmFpbGFibGUKMzogdXNlIE1PViBmb3IgUEZOL1BEWCBjb252ZXJzaW9uIHdoZW4gcG9zc2li
bGUKNDogdXNlIFBERVAgZm9yIFBURSBmbGFncyBpbnNlcnRpb24gd2hlbiBhdmFpbGFibGUKClNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY0OiBJbmRl
bnRhdGlvbiBhZGp1c3RtZW50cy4gQ29tbWVudHMuCnYzOiBSZS1vcmRlciBzZXJpZXMuIFJlLWJh
c2UuCnYyOiBFeHRlbnNpdmUgcmUtYmFzZS4KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
