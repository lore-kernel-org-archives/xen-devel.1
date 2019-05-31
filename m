From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
Date: Fri, 31 May 2019 11:52:08 +0100
Message-ID: <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
References: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWf8v-0003m5-2b
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:52:13 +0000
In-Reply-To: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzMxLzE5IDQ6MTggQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPiBUaHVzLCBzaXpl
b2Yoc3RydWN0IGNwdXBvb2wpIHdpbGwgc2F2ZSA4IGJ5dGVzIGZvciA2NC1iaXQgc3lzdGVtLgoK
SSBhbSBoYXBweSB3aXRoIHRoZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90
IGluc3RhbnRpYXRlZCAKdGhhdCBvZnRlbi4gQXJlIHlvdSBwbGFubmluZyB0byBoYXZlIG1vcmUg
aW5zdGFudGlhdGlvbiBvZiBpdD8KCkNoZWVycywKCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFvZG9u
ZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgo+IC0tLQo+ICAgeGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+IGluZGV4IDkyYmM3YTAuLmYwY2YyMTAgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaAo+IEBAIC0yMTMsOSArMjEzLDkgQEAgc3RhdGljIGlubGluZSB2b2lk
IHNjaGVkX2ZyZWVfZG9tZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+ICAgc3RydWN0
IGNwdXBvb2wKPiAgIHsKPiAgICAgICBpbnQgICAgICAgICAgICAgIGNwdXBvb2xfaWQ7Cj4gKyAg
ICB1bnNpZ25lZCBpbnQgICAgIG5fZG9tOwo+ICAgICAgIGNwdW1hc2tfdmFyX3QgICAgY3B1X3Zh
bGlkOyAgICAgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KPiAgICAgICBzdHJ1Y3Qg
Y3B1cG9vbCAgICpuZXh0Owo+IC0gICAgdW5zaWduZWQgaW50ICAgICBuX2RvbTsKPiAgICAgICBz
dHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZDsKPiAgICAgICBhdG9taWNfdCAgICAgICAgIHJlZmNudDsK
PiAgIH07Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
