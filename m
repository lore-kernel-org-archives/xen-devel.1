From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] vpci: reduce verboseness of BAR
 write warnings
Date: Mon, 18 Feb 2019 10:02:26 -0700
Message-ID: <5C6AE5220200007800217C3C@prv1-mh.provo.novell.com>
References: <20190218162428.19056-1-roger.pau@citrix.com>
 <5C6AE1130200007800217C10@prv1-mh.provo.novell.com>
 <20190218165306.gtbv4tbpkfotthkw@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gvmJO-0008Ei-Qm
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 17:02:34 +0000
In-Reply-To: <20190218165306.gtbv4tbpkfotthkw@Air-de-Roger>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDE3OjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDE4LCAyMDE5IGF0IDA5OjQ1OjA3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTguMDIuMTkgYXQgMTc6MjQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTM4MSw2ICszNzEsMTkgQEAgc3RhdGljIHZvaWQgYmFyX3dyaXRlKGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLAo+PiA+ICAgICAgZWxz
ZQo+PiA+ICAgICAgICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOwo+PiA+ICAK
Pj4gPiArICAgIGlmICggcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90
LCBmdW5jLCBQQ0lfQ09NTUFORCkgJgo+PiA+ICsgICAgICAgICBQQ0lfQ09NTUFORF9NRU1PUlkg
KQo+PiA+ICsgICAgewo+PiA+ICsgICAgICAgIC8qIElmIHRoZSB2YWx1ZSB3cml0dGVuIGlzIHRo
ZSBjdXJyZW50IG9uZSBhdm9pZCBwcmludGluZyBhIHdhcm5pbmcuICovCj4+ID4gKyAgICAgICAg
aWYgKCB2YWwgIT0gKHVpbnQzMl90KShiYXItPmFkZHIgPj4gKGhpID8gMzIgOiAwKSkgKQo+PiA+
ICsgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLAo+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICIlMDR4OiUwMng6JTAyeC4ldTogaWdub3JlZCBCQVIgJWx1IHdyaXRlIHdpdGggbWVt
b3J5IGRlY29kaW5nIGVuYWJsZWRcbiIsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgcGRldi0+
c2VnLCBwZGV2LT5idXMsIHNsb3QsIGZ1bmMsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgYmFy
IC0gcGRldi0+dnBjaS0+aGVhZGVyLmJhcnMgKyAoaGkgPyAxIDogMCkpOwo+PiAKPj4gV2h5IHRo
ZSBjb25kaXRpb25hbCBvcGVyYXRvcj8gYm9vbCBjb252ZXJ0cyBmaW5lIHRvIGFuIGludGVnZXIK
Pj4gdmFsdWUgb2YgMCBvciAxLgo+IAo+IEhtLCBJIGFsd2F5cyBmb3JnZXQgYWJvdXQgdGhpcy4g
V291bGQgeW91IGJlIHdpbGxpbmcgdG8gZml4IHRoaXMgYXQKPiBjb21taXQgaWYgSnVlcmdlbiBn
aXZlcyBpdCBoaXMgUkFCPwoKU3VyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
