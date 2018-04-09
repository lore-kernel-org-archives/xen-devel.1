From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] x86/HVM: I/O completion adjustments
Date: Mon, 09 Apr 2018 07:19:55 -0600
Message-ID: <5ACB849B02000078001B9934@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=shlr=g6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5WiI-0007iW-1D
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 13:20:02 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogc3VwcHJlc3MgSS9PIGNvbXBsZXRpb24gZm9yIHBvcnQgb3V0cHV0CjI6IGFsdGVyIGNvbXBs
ZXRpb24tbmVlZGVkIGNoZWNraW5nCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpQYXRjaCAxLCB3aGlsZSBub3QgYWRkcmVzc2luZyB0aGUgZnVuZGFtZW50
YWwgdW5kZXJseWluZyBwcm9ibGVtLAppcyBzdHJpY3RseSBhIGZpeCBmb3IgYW4gb2JzZXJ2ZWQg
YnVnICh3aXRoIFdpbmRvd3MgU2VydmVyIDIwMTYpCihiZXNpZGVzIGFsc28gYmVpbmcgYW4gb3B0
aW1pemF0aW9uKSwgc28gc2hvdWxkIGJlIGNvbnNpZGVyZWQgZm9yCjQuMTEuIFBhdGNoIDIsIG90
b2gsIGlzIG5vdCBldmVuIGNsZWFyIHdoZXRoZXIgd2Ugd2FudCBpdCBhdCBhbGwgKHNlZQp0aGVy
ZSkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
