From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] guest/pvh: special case the low 1MB
Date: Mon, 12 Nov 2018 15:54:58 +0000
Message-ID: <20181112155458.o4yulawkays74q2b@zion.uk.xensource.com>
References: <20181109172250.12894-1-roger.pau@citrix.com>
 <20181109172250.12894-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v6tt=nx=citrix.com=prvs=847216550=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMEYO-00034u-60
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:55:08 +0000
Content-Disposition: inline
In-Reply-To: <20181109172250.12894-3-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDksIDIwMTggYXQgMDY6MjI6NTBQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFdoZW4gcnVubmluZyBhcyBhIFBWSCBndWVzdCBYZW4gb25seSBzcGVjaWFsIGNh
c2VzIHRoZSB0cmFtcG9saW5lCj4gY29kZSBpbiB0aGUgbG93IDFNQiwgd2l0aG91dCBhbHNvIHJl
c2VydmluZyB0aGUgc3BhY2UgdXNlZCBieSB0aGUKPiByZWxvY2F0ZWQgbWV0YWRhdGEgb3IgdGhl
IHRyYW1wb2xpbmUgc3RhY2suCj4gCj4gRml4IHRoaXMgYnkgYWx3YXlzIHJlc2VydmluZyB0aGUg
bG93IDFNQiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgWGVuIGlzCj4gcnVubmluZyBhcyBhIGd1ZXN0
IG9yIG5hdGl2ZWx5Lgo+IAo+IFJlcG9ydGVkLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlh
c2xpQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
