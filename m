From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 7/7] x86: expose CONFIG_HVM
Date: Fri, 21 Sep 2018 16:53:05 +0100
Message-ID: <20180921155305.2kfpdlpjfmzkzg7d@zion.uk.xensource.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <180534f4d2c9349dc789a815d865db414d33e829.1536856592.git-series.wei.liu2@citrix.com>
 <5B9BAFB502000078001E8AFC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3Njx-0005EX-E8
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 15:53:09 +0000
Content-Disposition: inline
In-Reply-To: <5B9BAFB502000078001E8AFC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDY6NTU6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE4OjM4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4g
LS0tCj4gPiB2NDogcmVtb3ZlIGEgYmxhbmsgbGluZQo+ID4gdjM6IGxvbmdlciB0ZXh0Cj4gPiB2
MjogdXNlIHRhYiB0byBpbmRlbnQKPiA+IAo+ID4gSGF2ZW4ndCBhZGRlZCBhIGRlcGVuZGVuY3kg
b24gUFZfU0hJTV9FWENMVVNJVkUgYmVjYXVzZSBhZ3JlZW1lbnQgaXMKPiA+IG5vdCB5ZXQgcmVh
Y2hlZC4KPiA+IAo+ID4gQ0MgbW9yZSBwZW9wbGUgZm9yIG9waW5pb25zLgo+ID4gCj4gPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+ID4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiA+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4gPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gPiBDYzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+ID4gCj4gPiBJIGRvbid0IGhhdmUgYW4gb3BpbmlvbiBoZXJl
LCB0aGF0J3Mgd2h5IEkgZGlkbid0IHJlcGx5IHRvIHByZXZpb3VzCj4gPiB0aHJlYWRzLgo+ID4g
Cj4gPiBNYXliZQo+ID4gCj4gPiAgIGRlZl9ib29sIHkgaWYgIVBWX1NISU1fRVhDTFVTSVZFCj4g
PiAKPiA+IGlzIGEgZ29vZCBjb21wcm9taXNlPwo+IAo+IFdlbGwsIHRoYXQncyB0aGUgbWluaW11
bSBJIGNhbiBsaXZlIHdpdGgsIGJ1dCBJIHdvbid0IGFjayBhIHBhdGNoIHdpdGhvdXQKPiB0aGUg
ZWFybGllciBzdWdnZXN0ZWQgImRlcGVuZHMgb24iLiBIb3dldmVyLCBub3QgbmVlZCBmb3IgImlm
IC4uLiIgaGVyZSwKPiBqdXN0IHVzaW5nICJkZWZfYm9vbCAhUFZfU0hJTV9FWENMVVNJVkUiIHNo
b3VsZCBiZSBxdWl0ZSBmaW5lIGFzIGxvbmcKPiBhcyB0aGVyZSdzIGFuIGFsd2F5cyB2aXNpYmxl
IHByb21wdC4KPiAKPiBOb3RlIGFsc28gdGhhdCBvcmRlcmluZyB3aXRoaW4gdGhlIHZhcmlvdXMg
S2NvbmZpZyogZmlsZXMgbWF5IG1hdHRlcgo+IHdpdGggdGhpcyBhcHByb2FjaCwgYXQgbGVhc3Qg
d2hlbiBwcm9jZXNzaW5nIHRoaW5ncyBzZXF1ZW50aWFsbHkgKGxpa2UKPiBpcyBoYXBwZW5pbmcg
Zm9yIHRoZSAib2xkY29uZmlnIiB0YXJnZXQsIGZvciBleGFtcGxlKTogVGhlIHdyb25nCj4gZGVm
YXVsdCB3b3VsZCBwcm9iYWJseSBiZSBzdWdnZXN0ZWQgaWYgUFZfU0hJTV9FWENMVVNJVkUgaGFz
IG5vdAo+IGJlZW4gZ2l2ZW4gYSB2YWx1ZSB5ZXQgYnkgdGhlIHRpbWUgSFZNIGlzIGdldHRpbmcg
cHJvbXB0ZWQgZm9yLgoKSSB0cmllZCB0byBmaWd1cmUgb3V0IGlmIHRoZXJlIGlzIGEgd2VsbCBk
ZWZpbmVkIG1vZGVsIGZvciBLY29uZmlnCm9wdGlvbiBwcm9jZXNzaW5nLCBidXQgZm91bmQgbm9u
ZS4KCkkgZG9uJ3Qga25vdyB3aGF0IGVsc2UgSSBjYW4gZG8gdG8gdW5ibG9jayB0aGlzLiBGb3Ig
bm93IEkgd2lsbCBqdXN0Cm1ha2UgYSBzbWFsbCBhZGp1c3RtZW50LgoKV2VpLgoKPiAKPiBKYW4K
PiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
