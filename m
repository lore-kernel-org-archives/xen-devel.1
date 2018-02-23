From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 04/11] pci: split code to size BARs from
 pci_add_device
Date: Fri, 23 Feb 2018 08:58:59 -0700
Message-ID: <5A90485302000078001AB00E@prv-mh.provo.novell.com>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1epFkb-0006Bj-6X
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:59:09 +0000
In-Reply-To: <20180123150735.74779-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNvIHRoYXQgaXQgY2FuIGJlIGNhbGxlZCBmcm9tIG91dHNpZGUgaW4gb3JkZXIgdG8gZ2V0IHRo
ZSBzaXplIG9mIHJlZ3VsYXIgUENJCj4gQkFScy4gVGhpcyB3aWxsIGJlIHJlcXVpcmVkIGluIG9y
ZGVyIHRvIG1hcCB0aGUgQkFScyBmcm9tIFBDSSBkZXZpY2VzIGludG8gUFZICj4gRG9tMCBwMm0u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
