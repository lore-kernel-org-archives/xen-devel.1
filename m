From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: fix pv boot
Date: Wed, 7 Nov 2018 13:16:42 +0100
Message-ID: <b35f5ef5-28bc-5747-63d2-3c5c82ae49e9__10508.1407040872$1541592926$gmane$org@suse.com>
References: <20181107113017.30090-1-jgross@suse.com>
 <f95cf3fb-fb49-8211-0c54-f6c7382ac455@citrix.com>
 <6eb96a45-393c-4e06-ee19-549fdbe9e316@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hym7=ns=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gKMlJ-0002f3-PO
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:16:45 +0000
In-Reply-To: <6eb96a45-393c-4e06-ee19-549fdbe9e316@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMjAxOCAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8xMS8xOCAx
MTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcvMTEvMTggMTE6MzAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArCXJldHVybiByZXQ7Cj4+PiAgfQo+Pj4gIAo+Pj4gIHN0YXRpYyBp
bmxpbmUgaW50IHhlbl9zYWZlX3JlYWRfdWxvbmcodW5zaWduZWQgbG9uZyAqYWRkciwgdW5zaWdu
ZWQgbG9uZyAqdmFsKQo+Pj4gIHsKPj4+IC0JcmV0dXJuIF9fZ2V0X3VzZXIoKnZhbCwgKHVuc2ln
bmVkIGxvbmcgX191c2VyICopYWRkcik7Cj4+PiArCWludCByZXQgPSAwOwo+Pj4gKwl1bnNpZ25l
ZCBsb25nIHJ2YWw7Cj4+PiArCj4+PiArCWFzbSB2b2xhdGlsZSgiMTogbW92Il9faSIgJTIsJSJf
X3IiMVxuIgo+Pj4gKwkJICAgICAiMjpcbiIKPj4+ICsJCSAgICAgIi5zZWN0aW9uIC5maXh1cCxc
ImF4XCJcbiIKPj4+ICsJCSAgICAgIjM6IG1vdiAlMywlMFxuIgo+Pj4gKwkJICAgICAiICAgam1w
IDJiXG4iCj4+PiArCQkgICAgICIucHJldmlvdXNcbiIKPj4+ICsJCSAgICAgX0FTTV9FWFRBQkxF
KDFiLCAzYikKPj4+ICsJCSAgICAgOiAiPXIiIChyZXQpLCAiPXIiIChydmFsKQo+Pj4gKwkJICAg
ICA6ICJtIiAoKmFkZHIpLCAiaSIgKC0xKSwgIjAiIChyZXQpKTsKPj4+ICsJKnZhbCA9IHJ2YWw7
Cj4+PiArCXJldHVybiByZXQ7Cj4+IFRoaXMgYWxzbyB1c2VzIHJ2YWwgdW5pbml0aWFsaXNlZCBp
ZiBhIGZhdWx0IG9jY3Vycy4KPj4KPj4gT3ZlcmFsbCwgaG93IGFib3V0Ogo+Pgo+PiBzdGF0aWMg
aW5saW5lIGludCB4ZW5fc2FmZV93cml0ZV91bG9uZyh1bnNpZ25lZCBsb25nICphZGRyLCB1bnNp
Z25lZAo+PiBsb25nIHZhbCkKPj4gewo+PiDCoMKgwqAgaW50IHJldCA9IDA7Cj4+Cj4+IMKgwqDC
oCBhc20gdm9sYXRpbGUoIjE6IG1vdiAlW3ZhbF0sICVbcHRyXVxuIgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiMjpcbiIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIi5zZWN0aW9uIC5maXh1cCwgXCJheFwiXG4iCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICIzOiBtb3YgJVtlcnJdLCAlW3JldF1cbiIKPiAKPiBBY3R1YWxseSwgaWYg
eW91IHdhbnQgYSBzaG9ydGVyIGZpeHVwIHBhdGgsIGBzdWIgJDEsICVbcmV0XWAgd291bGQgYWxz
bwo+IGRvLCBhbmQgZHJvcCB0aGUgW2Vycl0gY29uc3RyYWludC4KClRoYW5rcyBmb3IgdGhlIHJl
dmlldy4KCldpbGwgc2VuZCBWMiBzb29uLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
