From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 10:33:30 +0100
Message-ID: <aed28c38-1ca3-6253-3f3a-86ab93e1477d@citrix.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
 <20180419145453.ahbpxclr5isbhdcm@citrix.com>
 <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
 <20180419162227.vo7cgh6tqe5npu3w@citrix.com>
 <20180420092832.7uwpwgiaq4ak7inh@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sfiv=hj=citrix.com=prvs=641bd8182=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f9SQA-0006qu-3R
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 09:33:34 +0000
In-Reply-To: <20180420092832.7uwpwgiaq4ak7inh@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTA6MjgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTksIDIwMTggYXQgMDU6MjI6MjhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPj4gT24gVGh1LCBB
cHIgMTksIDIwMTggYXQgMDU6MTQ6MzhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
IE9uIDE5LzA0LzE4IDE1OjU0LCBXZWkgTGl1IHdyb3RlOgo+Pj4+IE9uIFRodSwgQXByIDE5LCAy
MDE4IGF0IDAxOjAxOjUzUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IE9uIDE5
LzA0LzE4IDEyOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4+IE9uIDE5LjA0LjE4IGF0
IDEyOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+PiAtLS0gYS90b29scy9maXJt
d2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+Pj4+Pj4gKysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRp
ci9NYWtlZmlsZQo+Pj4+Pj4+IEBAIC00MSwyMSArNDEsMjIgQEAgbGlua2Zhcm0uc3RhbXA6ICQo
REVQX0RJUlMpICQoREVQX0ZJTEVTKSBGT1JDRQo+Pj4+Pj4+ICAkKEQpOiBsaW5rZmFybS5zdGFt
cAo+Pj4+Pj4+ICAJJChNQUtFKSAtQyAkKEQpL3hlbiBkaXN0Y2xlYW4KPj4+Pj4+PiAgCj4+Pj4+
Pj4gLS5QSE9OWTogc2hpbS0lY29uZmlnCj4+Pj4+Pj4gLXNoaW0tJWNvbmZpZzogJChEKSBGT1JD
RQo+Pj4+Pj4+IC0JJChNQUtFKSAtQyAkKEQpL3hlbiAkKmNvbmZpZyBcCj4+Pj4+PiBJIHRoaW5r
IHRoZXJlIHdhcyBhIHJlYXNvbiBmb3IgdGhlICUgYW5kICQqLgo+Pj4+PiBUaGUgb25seSBvbmUg
SSBjb3VsZCB0aGluayBvZiBpcyB0aGUgcG9zc2liaWxpdHkgdG8gZG8KPj4+Pj4KPj4+Pj4gbWFr
ZSBzaGltLWRlZmF1bHRjb25maWcKPj4+Pj4KPj4+Pj4gb3Igc2ltaWxhciBjYWxscy4gUXVlc3Rp
b24gaXMgd2hvIHdpbGwgZXZlciBuZWVkIHRoYXQuIEluIGNhc2UgaXQgaXMKPj4+Pj4gYmVsaWV2
ZWQgdG8gYmUgdmFsdWFibGUgSSBjYW4ga2VlcCBpdC4KPj4+PiBOb3QgbGlrZWx5IEkgdGhpbmsu
Cj4+PiBVc2luZyBgbWFrZSBzaGltLW1lbnVjb25maWdgIHdhcyBhIHNwZWNpZmljIHVzZWNhc2Ug
Zm9yIG15IG9yaWdpbmFsCj4+PiB2ZXJzaW9uLCBidXQgd2l0aCB0aGlzIGRpZmZlcmVuY2UgaW4g
cmVwcmVzZW50YXRpb24sIHRoZSB1c2VjYXNlIGhhcwo+Pj4gbW9zdGx5IGdvbmUgYXdheS4KPj4+
Cj4+PiBXaXRoIHRoaXMgY2hhbmdlIGluIHBsYWNlLCB3aGF0IGlzIHRoZSBleHBlY3RlZCB3b3Jr
ZmxvdyBmb3IgbWFraW5nIGFuCj4+PiB1cGRhdGUgdG8gdGhlIGNvbmZpZ3VyYXRpb24/Cj4+Pgo+
PiBKdXN0IGNvbW1pdCB0aGUgbXVzdC1oYXZlJ3MgdG8gdGhlIHRyYWNrZWQgZmlsZSBhbmQgbGV0
IFhlbidzIGJ1aWxkCj4+IHN5c3RlbSBoYW5kbGUgdGhlIHJlc3Q/Cj4gKzEuIEFzIGEgYmFyZSBt
aW5pbXVtOgo+Cj4gQ09ORklHX1hFTl9HVUVTVD15Cj4gQ09ORklHX1BWSF9HVUVTVD15Cj4gQ09O
RklHX1BWX1NISU09eQo+IENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRT15Cj4KPiBCdXQgSSBleHBl
Y3Qgc29tZSBtb3JlIG1pZ2h0IGJlIG5lZWRlZC4KCkNPTkZJR19TSEFET1dfUEFHSU5HPW4KQ09O
RklHX05SX0NQVVM9MzIKQ09ORklHX1ZJREVPPW4KQ09ORklHX0hWTV9GRVA9bgpDT05GSUdfVEJP
T1Q9bgpDT05GSUdfS0VYRUM9bgpDT05GSUdfVE1FTT1uCkNPTkZJR19YRU5PUFJPRj1uCgpSZW1l
bWJlciB0aGF0IHNoaW0gYWxzbyB3YW50cyB0byBiZSBhcyBtdWNoIG9mIGEgc2xpbWxpbmUgYnVp
bGQgYXMgcG9zc2libGUKCj4gSGF2aW5nIGEgZnVsbCBjb25maWcgd2lsbCBhbHdheXMgYmUgYSBQ
SVRBIGJlY2F1c2UgaXQgd2lsbCBnZXQgb3V0IG9mCj4gc3luY2guCgpIb3dldmVyIHdlIHN0b3Jl
IGl0LCBpdCB3aWxsIGdldCBvdXQgb2Ygc3luYy7CoCBJIGRvbid0IHNlZSBhIHNvbHV0aW9uIHRv
CnRoaXMgcHJvYmxlbS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
