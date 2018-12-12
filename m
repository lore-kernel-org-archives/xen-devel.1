From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: improve paging memory
 usage calculations
Date: Wed, 12 Dec 2018 02:59:42 -0700
Message-ID: <5C10DC0E020000780020561B@prv1-mh.provo.novell.com>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-3-roger.pau@citrix.com>
 <5C0FD5860200007800205220@prv1-mh.provo.novell.com>
 <20181211153651.kgltzqwy5cbj5rpq@mac>
 <5C0FE4090200007800205338@prv1-mh.provo.novell.com>
 <20181212093718.cyyfhdo73slsbpt3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gX1Iy-00013Q-LY
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:59:48 +0000
In-Reply-To: <20181212093718.cyyfhdo73slsbpt3@mac>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEyLjE4IGF0IDEwOjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9LLCBJIHdpbGwgaXRlcmF0ZSBvdmVyIGFsbCB0aGUgZGV2aWNlcyBpbiBvcmRlciB0byBzaXpl
IHRoZSBCQVJzLCBhbmQKPiB0aGVuIGFkZCB0aGUgc3VtIG9mIEJBUnMgTU1JTyByZWdpb25zIHRv
IHRoZSBhbW91bnQgb2YgZ3Vlc3QgbWVtb3J5LAo+IHNvIHRoYXQgZWFjaCAxTUIgb2YgQkFSIE1N
SU8gd2lsbCByZXF1aXJlIDEgcGFnZSBmb3IgdGhlIHAybS4KCkRvbid0IHlvdSBjb25zdHJ1Y3Qg
YSByYW5nZXNldCBmb3IgYWxsIG9mIHRoZSBCQVJzIGFscmVhZHkKYW55d2F5PyBGb3Igb25lcyB3
aGljaCBoYXZlIGFuIGFkZHJlc3MgYXNzaWduZWQgYW5kIGFyZQplbmFibGVkLCBhbHNvIHRha2lu
ZyB0aGUgYWRkcmVzcyBpbnRvIGFjY291bnQgd291bGQgc2VlbQpkZXNpcmFibGUsIGFzIHRoZW4g
eW91IGNvdWxkIGRvIHdpdGggbGVzcyB0aGFuIGRvdWJsZSBvdmVyLQplc3RpbWF0aW5nIChpbiB0
aGUgY29tbW9uIGNhc2UpIHRoZSBhbW91bnQgb2Ygc3BhY2UgbmVlZGVkLgoKPiBOb3RlIHRoYXQg
QVRNIEkgd2lsbCBub3QgYWNjb3VudCBmb3IgVkYgQkFScy4KCkhtbSwgeWVzLCB0aGlzIGlzIHBl
cmhhcHMgaW5kZWVkIHRvbyBtdWNoIHRvIGFzayBmb3IgYXQgdGhpcwpwb2ludC4gQnV0IHVsdGlt
YXRlbHkgd2UgbmVlZCBhIGNsZWFuIGFwcHJvYWNoIHRoZXJlIHRvby4KCj4gT0ssIHNvIGZvciBz
aGFkb3cgd2UgYWxzbyBuZWVkIHRvIGFjY291bnQgZm9yIHRoZSBJT01NVSBwYWdlIHRhYmxlCj4g
c2l6ZSwgd2hpY2ggaXMgbm90IGRvbmUgbm93IEFGQUlDVC4KCkFzIHNhaWQgKG9yIHBlcmhhcHMg
aW1wbGllZCkgaW4gdGhlIG90aGVyIHJlcGx5LCB0aGUgY2FsY3VsYXRpb24KdGhlcmUgbWF5IGlt
cGx5IGhhbGYgb2YgdGhlIHNwYWNlIGZvciB0aGUgSU9NTVUsIGJ1dCBpdCBtYXkKYWxzbyBtZWFu
IHRoZSBvdGhlciBoYWxmIHRvIGJlIGZvciBoaWdoZXIgbGV2ZWwgdGFibGVzIG9uIHRoZQpDUFUg
c2lkZS4gSXQncyBhbGwgZ3Vlc3N3b3JrIHdpdGhvdXQgc3VpdGFibGUgY29tbWVudHMuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
