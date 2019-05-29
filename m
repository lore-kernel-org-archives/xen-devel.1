From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 00/19] xen/arm: Clean-up
 & fixes in boot/mm code
Date: Wed, 29 May 2019 18:23:04 +0100
Message-ID: <1de6f672-e272-b48f-cea1-5f8e9be9fc38@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2I8-0007Vo-Ro
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:23:08 +0000
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpJIGFtIG1pc3Npbmcgc29tZSByZXBseS9yZXZpZXcgZnJvbSBTdGVmYW5vIChzZWUgYmVs
b3cpLgoKT24gMTQvMDUvMjAxOSAxMzoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEp1bGllbiBH
cmFsbCAoMTkpOgo+ICAgIHhlbi9hcm06IFJld29yayBIU0NUTFJfQkFTRQoKTW9yZSBkZXRhaWxz
IGlucHV0IG9uIGhpcyBjbGFpbS4uLiBhbmQgcmV2aWV3IGZvciB0aGUgZm9sbG93aW5nIHBhdGNo
ZXM6Cgo+ICAgIHhlbi9hcm06IFJlbW92ZSBwYXJhbWV0ZXIgY3B1aWQgZnJvbSBzdGFydF94ZW4K
PiAgICB4ZW4vYXJtMzI6IGhlYWQ6IENvcnJlY3RseSByZXBvcnQgdGhlIEhXIENQVSBJRAo+ICAg
IHhlbi9hcm0zMjogaGVhZDogRG9uJ3Qgc2V0IE1BSVIwIGFuZCBNQUlSMQo+ICAgIHhlbi9hcm0z
MjogaGVhZDogQWx3YXlzIHplcm8gcjMgYmVmb3JlIHVwZGF0ZSBhIHBhZ2UtdGFibGUgZW50cnkK
PiAgICB4ZW4vYXJtMzI6IG1tOiBBdm9pZCB0byB6ZXJvIGFuZCBjbGVhbiBjYWNoZSBmb3IgQ1BV
MCBkb21oZWFwCj4gICAgeGVuL2FybTMyOiBtbTogQXZvaWQgY2xlYW5pbmcgdGhlIGNhY2hlIGZv
ciBzZWNvbmRhcnkgQ1BVcyBwYWdlLXRhYmxlcwo+ICAgIHhlbi9hcm06IG1tOiBJbnRyb2R1Y2Ug
REVGSU5FX1BBR0VfVEFCTEV7LFN9IGFuZCB1c2UgaXQKPiAgICB4ZW4vYXJtOiBtbTogUHJvdGVj
dCBYZW4gcGFnZS10YWJsZSB1cGRhdGUgd2l0aCBhIHNwaW5sb2NrCj4gICAgeGVuL2FybTogbW06
IEluaXRpYWxpemUgcGFnZS10YWJsZXMgZWFybGllcgo+ICAgIHhlbi9hcm06IG1tOiBDaGVjayBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIGVuZCBpbiB7ZGVzdHJveSwKPiAgICAgIG1vZGlmeX1feGVu
X21hcHBpbmdzCj4gICAgeGVuL2FybTogUGFpciBjYWxsIHRvIHNldF9maXhtYXAgd2l0aCBjYWxs
IHRvIGNsZWFyX2ZpeG1hcCBpbgo+ICAgICAgY29weV9mcm9tX3BhZGRyCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
