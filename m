From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/5] x86: improve PDX <-> PFN and alike
	translations
Date: Wed, 28 Feb 2018 06:51:02 -0700
Message-ID: <5A96C1D602000078001ACCEC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er28V-00081e-4y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 13:51:11 +0000
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
LmgKMjogdXNlIFBERVAgZm9yIFBURSBmbGFncyBpbnNlcnRpb24gd2hlbiBhdmFpbGFibGUKMzog
dXNlIFBERVAvUEVYVCBmb3IgbWFkZHIvZGlyZWN0LW1hcC1vZmZzZXQgY29udmVyc2lvbiB3aGVu
IGF2YWlsYWJsZQo0OiB1c2UgUERFUC9QRVhUIGZvciBQRk4vUERYIGNvbnZlcnNpb24gd2hlbiBh
dmFpbGFibGUKNTogdXNlIE1PViBmb3IgUEZOL1BEWCBjb252ZXJzaW9uIHdoZW4gcG9zc2libGUK
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
