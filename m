From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/2] x86: initial simplistic Meltdown
	mitigation
Date: Tue, 16 Jan 2018 08:16:52 -0700
Message-ID: <5A5E2574020000780019F27A@prv-mh.provo.novell.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n0uv=el=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebSyw-0006qB-Lc
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 15:16:58 +0000
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

MTogeDg2OiBNZWx0ZG93biBiYW5kLWFpZCBhZ2FpbnN0IG1hbGljaW91cyA2NC1iaXQgUFYgZ3Vl
c3RzCjI6IHg4NjogYWxsb3cgTWVsdGRvd24gYmFuZC1haWQgdG8gYmUgZGlzYWJsZWQKClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBBZGRyZXNz
aW5nIHJldmlldyBjb21tZW50cyAoc2VlIGluZGl2aWR1YWwgcGF0Y2hlcykuCnYyOiBBZGRyZXNz
aW5nIHJldmlldyBjb21tZW50cyBmb3IgcGF0Y2ggMSAoc2VlIHRoZXJlKSBhbmQgbmV3CiAgICBw
YXRjaCAyLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
