From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 03/15] libxl_qmp: Implement fd callback
 and read data [and 1 more messages]
Date: Tue, 30 Oct 2018 18:25:14 +0000
Message-ID: <23512.41482.912007.387262@mariner.uk.xensource.com>
References: <20181015151630.3887-1-ian.jackson@eu.citrix.com>
 <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-4-anthony.perard@citrix.com>
 <23486.7932.781238.747508@mariner.uk.xensource.com>
 <20181011140604.GH1331@perard.uk.xensource.com>
 <23492.49624.248349.953540@mariner.uk.xensource.com>
 <20181029155231.GC6481@perard.uk.xensource.com>
 <23511.17423.158308.290375@mariner.uk.xensource.com>
 <20181030180333.GD6481@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dpcg=nk=citrix.com=prvs=834417343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gHYiB-0003Pm-Rq
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 18:25:55 +0000
In-Reply-To: <20181030180333.GD6481@perard.uk.xensource.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAwMy8xNV0gbGlieGxfcW1wOiBJ
bXBsZW1lbnQgZmQgY2FsbGJhY2sgYW5kIHJlYWQgZGF0YSBbYW5kIDEgbW9yZSBtZXNzYWdlc10i
KToKPiBPbiBNb24sIE9jdCAyOSwgMjAxOCBhdCAwNTozMTo1OVBNICswMDAwLCBJYW4gSmFja3Nv
biB3cm90ZToKPiA+IFRvIGJlIGhvbmVzdCB0aGlzIGNvbmRpdGlvbiBpcyBhIGJpdCBmaWRkbHku
ICBXaHkgbm90IGRvIHRoaXMgYWZ0ZXIKPiA+IHN1YnRyYWN0aW5nIGJ1Zl9jb25zdW1lZCBmcm9t
IGJ1Zl91c2VkIGFuZCBjb3B5aW5nIHRoZSBvbGQgZGF0YSBkb3duID8KPiAKPiBTb21laG93LCB0
aGF0IGZlZWxzIHdyb25nIHRvIG1vdmUgdGhlIGRhdGEgaW5zaWRlIHRoZSBidWZmZXIuCgpZb3Ug
YXJlIGdvaW5nIHRvIGhhdmUgdG8gbW92ZSB0aGUgZGF0YSBzb21ldGltZXMuICBTdXBwb3NlIHFl
bXUga2VlcHMKc2VuZGluZyB5b3UgaGFsZiBtZXNzYWdlcyBhbmQgdGhlbiBwYXVzaW5nLiAgWW91
J2xsIG5ldmVyIGhhdmUgYW4KZW1wdHkgYnVmZmVyLgoKPiA+IFRoZW4gaXQgd291bGQgcmVhZAo+
ID4gICBpZiAoIWV2LT5idWZfdXNlZCkKPiA+IAo+ID4gQnV0IGV2ZW4gYmV0dGVyLCBpZiB5b3Ug
Y2hhbmdlIHlvdXIgY29kZSB0byBwZXJtaXQgZXYtPnJ4X2J1ZiAhPSBOVUxMCj4gPiB3aGVuIGV2
LT5yeF9idWZfdXNlZD09MCwgdGhpcyBjb2RlIGdvZXMgYXdheSBjb21wbGV0ZWx5Lgo+IAo+IEkg
Z3Vlc3MgeW91IG1lYW4gdG8ga2VlcCB0aGUgYnVmZmVyIGV2ZW4gb25jZSB0aGVyZSdzIG5vdGhp
bmcgbGVmdCB0bwo+IHBhcnNlPyAoQW5kIG9ubHkgZnJlZSBpdCBvbmNlIHdlIGNhbGwgX2Rpc3Bv
c2UoKS4pCgpZZXMuICBJdCBzZWVtcyBzaW1wbGVyLgoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
