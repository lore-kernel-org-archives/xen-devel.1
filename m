From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 00/12] xen/arm: Add support to build with
 clang
Date: Wed, 17 Apr 2019 10:42:36 +0100
Message-ID: <34d8cf3f-e262-e3ab-b9e3-3c0dcbd75e37@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
 <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGh5W-00032M-Pv
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 09:42:42 +0000
In-Reply-To: <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Andrii Anisov <Andrii_Anisov@epam.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNi8wNC8yMDE5IDIzOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
RnJpLCAyOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyOC8wMy8yMDE5IDEx
OjI3LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+Pj4gSGkgSnVsaWVuLAo+Pgo+PiBIaSBBcnRlbSwK
Pj4KPj4+IE9uIFdlZCwgMjAxOS0wMy0yNyBhdCAxODo0NSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4+IEhpIGFsbCwKPj4+Pgo+Pj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBi
dWlsZCBYZW4gQXJtIHdpdGggY2xhbmcuIFRoaXMgc2VyaWVzIHdhcwo+Pj4+IHRlc3RlZAo+Pj4+
IHdpdGggY2xhbmcgOC4wLgo+Pj4+Cj4+Pj4gTm90ZSB0aGF0IEkgb25seSBkaWQgYnVpbGQgZm9y
IGFybTY0LiBJIHN0aWxsIG5lZWQgdG8gbG9vayBhdCB0aGUgYXJtMzIKPj4+PiBidWlsZC4KPj4+
Pgo+Pj4KPj4+IEkgd29uZGVyIGlmIHlvdSBoYXZlIHRpbWUgdG8gdHJ5IHRoZSBzZXJpZXMgd2l0
aCBBcm0gQ29tcGlsZXIgNj8gSSBhbQo+Pj4gYXNraW5nIGJlY2F1c2UgQUZBSUsgaXQgaXMgYmFz
ZWQgb24gY2xhbmcvbGx2bSBbMV0gYW5kIHRoZXJlJ3MgYQo+Pj4gc2FmZXR5LWNvbXBsaWFudCB2
ZXJzaW9uIG9mIGl0IGNlcnRpZmllZCBieSBUVVYgWzJdLiBJIGRvbid0IGhhdmUgYQo+Pj4gbGlj
ZW5zZSB5ZXQgc28gY2Fubm90IHRyeSBpdCBteXNlbGYgYnV0IG1heWJlIHlvdSBoYXZlIGFjY2Vz
cy4KPj4gSSBnYXZlIGEgcXVpY2sgdHJ5IHRvIHRoZSBBcm0gQ29tcGlsZXIuIEkgaGFkIHRvIGhh
Y2sgYSBiaXQgY29uZmlnL1N0ZEdOVS5tawo+PiB0byBwYXNzIGFybWNsYW5nIGFuZCB0aGUgYXBw
cm9wcmlhdGUgdGFyZ2V0IG9wdGlvbi4KPj4KPj4gSSBhbHNvIGhhZCBhIGxpbmtpbmcgaXNzdWUg
YXQgdGhlIGVuZCB3aGVyZSBfXzJzbnByaW50ZiB3YXMgbm90IGZvdW5kLiBJdAo+PiBzZWVtcyB0
aGUgY29tcGlsZXIgcmVwbGFjZSBzbnByaW50ZiB3aXRoIF9fMnNucHJpbnRmLCBJIGhhdmVuJ3Qg
ZmlndXJlZCBvdXQKPj4gd2h5IHlldC4KPiAKPiBCdXQgYWZ0ZXIgdGhlc2UgY2hhbmdlcywgZG9l
cyBpdCB3b3JrPwoKSSBoYXZlbid0IHRyaWVkIHRvIGZpeCB0aGUgbGlua2luZyBpc3N1ZXMuIEkg
b25seSBnYXZlIGEgcXVpY2sgdHJ5IGJlY2F1c2UgQXJ0ZW0gCmFza2VkLiBJIGhhdmUgbm8gcGxh
biBhdCB0aGUgbW9tZW50IHRvIGdvIGZ1cnRoZXIgdGhhbiB0aGF0IGZvciBub3cuCgpQYXRjaGVz
IGFyZSB3ZWxjb21lZCB0byBhZGQgc3VwcG9ydCBmb3IgYXJtY2xhbmcuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
