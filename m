From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 for-next 06/12] pci: split code to size
 BARs from pci_add_device
Date: Fri, 15 Dec 2017 03:54:56 -0700
Message-ID: <5A33B8100200007800197A6D@prv-mh.provo.novell.com>
References: <20171018114034.36587-1-roger.pau@citrix.com>
 <20171018114034.36587-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nivo=dl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePndq-0007zQ-9U
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 10:54:58 +0000
In-Reply-To: <20171018114034.36587-7-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjEwLjE3IGF0IDEzOjQwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
ICsgICAgICAgICAgICAgICAgcmV0ID0gcGNpX3NpemVfbWVtX2JhcihzYmRmLCBpZHgsIE5VTEws
ICZwZGV2LT52Zl9ybGVuW2ldLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQQ0lfQkFSX1ZGIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKGkgPT0gUENJX1NSSU9WX05VTV9CQVJTIC0gMSkgPwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBQQ0lfQkFSX0xBU1QgOiAwKTsKClRoZXJlIGFyZSBwYXJlbnRo
ZXNlcyBtaXNzaW5nIGFyb3VuZCB0aGUgY29uZGl0aW9uYWwgZXhwcmVzc2lvbgpoZXJlLgoKPiAr
ICAgICAgICAgICAgICAgIGlmICggcmV0IDwgMCApCj4gKyAgICAgICAgICAgICAgICAgICAgYnJl
YWs7CgpJIGRvbid0IHRoaW5rIHlvdSBzaG91bGQgYmFpbCBvdXQgaGVyZSwgb3IgcmVwb3J0IHRo
ZSBlcnJvciB5b3UndmUKZ290IGJhY2sgdG8geW91ciBjYWxsZXIuIE90aGVyd2lzZSB0aGlzIGlz
IGxhdGVudCAoZm9yIHRoZSBmb3JtZXIpCmFuZCBhY3R1YWwgKGZvciB0aGUgbGF0dGVyKSBjaGFu
Z2UgaW4gYmVoYXZpb3IuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
