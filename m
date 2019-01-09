From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH] tmem: default to off
Date: Wed, 9 Jan 2019 17:53:09 +0100
Message-ID: <CAPLaKK4pK2EiBVR1nXSkasuGorSZJkjO7M0CeUXbW5XZgcvkyg@mail.gmail.com>
References: <5C35B94F020000780020BB36@prv1-mh.provo.novell.com>
 <1547046169812.74855@citrix.com>
 <5C3612F3020000780020BDE4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fPtS=PR=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghH6Z-0002Id-2P
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 16:53:23 +0000
Received: by mail-oi1-f194.google.com with SMTP id m6so6817479oig.11
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 08:53:21 -0800 (PST)
In-Reply-To: <5C3612F3020000780020BDE4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA0OjI4IFBNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDkuMDEuMTkgYXQgMTY6MDIsIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBvbiBiZWhhbGYgb2YgSmFuIEJldWxpY2gKPiA+IDxKQmV1bGlj
aEBzdXNlLmNvbT46Cj4gPiAtLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCj4gPiArKysgYi94ZW4v
Y29tbW9uL01ha2VmaWxlCj4gPiBAQCAtMjEsNyArMjEsNyBAQCBvYmotJChDT05GSUdfS0VYRUMp
ICs9IGtpbWFnZS5vCj4gPiAgb2JqLXkgKz0gbGliLm8KPiA+ICBvYmotJChDT05GSUdfTkVFRFNf
TElTVF9TT1JUKSArPSBsaXN0X3NvcnQubwo+ID4gIG9iai0kKENPTkZJR19MSVZFUEFUQ0gpICs9
IGxpdmVwYXRjaC5vIGxpdmVwYXRjaF9lbGYubwo+ID4gLW9iai15ICs9IGx6by5vCj4gPiArb2Jq
LSQoQ09ORklHX1RNRU0pICs9IGx6by5vCj4gPgo+ID4gSGVyZSB5b3UgY29tcGxldGVseSBkaXNh
YmxlIHRoZSBidWlsZCBvZiBsem8gaWYgdG1lbSBpcyBub3QgZW5hYmxlZC4KPiA+Cj4gPiAgb2Jq
LSQoQ09ORklHX01FTV9BQ0NFU1MpICs9IG1lbV9hY2Nlc3Mubwo+ID4gIG9iai15ICs9IG1lbW9y
eS5vCj4gPiAgb2JqLXkgKz0gbW9uaXRvci5vCj4gPiBAQCAtNjYsOCArNjYsOSBAQCBvYmotYmlu
LXkgKz0gd2FybmluZy5pbml0Lm8KPiA+ICBvYmotJChDT05GSUdfWEVOT1BST0YpICs9IHhlbm9w
cm9mLm8KPiA+ICBvYmoteSArPSB4bWFsbG9jX3Rsc2Yubwo+ID4KPiA+IC1vYmotYmluLSQoQ09O
RklHX1g4NikgKz0gJChmb3JlYWNoIG4sZGVjb21wcmVzcyBidW56aXAyIHVueHogdW5sem1hIHVu
bHpvCj4gPiB1bmx6NCBlYXJseWNwaW8sJChuKS5pbml0Lm8pCj4gPiAtCj4gPiArbHpvLXkgOj0g
bHpvCj4gPiArbHpvLSQoQ09ORklHX1RNRU0pIDo9Cj4gPiArb2JqLWJpbi0kKENPTkZJR19YODYp
ICs9ICQoZm9yZWFjaCBuLGRlY29tcHJlc3MgYnVuemlwMiB1bnh6IHVubHptYSAkKGx6by15KSB1
bmx6byB1bmx6NCBlYXJseWNwaW8sJChuKS5pbml0Lm8pCj4gPgo+ID4gSGVyZSBob3dldmVyIHlv
dSBhbHdheXMgYnVpbGQgdW5sem8uYywgd2hpY2ggQUZBSUNUIG1ha2VzIHVzZSBvZiB0aGUKPiA+
IGx6bzF4X2RlY29tcHJlc3Nfc2FmZSBmdW5jdGlvbiB0aGF0J3MgZGVmaW5lZCBpbiBsem8uYy4K
Pgo+IE5vdGUgdGhlIChuZXcpIGRlZmluaXRpb24gYW5kIHVzZSBvZiBsem8teSwgc28gdG9nZXRo
ZXIgd2l0aCB1bmx6by5pbml0Lm8KPiBsem8uaW5pdC5vIHdpbGwgYWxzbyBiZSBidWlsdC4gKEkg
Y2FuIGFzc3VyZSB5b3UgdGhhdCBJIGRpZCB0ZXN0IHdpdGggVE1FTQo+IGVuYWJsZWQgYW5kIGRp
c2FibGVkLikKCk9oIHNvcnJ5LCBtaXNzZWQgaXQuIFRoYXQgbWFrZXMgdGhlIGx6byBwYXJ0cyBu
ZWVkIHdoZW4gbm90IHVzaW5nIHRtZW0KYmUgcGxhY2VkIChhbmQgY2hlY2tlZCkgdG8gYmUgaW4g
dGhlIGluaXQgc2VjdGlvbi4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
