From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pmtimer: Fix hvm_acpi_sleep_button
 behavior
Date: Tue, 19 Feb 2019 19:19:50 +0000
Message-ID: <a7cceb8f-a5b2-f812-0840-7cb15da6cfc5@citrix.com>
References: <1550598025-31513-1-git-send-email-vrd@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=riu8=Q2=citrix.com=prvs=9462ceaa8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gwB7k-0006mO-G2
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 19:32:12 +0000
In-Reply-To: <1550598025-31513-1-git-send-email-vrd@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Varad Gautam <vrd@amazon.de>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <JGross@suse.com>, Amit Shah <aams@amazon.de>, Jan Beulich <jbeulich@suse.com>, David Woodhouse <dwmw@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMjAxOSAxNzo0MCwgVmFyYWQgR2F1dGFtIHdyb3RlOgo+IENvbW1pdCAxOWZiMTQ2
MjJlOTQxICJ4ODYvcG10aW1lcjogbW92ZSBBQ1BJIHJlZ2lzdGVycyBmcm9tIFBNVFN0YXRlIHRv
Cj4gaHZtX2RvbWFpbiIgbWlzY29uZmlndXJlcyBwbTFhX3N0cyBmb3IgaHZtX2FjcGlfc2xlZXBf
YnV0dG9uIHdpdGgKPiBQV1JCVE5fU1RTIGluc3RlYWQgb2YgU0xQQlROX1NUUywgd2hpY2ggbGVh
ZHMgdG8KPiBYRU5fRE9NQ1RMX1NFTkRUUklHR0VSX1NMRUVQIGNhdXNpbmcgZ3Vlc3QgcG93ZXJk
b3ducy4gRml4IHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6
b24uZGU+CgpPb3BzIHllcyAtIHRoYXQgbG9va3MgbGlrZSBhIGNvcHkvcGFzdGUgZXJyb3IuCgpS
ZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkND
J2luZyBKdWVyZ2VuIC0gdGhpcyBpcyA0LjEyIG1hdGVyaWFsLCBhbmQgbG9va3MgbGlrZSBpdCB3
YW50cyB0byBiZQpiYWNrcG9ydGVkIHRvIDQuOSBpbiBkdWUgY291cnNlLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
