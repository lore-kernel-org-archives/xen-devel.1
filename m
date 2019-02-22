From: chengyan <yancheng@ecarx.com.cn>
Subject: Re: About Porting Virtio to the XEN
Date: Fri, 22 Feb 2019 09:37:50 +0800
Message-ID: <a41a0147-a24a-b3d1-7b65-f89d135a46e5@ecarx.com.cn>
References: <9ee0e867-41c7-6474-bddf-220f2526c5bf@ecarx.com.cn>
 <20190221115821.sicxk2x4kw5met54@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FL92=Q5=ecarx.com.cn=yan.cheng@srs-us1.protection.inumbo.net>)
 id 1gwzmo-0001dA-SI
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 01:37:58 +0000
In-Reply-To: <20190221115821.sicxk2x4kw5met54@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RGVhciBXZWk6CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vdyzCoCBJIG9ubHkgbWFrZSBh
IGRlbW8gaW4geDg2IHBsYXRmb3JtIGFuZCBpdCBpcyBqdXN0IGEgdHJ5LgoKIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBOb3Qgc3VyZSB0aGF0IHdoZXRoZXIgaXQgaXMgc3VjY2Vzc2Z1bCB1c2lu
ZyBWaXJ0aW8gdGVjaCAKaW4gdGhlIFhFTiBwcm9qZWN0LgoKIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBJIGZvdW5kIGl0IGlzIGEgaHVnZSBhbmQgZGlmZmljdWx0IHRyeS4KCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIElmIHRoZXJlIGFyZSBwcm9ibGVtcyByZWxhdGVkIHRvIGFybSBpbiB0aGUg
ZnV0dXJlLCBJIHdpbGwgCmFzayB0byBKdWxpZW4uCgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBU
aGFuayB5b3UgZm9yIHlvdXIgcmVjb21tZW5kYXRpb24gYWdhaW4uCgpUaGFua3MuCgrlnKggMjAx
OS8yLzIxIOS4i+WNiDc6NTgsIFdlaSBMaXUg5YaZ6YGTOgo+IE9uIFRodSwgRmViIDIxLCAyMDE5
IGF0IDA2OjEzOjMyUE0gKzA4MDAsIGNoZW5neWFuIHdyb3RlOgo+PiBEZWFyIEV4cGVydDoKPj4K
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJIHdhbnQgdG8gcG9ydGlu
ZyB0aGUgVmlydGlvIHRvIHRoZSBYRU4gdmlhIHJlZmVyZW5jZSB0bwo+PiB0aGUgYmVsb3cgbGlu
a3MuCj4+Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaHR0cHM6Ly93
aWtpLnhlbi5vcmcvd2lraS9WaXJ0aW9fT25fWGVuLgo+IFRoYXQgcGFnZSBpcyB2ZXJ5IGRhdGVk
Lgo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqAgSWYgSSBoYXZlIHBvcnRl
ZCB0aGUgVmlydGlvIGFzIHRoZSBmb2xsb3dpbmcgZ3VpZGVzCj4+ICx3aGV0aGVyIGl0IG1heSBy
ZWFjaCBteSByZXF1aXJlbWVudCx3aGljaCBpcyBpbiB0aGUgSFZNIGd1ZXN0Pwo+IFdoYXQgYXJl
IHlvdXIgcmVxdWlyZW1lbnRzPwo+Cj4gU2VlaW5nIHRoYXQgeW91ciBjb21wYW55IHNlZW1zIHRv
IHdvcmsgb24gYXV0b21vdGl2ZSBwcm9qZWN0cywgSSBrbm93Cj4gSnVsaWVuIGZyb20gQXJtIGhh
cyBkb25lIHNvbWUgd29yayBmb3IgWGVuIG9uIEFybSwgaWYgeW91IGNhbiBiZSBtb3JlCj4gc3Bl
Y2lmaWMsIG1heWJlIEp1bGllbiBjYW4gZ2l2ZSB5b3UgYW4gYW5zd2VyPwo+Cj4gV2VpLgo+Cj4+
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNeSBleHBlY3RlZCByZXN1bHQg
aXMgdGhhdCB2aXNpdCBJL08gdmlhIHRoZSB2aXJ0aW8uIFdvdWxkCj4+IHlvdSBwbGVhc2UgZ2l2
ZSBtZSBhbnN3ZXJzID8KPj4KPj4gVGhhbmtzLgo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Cj4+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCj4gLgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
