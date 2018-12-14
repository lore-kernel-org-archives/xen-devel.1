From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a
 few
Date: Fri, 14 Dec 2018 13:34:14 +0000
Message-ID: <CAFEAcA_aq2LftJbNPmQREghDhFWqFhM7tgRoK33uRbKbd-oeVQ__25239.9770114154$1544794407$gmane$org@mail.gmail.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bmA8=OX=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gXnbp-0003Cc-NY
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 13:34:29 +0000
Received: by mail-ot1-x343.google.com with SMTP id u16so5366684otk.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Dec 2018 05:34:27 -0800 (PST)
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Qemu-block <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, andrzej zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMyBEZWMgMjAxOCBhdCAyMjozOCwgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBNb3N0IGZpbGVzIHRoYXQgaGF2ZSBUQUJzIG9ubHkgY29udGFp
biBhIGhhbmRmdWwgb2YgdGhlbS4gIENoYW5nZQo+IHRoZW0gdG8gc3BhY2VzIHNvIHRoYXQgd2Ug
ZG9uJ3QgY29uZnVzZSBwZW9wbGUuCj4KPiBkaXNhcywgc3RhbmRhcmQtaGVhZGVycywgbGludXgt
aGVhZGVycyBhbmQgbGliZGVjbnVtYmVyIGFyZSBpbXBvcnRlZAo+IGZyb20gb3RoZXIgcHJvamVj
dHMgYW5kIHByb2JhYmx5IHNob3VsZCBiZSBleGVtcHRlZCBmcm9tIHRoZSBjaGVjay4KPiBPdXRz
aWRlIHRob3NlLCBhZnRlciB0aGlzIHBhdGNoIHRoZSBmb2xsb3dpbmcgZmlsZXMgc3RpbGwgY29u
dGFpbiBib3RoCj4gOC1zcGFjZSBhbmQgVEFCIHNlcXVlbmNlcyBhdCB0aGUgYmVnaW5uaW5nIG9m
IHRoZSBsaW5lLiAgTWFueSBvZiB0aGVtCj4gaGF2ZSBhIG1ham9yaXR5IG9mIFRBQnMsIG9yIHdl
cmUgaW5pdGlhbGx5IGNvbW1pdHRlZCB3aXRoIGFsbCB0YWJzLgo+Cgo+IGRpZmYgLS1naXQgYS9o
dy9hcm0vdmlydC5jIGIvaHcvYXJtL3ZpcnQuYwo+IGluZGV4IDE3ZjFiNDlkMTEuLmFkNmZhOGUz
YzYgMTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL3ZpcnQuYwo+ICsrKyBiL2h3L2FybS92aXJ0LmMKPiBA
QCAtMTg1NCw3ICsxODU0LDcgQEAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIHZpcnRfbWFjaGluZV9p
bmZvID0gewo+ICAgICAgLmluc3RhbmNlX3NpemUgPSBzaXplb2YoVmlydE1hY2hpbmVTdGF0ZSks
Cj4gICAgICAuY2xhc3Nfc2l6ZSAgICA9IHNpemVvZihWaXJ0TWFjaGluZUNsYXNzKSwKPiAgICAg
IC5jbGFzc19pbml0ICAgID0gdmlydF9tYWNoaW5lX2NsYXNzX2luaXQsCj4gLSAgICAgICAuaW5z
dGFuY2VfaW5pdCA9IHZpcnRfaW5zdGFuY2VfaW5pdCwKPiArICAgICAgICAuaW5zdGFuY2VfaW5p
dCA9IHZpcnRfaW5zdGFuY2VfaW5pdCwKPiAgICAgIC5pbnRlcmZhY2VzID0gKEludGVyZmFjZUlu
Zm9bXSkgewo+ICAgICAgICAgICB7IFRZUEVfSE9UUExVR19IQU5ETEVSIH0sCj4gICAgICAgICAg
IHsgfQoKVGhpcyBvbmUgZ2V0cyB0aGUgYWxpZ25tZW50IHdyb25nIC0tIHRoZSBwZXJzb24gd2hv
IHdyb3RlCnRoYXQgbXVzdCBoYXZlIGhhZCB0YWJzIHNldCB0byA0LXNwYWNlLiBFZHVhcmRvIGhh
cyBzZW50IGEKcGF0Y2ggd2hpY2ggZml4ZXMgaXQgdXAgKCJ2aXJ0OiBGaXggYnJva2VuIGluZGVu
dGF0aW9uIiksCndoaWNoIEkndmUgcXVldWVkLCBzbyB0aGlzIGlzIGp1c3QgYSBoZWFkcy11cCBh
Ym91dCB0aGUKcmVzdWx0aW5nIHRyaXZpYWwgY29uZmxpY3QuCgp0aGFua3MKLS0gUE1NCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
