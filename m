From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Tue, 16 Jan 2018 13:14:36 +0000
Message-ID: <dcc5d9dc-ce13-1769-d379-ad83cc3e69ab@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
 <4ddcd633-89e2-3518-810b-4111c9f75ced@caviumnetworks.com>
 <8db2ef47-17fe-e0ca-056e-6245e9788fa4@linaro.org>
 <0d29eec8-78e3-0978-6b43-7d3e083c077d@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lndq=el=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ebR4a-0003nb-PN
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 13:14:40 +0000
Received: by mail-wr0-x241.google.com with SMTP id o7so15109154wro.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 05:14:39 -0800 (PST)
In-Reply-To: <0d29eec8-78e3-0978-6b43-7d3e083c077d@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8wMS8xOCAxMjo0MCwgTWFuaXNoIEphZ2dpIHdyb3RlOgo+IEhpIEp1bGllbiwKCkhp
LAoKPiBPbiAwMS8xNi8yMDE4IDAyOjExIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+
IE9uIDAxLzAzLzIwMTggMDU6MzQgQU0sIE1hbmlzaCBKYWdnaSB3cm90ZToKPj4+IEhpIFNhbWVl
ciwKPj4KPj4gSGkgTWFuaXNoLAo+Pgo+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0eXBlOwo+Pj4+ICsKPj4+PiArwqDCoMKgIC8qIER1bW15IGNvbXBhdGli
aWxpdHkgZGVmaW5lcyAqLwo+Pj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBwZ3NpemVfYml0bWFw
Owo+Pj4+ICvCoMKgwqAgc3RydWN0IGlvbW11X2RvbWFpbl9nZW9tZXRyeSBnZW9tZXRyeTsKPj4+
PiArCj4+Pj4gK8KgwqDCoCBhdG9taWNfdCByZWY7Cj4+Pj4gK8KgwqDCoCAvKiBVc2VkIHRvIGxp
bmsgaW9tbXVfZG9tYWluIGNvbnRleHRzIGZvciBhIHNhbWUgZG9tYWluLgo+Pj4+ICvCoMKgwqDC
oCAqIFRoZXJlIGlzIGF0IGxlYXN0IG9uZSBwZXItU01NVSB0byB1c2VkIGJ5IHRoZSBkb21haW4u
Cj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkwqDCoMKgwqDC
oMKgwqAgbGlzdDsKPj4+PiArfTsKPj4+PiArCj4+Pj4gKy8qIFhlbjogRGVzY3JpYmVzIGluZm9y
bWF0aW9uIHJlcXVpcmVkIGZvciBhIFhlbiBkb21haW4gKi8KPj4+PiArc3RydWN0IGFybV9zbW11
X3hlbl9kb21haW4gewo+Pj4+ICvCoMKgwqAgc3BpbmxvY2tfdMKgwqDCoMKgwqDCoMKgwqDCoCBs
b2NrOwo+Pj4+ICvCoMKgwqAgLyogTGlzdCBvZiBpb21tdSBkb21haW5zIGFzc29jaWF0ZWQgdG8g
dGhpcyBkb21haW4gKi8KPj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWTCoMKgwqDCoMKgwqDC
oCBjb250ZXh0czsKPj4+IENvdWxkIHdlIHVzZSBhIG1vcmUgdmVyYm9zZSBuYW1lLCBIb3cgYWJv
dXQgCj4+PiAlcy9jb250ZXh0cy9pb21tdV9kb21haW5fY29udGV4dHMvZyA/Cj4+Cj4+IEhvdyBh
Ym91dCBhIG11Y2ggbW9yZSB2ZXJib3NlIG5hbWUuLi4/IFRoaXMgbmFtZSBpcyAyMSBsZXR0ZXJz
IGFuZCAKPj4gdGhhdCdzIG9ubHkgZm9yIHRoZSBmaWVsZC4gSnVzdCBpbWFnaW5lIHdpdGggdGhl
IHZhcmlhYmxlIG5hbWUgYmVmb3JlIAo+PiBhbmQgYSBjb3VwbGUgb2YgaW5kZW50YXRpb24uCj4g
SG93IGFib3V0IGlvX2NvbnRleHQ/IGFueXRoaW5nIHdoaWNoIG1ha2VzIGl0IG1vcmUgdmVyYm9z
ZSBpcyBvayB3aXRoIG1lLgoKSSBtdWNoIHByZWZlciB0byBzdGljayB3aXRoICJjb250ZXh0cyIu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
