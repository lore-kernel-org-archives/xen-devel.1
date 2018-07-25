From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 08:43:19 +0100
Message-ID: <20180725074319.omt7mlt2am5klao3@citrix.com>
References: <20180724165651.21743-1-wei.liu2@citrix.com>
 <20180724180152.luftbxunayvi5zgf@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiESB-0008Te-PD
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 07:43:23 +0000
Content-Disposition: inline
In-Reply-To: <20180724180152.luftbxunayvi5zgf@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDE6MDE6NTJQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDU6NTY6NTFQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiA+IC0tLQo+ID4gVGhpcyBpcyBhIHNjcmlwdCBJIHdyb3RlIHByZXZpb3VzbHkgZm9yIGJ1
aWxkIHRlc3QuCj4gCj4gR29hbCBoZXJlIGlzIHRvIGJpc2VjdCBhIHNlcmllcyB0byBmaW5kIHRo
ZSBidWlsZCBmYWlsdXJlPyBXZSBjb3VsZAoKTm8sIG5vdCB0byBiaXNlY3QuICBnaXQtYmlzZWN0
IHdvdWxkIGJlIGdvb2QgZW5vdWdoIGZvciBiaXNlY3Rpb24gYW5kIEkKZG9uJ3QgaW50ZW50IHRv
IHBvb3JseSByZWludmVudCBteSBvd24gd2hlZWwuCgpXZSBoYXZlIHNlZW4gbWFueSBjYXNlcyB0
aGUgYnVpbGQgd291bGQgYmUgYnJva2VuIGluIHRoZSBtaWRkbGUgb2YgYQpsb25nIHNlcmllcywg
YnV0IHRoZSBzZXJpZXMgYXMgYSB3aG9sZSBzdGlsbCBidWlsZHMuICBUaGlzIHNjcmlwdCBpcyB0
bwprZWVwIGV2ZXJ5IGNvbW1pdCBpbiBhIHNlcmllcyBidWlsZGFibGUgc28gaXQgZG9lc24ndCBi
cmVhayBiaXNlY3Rpb24uCgpBbmQgZGVzcGl0ZSBhc2tpbmcgY29udHJpYnV0b3JzIG5pY2VseSB0
byBkbyBzbywgdGhleSBkb24ndCB0ZW5kIHRvIGhhdmUKdGhlIHRpbWUgdG8gd3JpdGUgYWxsIHRo
ZSBjb21tYW5kcyBpbiBhIHNhZmUgd2F5LgoKPiA+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3Nj
cmlwdHMvYnVpbGQtdGVzdC5zaCBiL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uODg1ZTVmN2ExMwo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkLXRlc3Qu
c2gKPiA+IEBAIC0wLDAgKzEsNjggQEAKPiA+ICsjIS9iaW4vYmFzaAo+ID4gKwo+ID4gKyMgUnVu
IGNvbW1hbmQgb24gZXZlcnkgY29tbWl0IHdpdGhpbiB0aGUgcmFuZ2Ugc3BlY2lmaWVkLiBJZiBu
byBjb21tYW5kIGlzCj4gPiArIyBwcm92aWRlZCwgdXNlIHRoZSBkZWZhdWx0IG9uZSB0byBjbGVh
biBhbmQgYnVpbGQgdGhlIHdob2xlIHRyZWUuCj4gPiArIwo+ID4gKyMgVGhlIGRlZmF1bHQgcnVu
ZSBpcyByYXRoZXIgc2ltcGxlLiBUbyBkbyBhIGNyb3NzLWJ1aWxkLCBwbGVhc2UgcHV0IHlvdXIg
dXN1YWwKPiA+ICsjIGJ1aWxkIHJ1bmUgaW4gYSBzaGVsbCBzY3JpcHQgYW5kIGludm9rZSBpdCB3
aXRoIHRoaXMgc2NyaXB0Lgo+ID4gKwo+ID4gK2lmICEgdGVzdCAtZiB4ZW4vY29tbW9uL2tlcm5l
bC5jOyB0aGVuCj4gPiArICAgIGVjaG8gIlBsZWFzZSBydW4gdGhpcyBzY3JpcHQgZnJvbSB0b3At
bGV2ZWwgZGlyZWN0b3J5Igo+ID4gKyAgICBleGl0IDEKPiA+ICtmaQo+IAo+IFlvdSBjb3VsZCBt
YWtlIGl0IHJ1biBmcm9tIGFueXdoZXJlIGlmIHlvdSBkaWQ6Cj4gcHVzaGQgYGdpdCByZXYtcGFy
c2UgLS1zaG93LXRvcGxldmVsYAoKQWgsIHRoYW5rcyBmb3IgdGhlIHRpcC4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
