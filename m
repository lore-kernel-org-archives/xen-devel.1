From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Thu, 13 Sep 2018 07:56:42 -0600
Message-ID: <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-9-paul.durrant@citrix.com>
 <5B9A662D02000078001E83F4@prv1-mh.provo.novell.com>
 <f69c1a46c5764297b7dfdb8f55e7b1f8@AMSPEX02CL03.citrite.net>
 <5B9A69CF02000078001E8448@prv1-mh.provo.novell.com>
 <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0S6w-0000TM-8i
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 13:56:46 +0000
In-Reply-To: <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE1OjUwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE9rLiBJJ2xsIHNwZWxsIGl0IG91dCBpbiB0aGUgaGVhZGVyIGlmIHlvdSB0aGluayBpdCBp
cyBub24tb2J2aW91cy4KCk9idmlvdXMgb3Igbm90IC0gZG8gd2UgX2hhdmVfIGFueSBzdWNoIG91
dGVyIGxvY2tpbmcgaW4gcGxhY2UgcmlnaHQgbm93PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
