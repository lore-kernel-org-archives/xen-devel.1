From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Minios-devel] automation: Creating a patchwork
 instance to improve pre-commit build testing
Date: Tue, 24 Jul 2018 12:45:12 +0000
Message-ID: <BD4DCDDD-FECC-40D6-BD0F-BF1D79237662@citrix.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <A926ADEA-FB93-4AE8-9529-09F429FC8E3B@citrix.com>
 <tza4s2sh48vopp.fsf@N-1128.office.hd>
 <5B5714C102000078001D72E6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2ds=ki=citrix.com=prvs=736251401=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fhwgn-0002n3-1O
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 12:45:17 +0000
In-Reply-To: <5B5714C102000078001D72E6@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <A9F1DFD8951D9E45B177A0C57908D1CB@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Yuri Volchkov <yuri.volchkov@neclab.eu>
Cc: Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Minios-devel <minios-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDI0LzA3LzIwMTgsIDEzOjAwLCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjQuMDcuMTggYXQgMTM6NDgsIDx5dXJpLnZvbGNo
a292QG5lY2xhYi5ldT4gd3JvdGU6DQogICAgPiBJbiBteSBwZXJzb25hbCBvcGluaW9uLCBqdXN0
IHNlbmRpbmcgQ0kgZW1haWwgYXMgInJlcGx5LWFsbCIgaXMgZmluZS4gSQ0KICAgID4gZG8gbm90
IG1pbmQgaGF2aW5nIGFuIGV4dHJhIGVtYWlsIHBlciBwYXRjaCBpbiBteSBtYWlsYm94Lg0KICAg
IA0KICAgIFRoaXMgaXMgZXhhY3RseSB3aGF0IEknbSBhZnJhaWQgb2YgLSB3aGVuIHlvdSdyZSBD
Yy1lZCBvbiBhIGxvdCBvZg0KICAgIHBhdGNoZXMsIHlvdSBtYXkgdGhlbiBhbHNvIGdldCBhIGxv
dCBvZiBtYWlscyBoZXJlLiBBbmQgbm8sIG90aGVyDQogICAgdGhhbiBzdWdnZXN0ZWQgZWxzZXdo
ZXJlLCBJJ20gbmV2ZXIgZ29pbmcgdG8gaGF2ZSBhIHJ1bGUgdG8gcHVzaA0KICAgIGFsbCBtYWls
cyBtYXRjaGluZyBjZXJ0YWluIGNyaXRlcmlhIHJpZ2h0IGludG8gdHJhc2ggLSB0aGVyZSdzIGFs
d2F5cw0KICAgIHRoZSByaXNrIG9mIGEgZmFsc2UgcG9zaXRpdmUuIEl0IGlzIGltbyBfYWx3YXlz
XyB0aGUgc2VuZGluZyBzaWRlDQogICAgd2hpY2ggbmVlZHMgdG8ganVkZ2Ugd2hvIG5lZWRzIHRv
IGJlIG9uIHRoZSBUby9DYyBsaXN0cyBvZiBhIG1haWwsDQogICAgbmV2ZXIgdGhlIHJlY2Vpdmlu
ZyBzaWRlIHRvICJwYXBlciBvdmVyIiBtaXN0YWtlcyB0aGUgc2VuZGVyIGhhcw0KICAgIG1hZGUu
DQogICAgDQpJIGJlbGlldmUgdGhlcmUgaXMgcXVpdGUgYSBiaXQgb2YgZnJlZWRvbSBvbiBob3cg
d2Ugd291bGQgaW1wbGVtZW50IHRoaXMuDQoNCkBEb3VnOiBwbGVhc2UgY29ycmVjdCBtZSBpZiB0
aGlzIGlzIHdyb25nLg0KDQpGb3IgZXhhbXBsZTogd2UgY291bGQgZG8gc29tZXRoaW5nIGxpa2Ug
dGhlIGZvbGxvd2luZw0KKiBDb250cmlidXRvciBzZW5kcyBzZXJpZXMgdG8geGVuLWRldmVsQCAo
b3IgaWYgbmVjZXNzYXJ5IHRvIHNvbWUgDQphbGlhcyBvciBhIGRpZmZlcmVudCBuZXcgbGlzdCkN
CiogUGF0Y2hib3QgdG8gdGFrZSBtYWlsIG9mZiBsaXN0IGFuZCBydW4gdGhlIHRlc3RzDQoqIFBh
dGNoYm90IHRvIGF1Z21lbnQgdGhlIG9yaWdpbmFsIG1haWwocykgd2l0aCBlbWJlZGRlZCANCnRl
c3QgcmVzdWx0cyBhbmQvb3IgVGVzdGVkLWJ5OiB0YWdzIHRvIGFuZCBzZW5kIGl0IHRvIHhlbi1k
ZXZlbEANCiogQXVnbWVudGVkIG1haWwgdG8gYmUgc2VudCB0byB4ZW4tZGV2ZWxAIGFzIGlmIGl0
IGNhbWUgZnJvbQ0Kc2VuZGVyIC0gYWx0aG91Z2ggdGhpcyBtYXkgY2F1c2UgcHJvYmxlbXMgd2l0
aCBzb21lIG1haWwNCmNsaWVudHMNCg0KT3Igd2UgY291bGQgcHVzaCB0aGUgYnVyZGVuIG9udG8g
dGhlIGNvbnRyaWJ1dG9yLCBlLmcuDQoqIENvbnRyaWJ1dG9yIHRvIHNlbmQgc2VyaWVzIHRvIHRl
c3Qgc2VydmljZSANCiogQ29udHJpYnV0b3Igd2lsbCBnZXQgcmVzdWx0cyAoaW5jbHVkaW5nIHNv
bWUgVVJMIHBvaW50aW5nIHRvIHJlc3VsdHMpDQoqIElmIHN1Y2NlZWRlZCBvciB0aGVyZSBpcyBh
bm90aGVyIGdvb2QgcmVhc29uIHRvIHNlbmQgdGhlIHNlcmllczogDQpDb250cmlidXRvciB0byBz
ZW5kIG1haWwgdG8geGVuLWRldmVsQCB3aXRoIGEgcmVmZXJlbmNlIHRvIHRoZSByZXN1bHRzIA0K
aW4gdGhlIHBhdGNoDQoNCkxhcnMNCiAgICANCiAgICANCiAgICANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
