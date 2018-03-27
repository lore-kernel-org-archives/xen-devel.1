From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 for-4.11 2/2] vpci: make sure handlers
 can deal with size == 0
Date: Tue, 27 Mar 2018 02:19:21 -0600
Message-ID: <5ABA1AA902000078001B65DF@prv1-mh.provo.novell.com>
References: <20180326163244.84056-1-roger.pau@citrix.com>
 <20180326163244.84056-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j1hy=gr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0jpI-0001Mg-QG
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 08:19:28 +0000
In-Reply-To: <20180326163244.84056-2-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDE4OjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBjb2RlIGlzIG5vdCBwcmVwYXJlZCB0byBoYW5kbGUgc3VjaCBjYXNlLCBzbyBqdXN0IHJl
dHVybiBlYXJseS4gSW4KPiB0aGUgZGVidWcgY2FzZSBhZGQgYW4gYXNzZXJ0Lgo+IAo+IFJlcG9y
dGVkLWJ5OiBDb3Zlcml0eQo+IENvdmVyaXR5IElEOiAxNDMwODA5Cj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
