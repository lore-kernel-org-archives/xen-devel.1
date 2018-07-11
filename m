From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/8] cpumask: tidy {,z}alloc_cpumask_var()
Date: Wed, 11 Jul 2018 13:20:27 +0100
Message-ID: <76a2ee56-28ad-a7d5-649a-e5c7ce351dd6@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F41E02000078001D3174@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cheb=j3=citrix.com=prvs=72379a78f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdE6f-0007yo-UF
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 12:20:29 +0000
In-Reply-To: <5B45F41E02000078001D3174@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTM6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IERyb3AgdW5uZWNlc3Nhcnkg
Y2FzdHMgYW5kIHVzZSBib29sIGluIGZhdm9yIG9mIGJvb2xfdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
