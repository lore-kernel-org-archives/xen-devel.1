From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
Date: Wed, 15 May 2019 09:55:30 +0100
Message-ID: <7fcc90c5-35c4-5ce4-e6c0-8e2276fedcd7@citrix.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
 <20190515065342.GJ2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TDX9=TP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQphH-0005pZ-Nw
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:55:35 +0000
In-Reply-To: <20190515065342.GJ2798@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: george.dunlap@eu.citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gNS8xNS8xOSA3OjUzIEFNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5
IGF0IDA3OjEzOjU3UE0gKzAzMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gQWxsIGl0cyBj
YWxsZXJzIGxpdmUgaW5zaWRlICNpZmRlZiBDT05GSUdfSFZNIHNlY3Rpb25zLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
