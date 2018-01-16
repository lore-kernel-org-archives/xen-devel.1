From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Tue, 16 Jan 2018 18:10:06 +0530
Message-ID: <0d29eec8-78e3-0978-6b43-7d3e083c077d@caviumnetworks.com>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
 <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
 <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0hmy=el=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1ebQXW-0001Bs-3n
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:40:30 +0000
In-Reply-To: <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
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

SGkgSnVsaWVuLAoKCk9uIDAxLzE2LzIwMTggMDI6MTEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToK
Pgo+Cj4gT24gMDEvMDMvMjAxOCAwNTozNCBBTSwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+PiBIaSBT
YW1lZXIsCj4KPiBIaSBNYW5pc2gsCj4KPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0eXBlOwo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBEdW1teSBjb21wYXRpYmls
aXR5IGRlZmluZXMgKi8KPj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBwZ3NpemVfYml0bWFwOwo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgaW9tbXVfZG9tYWluX2dlb21ldHJ5IGdlb21ldHJ5Owo+Pj4gKwo+
Pj4gK8KgwqDCoCBhdG9taWNfdCByZWY7Cj4+PiArwqDCoMKgIC8qIFVzZWQgdG8gbGluayBpb21t
dV9kb21haW4gY29udGV4dHMgZm9yIGEgc2FtZSBkb21haW4uCj4+PiArwqDCoMKgwqAgKiBUaGVy
ZSBpcyBhdCBsZWFzdCBvbmUgcGVyLVNNTVUgdG8gdXNlZCBieSB0aGUgZG9tYWluLgo+Pj4gK8Kg
wqDCoMKgICovCj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWTCoMKgwqDCoMKgwqDCoCBsaXN0
Owo+Pj4gK307Cj4+PiArCj4+PiArLyogWGVuOiBEZXNjcmliZXMgaW5mb3JtYXRpb24gcmVxdWly
ZWQgZm9yIGEgWGVuIGRvbWFpbiAqLwo+Pj4gK3N0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluIHsK
Pj4+ICvCoMKgwqAgc3BpbmxvY2tfdMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NrOwo+Pj4gK8KgwqDC
oCAvKiBMaXN0IG9mIGlvbW11IGRvbWFpbnMgYXNzb2NpYXRlZCB0byB0aGlzIGRvbWFpbiAqLwo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkwqDCoMKgwqDCoMKgwqAgY29udGV4dHM7Cj4+IENv
dWxkIHdlIHVzZSBhIG1vcmUgdmVyYm9zZSBuYW1lLCBIb3cgYWJvdXQgCj4+ICVzL2NvbnRleHRz
L2lvbW11X2RvbWFpbl9jb250ZXh0cy9nID8KPgo+IEhvdyBhYm91dCBhIG11Y2ggbW9yZSB2ZXJi
b3NlIG5hbWUuLi4/IFRoaXMgbmFtZSBpcyAyMSBsZXR0ZXJzIGFuZCAKPiB0aGF0J3Mgb25seSBm
b3IgdGhlIGZpZWxkLiBKdXN0IGltYWdpbmUgd2l0aCB0aGUgdmFyaWFibGUgbmFtZSBiZWZvcmUg
Cj4gYW5kIGEgY291cGxlIG9mIGluZGVudGF0aW9uLgpIb3cgYWJvdXQgaW9fY29udGV4dD8gYW55
dGhpbmcgd2hpY2ggbWFrZXMgaXQgbW9yZSB2ZXJib3NlIGlzIG9rIHdpdGggbWUuCj4KPiBUaGlz
IGlzIHdoZXJlIGNvbW1lbnQgYXJlIGhlbHBmdWwsIGEgZGV2ZWxvcGVyIGNhbiBlYXNpbHkgbG9v
ayBmb3IgdGhlIAo+IHN0cnVjdHVyZS9maWVsZCB0byBzZWUgYSBkZXNjcmlwdGlvbiBvZiB0aGUg
ZmllbGQuIFNvIGxldCdzIG5vdCBtYWtlIAo+IHRoZSBjb2RlIG1vcmUgaG9ycmlibGUgYmVjYXVz
ZSB5b3Ugd291bGQgaGF2ZSB0byBzcGxpdCB0aGUgbGluZS4KPgo+IENoZWVycywKPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
