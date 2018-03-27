From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vpci: validate data first in
 register_vpci_mmcfg_handler
Date: Tue, 27 Mar 2018 05:49:07 -0600
Message-ID: <5ABA4BD302000078001B6825@prv1-mh.provo.novell.com>
References: <20180327110420.29414-1-wei.liu2@citrix.com>
 <20180327110943.nqpspkddqhnmduwg@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=j1hy=gr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0n6H-00068p-Pp
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 11:49:13 +0000
In-Reply-To: <20180327110943.nqpspkddqhnmduwg@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDEzOjA5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgTWFyIDI3LCAyMDE4IGF0IDEyOjA0OjIwUE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IEF2b2lkIHRoZSBuZWVkIHRvIGRlYWxsb2NhdGUgbWVtb3J5IHdoZW4gdGhlIGRhdGEgaXMg
aW52YWxpZC4gSXQgaGFzCj4+IHRoZSBiZW5lZml0IHRvIG5vdCBmcmFnbWVudCBtZW1vcnkgaW4g
WGVuLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
