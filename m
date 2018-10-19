From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Fri, 19 Oct 2018 16:18:21 +0100
Message-ID: <8e67b15e-24df-bfb7-aae8-4d14b714ae75@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDWYM-0000hI-5i
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:19:06 +0000
In-Reply-To: <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gVGhleSBhcmUgdXNlZnVsIHRvIFBW
IG9ubHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoK
SG93IGVhc3kgaXMgdGhpcyB0byB0dXJuIGludG8gYSBkb21haW5jcmVhdGUgZmxhZz/CoCBJdCBp
cyB5ZXQgYW5vdGhlcgpzaW5nbGV0b24gb3BlcmF0aW9uIHdoaWNoIGNvbXBsaWNhdGVkIFhlbidz
IGluaXQvY2xlYW51cCBwYXRoIGhhdmluZyB0bwpjb3BlIHdpdGggaXQgYmVpbmcgZW5hYmxlZCBh
ZnRlciB0aGUgZmFjdC4KCihUaGlzIGlzIGEgc2xpZ2h0bHkgbG9hZGVkIHF1ZXN0aW9uLsKgIEkg
aGF2ZSBhIHN1c3BpY2lvbiB0aGF0IHRoZSBhbnN3ZXIKaXMgInJhdGhlciBjb21wbGljYXRlZCB0
byBtYWtlIHRoZSBhc3NvY2lhdGVkIGxpYnhsIGNoYW5nZXMiLCBhcyB5b3UKbmVlZCB0byBrbm93
IHRoZSBiaXRuZXNzIG9mIHRoZSBQViBrZXJuZWwgYmVmb3JlIGNhbGxpbmcgZG9tYWluY3JlYXRl
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
