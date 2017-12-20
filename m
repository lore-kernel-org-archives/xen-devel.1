From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] simplify xenmem_add_to_physmap_batch()
Date: Wed, 20 Dec 2017 11:36:44 +0000
Message-ID: <03606f37-8589-0116-6bde-b5325867ce79@citrix.com>
References: <5A3A39070200007800198C70@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4g8x=dq=citrix.com=prvs=520a8dc14=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eRcg9-0003c8-Bd
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 11:36:53 +0000
In-Reply-To: <5A3A39070200007800198C70@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTIvMTcgMDk6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXJlJ3Mgbm8gbmVlZCBm
b3IKPiAtIGFkdmFuY2luZyB0aGUgaGFuZGxlcyBhbmQgYXQgdGhlIHNhbWUgdGltZSB1c2luZwo+
ICAgX19jb3B5X3tmcm9tLHRvfV9ndWVzdF9vZmZzZXQoKSwKPiAtIGFuICJvdXQiIGxhYmVsLAo+
IC0gbG9jYWwgdmFyaWFibGVzICJkb25lIiBhbmQgKGZ1bmN0aW9uIHNjb3BlKSAicmMiLgo+Cj4g
VG8gYmV0dGVyIHJlZmxlY3QgaXRzIHJlc3VsdGluZyB1c2UgYWxzbyByZW5hbWUgdGhlIGZ1bmN0
aW9uJ3MgInN0YXJ0Igo+IHBhcmFtZXRlciB0byAiZXh0ZW50Ii4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
