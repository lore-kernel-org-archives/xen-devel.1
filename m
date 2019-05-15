From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
Date: Wed, 15 May 2019 07:53:42 +0100
Message-ID: <20190515065342.GJ2798@zion.uk.xensource.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQnnj-0003fw-6Q
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 06:54:07 +0000
Content-Disposition: inline
In-Reply-To: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: wei.liu2@citrix.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDc6MTM6NTdQTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IEFsbCBpdHMgY2FsbGVycyBsaXZlIGluc2lkZSAjaWZkZWYgQ09ORklHX0hWTSBz
ZWN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
