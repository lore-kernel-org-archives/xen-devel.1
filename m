From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 02/23] xen: is_hvm_{domain,
 vcpu} should evaluate to false when !CONFIG_HVM
Date: Tue, 28 Aug 2018 12:09:58 +0100
Message-ID: <dbf60ce3-9aa7-a8e9-03f1-c00e11aacc82@arm.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <dd4481dbc4e9fbfe0fcb3ab8a704e58e9d5f04ca.1535285866.git-series.wei.liu2@citrix.com>
 <5B84098302000078001E241E@prv1-mh.provo.novell.com>
 <20180828084121.6dmbkbgcujr36m4t@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ec/y=ll=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fubso-0003tX-CH
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 11:10:02 +0000
In-Reply-To: <20180828084121.6dmbkbgcujr36m4t@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOC8wOC8xOCAwOTo0MSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEF1ZyAyNywg
MjAxOCBhdCAwODoyNDowM0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjYu
MDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+IFR1cm4gdGhl
bSBpbnRvIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIHdoaWNoIGV2YWx1YXRlIHRvIGZhbHNlIHdo
ZW4KPj4+IENPTkZJR19IVk0gaXMgbm90IHNldC4gQVJNIHdvbid0IGJlIGJyb2tlbiBiZWNhdXNl
IEFSTSBndWVzdHMgYXJlIHNldAo+Pj4gdG8gUFYgdHlwZSBpbiB0aGUgaHlwZXJ2aXNvci4KPj4+
Cj4+PiBCdXQgQVJNIGhhcyBwbGFuIHRvIHN3aXRjaCB0byBIVk0gZ3Vlc3QgdHlwZSBpbnNpZGUg
dGhlIGh5cGVydmlzb3IsIHNvCj4+PiBwcmVlbXB0aXZlbHkgaW50cm9kdWNlIENPTkZJR19IVk0g
Zm9yIEFSTSBoZXJlLgo+Pgo+PiBCdXQgaXMgc2V0dGluZyB0aGlzIHRvIFkgdGhlbiBjb3JyZWN0
IGF0IHRoaXMgcG9pbnQ/Cj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBsZXNzIHN1cnByaXNpbmcg
d2hlbiB0aGUgc3dpdGNoaW5nIGV2ZW50dWFsbHkKPiBoYXBwZW5zLiBJIHdpbGwgbGV0IEFSTSBt
YWludGFpbmVycyBkZWNpZGUgd2hldGhlciBpdCBzaG91bGQgYmUgWSBvciBOLgoKSSBhbSBmaW5l
IHdpdGggdGhpcyBjaGFuZ2VzIHRvIGJlIGNvbW1pdHRlZCBub3cuCgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
