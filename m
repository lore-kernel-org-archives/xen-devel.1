From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] x86/xen: init %gs very early to avoid
 page faults with stack protector
Date: Thu, 1 Feb 2018 15:17:38 -0500
Message-ID: <b8f04374-97f1-76d5-81b5-3583441833f4__26841.1540812396$1517516202$gmane$org@oracle.com>
References: <20180201124019.11693-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h7in=e3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ehLI3-0006dE-If
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 20:16:59 +0000
In-Reply-To: <20180201124019.11693-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDEvMjAxOCAwNzo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIHJ1bm5p
bmcgYXMgWGVuIHB2IGd1ZXN0ICVncyBpcyBpbml0aWFsaXplZCBzb21lIHRpbWUgYWZ0ZXIKPiBD
IGNvZGUgaXMgc3RhcnRlZC4gRGVwZW5kaW5nIG9uIHN0YWNrIHByb3RlY3RvciB1c2FnZSB0aGlz
IG1pZ2h0IGJlCj4gdG9vIGxhdGUsIHJlc3VsdGluZyBpbiBwYWdlIGZhdWx0cy4KPgo+IFNvIHNl
dHVwICVncyBhbmQgTVNSX0dTX0JBU0UgaW4gYXNzZW1ibHkgY29kZSBhbHJlYWR5Lgo+Cj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
