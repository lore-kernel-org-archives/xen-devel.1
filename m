From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/IRQ: conditionally preserve access
 permission on map error paths
Date: Wed, 20 Dec 2017 19:26:48 +0000
Message-ID: <9515ffc0-a262-c9e0-e5e1-59fc5abaa1ff@citrix.com>
References: <5A29208B0200007800195540@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4g8x=dq=citrix.com=prvs=520a8dc14=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eRk11-0001KX-Pm
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 19:26:55 +0000
In-Reply-To: <5A29208B0200007800195540@prv-mh.provo.novell.com>
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

T24gMDcvMTIvMTcgMTA6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFBlcm1pc3Npb25zIHRoYXQg
aGFkIGJlZW4gZ3JhbnRlZCBiZWZvcmUgc2hvdWxkIG5vdCBiZSByZXZva2VkIHdoZW4KPiBoYW5k
bGluZyB1bnJlbGF0ZWQgZXJyb3JzLgo+Cj4gUmVwb3J0ZWQtYnk6IEhXNDIgPGh3NDJAaXBzdW1q
LmRlPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
