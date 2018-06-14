From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] VT-d: re-phrase logic in
 vtd_set_hwdom_mapping() for clarity
Date: Thu, 14 Jun 2018 09:44:14 -0600
Message-ID: <5B228D4E02000078001CB563@prv1-mh.provo.novell.com>
References: <20180612134734.22132-1-paul.durrant@citrix.com>
 <20180612134734.22132-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vplz=ja=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTUQ7-0005gE-8a
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 15:44:19 +0000
In-Reply-To: <20180612134734.22132-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA2LjE4IGF0IDE1OjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC94ODYvdnRkLmMKPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L3Z0ZC5jCj4gQEAgLTExNCwyNiArMTE0LDI5
IEBAIHZvaWQgX19od2RvbV9pbml0IHZ0ZF9zZXRfaHdkb21fbWFwcGluZyhzdHJ1Y3QgZG9tYWlu
ICpkKQo+ICAKPiAgICAgIEJVR19PTighaXNfaGFyZHdhcmVfZG9tYWluKGQpKTsKPiAgCj4gLSAg
ICB0b3AgPSBtYXgobWF4X3BkeCwgcGZuX3RvX3BkeCgweGZmZmZmZmZmVUwgPj4gUEFHRV9TSElG
VCkgKyAxKTsKPiArICAgIHRvcCA9IG1heChtYXhfcGR4LCBwZm5fdG9fcGR4KEdCKDQpID4+IFBB
R0VfU0hJRlQpKTsKCkF0IGNlcnRhaW4gYm91bmRhcmllcwoKcGZuX3RvX3BkeCh4ICsgMSkgIT0g
cGZuX3RvX3BkeCh4KSArIDEKCmkuZS4gdGhlcmUgd2FzIGEgcmVhc29uIGZvciB0aGUgd2F5IHRo
aXMgd2FzIHBocmFzZWQgYmVmb3JlLgoKPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgdG9wOyBpKysg
KQo+ICAgICAgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgcGZuID0gcGR4X3RvX3BmbihpKTsK
PiArICAgICAgICBib29sIG1hcDsKPiAgICAgICAgICBpbnQgcmMgPSAwOwo+ICAKPiArICAgICAg
ICBpZiAoIHBmbiA+PSAoR0IoNCkgPj4gUEFHRV9TSElGVCkgJiYgIW1mbl92YWxpZChfbWZuKHBm
bikpICkKPiArICAgICAgICAgICAgY29udGludWU7CgpXaHkgYWhlYWQgb2YgdGhlIGNvbW1lbnQg
Li4uCgo+ICAgICAgICAgIC8qCj4gLSAgICAgICAgICogU2V0IHVwIDE6MSBtYXBwaW5nIGZvciBk
b20wLiBEZWZhdWx0IHRvIHVzZSBvbmx5IGNvbnZlbnRpb25hbCBSQU0KPiAtICAgICAgICAgKiBh
cmVhcyBhbmQgbGV0IFJNUlJzIGluY2x1ZGUgbmVlZGVkIHJlc2VydmVkIHJlZ2lvbnMuIFdoZW4g
c2V0LCB0aGUKPiAtICAgICAgICAgKiBpbmNsdXNpdmUgbWFwcGluZyBtYXBzIGluIGV2ZXJ5dGhp
bmcgYmVsb3cgNEdCIGV4Y2VwdCB1bnVzYWJsZQo+IC0gICAgICAgICAqIHJhbmdlcy4KPiArICAg
ICAgICAgKiBTZXQgdXAgMToxIG1hcHBpbmcgZm9yIGRvbTAuIERlZmF1bHQgdG8gaW5jbHVkZSBv
bmx5Cj4gKyAgICAgICAgICogY29udmVudGlvbmFsIFJBTSBhcmVhcyBhbmQgbGV0IFJNUlJzIGlu
Y2x1ZGUgbmVlZGVkIHJlc2VydmVkCj4gKyAgICAgICAgICogcmVnaW9ucy4gV2hlbiBzZXQsIHRo
ZSBpbmNsdXNpdmUgbWFwcGluZyBtYXBzIGluIGV2ZXJ5IHBmbiB1cAo+ICsgICAgICAgICAqIHRv
IDRHQiBleGNlcHQgdGhvc2UgdGhhdCBmYWxsIGluIHVudXNhYmxlIHJhbmdlcy4KPiAgICAgICAg
ICAgKi8KCi4uLiBleHBsYWluaW5nIGl0LCB3aGVuIHRoZSBvdGhlciBwYXJ0cyB0aGF0IGdldCBl
eHBsYWluZWQgZm9sbG93IGFmdGVyIGl0PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
