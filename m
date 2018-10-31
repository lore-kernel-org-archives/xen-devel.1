From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libvchan: create xenstore entries in one
 transaction
Date: Wed, 31 Oct 2018 09:41:35 +0000
Message-ID: <20181031094135.6z4dfdmxhmn45ccu@zion.uk.xensource.com>
References: <20181030234905.26142-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHn0p-0005NO-V9
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 09:42:07 +0000
Content-Disposition: inline
In-Reply-To: <20181030234905.26142-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTI6NDk6MDVBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFRoaXMgd2lsbCBwcmV2ZW50IHJhY2Ugd2hlbiBjbGllbnQg
d2FpdHMgZm9yIHNlcnZlciB3aXRoIHhzX3dhdGNoIC0gYWxsCj4gZW50cmllcyBzaG91bGQgYXBw
ZWFyIGF0IG9uY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKSSB3b3VsZCBwcmVmZXIgaXQg
aXMgd3JpdHRlbiBhcyBhIHdoaWxlKDEpe30gbG9vcCwgYnV0IHRoYXQncyBqdXN0IGEKbWF0dGVy
IG9mIHRhc3RlLCBzbzoKCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
