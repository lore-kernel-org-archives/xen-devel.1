From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/7] common: avoid atomic read-modify-write
 accesses in map_vcpu_info()
Date: Tue, 12 Mar 2019 03:30:05 -0600
Message-ID: <5C877C1D020000780021D92C@prv1-mh.provo.novell.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C86916A020000780021D5F4@prv1-mh.provo.novell.com>
 <ff56f677-a300-a769-a021-b36192d47c3a@citrix.com>
 <d1c5d13d-90b3-94fd-5a8f-dc80f4ae4a56@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rfzp=RP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3djd-0006kq-SR
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 09:30:09 +0000
In-Reply-To: <d1c5d13d-90b3-94fd-5a8f-dc80f4ae4a56@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDE4OjUzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDExLzAzLzIwMTkgMTY6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9u
IDExLzAzLzIwMTkgMTY6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gVGhlcmUncyBubyBuZWVk
IHRvIHNldCB0aGUgZXZ0Y2huX3BlbmRpbmdfc2VsIGJpdHMgb25lIGJ5IG9uZS4gU2ltcGx5Cj4+
PiB3cml0ZSBmdWxsIHdvcmRzIHdpdGggYWxsIG9uZXMuCj4+Pgo+Pj4gRm9yIEFybSB0aGlzIHJl
cXVpcmVzIGV4dGVuZGluZyB3cml0ZV9hdG9taWMoKSB0byBhbHNvIGhhbmRsZSA2NC1iaXQKPj4+
IHZhbHVlczsgZm9yIHN5bW1ldHJ5IHJlYWRfYXRvbWljKCkgZ2V0cyBhZGp1c3RlZCBhcyB3ZWxs
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4gCj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+PiAKPj4gKEknbGwgbGVhdmUgdGhlIEFSTSBhc3NlbWJseSB0byBKdWxpZW4gdG8gY2hl
Y2sgb3ZlcikKPiAKPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiAKPiBJIGNhbiBxdWV1ZSB0aGlzIHNlcmllcyBpbiBteSBuZXh0IGJyYW5jaCBvbmNl
IGl0IGlzIGZ1bGx5IGFja2VkLgoKSSB3YXMgbWVhbmluZyB0byBhcHBseSByaWdodCBhd2F5IHdo
YXRldmVyIGluaXRpYWwgcGFydHMgb2YgaXQgYXJlCmZ1bGx5IGFja2VkLCBhcyB0aGlzIGlzbid0
IGEgbWFqb3IgY2hhbmdlLCBhbmQgaXQgZG9lc24ndCBoYXZlIGEKc2lnbmlmaWNhbnQgcmlzayBv
ZiBjb25mbGljdHMgd2l0aCBwb3RlbnRpYWwgbGFzdCBtaW51dGUgY2hhbmdlcyBmb3IKNC4xMi4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
