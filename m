From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] rangeset: make inquiry functions tolerate
 NULL inputs
Date: Fri, 17 Aug 2018 11:29:23 +0200
Message-ID: <20180817092923.4hmev4c75ckreu4c@mac>
References: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqb4Y-0007dj-V0
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:29:34 +0000
Content-Disposition: inline
In-Reply-To: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDM6MjA6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmF0aGVyIHRoYW4gc3BlY2lhbCBjYXNpbmcgdGhlIC0+aW9tZW1fY2FwcyBjaGVjayBp
biB4ODYncwo+IGdldF9wYWdlX2Zyb21fbDFlKCkgZm9yIHRoZSBkb21feGVuIGNhc2UsIGxldCdz
IGJlIG1vcmUgdG9sZXJhbnQgaW4KPiBnZW5lcmFsLCBhbG9uZyB0aGUgbGluZXMgb2YgcmFuZ2Vz
ZXRfaXNfZW1wdHkoKTogQSBuZXZlciBhbGxvY2F0ZWQKPiByYW5nZXNldCBjYW4ndCBwb3NzaWJs
eSBjb250YWluIG9yIG92ZXJsYXAgYW55IHJhbmdlLgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkxHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBcyBzYWlkIGluIHRoZSBjb21taXQgbWVz
c2FnZSwgdGhpcyBpcyBkb25lIHRvIGF2b2lkIGFuIGV4dHJhIGNoZWNrIGluCmdldF9wYWdlX2Zy
b21fbDFlIEkgYXNzdW1lLCBzbyBzaG91bGQgdGhlIGV4dHJhIGNoZWNrIGFsc28gYmUgZHJvcHBl
ZApoZXJlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
