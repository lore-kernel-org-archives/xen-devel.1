From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Wed, 21 Nov 2018 04:41:35 -0700
Message-ID: <5BF5446F02000078001FE6EA@prv1-mh.provo.novell.com>
References: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
 <f2283654-f99e-6ed0-22f8-8cad9d2041f8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffyj=oa=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPQt2-0001QE-Cc
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:41:40 +0000
In-Reply-To: <f2283654-f99e-6ed0-22f8-8cad9d2041f8@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDEyOjAzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAxMS8yMS8xOCAxMTowMSBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4g
Cj4gV2h5PwoKQXJlIHlvdSBhc2tpbmcgaW4gZ2VuZXJhbCAoSSB0aGluayBpdCdzIG9idmlvdXMp
LCBvciBtZXJlbHkgYmVjYXVzZQp0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGlzIGVtcHR5PwoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
