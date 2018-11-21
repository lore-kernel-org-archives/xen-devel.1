From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Wed, 21 Nov 2018 11:03:31 +0000
Message-ID: <f2283654-f99e-6ed0-22f8-8cad9d2041f8@citrix.com>
References: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=azpx=oa=citrix.com=prvs=856900a8f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gPQIE-0006eI-D0
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:03:38 +0000
In-Reply-To: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTE6MDEgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgpXaHk/Cgog
LUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
