From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 08 Oct 2018 08:26:18 -0600
Message-ID: <5BBB690A02000078001EFA83@prv1-mh.provo.novell.com>
References: <20181008135239.41160-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9WUI-0001NK-96
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 14:26:22 +0000
In-Reply-To: <20181008135239.41160-1-roger.pau@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IENvbW1pdCAyOTE2OTUxYzEgIm1tIC8gaW9tbXU6IGluY2x1ZGUgbmVlZF9pb21tdSgpIHRlc3Qg
aW4KPiBpb21tdV91c2VfaGFwX3B0KCkiIGNoYW5nZWQgdGhlIGNoZWNrIGluIGlvbW11X3NoYXJl
X3AybV90YWJsZSB0byB1c2UKPiBuZWVkX2lvbW11KGQpIChhcyBwYXJ0IG9mIGlvbW11X3VzZV9o
YXBfcHQpIGluc3RlYWQgb2YgaW9tbXVfZW5hYmxlZCwKPiB3aGljaCBicm9rZSB0aGUgY2hlY2sg
YmVjYXVzZSBhdCB0aGUgcG9pbnQgaW4gZG9tYWluIGNvbnN0cnVjdGlvbgo+IHdoZXJlIGlvbW11
X3NoYXJlX3AybV90YWJsZSBpcyBjYWxsZWQgbmVlZF9pb21tdShkKSB3aWxsIGFsd2F5cyByZXR1
cm4KPiBmYWxzZS4KPiAKPiBGaXggdGhpcyBieSByZXZlcnRpbmcgdG8gdGhlIHByZXZpb3VzIGxv
Z2ljLgo+IAo+IFdoaWxlIHRoZXJlIHR1cm4gdGhlIGhhcF9lbmFibGVkIGNoZWNrIGludG8gYW4g
QVNTRVJULCBzaW5jZSB0aGUgb25seQo+IGNhbGxlciBvZiBpb21tdV9zaGFyZV9wMm1fdGFibGUg
YWxyZWFkeSBwZXJmb3JtcyB0aGUgaGFwX2VuYWJsZWQgY2hlY2sKPiBiZWZvcmUgY2FsbGluZyB0
aGUgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC01MDUsNyArNTA1LDEzIEBAIGludCBp
b21tdV9kb19kb21jdGwoCj4gIAo+ICB2b2lkIGlvbW11X3NoYXJlX3AybV90YWJsZShzdHJ1Y3Qg
ZG9tYWluKiBkKQo+ICB7Cj4gLSAgICBpZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQo+ICsgICAg
QVNTRVJUKGhhcF9lbmFibGVkKGQpKTsKPiArICAgIC8qCj4gKyAgICAgKiBpb21tdV91c2VfaGFw
X3B0IGNhbm5vdCBiZSB1c2VkIGhlcmUgYmVjYXVzZSBhdCB0aGUgcG9pbnQgaW4gdGhlIGRvbWFp
bgo+ICsgICAgICogY29uc3RydWN0aW9uIHdoZXJlIGlvbW11X3NoYXJlX3AybV90YWJsZSBnZXQg
Y2FsbGVkIG5lZWRfaW9tbXUoZCkgd2lsbAo+ICsgICAgICogYWx3YXlzIHJldHVybiBmYWxzZS4K
PiArICAgICAqLwoKSSdtIGZpZ2h0aW5nIHdpdGggbXlzZWxmIHdoZXRoZXIgdG8gc2hvcnRlbiB0
aGlzIGNvbW1lbnQgd2hpbGUKY29tbWl0dGluZyAtIGl0J3MgY2VydGFpbmx5IG5vdCAiYnJpZWYi
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
