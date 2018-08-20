From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] xenpmd: prevent format-truncation warning
 with gcc 8.2 + ARM 32-bit
Date: Mon, 20 Aug 2018 10:06:38 -0700
Message-ID: <CACMJ4Gb_9bqzi4VAPsMVC1C3GYqZaLLWeoyxjMOyw7moNVtv=Q@mail.gmail.com>
References: <1534555336-10318-1-git-send-email-christopher.w.clark@gmail.com>
 <20180820142102.mcqdbkt2hv4umj6l@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nasa=ld=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1frnda-0000ng-Ai
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 17:06:42 +0000
Received: by mail-lj1-x243.google.com with SMTP id u7-v6so12172856lji.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Aug 2018 10:06:40 -0700 (PDT)
In-Reply-To: <20180820142102.mcqdbkt2hv4umj6l@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgNzoyMSBBTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDY6MjI6MTZQTSAtMDcwMCwg
Q2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cgo+Pgo+PiBQcmlvciB0byB0aGlzIGNoYW5nZSwgYnVp
bGRpbmcgZmFpbHMgd2l0aCB0aGUgY29tcGlsZXIgd2FybmluZzoKPj4KPj4gfCB4ZW5wbWQuYzog
SW4gZnVuY3Rpb24gJ3dyaXRlX2JhdHRlcnlfaW5mb190b194ZW5zdG9yZSc6Cj4+IHwgeGVucG1k
LmM6MzU0OjIzOiBlcnJvcjogJyUwMngnIGRpcmVjdGl2ZSBvdXRwdXQgbWF5IGJlIHRydW5jYXRl
ZAo+PiB3cml0aW5nIGJldHdlZW4gMiBhbmQgOCBieXRlcyBpbnRvIGEgcmVnaW9uIG9mIHNpemUg
Mwo+PiBbLVdlcnJvcj1mb3JtYXQtdHJ1bmNhdGlvbj1dCj4+IHwgICAgICBzbnByaW50Zih2YWws
IDMsICIlMDJ4IiwKPj4gfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KPj4gfCB4ZW5wbWQu
YzozNTQ6MjI6IG5vdGU6IGRpcmVjdGl2ZSBhcmd1bWVudCBpbiB0aGUgcmFuZ2UgWzQwLCAyMTQ3
NDgzNzc4XQo+PiB8ICAgICAgc25wcmludGYodmFsLCAzLCAiJTAyeCIsCj4+IHwgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fgo+PiB8IHhlbnBtZC5jOjM1NDo1OiBub3RlOiAnc25wcmludGYn
IG91dHB1dCBiZXR3ZWVuIDMgYW5kIDkgYnl0ZXMgaW50byBhCj4+IGRlc3RpbmF0aW9uIG9mIHNp
emUgMwo+PiB8ICAgICAgc25wcmludGYodmFsLCAzLCAiJTAyeCIsCj4+IHwgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPj4gfCAgICAgICAgICAgICAgICh1bnNpZ25lZCBpbnQpKDkqNCAr
Cj4+IHwgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RybGVuKGluZm8tPm1vZGVsX251bWJlcikgKwo+PiB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RybGVuKGluZm8tPnNlcmlhbF9udW1iZXIp
ICsKPj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4+IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJsZW4oaW5mby0+
YmF0dGVyeV90eXBlKSArCj4+IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJsZW4oaW5mby0+b2VtX2luZm8pICsgNCkpOwo+PiB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiB8IGNjMTogYWxsIHdhcm5pbmdz
IGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVy
IENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4KPiBIbW0uLi4gSSBq
dXN0IHB1c2hlZCBhIGRpZmZlcmVudCBmaXggZm9yIHRoaXMgdG8gc3RhZ2luZy4gQ2FuIHlvdSB0
cnkgaWYKPiB0aGF0IHdvcmtzIGZvciB5b3U/CgpZZXAsIGxvb2tzIG9rIGFuZCB0aGF0IGJ1aWxk
cyBmaW5lLgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFy
azZAYmFlc3lzdGVtcy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
