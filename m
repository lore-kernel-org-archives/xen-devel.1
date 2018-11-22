From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Thu, 22 Nov 2018 14:14:58 +0200
Message-ID: <1b5f1036-378a-e69d-781d-38b2b4e98415@bitdefender.com>
References: <1542802175-3955-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QveS=OB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPnsx-0000Rv-4D
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:15:07 +0000
In-Reply-To: <1542802175-3955-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, tamas@tklengyel.com
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMjowOSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE1pbm9yIGltcHJv
dmVtZW50OyBzaW1wbHkgaW1wcm92aW5nIGNvZGUgcXVhbGl0eSBieSB1c2luZyBjb25zdHMKPiB3
aGVyZXZlciByZWFzb25hYmxlLgo+IAo+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4KClRhbWFzLCBJIHRoaW5rIHdlIG5lZWQgeW91ciBhY2sgZm9yIHRo
aXM/CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
