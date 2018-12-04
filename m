From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Tue, 4 Dec 2018 01:08:00 -0800
Message-ID: <CACMJ4GaXTzB3GXtm8KYT=2Ycqp+QEG8ejAsnk38ErV8j5913dA@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <6c9074fa-eb9a-350b-1019-93c35803e0e1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3zo+=on=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gU6gg-0007eN-N7
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:08:14 +0000
Received: by mail-lj1-x243.google.com with SMTP id n18-v6so14172326lji.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 01:08:13 -0800 (PST)
In-Reply-To: <6c9074fa-eb9a-350b-1019-93c35803e0e1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, James McKenzie <voreekf@madingley.org>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com, eric chanudet <eric.chanudet@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBEZWMgMiwgMjAxOCBhdCAxMjoxMSBQTSBKdWxpZW4gR3JhbGwgPEp1bGllbi5HcmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAwMS8xMi8yMDE4IDAxOjMyLCBDaHJpc3RvcGhl
ciBDbGFyayB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJnby5o
IGIveGVuL2luY2x1ZGUvcHVibGljL2FyZ28uaAo+ID4gaW5kZXggMjBkYWJjMC4uNWFkOGUyYiAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmdvLmgKPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9hcmdvLmgKPiA+IEBAIC0yMSw2ICsyMSwyMCBAQAo+ID4KPiA+ICAgI2lu
Y2x1ZGUgInhlbi5oIgo+ID4KPiA+ICsjZGVmaW5lIEFSR09fUklOR19NQUdJQyAgICAgIDB4YmQ2
N2UxNjNlNzc3N2YyZlVMTAo+ID4gKwo+ID4gKyNkZWZpbmUgQVJHT19ET01JRF9BTlkgICAgICAg
ICAgIERPTUlEX0lOVkFMSUQKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFRoZSBtYXhpbXVtIHNpemUg
b2YgYW4gQXJnbyByaW5nIGlzIGRlZmluZWQgdG8gYmU6IDE2R0IKPiA+ICsgKiAgLS0gd2hpY2gg
aXMgMHgxMDAwMDAwIG9yIDE2Nzc3MjE2IGJ5dGVzLgo+ID4gKyAqIEEgYnl0ZSBpbmRleCBpbnRv
IHRoZSByaW5nIGlzIGF0IG1vc3QgMjQgYml0cy4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIEFSR09f
TUFYX1JJTkdfU0laRSAgKDE2Nzc3MjE2VUxMKQo+ID4gKwo+ID4gKy8qIHBmbiB0eXBlOiA2NC1i
aXQgb24gYWxsIGFyY2hpdGVjdHVyZXMgdG8gYWlkIGF2b2lkaW5nIGEgY29tcGF0IEFCSSAqLwo+
ID4gK3R5cGVkZWYgdWludDY0X3QgYXJnb19wZm5fdDsKPgo+IEFzIHlvdSBhbHdheXMgdXNlIDY0
LWJpdCwgY2FuIHdlIGp1c3QgdXNlIGFuIGFkZHJlc3M/IFRoaXMgd291bGQgbWFrZQo+IHRoZSBB
QkkgYWdub3N0aWMgdG8gdGhlIGh5cGVydmlzb3IgcGFnZSBncmFudWxhcml0eS4KClRoYW5rcyBm
b3IgcmV2aWV3aW5nIHRoaXMgc2VyaWVzLgoKSSdtIG5vdCBzdXJlIHlldCB0aGF0IHN3aXRjaGlu
ZyB0byB1c2luZyBhZGRyZXNzZXMgaW5zdGVhZCB3b3VsZCBiZQpmb3IgdGhlIGJlc3QsIHNvIGhh
dmUgYmVlbiB3b3JraW5nIHRocm91Z2ggc29tZSByZWFzb25pbmcgYWJvdXQgeW91cgpzdWdnZXN0
aW9uLiBUaGlzIGludGVyZmFjZSBpcyBmb3IgdGhlIGd1ZXN0IHRvIGlkZW50aWZ5IHRvIHRoZQpo
eXBlcnZpc29yIHRoZSBsaXN0IG9mIGZyYW1lcyBvZiBtZW1vcnkgdG8gdXNlIGFzIHRoZSByaW5n
LCBhbmQgdGhlCnB1cnBvc2Ugb2YgYSBmcmFtZSBudW1iZXIgaXMgdG8gdW5pcXVlbHkgaWRlbnRp
ZnkgYSBmcmFtZS4gRnJhbWUKbnVtYmVycywgYXMgb3Bwb3NlZCB0byBhZGRyZXNzZXMsIGFyZSBn
b2luZyB0byByZW1haW4gdGhlIHNhbWUgYWNyb3NzCmFsbCBwcm9jZXNzb3JzLCBpbmRlcGVuZGVu
dCBvZiB0aGUgcGFnZSB0YWJsZXMgdGhhdCBoYXBwZW4gdG8KY3VycmVudGx5IGJlIGluIHVzZS4K
CldoZXJlIHBvc3NpYmxlLCB0cmFuc2xhdGlvbiBzaG91bGQgYmUgcGVyZm9ybWVkIGJ5IHRoZSBn
dWVzdCByYXRoZXIKdGhhbiB0aGUgaHlwZXJ2aXNvciwgbWluaW1pemluZyB0aGUgaHlwZXJ2aXNv
ciBsb2dpYyAoZ29vZCBmb3Igc2V2ZXJhbApyZWFzb25zKSAtIHNvIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBhdm9pZCBhZGRpbmcgdGhlCmFkZHJlc3MtdG8tcGFnZS1udW1iZXIgd2FsayBhbmQgZ3Jh
bnVsYXJpdHkgaGFuZGxpbmcgaW4gdGhlIGh5cGVydmlzb3IKaGVyZS4gSW4gdGhpcyBjYXNlLCB0
aGUgZ3Vlc3QgaGFzIHRoZSBpbmNlbnRpdmUgdG8gZG8gdGhhdCB3b3JrLCBnaXZlbgp0aGF0IGl0
IHdhbnRzIHRvIHJlZ2lzdGVyIHRoZSByaW5nLgoKKFNsaWdodGx5IG91dCBvZiBzY29wZSwgYnV0
IGhvcGVmdWxseSBub3QgZm9yIGxvbmc6IFdlIGhhdmUgYQpuZWFyLXRlcm0gaW50ZXJlc3QgaW4g
dXNpbmcgYXJnbyB0byBjb21tdW5pY2F0ZSBiZXR3ZWVuIFZNcyBhdApkaWZmZXJlbnQgbGV2ZWxz
IG9mIG5lc3RpbmcgaW4gTDAvTDEgbmVzdGVkIGh5cGVydmlzb3JzLCBhbmQgSSBzdXNwZWN0CnRo
YXQgZnJhbWUgbnVtYmVyIHRyYW5zbGF0aW9uIHdpbGwgZW5kIHVwIGJlaW5nIGVhc2llciB0byBo
YW5kbGUKYWNyb3NzIEwwL0wxIHRoYW4gdHJhbnNsYXRpb24gb2YgZ3Vlc3QgYWRkcmVzc2VzIGlu
IGEgVk0gcnVubmluZyBhdAp0aGUgb3RoZXIgbGV2ZWwuKQoKQ291bGQgeW91IGdpdmUgYSBzcGVj
aWZpYyBzY2VuYXJpbyB5b3UgaGF2ZSBpbiBtaW5kIHRoYXQgaXMgcHJvbXB0aW5nIGEgY29uY2Vy
bj8KCkNocmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
