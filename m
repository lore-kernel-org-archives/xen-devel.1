From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] common: make sure symbols-dummy.o gets
 rebuilt when needed
Date: Fri, 23 Nov 2018 11:55:19 +0000
Message-ID: <7e213eaf-9619-4930-6434-d2654f8fe246@citrix.com>
References: <5BF7E64C02000078001FF5D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zeqX=OC=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQA3P-0007ON-KZ
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:55:23 +0000
In-Reply-To: <5BF7E64C02000078001FF5D2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHBlci1hcmNoIHRv
cCBsZXZlbCBtYWtlIGZpbGVzIGRvbid0IHJlY29yZCBhbnkgZGVwZW5kZW5jaWVzIGZvciB0aGUK
PiBmaWxlLCBzbyBpdHMgbWVyZSBleGlzdGVuY2UgaXMgZW5vdWdoIGZvciBtYWtlIHRvIGNvbnNp
ZGVyIGl0IHVwLXRvLQo+IGRhdGUuIEFzIG9mIGFiM2U1ZjVmZjkgKCJ4c3BsaWNlLCBzeW1ib2xz
OiBJbXBsZW1lbnQgZmFzdCBzeW1ib2wgbmFtZXMKPiAtPiB2aXJ0dWFsIGFkZHJlc3NlcyBsb29r
dXAiKSB0aGUgZmlsZSwgaG93ZXZlciwgZGVwZW5kcyBvbiB0aGUKPiBGQVNUX1NZTUJPTF9MT09L
VVAgY29uZmlnIG9wdGlvbiwgd2hpY2ggbWF5IGNoYW5nZSBiZXR3ZWVuIGluY3JlbWVudGFsCj4g
cmUtYnVpbGRzLgo+Cj4gVXNlIHRoZSAkKGV4dHJhLXkpIG1hY2hpbmVyeSB0byBnZXQgdGhlIGZp
bGUgYnVpbHQgd2l0aG91dCBhbiBleHRyYQo+IHJlY3Vyc2lvbiBzdGVwIGludG8gY29tbW9uLywg
YnV0IGluc3RlYWQgcmlnaHQgd2hlbiB0aGUgb3RoZXIgdGhpbmdzIGluCj4gdGhhdCBkaXJlY3Rv
cnkgZ2V0IGJ1aWx0LiBTb21lIG1ha2VmaWxlIGFkanVzdG1lbnRzIGFyZSBuZWNlc3NhcnkgdG8K
PiBhY3R1YWxseSBtYWtlIHRoaXMgbWFjaGluZXJ5IHdvcmsgYmV5b25kIHRoZSByZXN0cmljdGVk
IHNldCBvZiBwbGFjZSBpdAo+IHdhcyB1c2VkIGluIGJlZm9yZS4gTm90ZSBob3dldmVyIHRoYXQg
YW4gaW1wb3J0YW50IHJlc3RyaWN0aW9uIHJlbWFpbnM6Cj4gJChleHRyYS15KSBtYXkgbm90IG92
ZXJsYXAgJChvYmoteSkgb3IgJChvYmotYmluLXkpLgo+Cj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkg
YW5kIGFsc28gbWFrZSB0aGUgZ2VuZGVwIGludm9jYXRpb24gY292ZXIgYm90aAo+ICQob2JqLWJp
bi15KSBhbmQgJChleHRyYS15KSwgZXZlbiBpZiB0aGlzIGlzIG5vdCBkaXJlY3RseSByZWxhdGVk
IGhlcmUuCj4gSSBzaG91bGQgaGF2ZSBpbmNsdWRlZCB0aGVtIHJpZ2h0IGF3YXkgaW4gOGI2ZWY5
YzE1MiAoImNvbXBhdDogZW5mb3JjZQo+IGRpc3Rpbmd1aXNoYWJsZSBmaWxlIG5hbWVzIGluIHN5
bWJvbCB0YWJsZSIpLgo+Cj4gUmVwb3J0ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
