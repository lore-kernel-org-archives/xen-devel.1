From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libxl: fix build on rather old systems
Date: Fri, 11 Jan 2019 06:41:48 -0700
Message-ID: <5C389D1C020000780020CAE9@prv1-mh.provo.novell.com>
References: <5C386B5F020000780020C96B@prv1-mh.provo.novell.com>
 <20190111111826.ur7e4z6f3yqs2duw@zion.uk.xensource.com>
 <5B2F4C9D-0742-4A99-BC18-1339D141270C@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghx4I-0008Pr-8h
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 13:41:50 +0000
In-Reply-To: <5B2F4C9D-0742-4A99-BC18-1339D141270C@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAxLjE5IGF0IDEzOjA2LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gSmFuIDExLCAyMDE5LCBhdCA5OjE4IFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPj4gT24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDM6MDk6MzVBTSAtMDcw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBDTE9ORV9ORVdJUEMgaGFzIGJlZW4gaW50cm9kdWNl
ZCBpbiBMaW51eCAyLjYuMTkgb25seSAoYW5kIGludG8gZ2xpYmMKPj4+IGF0IGFyb3VuZCB0aGF0
IHRpbWUgYXMgd2VsbCkuIENvcGUgd2l0aCBpdCBiZWluZyB1bmRlZmluZWQgYXMgd2VsbCBhcwo+
Pj4gd2l0aCB0aGUgdW5kZXJseWluZyBrZXJuZWwgbm90IGtub3dpbmcgb2YgaXQuCj4+PiAKPj4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IC0tLQo+
Pj4gQ29uc2lkZXJpbmcgaG93IG9sZCAib2xkIiBoZXJlIHJlYWxseSBtZWFucywgSSBjb3VsZCB1
bmRlcnN0YW5kIGlmCj4+PiB0aGlzIHdhcyByZWplY3RlZCwgaW4gd2hpY2ggY2FzZSBJJ2QgY2Fy
cnkgYSBzaW1wbGlmaWVkIHZlcnNpb24gbG9jYWxseS4KPj4+IEkgZG9uJ3QgcnVuIHN1Y2ggb2xk
IGtlcm5lbHMgdG9nZXRoZXIgd2l0aCBtb2Rlcm4gWGVuLCBidXQgSSBkbwo+Pj4gb2NjYXNpb25h
bGx5IGJ1aWxkIG9uIHN1Y2ggb2xkIHN5c3RlbXMuCj4gCj4gQnV0IHdoeSBkbyB5b3UgYnVpbGQg
b24gaXQgaWYgeW91IGRvbuKAmXQgcnVuIGl0PwoKSSBhbHNvIHJ1biBpdCB0aGVyZSwganVzdCBu
b3Qgd2l0aCBhcyBvbGQgYSBrZXJuZWwgYXMgdGhlIHN5c3RlbSBoZWFkZXJzCnJlcHJlc2VudC4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
