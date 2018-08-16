From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: fix ARM build after 54ed251dc7
Date: Thu, 16 Aug 2018 13:45:51 +0100
Message-ID: <20180816124551.lr5o7d5y4qclsixc@citrix.com>
References: <5B751E7902000078001DEB43@prv1-mh.provo.novell.com>
 <9297c93c-5fcc-a817-578d-71ec0bdb49bb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aicj=k7=citrix.com=prvs=7595339f3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqHf2-0001SY-FC
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 12:45:56 +0000
Content-Disposition: inline
In-Reply-To: <9297c93c-5fcc-a817-578d-71ec0bdb49bb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDg6NDE6NTVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNi8wOC8yMDE4IDA3OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IENvbW1p
dCAidG9vbHM6IFJld29yayB4Y19kb21haW5fY3JlYXRlKCkgdG8gdGFrZSBhIGZ1bGwKPiA+IHhl
bl9kb21jdGxfY3JlYXRlZG9tYWluIiAgZmFpbGVkIHRvIHJlcGxhY2Ugb25lIGZ1cnRoZXIgaW5z
dGFuY2Ugb2YKPiA+IHhjX2NvbmZpZyBpbiBsaWJ4bF9fYXJjaF9kb21haW5fc2F2ZV9jb25maWco
KS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4gPiAtLS0KPiA+IEkgaGF2ZSBubyBlbnZpcm9ubWVudCBzZXQgdXAgdG8gZG8gY3Jvc3MgdG9v
bCBzdGFjayBidWlsZHMsIHNvIHRoZSBwYXRjaAo+ID4gaXMgc29sZWx5IGJhc2VkIG9uIG9zc3Rl
c3QgcmVwb3J0IGFuZCBjb2RlIGluc3BlY3Rpb24uCj4gCj4gTm9yIGRvIEkgc2FkbHksIGFuZCB3
ZSBkb24ndCB5ZXQgaGF2ZSB0aGlzIHdvcmtpbmcgaW4gVHJhdmlzL2dpdGxhYgo+IHdoaWNoIGlz
IHRoYXQgdGVzdGluZyBtaXNzZWQgaXQuCj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
