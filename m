From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 15/15] libxl: Re-implement
 domain_suspend_device_model using libxl__ev_qmp
Date: Fri, 9 Nov 2018 17:11:05 +0000
Message-ID: <23525.49065.14807.657219@mariner.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-16-anthony.perard@citrix.com>
 <23494.951.777903.157046@mariner.uk.xensource.com>
 <20181109165918.GD1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gbfi=nu=citrix.com=prvs=84465d680=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gLAJJ-0003SI-4I
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 17:11:09 +0000
In-Reply-To: <20181109165918.GD1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAxNS8xNV0gbGlieGw6IFJlLWlt
cGxlbWVudCBkb21haW5fc3VzcGVuZF9kZXZpY2VfbW9kZWwgdXNpbmcgbGlieGxfX2V2X3FtcCIp
Ogo+IE9uIFR1ZSwgT2N0IDE2LCAyMDE4IGF0IDA0OjI4OjU1UE0gKzAxMDAsIElhbiBKYWNrc29u
IHdyb3RlOgo+ID4gRG9lcyB0aGlzIHN0YXRlZmlsZSBmZCByZWFsbHkgbmVlZCB0byBiZSBhIGNh
cmVmZCA/ICBJcyBpdCBhIHBpcGUgb3IgYQo+ID4gZmlsZSA/ICBJZiBpdCBpcyBhIGZpbGUsIGlz
IGl0IG9mIG5vbnRyaXZpYWwgc2l6ZSA/Cj4gCj4gWWVzLCBpdCBuZWVkcyB0byBiZSBjYXJlZGZk
LCBiZWNhdXNlIHRoYXQncyB3aGF0IHRoZSBsaWJ4bF9fZXZfcW1wIEFQSQo+IHdhbnRzLiBJIGRv
bid0IGtub3cgeWV0IGlmIGl0IGlzIGEgZ29vZCBpZGVlIHRvIGhhdmUgdGhlIF9ldl9xbXAgQVBJ
Cj4gb25seSB0YWtlcyBmZC4gRG8geW91IHRoaW5rIGl0J3MgZmluZSB0byBoYXZlIGxpYnhsX19l
dl9xbXAgQVBJIHRha2VzIGEKPiBzaW1wbGUgZmQgYW5kIGxldCBjYWxsZXJzIGhhbmRsZSB0aGUg
ZmQgdGhlIHdheSB0aGV5IHdhbnQ/Cj4gCj4gKEluIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBh
dGNoIHNlcmllcywgbGlieGxfX2V2X3FtcCB1c2VkIHRvIGNsb3NlCj4gdGhlIGNhcmVmZC4gVGhh
dCdzIG5vdCB0aGUgY2FzZSBhbnltb3JlLCBhbmQgdGhhdCBjYXJlZmQgaXMgb25seSByZWFkLAo+
IHNvIEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVyIGFueW1vcmUgd2hpY2gga2luZCBpdCBpcyBiZXR3
ZWVuIGludCBhbmQKPiBjYXJlZmQuKQoKQWguICBJbiBPT1AgdGVybXMgSSB0aGluayB0aGUgQVBJ
IHNob3VsZCB0YWtlIHRoZSBuYXJyb3dlc3QgY2xhc3MgdGhhdApoYXMgYWxsIHRoZSByZXF1aXJl
ZCBtZXRob2RzLiAgSW4gdGhpcyBjYXNlIHRoYXQgbWVhbnMgdGhhdCBzaW5jZSB5b3UKZG9uJ3Qg
bmVlZCB0byBjbG9zZSB0aGUgZmQgeW91IHNob3VsZG4ndCBwcmVqdWRnZSB3aGV0aGVyIGl0J3Mg
YQpjYXJlZmQgb3Igbm90IC0gc28geW91IHNob3VsZCBtYWtlIGl0IGFuIGludC4KClJlZ2FyZGxl
c3Mgb2Ygd2hldGhlciBpdCdzIGFuIGZkIG9yIGEgY2FyZWZkLCBJIHRoaW5rIHRoZSBxbXAgQVBJ
CmNhbGxlciBuZWVkcyB0byBrZWVwIHRoZSB0aGluZyBvcGVuIHVudGlsIHRoZSBxbXAgYXN5bmMg
b3BlcmF0aW9uIGlzCmRvbmUsIHJpZ2h0ID8KCkZlZWwgZnJlZSB0byB0cnkgdG8gdGFsayBtZSBv
dXQgb2YgdGhpcyB2aWV3LiAgSSB3YXMgYXNraW5nIHRoZQpxdWVzdGlvbiB0byBwcm92b2tlIHRo
b3VnaHQsIG5vdCBuZWNlc3NhcmlseSB0byBwdXNoIGEgcGFydGljdWxhcgpvcGluaW9uLgoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
