From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: re-indent after "re-arrange
 get_page_from_l<N>e() vs pv_l1tf_check_l<N>e()"
Date: Thu, 20 Sep 2018 14:38:46 +0100
Message-ID: <3b1730df-3b62-4c58-8ca5-54cc91f20768@citrix.com>
References: <5B96794302000078001E6CF1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y5lu=mc=citrix.com=prvs=794f34a96=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g2zAQ-0007Pl-Qq
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 13:38:50 +0000
In-Reply-To: <5B96794302000078001E6CF1@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDkvMTggMTU6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoYXQgZWFybGllciBjaGFu
Z2UgaW50cm9kdWNlZCB0d28gImVsc2Ugc3dpdGNoICgpIiBjb25zdHJ1Y3RzIHdoaWNoIG5vdwo+
IGdldCBjb252ZXJ0ZWQgYmFjayB0byAibm9ybWFsIiBzdHlsZSAoaW5kZW50YXRpb24pLiBUbyBs
aW1pdCBpbmRlbnRhdGlvbgo+IGRlcHRoLCBhIGNvbmRpdGlvbmFsIGdldHMgaW52ZXJ0ZWQgaW4g
cHR3cl9lbXVsYXRlZF91cGRhdGUoKS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lgo+Cj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
