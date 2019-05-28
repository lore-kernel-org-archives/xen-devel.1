From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 60/60] xen/sched: add scheduling granularity
 enum
Date: Tue, 28 May 2019 14:02:26 +0200
Message-ID: <0b2594c8-3692-e2ec-0daf-06d93077dd65@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-61-jgross@suse.com>
 <5CED20DF0200007800233156@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVaoH-0002kw-Cu
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 12:02:29 +0000
In-Reply-To: <5CED20DF0200007800233156@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMjAxOSAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtNjEsNiArNjIsMjMgQEAg
dW5zaWduZWQgaW50IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKPj4gIGJvb2wgc2NoZWRfZGlzYWJs
ZV9zbXRfc3dpdGNoaW5nOwo+PiAgY3B1bWFza192YXJfdCBzY2hlZF9yZXNfbWFzazsKPj4gIAo+
PiArI2lmZGVmIENPTkZJR19YODYKPj4gK3N0YXRpYyBpbnQgX19pbml0IHNjaGVkX3NlbGVjdF9n
cmFudWxhcml0eShjb25zdCBjaGFyICpzdHIpCj4+ICt7Cj4+ICsgICAgaWYgKHN0cmNtcCgiY3B1
Iiwgc3RyKSA9PSAwKQo+PiArICAgICAgICBvcHRfc2NoZWRfZ3JhbnVsYXJpdHkgPSBTQ0hFRF9H
UkFOX2NwdTsKPj4gKyAgICBlbHNlIGlmIChzdHJjbXAoImNvcmUiLCBzdHIpID09IDApCj4+ICsg
ICAgICAgIG9wdF9zY2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY29yZTsKPj4gKyAgICBl
bHNlIGlmIChzdHJjbXAoInNvY2tldCIsIHN0cikgPT0gMCkKPj4gKyAgICAgICAgb3B0X3NjaGVk
X2dyYW51bGFyaXR5ID0gU0NIRURfR1JBTl9zb2NrZXQ7Cj4+ICsgICAgZWxzZQo+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArICAgIHJldHVybiAwOwo+PiArfQo+PiArY3VzdG9t
X3BhcmFtKCJzY2hlZC1ncmFuIiwgc2NoZWRfc2VsZWN0X2dyYW51bGFyaXR5KTsKPj4gKyNlbmRp
Zgo+IAo+IEknbSBzdXJwcmlzZWQgYnkgdGhlIHg4NiBkZXBlbmRlbmN5IGhlcmU6IEkgZGlkbid0
IHRoaW5rIEhUIG9yIG11bHRpLQo+IGNvcmUgYXJlIHg4Ni1vbmx5IGNvbmNlcHRzLiBFdmVuIGlm
IEFybSBtYXkgbm90IHdhbnQgdGhpcyByaWdodCBub3csCj4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gaGF2ZSBhIGRlZGljYXRlZCBLY29uZmlnIHNldHRpbmcsIHdoaWNoCj4gZm9yIG5v
dyBvbmx5IHg4NiB3b3VsZCBzZWxlY3QuCgpGaW5lIHdpdGggbWUuCgpJIGp1c3Qgd2FudGVkIHRv
IGhpZ2hsaWdodCB0aGF0IEFSTSBpcyBtaXNzaW5nIHNvbWUgY29kZSBpbiB0aGUgY29udGV4dApz
d2l0Y2hpbmcgYXJlYS4KCj4gQWxzbyB0aGVyZSBhcmUgc2V2ZXJhbCBtaXNzaW5nIGJsYW5rcyBo
ZXJlLgoKT2gsIGluZGVlZCEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
