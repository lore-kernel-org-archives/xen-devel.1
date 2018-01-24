From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 23 Jan 2018 21:41:17 -0500
Message-ID: <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kpe7=et=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eeB0E-0002Zq-MW
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 02:41:30 +0000
In-Reply-To: <20180118103330.6ampgvc5ovejzyfp@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTgvMjAxOCAwNTozMyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAxOCwg
MjAxOCBhdCAxMTozMTozMkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXZWksCj4+
Cj4+IE9uIDAxLzEyLzE3IDE1OjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gSW5zdGVhZCBv
ZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxvdyAxTUIgcHV0IGl0IGp1c3QgYmVsb3cgNEdC
Cj4+PiBsaWtlIHRoZSByZXN0IG9mIHRoZSBBQ1BJIHRhYmxlcyBpbiBjYXNlIG9mIFBWSCBndWVz
dHMuIFRoaXMgd2lsbAo+Pj4gYXZvaWQgcHVuY2hpbmcgbW9yZSBob2xlcyB0aGFuIG5lY2Vzc2Fy
eSBpbnRvIHRoZSBtZW1vcnkgbWFwLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgo+PiBNaW5kIGFwcGx5aW5nIHRoaXMgb25lPwo+IERvbid0IHdvcnJ5LCBpdCBpcyBp
biBteSBxdWV1ZS4KPgo+IFdpbGwgY29tZSB0byB0aGlzIGFuZCBvdGhlciBwYXRjaGVzIEkgYWNj
dW11bGF0ZWQgc29vbi4KPgo+IFdlaS4KClRoaXMgcmVxdWlyZXMga2VybmVsIGNoYW5nZXMsIGRv
ZXNuJ3QgaXQ/CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTctMTIvbXNnMDA3MTQuaHRtbAoKQW5kIHRoaXMgc2VyaWVzIGFwcGFyZW50bHkg
bmV2ZXIgbWFkZSBpdCB0byB0aGUgdHJlZS4KClBWSCBndWVzdHMgYXJlIGJyb2tlbiBub3cgb24g
c3RhZ2luZy4KCi1ib3JpcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
