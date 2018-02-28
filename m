From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 07/11] vpci/bars: add handlers to map the
 BARs
Date: Wed, 28 Feb 2018 04:34:01 -0700
Message-ID: <5A96A1B902000078001ACA9C@prv-mh.provo.novell.com>
References: <5A6750020200009C0431366C@prv-mh.provo.novell.com>
 <5A905C0902000078001AB15D@prv-mh.provo.novell.com>
 <5A93FB8202000078001ABAE7@prv-mh.provo.novell.com>
 <20180226180018.tqpxlkdjsamr5c3g@MacBook-Pro-de-Roger.local>
 <5A9525A802000078001AC0B0@prv-mh.provo.novell.com>
 <20180227092133.fynrrw7327kxh7nr@MacBook-Pro-de-Roger.local>
 <5A953A9802000078001AC158@prv-mh.provo.novell.com>
 <20180227115707.ckah2etzzr3ia56p@MacBook-Pro-de-Roger.local>
 <5A9574FB02000078001AC436@prv-mh.provo.novell.com>
 <20180228112050.pdrp65ytqehzudoi@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqzzv-0001g7-50
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:34:11 +0000
In-Reply-To: <20180228112050.pdrp65ytqehzudoi@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAyLjE4IGF0IDEyOjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkndmUgYmVlbiBnaXZpbmcgc29tZSB0aG91Z2h0IHRvIHRoaXMsIGFuZCBJIGNhbm5vdCBmaW5k
IGEgZ29vZAo+IHNvbHV0aW9uLiBTbyBmYXIgdGhlIGxlc3Mgd29yc2Ugb25lIHdvdWxkIGJlOgo+
IAo+ICAgICArLS0tLS0tLS0tLS0tLS0rICBZRVMgICstLS0tLS0tLS0rCj4gICAgIHxJcyBicm9r
ZW4gc2V0P3wtLS0tLS0+fE5vIGFjdGlvbnwKPiAgICAgKy0tLS0tLS0tLS0tLS0tKyAgICAgICAr
LS0tLS0tLS0tKwo+ICAgICAgICAgIHwKPiAgICAgICAgICB8IE5PCj4gCSB8Cj4gICAgICstLS0t
di0tLS0rICAgU1VDQ0VTUyAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAg
ICAgfG1hcC91bm1hcCstLS0tLS0tLS0tLS0+Q2hhbmdlIGRlY29kaW5nIG9yIFJPTSBlbmFibGUg
Yml0fAo+ICAgICArLS0tLSstLS0tKyAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rCj4gICAgICAgICAgfAo+ICAgICAgICAgIHxGQUlMVVJFCj4gICAgICAgICAg
fAo+ICstLS0tLS0tLXYtLS0tLS0tLS0tLS0tLS0tKwo+IHxDbGVhciBtZW1vcnkgZGVjb2Rpbmcg
Yml0fAo+IHxTZXQgYnJva2VuICAgICAgICAgICAgICAgfAo+ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKwo+IAo+IExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rIG9mIHRoaXMuCgpMb29rcyBy
ZWFzb25hYmxlLCBtYXliZSB3aXRoICJzZXQgYnJva2VuIiByZXBsYWNlZCBieSAic2V0CmJyb2tl
biBpZiBEb20wLCBlbHNlIHJlbW92ZSBkZXZpY2UgZnJvbSBkb21haW4iLiBUaGlzIGF0IGxlYXN0
CnBhcnRseSBkZXBlbmRzIG9uIGhvdyByZWNvdmVyeSBmcm9tICJicm9rZW4iIHdvdWxkIGxvb2sg
bGlrZSwKaS5lLiB3aGV0aGVyIHRoYXQgd291bGQgYmUgYXBwbGljYWJsZSAoYW5kIHNhZmUpIGZv
ciBhIERvbVUgYXMKd2VsbC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
