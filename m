From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [Xen-users] Xen shutdown fails to release DRBD
 device
Date: Fri, 24 Aug 2018 18:22:32 +0200
Message-ID: <20180824162232.GB3534@gavran.carpriv.carnet.hr>
References: <20180822132424.GB3534@gavran.carpriv.carnet.hr>
 <20180822133420.osvdkjonaxwtd3pq@mac>
 <20180822134251.GC3534@gavran.carpriv.carnet.hr>
 <20180822135546.GD3534@gavran.carpriv.carnet.hr>
 <20180822153928.GE3534@gavran.carpriv.carnet.hr>
 <20180822155154.pkpcvchspm3itwq5@mac>
 <20180822162301.GF3534@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g6n1=lh=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1ftErB-0004SY-79
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 16:22:41 +0000
Content-Disposition: inline
In-Reply-To: <20180822162301.GF3534@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDY6MjM6MDFQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDU6NTE6NTRQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IENhbiB5b3UgYWRkIHNvbWUgZGVidWcgcHJpbnRzIHRvIGNo
ZWNrIGlmIHhlbl9ibGtpZl9kaXNjb25uZWN0IGlzCj4gPiBpbmRlZWQgcmV0dXJuaW5nIEVCVVNZ
IChvciBzb21lIGVycm9yKSBhbmQgdGhhdCdzIHByZXZlbnRpbmcgdGhlCj4gPiBkZXZpY2UgZnJv
bSBjbG9zaW5nIGNvcnJlY3RseT8KPiAKPiBUaGVzZSBhcmUgcHJvZHVjdGlvbiBub2RlcywgYnV0
IEknbGwgdHJ5IHRoYXQgb24gc29tZSB0ZXN0IG1hY2hpbmVzLi4uCgpNYW5hZ2VkIHRvIHJlcHJv
ZHVjZSB0aGlzIGFuZCB4ZW5fYmxraWZfZGlzY29ubmVjdCBpcyBhbHdheXMgcmV0dXJuaW5nIDAK
bGlrZSB5b3UgZXhwZWN0ZWQuICBTbyB0aGlzIGlzIHNvbWUgb3RoZXIgaXNzdWUsIGFuZCBmcm9t
IHdoYXQgSSBjYW4gdGVsbApibGtkZXZfcHV0IG9mIHRoZSB1bmRlcmx5aW5nIGRyYmQgZGV2aWNl
IGdldHMgY2FsbGVkIHNvbWUgdGltZSBhZnRlcgp4ZW5idXNfc3dpdGNoX3N0YXRlKGRldiwgWGVu
YnVzU3RhdGVDbG9zZWQpLiAgQW55IGlkZWEgaG93IHRvIG1ha2Ugc3VyZQppdCBoYXBwZW5zIGlu
IHRoZSBvcHBvc2l0ZSBvcmRlcjogYmxrZGV2X3B1dCBiZWZvcmUgWGVuYnVzU3RhdGVDbG9zZWQ/
CgotLSAKVmFsZW50aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
