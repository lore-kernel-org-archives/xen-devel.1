From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/2] x86: fix comment on super page
 alignment requirement
Date: Fri, 28 Sep 2018 09:10:12 -0600
Message-ID: <5BAE445402000078001ECF16@prv1-mh.provo.novell.com>
References: <cover.52fcf30dd6185aa3331fdf5dd90a508a79aa78e7.1538123925.git-series.wei.liu2@citrix.com>
 <9dea8007d439251f43089b3ce9e1acbb594d57c0.1538123925.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5uPH-0007jP-Pz
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:10:15 +0000
In-Reply-To: <9dea8007d439251f43089b3ce9e1acbb594d57c0.1538123925.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDEwOjM5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Qk9PVFNUUkFQX0RJUkVDVE1BUF9FTkQgaXMgZ29uZS4gVGhlIGNvbW1lbnQgaW4gcXVlc3Rpb24g
c2hvdWxkIHJlZmVyCj4gdG8gQk9PU1RSQVBfTUFQX0JBU0UgYW5kIDRHQiBpbnN0ZWFkLgo+IAo+
IE1vdmUgdGhlIGVudGlyZSBjb21tZW50IGJsb2NrIHRvIHdoZXJlIGl0IGJlbG9uZ3MgLS0gaW1t
ZWRpYXRlbHkKPiBiZWZvcmUgdGhlIGxvb3Agd2hpY2ggZG9lcyB0aGUgdGhpbmdzIHNhaWQgaW4g
dGhlIGNvbW1lbnQuCj4gCj4gUmVtb3ZlIHR3byB0cmFpbGluZyBzcGFjZXMgd2hpbGUgYXQgaXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkkgZ3Vl
c3MgaXQncyBnb29kIGVub3VnaCB0aGlzIHdheSBmb3Igbm93LCBzbwpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
