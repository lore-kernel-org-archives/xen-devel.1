From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Tue, 16 Jan 2018 18:57:44 +0530
Message-ID: <dfebfbd3-cef4-4466-45fc-3a46c320a806@caviumnetworks.com>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
 <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
 <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
 <0d29eec8-78e3-0978-6b43-7d3e083c077d@caviumnetworks.com>
 <dcc5d9dc-ce13-1769-d379-ad83cc3e69ab@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0hmy=el=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1ebRHT-0004tX-Jk
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 13:27:59 +0000
In-Reply-To: <dcc5d9dc-ce13-1769-d379-ad83cc3e69ab@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8xNi8yMDE4IDA2OjQ0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4KPgo+IE9uIDE2
LzAxLzE4IDEyOjQwLCBNYW5pc2ggSmFnZ2kgd3JvdGU6Cj4+IEhpIEp1bGllbiwKPgo+IEhpLAo+
Cj4+IE9uIDAxLzE2LzIwMTggMDI6MTEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gMDEvMDMvMjAxOCAwNTozNCBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+Pj4+IEhpIFNh
bWVlciwKPj4+Cj4+PiBIaSBNYW5pc2gsCj4+Pgo+Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGludMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIC8qIER1bW15
IGNvbXBhdGliaWxpdHkgZGVmaW5lcyAqLwo+Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGdz
aXplX2JpdG1hcDsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9tbXVfZG9tYWluX2dlb21ldHJ5IGdl
b21ldHJ5Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgYXRvbWljX3QgcmVmOwo+Pj4+PiArwqDCoMKg
IC8qIFVzZWQgdG8gbGluayBpb21tdV9kb21haW4gY29udGV4dHMgZm9yIGEgc2FtZSBkb21haW4u
Cj4+Pj4+ICvCoMKgwqDCoCAqIFRoZXJlIGlzIGF0IGxlYXN0IG9uZSBwZXItU01NVSB0byB1c2Vk
IGJ5IHRoZSBkb21haW4uCj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgIHN0cnVjdCBs
aXN0X2hlYWTCoMKgwqDCoMKgwqDCoCBsaXN0Owo+Pj4+PiArfTsKPj4+Pj4gKwo+Pj4+PiArLyog
WGVuOiBEZXNjcmliZXMgaW5mb3JtYXRpb24gcmVxdWlyZWQgZm9yIGEgWGVuIGRvbWFpbiAqLwo+
Pj4+PiArc3RydWN0IGFybV9zbW11X3hlbl9kb21haW4gewo+Pj4+PiArwqDCoMKgIHNwaW5sb2Nr
X3TCoMKgwqDCoMKgwqDCoMKgwqAgbG9jazsKPj4+Pj4gK8KgwqDCoCAvKiBMaXN0IG9mIGlvbW11
IGRvbWFpbnMgYXNzb2NpYXRlZCB0byB0aGlzIGRvbWFpbiAqLwo+Pj4+PiArwqDCoMKgIHN0cnVj
dCBsaXN0X2hlYWTCoMKgwqDCoMKgwqDCoCBjb250ZXh0czsKPj4+PiBDb3VsZCB3ZSB1c2UgYSBt
b3JlIHZlcmJvc2UgbmFtZSwgSG93IGFib3V0IAo+Pj4+ICVzL2NvbnRleHRzL2lvbW11X2RvbWFp
bl9jb250ZXh0cy9nID8KPj4+Cj4+PiBIb3cgYWJvdXQgYSBtdWNoIG1vcmUgdmVyYm9zZSBuYW1l
Li4uPyBUaGlzIG5hbWUgaXMgMjEgbGV0dGVycyBhbmQgCj4+PiB0aGF0J3Mgb25seSBmb3IgdGhl
IGZpZWxkLiBKdXN0IGltYWdpbmUgd2l0aCB0aGUgdmFyaWFibGUgbmFtZSAKPj4+IGJlZm9yZSBh
bmQgYSBjb3VwbGUgb2YgaW5kZW50YXRpb24uCj4+IEhvdyBhYm91dCBpb19jb250ZXh0PyBhbnl0
aGluZyB3aGljaCBtYWtlcyBpdCBtb3JlIHZlcmJvc2UgaXMgb2sgd2l0aCAKPj4gbWUuCj4KPiBJ
IG11Y2ggcHJlZmVyIHRvIHN0aWNrIHdpdGggImNvbnRleHRzIi4KSSBhbSBub3QgYWJsZSB0byB1
bmRlcnN0YW5kIHdoeSB0byB1c2UgY29udGV4dHMgZm9yIGEgbGlzdCB3aGljaCBoYXMgCmlvbW11
X2RvbWFpbiBwb2ludGVycy4KSWYgeW91IGFyZSBvayB3aXRoIHRoaXMgbG9naWMsIHdlIGNhbiBy
ZW5hbWUgYWxsIGlvbW11X2RvbWFpbiBwb2ludGVyIAp2YXJpYWJsZXMgaW4gdGhpcyBmaWxlIGFz
IGNvbnRleHQuCkl0IGlzIG5vdCBpbnR1aXRpdmUgdG8gdXNlIGNvbnRleHQgZm9yIGlvbW11X2Rv
bWFpbiBpbiB0aGUgc2FtZSBmaWxlIGl0IAppcyBjb25mdXNpbmcuCgpzbW11IGNvZGUgaW4geGVu
IGlzIG5vdCBlYXN5IHRvIHJlYWQuClRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hpY2ggY29uZnVz
ZS4uLgoKfHN0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluICp4ZW5fZG9tYWluID0gZG9tX2lvbW11
KGQpLT5hcmNoLnByaXY7IFdoYXQgCmlzIHRoZSBmaXJzdCBpbXByZXNzaW9uIGZyb20gdGhpcyB2
YXJpYWJsZSB4ZW5fZG9tYWluLCBkb2VzIGl0IHJlZmVyIHRvIAphIFZNID8gSXQgaXMgY29uZnVz
aW5nLiB8Cgo+Cj4gQ2hlZXJzLAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
