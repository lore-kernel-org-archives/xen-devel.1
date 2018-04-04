From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm/ioreq: fix out of bounds access in
 error path
Date: Wed, 4 Apr 2018 12:17:33 +0100
Message-ID: <321f58e2-1333-dc65-ebc1-609ce6563673@citrix.com>
References: <20180404110314.16762-1-wei.liu2@citrix.com>
 <3af815d38c504742aaf219b047c3be63@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5rvm=gz=citrix.com=prvs=625f92827=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f3gQ3-0000Tm-Ja
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 11:17:35 +0000
In-Reply-To: <3af815d38c504742aaf219b047c3be63@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMTggMTI6MTEsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogV2VpIExpdSBbbWFpbHRvOndlaS5saXUyQGNpdHJpeC5jb21d
Cj4+IFNlbnQ6IDA0IEFwcmlsIDIwMTggMTI6MDMKPj4gVG86IFhlbi1kZXZlbCA8eGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj4+IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPj4gPFBhdWwuRHVycmFudEBj
aXRyaXguY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0hdIHg4Ni9odm0vaW9yZXE6IGZpeCBvdXQgb2Yg
Ym91bmRzIGFjY2VzcyBpbiBlcnJvciBwYXRoCj4+Cj4+IEl0IGlzIHBvc3NpYmxlIHRvIGNhbGwg
dGhlIGVycm9yIHBhdGggd2l0aCBpIHBvaW50aW5nIGJleW9uZCB0aGUgZW5kCj4+IG9mIHRoZSBh
cnJheS4KPj4KPj4gVGhlcmUgaXMgYW5vdGhlciBidWcgdGhhdCBpZiB0aGVyZSBpcyBhbHJlYWR5
IGEgZGVmYXVsdCBpb3JlcSBzZXJ2ZXIsCj4+IHRoZSBjb2RlIHdpbGwgYWN0dWFsbHkgc2V0cyB0
aGUgZWxlbWVudCB0byBOVUxMLCBoZW5jZSBsZWFraW5nIG1lbW9yeS4KPj4KPj4gTW92ZSBzZXR0
aW5nIE5VTEwgdG8gd2hlcmUgaXQgaXMgbmVlZGVkLgo+Pgo+PiBDb3Zlcml0eS1JRDogMTQzMzc3
Nwo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
