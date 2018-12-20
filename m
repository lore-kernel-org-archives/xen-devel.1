From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 24/25] argo: unmap rings on suspend and send
 signal to ring-owners on resume
Date: Wed, 19 Dec 2018 22:25:59 -0800
Message-ID: <CACMJ4GauDzbyxc777wu9ZvTQNfyzu8KOLzkYNR7UfzJFzkpLxQ@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-25-git-send-email-christopher.w.clark@gmail.com>
 <5C126C060200007800205E28@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrmf-0004l2-CB
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:26:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so482952ljd.12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:26:12 -0800 (PST)
In-Reply-To: <5C126C060200007800205E28@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgNjoyNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMzLCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gc28gdGhhdCB0aGUgZ3Vlc3QgbWF5IHJlLXJl
Z2lzdGVyIHRoZSByaW5ncyBvbiByZXN1bWUgd2l0aCBjdXJyZW50IG1hcHBpbmdzLgo+Cj4gSXMg
dGhpcyBzb21ldGhpbmcgZ3Vlc3RzIHJlYWxseSBuZWVkIGhlbHAgd2l0aCwgcmF0aGVyIHRoYW4g
bWFuYWdpbmcKPiBpdCBvbiB0aGVpciBvd24/IFdoYXQgZG9lcyAiY3VycmVudCBtYXBwaW5ncyIg
aGVyZSBtZWFuLCBpLmUuIHdoeQo+IGRvIHJpbmdzIG5lZWQgcmUtcmVnaXN0cmF0aW9uIGluIHRo
ZSBmaXJzdCBwbGFjZT8KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgZ2ZuLT5tZm4gbWFw
cGluZyBpcyBub3QgbmVjZXNzYXJpbHkKc3RhYmxlIGFjcm9zcyBlbnRyeSBhbmQgZXhpdCB0byBo
b3N0IFM0LCBzdXNwZW5kIHRvIGRpc2ssIHNvIHRoZQpyaW5ncyBuZWVkIHRvIGJlIHRvcm4gZG93
biBiZWZvcmUgc3VzcGVuZCB0byBzdG9wIGZ1cnRoZXIgd3JpdGVzCmludG8gdGhvc2UgcGFnZXMg
YWZ0ZXIgcmVzdW1lLgpXaGVuIHRoZSBndWVzdCBnZXRzIHRoZSBub3RpZmljYXRpb24gYWZ0ZXIg
cmVzdW1lLCBpdCBjYW4KcmUtcmVnaXN0ZXIgdGhlIHJpbmdzIHdpdGggaXRzIGxpc3Qgb2YgZ2Zu
cywgd2hpY2ggY2FuIHRoZW4KYmUgcmUtdHJhbnNsYXRlZCBpbnRvIHRoZSAocG9zc2libHkpIG5l
dyBtZm5zIG5lZWRlZCBmb3IgdGhlIHJpbmcuCgo+ID4gK3ZvaWQKPiA+ICthcmdvX3Jlc3VtZShz
dHJ1Y3QgZG9tYWluICpkKQo+ID4gK3sKPiA+ICsgICAgYm9vbCBzZW5kX3dha2V1cDsKPiA+ICsK
PiA+ICsgICAgaWYgKCAhZCApCj4gPiArICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgIGlm
ICggIWdldF9kb21haW4oZCkgKQo+ID4gKyAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICBy
ZWFkX2xvY2soJmFyZ29fbG9jayk7Cj4gPiArCj4gPiArICAgIHJlYWRfbG9jaygmZC0+YXJnby0+
bG9jayk7Cj4gPiArICAgIHNlbmRfd2FrZXVwID0gKCBkLT5hcmdvLT5yaW5nX2NvdW50ID4gMCAp
Owo+ID4gKyAgICByZWFkX3VubG9jaygmZC0+YXJnby0+bG9jayk7Cj4gPiArCj4gPiArICAgIGlm
ICggc2VuZF93YWtldXAgKQo+ID4gKyAgICAgICAgYXJnb19zaWduYWxfZG9tYWluKGQpOwo+ID4g
Kwo+ID4gKyAgICByZWFkX3VubG9jaygmYXJnb19sb2NrKTsKPiA+ICsKPiA+ICsgICAgcHV0X2Rv
bWFpbihkKTsKPiA+ICt9Cj4KPiBkb21haW5fcmVzdW1lKCkgYWxzbyBnZXRzIGNhbGxlZCBmcm9t
IGRvbWFpbl9zb2Z0X3Jlc2V0KCkuIERvCj4geW91IHJlYWxseSB3YW50IHN1Y2ggaGFuZGxpbmcg
aW4gdGhhdCBjYXNlIGFzIHdlbGwsIHdoZW4gYWZ0ZXIgYQo+IHNvZnQtcmVzZXQgdGhlIGRvbWFp
biBpcyBzdXBwb3NlZCB0byBiZSAiYmxhbmsiPwoKVGhhbmtzIGZvciB0aGUgcG9pbnRlciB0byBz
b2Z0IHJlc2V0OiBJJ3ZlIGFkZGVkIGltcGxlbWVudGF0aW9uCmZvciB0aGlzIHRvIHRoZSBuZXh0
IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcywgYW5kIGl0J2xsIGJlIGZpbmUKd2l0aCByZXN1
bWUgdGhlbi4KCkNocmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
