From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.11 2/2] libxc/x86: do not
 unconditionally set the module cmdline address
Date: Wed, 21 Mar 2018 18:11:35 +0000
Message-ID: <20180321181135.i4xvp4doieytt34z@citrix.com>
References: <20180321144211.57274-1-roger.pau@citrix.com>
 <20180321144211.57274-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyiEo-0000OM-3n
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 18:13:26 +0000
Content-Disposition: inline
In-Reply-To: <20180321144211.57274-3-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMDI6NDI6MTFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoaXMgd2lsbCBsZWFkIHRvIHdyaXRpbmcgYSB3cm9uZyBtb2R1bGUgY29tbWFu
ZCBsaW5lIHBoeXNpY2FsIG1lbW9yeQo+IGFkZHJlc3MgaWYgbm8gY29tbWFuZCBsaW5lIGlzIGFj
dHVhbGx5IHByb3ZpZGVkLgo+IAo+IFRoaXMgaGFzbid0IGNhdXNlZCBwcm9ibGVtcyBzbyBmYXIg
YmVjYXVzZSBodm1sb2FkZXIgaXMgdGhlIG9ubHkKPiBjb25zdW1lciBvZiB0aGUgbW9kdWxlcyBj
b21tYW5kIGxpbmUsIGFuZCBpdCdzIHVuY29uZGl0aW9uYWxseSBzZXQKPiBpbiB0aGF0IGNhc2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
