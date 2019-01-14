From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 15/15] argo: validate hypercall arg
 structures via compat machinery
Date: Mon, 14 Jan 2019 05:57:49 -0700
Message-ID: <5C3C874D020000780020D3D4@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-16-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gj1qL-0003Cb-MU
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 12:59:53 +0000
In-Reply-To: <1546846968-7372-16-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDA4OjQyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEFyZ28gZG9lc24ndCB1c2UgY29tcGF0IGh5cGVyY2FsbCBvciBhcmd1bWVudCB0
cmFuc2xhdGlvbiBidXQgY2FuIHVzZSBzb21lCj4gb2YgdGhlIGluZnJhc3RydWN0dXJlIGZvciB2
YWxpZGF0aW5nIHRoZSBoeXBlcmNhbGwgYXJndW1lbnQgc3RydWN0dXJlcyB0bwo+IGVuc3VyZSB0
aGF0IHRoZSBzdHJ1Y3Qgc2l6ZXMsIG9mZnNldHMgYW5kIGNvbXBvc2l0aW9ucyBkb24ndCB2YXJ5
IGJldHdlZW4gMzIKPiBhbmQgNjRiaXQsIHNvIGFkZCB0aGF0IGhlcmUgaW4gYSBuZXcgZGVkaWNh
dGVkIHNvdXJjZSBmaWxlIGZvciB0aGlzIHB1cnBvc2UuCj4gCj4gU29tZSBvZiB0aGUgYXJnbyBo
eXBlcmNhbGwgYXJndW1lbnQgc3RydWN0dXJlcyBjb250YWluIGVsZW1lbnRzIHRoYXQgYXJlCj4g
aHlwZXJjYWxsIGFyZ3VtZW50IHN0cnVjdHVyZSB0eXBlcyB0aGVtc2VsdmVzLCBhbmQgdGhlIHN0
YW5kYXJkIGNvbXBhdAo+IHN0cnVjdHVyZSB2YWxpZGF0aW9uIGRvZXMgbm90IGhhbmRsZSB0aGlz
LCBzaW5jZSB0aGUgdHlwZXMgZGlmZmVyIGluIGNvbXBhdAo+IHZzLiBub24tY29tcGF0IHZlcnNp
b25zOyBzbyBmb3Igc29tZSBvZiB0aGUgdGVzdHMgdGhlIGV4YWN0LXR5cGUtbWF0Y2ggY2hlY2sK
PiBpcyByZXBsYWNlZCB3aXRoIGEgd2Vha2VyLCBidXQgc3RpbGwgc3VmZmljaWVudCwgc2l6ZW9m
IGNoZWNrLgoKIlN0aWxsIHN1ZmZpY2llbnQiIG9uIHdoYXQgYmFzaXM/IE5vdGUgdGhhdCB0byBk
YXRlIHdlIGRpZG4ndCBoYXZlIHRvCm1ha2UgZXhjZXB0aW9ucyBsaWtlIHRoaXMgKGlpcmMpLCBz
byBJJ20gbm90IGhhcHB5IHRvIHNlZSBzb21lIGFwcGVhci4KCj4gVGhlbiB0aGVyZSBhcmUgYWRk
aXRpb25hbCBoeXBlcmNhbGwgYXJndW1lbnQgc3RydWN0dXJlcyB0aGF0IGNvbnRhaW4KPiBlbGVt
ZW50cyB0aGF0IGRvIG5vdCBoYXZlIGEgZml4ZWQgc2l6ZSAobGFzdCBlbGVtZW50LCB2YXJpYWJs
ZSBsZW5ndGggYXJyYXkKPiBmaWVsZHMpLCBzbyB3ZSBoYXZlIHRvIHRoZW4gZGlzYWJsZSB0aGF0
IHNpemUgY2hlY2sgdG9vIGZvciB2YWxpZGF0aW5nIHRob3NlCj4gc3RydWN0dXJlczsgdGhlIGNv
dmVyYWdlIG9mIG9mZnNldCBvZiBlbGVtZW50cyBpcyBzdGlsbCByZXRhaW5lZC4KClRoZXJlIGFy
ZSBwcmlvciBjYXNlcyBvZiBzdWNoIGFzIHdlbGw7IEknbSBub3Qgc3VyZSB0aG91Z2ggaWYgYW55
CndlcmUgYWN0dWFsbHkgaW4gbmVlZCBvZiBjaGVja2luZyB0aHJvdWdoIHRoZXNlIG1hY3Jvcy4g
U3RpbGwgSSdkCmxpa2UgdG8gYmV0dGVyIHVuZGVyc3RhbmQgd2hhdCBpdCBpcyB0aGF0IGRvZXNu
J3Qgd29yayBpbiB0aGF0IGNhc2UuClF1aXRlIHBvc3NpYmx5IHRoZXJlJ3Mgc29tZXRoaW5nIHRo
YXQgY2FuIGJlIGZpeGVkIGluIHRoZSBzY3JpcHRzCihvciBlbHNld2hlcmUpLgoKPiAtLS0gYS94
ZW4vY29tbW9uL01ha2VmaWxlCj4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+IEBAIC03MCw3
ICs3MCw3IEBAIG9iai15ICs9IHhtYWxsb2NfdGxzZi5vCj4gIG9iai1iaW4tJChDT05GSUdfWDg2
KSArPSAkKGZvcmVhY2ggbixkZWNvbXByZXNzIGJ1bnppcDIgdW54eiB1bmx6bWEgdW5sem8gdW5s
ejQgZWFybHljcGlvLCQobikuaW5pdC5vKQo+ICAKPiAgCj4gLW9iai0kKENPTkZJR19DT01QQVQp
ICs9ICQoYWRkcHJlZml4IGNvbXBhdC8sZG9tYWluLm8ga2VybmVsLm8gbWVtb3J5Lm8gbXVsdGlj
YWxsLm8geGxhdC5vKQo+ICtvYmotJChDT05GSUdfQ09NUEFUKSArPSAkKGFkZHByZWZpeCBjb21w
YXQvLGFyZ28ubyBkb21haW4ubyBrZXJuZWwubyBtZW1vcnkubyBtdWx0aWNhbGwubyB4bGF0Lm8p
CgpXaGlsZSBhIG1hdHRlciBvZiB0YXN0ZSB0byBhIGNlcnRhaW4gZGVncmVlLCBJJ20gbm90IGNv
bnZpbmNlZAppbnRyb2R1Y2luZyBhIHNlcGFyYXRlIGZpbGUgZm9yIHRoaXMgaXMgcmVhbGx5IG5l
Y2Vzc2FyeSwgZXNwZWNpYWxseQppZiBzb21lIG9mIHRoZSBvdmVycmlkZXMgdG8gdGhlIENIRUNL
XyogbWFjcm9zIHdvdWxkIGdvIGF3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
