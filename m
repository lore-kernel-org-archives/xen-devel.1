From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/xen: fix pv boot
Date: Wed, 7 Nov 2018 12:02:16 +0000
Message-ID: <6eb96a45-393c-4e06-ee19-549fdbe9e316__35753.3365408473$1541592061$gmane$org@citrix.com>
References: <20181107113017.30090-1-jgross@suse.com>
 <f95cf3fb-fb49-8211-0c54-f6c7382ac455@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vh0l=ns=citrix.com=prvs=84296f867=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKMXP-0001Xq-8P
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:02:23 +0000
In-Reply-To: <f95cf3fb-fb49-8211-0c54-f6c7382ac455@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMTggMTE6NTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDcvMTEvMTggMTE6
MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICsJcmV0dXJuIHJldDsKPj4gIH0KPj4gIAo+PiAg
c3RhdGljIGlubGluZSBpbnQgeGVuX3NhZmVfcmVhZF91bG9uZyh1bnNpZ25lZCBsb25nICphZGRy
LCB1bnNpZ25lZCBsb25nICp2YWwpCj4+ICB7Cj4+IC0JcmV0dXJuIF9fZ2V0X3VzZXIoKnZhbCwg
KHVuc2lnbmVkIGxvbmcgX191c2VyICopYWRkcik7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICsJdW5z
aWduZWQgbG9uZyBydmFsOwo+PiArCj4+ICsJYXNtIHZvbGF0aWxlKCIxOiBtb3YiX19pIiAlMiwl
Il9fciIxXG4iCj4+ICsJCSAgICAgIjI6XG4iCj4+ICsJCSAgICAgIi5zZWN0aW9uIC5maXh1cCxc
ImF4XCJcbiIKPj4gKwkJICAgICAiMzogbW92ICUzLCUwXG4iCj4+ICsJCSAgICAgIiAgIGptcCAy
YlxuIgo+PiArCQkgICAgICIucHJldmlvdXNcbiIKPj4gKwkJICAgICBfQVNNX0VYVEFCTEUoMWIs
IDNiKQo+PiArCQkgICAgIDogIj1yIiAocmV0KSwgIj1yIiAocnZhbCkKPj4gKwkJICAgICA6ICJt
IiAoKmFkZHIpLCAiaSIgKC0xKSwgIjAiIChyZXQpKTsKPj4gKwkqdmFsID0gcnZhbDsKPj4gKwly
ZXR1cm4gcmV0Owo+IFRoaXMgYWxzbyB1c2VzIHJ2YWwgdW5pbml0aWFsaXNlZCBpZiBhIGZhdWx0
IG9jY3Vycy4KPgo+IE92ZXJhbGwsIGhvdyBhYm91dDoKPgo+IHN0YXRpYyBpbmxpbmUgaW50IHhl
bl9zYWZlX3dyaXRlX3Vsb25nKHVuc2lnbmVkIGxvbmcgKmFkZHIsIHVuc2lnbmVkCj4gbG9uZyB2
YWwpCj4gewo+IMKgwqDCoCBpbnQgcmV0ID0gMDsKPgo+IMKgwqDCoCBhc20gdm9sYXRpbGUoIjE6
IG1vdiAlW3ZhbF0sICVbcHRyXVxuIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICIyOlxuIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIuc2VjdGlvbiAuZml4
dXAsIFwiYXhcIlxuIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIzOiBtb3Yg
JVtlcnJdLCAlW3JldF1cbiIKCkFjdHVhbGx5LCBpZiB5b3Ugd2FudCBhIHNob3J0ZXIgZml4dXAg
cGF0aCwgYHN1YiAkMSwgJVtyZXRdYCB3b3VsZCBhbHNvCmRvLCBhbmQgZHJvcCB0aGUgW2Vycl0g
Y29uc3RyYWludC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
