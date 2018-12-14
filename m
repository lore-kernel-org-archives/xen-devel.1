From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 v3 4/5] xen/arm: Implement Set/Way
 operations
Date: Fri, 14 Dec 2018 13:31:48 -0800
Message-ID: <a70e7603-5cd1-ab16-9c8a-7ed029d528d5@citrix.com>
References: <20181214115855.6713-1-julien.grall@arm.com>
 <20181214115855.6713-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kSfy=OX=citrix.com=prvs=879ade92c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gXv3r-00050p-U5
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 21:31:55 +0000
In-Reply-To: <20181214115855.6713-5-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMjAxOCAwMzo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNldC9XYXkgb3BlcmF0
aW9ucyBhcmUgdXNlZCB0byBwZXJmb3JtIG1haW50ZW5hbmNlIG9uIGEgZ2l2ZW4gY2FjaGUuCj4g
QXQgdGhlIG1vbWVudCwgU2V0L1dheSBvcGVyYXRpb25zIGFyZSBub3QgdHJhcHBlZCBhbmQgdGhl
cmVmb3JlIGEgZ3Vlc3QKPiBPUyB3aWxsIGRpcmVjdGx5IGFjdCBvbiB0aGUgbG9jYWwgY2FjaGUu
IEhvd2V2ZXIsIGEgdkNQVSBtYXkgbWlncmF0ZSB0bwo+IGFub3RoZXIgcENQVSBpbiB0aGUgbWlk
ZGxlIG9mIHRoZSBwcm9jZXNzb3IuIFRoaXMgd2lsbCByZXN1bHQgdG8gaGF2ZQo+IGNhY2hlIHdp
dGggc3RhbGwgZGF0YSAoU2V0L1dheSBhcmUgbm90IHByb3BhZ2F0ZWQpIHBvdGVudGlhbGx5IGNh
dXNpbmcKCnMvc3RhbGwvc3RhbGUvID8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
