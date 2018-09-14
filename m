From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 7/7] x86: expose CONFIG_HVM
Date: Fri, 14 Sep 2018 06:55:17 -0600
Message-ID: <5B9BAFB502000078001E8AFC@prv1-mh.provo.novell.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <180534f4d2c9349dc789a815d865db414d33e829.1536856592.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ck89=l4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0nd3-0006UW-7t
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 12:55:21 +0000
In-Reply-To: <180534f4d2c9349dc789a815d865db414d33e829.1536856592.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE4OjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiB2NDog
cmVtb3ZlIGEgYmxhbmsgbGluZQo+IHYzOiBsb25nZXIgdGV4dAo+IHYyOiB1c2UgdGFiIHRvIGlu
ZGVudAo+IAo+IEhhdmVuJ3QgYWRkZWQgYSBkZXBlbmRlbmN5IG9uIFBWX1NISU1fRVhDTFVTSVZF
IGJlY2F1c2UgYWdyZWVtZW50IGlzCj4gbm90IHlldCByZWFjaGVkLgo+IAo+IENDIG1vcmUgcGVv
cGxlIGZvciBvcGluaW9ucy4KPiAKPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ2M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBJIGRvbid0IGhhdmUgYW4gb3Bp
bmlvbiBoZXJlLCB0aGF0J3Mgd2h5IEkgZGlkbid0IHJlcGx5IHRvIHByZXZpb3VzCj4gdGhyZWFk
cy4KPiAKPiBNYXliZQo+IAo+ICAgZGVmX2Jvb2wgeSBpZiAhUFZfU0hJTV9FWENMVVNJVkUKPiAK
PiBpcyBhIGdvb2QgY29tcHJvbWlzZT8KCldlbGwsIHRoYXQncyB0aGUgbWluaW11bSBJIGNhbiBs
aXZlIHdpdGgsIGJ1dCBJIHdvbid0IGFjayBhIHBhdGNoIHdpdGhvdXQKdGhlIGVhcmxpZXIgc3Vn
Z2VzdGVkICJkZXBlbmRzIG9uIi4gSG93ZXZlciwgbm90IG5lZWQgZm9yICJpZiAuLi4iIGhlcmUs
Cmp1c3QgdXNpbmcgImRlZl9ib29sICFQVl9TSElNX0VYQ0xVU0lWRSIgc2hvdWxkIGJlIHF1aXRl
IGZpbmUgYXMgbG9uZwphcyB0aGVyZSdzIGFuIGFsd2F5cyB2aXNpYmxlIHByb21wdC4KCk5vdGUg
YWxzbyB0aGF0IG9yZGVyaW5nIHdpdGhpbiB0aGUgdmFyaW91cyBLY29uZmlnKiBmaWxlcyBtYXkg
bWF0dGVyCndpdGggdGhpcyBhcHByb2FjaCwgYXQgbGVhc3Qgd2hlbiBwcm9jZXNzaW5nIHRoaW5n
cyBzZXF1ZW50aWFsbHkgKGxpa2UKaXMgaGFwcGVuaW5nIGZvciB0aGUgIm9sZGNvbmZpZyIgdGFy
Z2V0LCBmb3IgZXhhbXBsZSk6IFRoZSB3cm9uZwpkZWZhdWx0IHdvdWxkIHByb2JhYmx5IGJlIHN1
Z2dlc3RlZCBpZiBQVl9TSElNX0VYQ0xVU0lWRSBoYXMgbm90CmJlZW4gZ2l2ZW4gYSB2YWx1ZSB5
ZXQgYnkgdGhlIHRpbWUgSFZNIGlzIGdldHRpbmcgcHJvbXB0ZWQgZm9yLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
