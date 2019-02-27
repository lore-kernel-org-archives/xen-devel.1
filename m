From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6.1 3/5] p2m: change write_p2m_entry to
 return an error code
Date: Wed, 27 Feb 2019 13:54:51 +0000
Message-ID: <20190227135451.hidwv7tdvp2akcvh@zion.uk.xensource.com>
References: <20190227110905.53512-4-roger.pau@citrix.com>
 <20190227113031.53725-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wyqt=RC=citrix.com=prvs=954d42a2d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gyzfn-0000vH-Bj
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 13:54:59 +0000
Content-Disposition: inline
In-Reply-To: <20190227113031.53725-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgMTI6MzA6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGFsc28gY2hhbmdpbmcgcDJtX2Vu
dHJ5X21vZGlmeSB0byByZXR1cm4gYW4KPiBlcnJvciBjb2RlLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
