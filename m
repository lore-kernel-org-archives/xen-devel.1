From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xl: handle PVH type in
 apply_global_affinity_masks again
Date: Fri, 12 Apr 2019 11:11:58 +0100
Message-ID: <20190412101158.GJ30543@zion.uk.xensource.com>
References: <20190412100325.11699-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEtAA-000891-1V
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:12:02 +0000
Content-Disposition: inline
In-Reply-To: <20190412100325.11699-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTE6MDM6MjVBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBBIGNhbGwgc2l0ZSBpbiBjcmVhdGVfZG9tYWluIGNhbiBjYWxsIGl0IHdpdGggUFZIIHR5cGUu
IFRoYXQgc2l0ZSB3YXMKPiBtaXNzZWQgZHVyaW5nIHRoZSByZXZpZXcgb2YgNDhkYWI5NzY3Lgo+
IAo+IFJlaW5zdGF0ZSBQVkggdHlwZSBpbiB0aGUgc3dpdGNoLgo+IAo+IFJlcG9ydGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpDQyBKdWVyZ2VuCgpUaGlzIGZpeGVzIGEgcmVncmVz
c2lvbi4KCgo+IC0tLQo+ICB0b29scy94bC94bF92Y3B1LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZjcHUuYyBi
L3Rvb2xzL3hsL3hsX3ZjcHUuYwo+IGluZGV4IDkzYWJjYzY1YzAuLjMyOTUxMmVhYWYgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMveGwveGxfdmNwdS5jCj4gKysrIGIvdG9vbHMveGwveGxfdmNwdS5jCj4g
QEAgLTc5LDYgKzc5LDcgQEAgdm9pZCBhcHBseV9nbG9iYWxfYWZmaW5pdHlfbWFza3MobGlieGxf
ZG9tYWluX3R5cGUgdHlwZSwKPiAgCj4gICAgICBzd2l0Y2ggKHR5cGUpIHsKPiAgICAgIGNhc2Ug
TElCWExfRE9NQUlOX1RZUEVfSFZNOgo+ICsgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVkg6
Cj4gICAgICAgICAgdHlwZV9tYXNrID0gJmdsb2JhbF9odm1fYWZmaW5pdHlfbWFzazsKPiAgICAg
ICAgICBicmVhazsKPiAgICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFY6Cj4gLS0gCj4gMi4y
MC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
