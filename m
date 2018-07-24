From: Julien Grall <julien.grall@arm.com>
Subject: Re: [Minios-devel] automation: Creating a patchwork
 instance to improve pre-commit build testing
Date: Tue, 24 Jul 2018 15:05:09 +0100
Message-ID: <6da2f372-4fb6-1560-2ecd-fe0fb204eb57@arm.com>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <A926ADEA-FB93-4AE8-9529-09F429FC8E3B@citrix.com>
 <tza4s2sh48vopp.fsf@N-1128.office.hd>
 <5B5714C102000078001D72E6@prv1-mh.provo.novell.com>
 <BD4DCDDD-FECC-40D6-BD0F-BF1D79237662@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lo6a=ki=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fhxwB-0001a4-7f
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 14:05:15 +0000
In-Reply-To: <BD4DCDDD-FECC-40D6-BD0F-BF1D79237662@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>, Jan Beulich <JBeulich@suse.com>, Yuri Volchkov <yuri.volchkov@neclab.eu>
Cc: Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Minios-devel <minios-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNC8wNy8xOCAxMzo0NSwgTGFycyBLdXJ0aCB3cm90ZToKPiAKPiAKPiDvu79PbiAyNC8w
Ny8yMDE4LCAxMzowMCwgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
IAo+ICAgICAgPj4+IE9uIDI0LjA3LjE4IGF0IDEzOjQ4LCA8eXVyaS52b2xjaGtvdkBuZWNsYWIu
ZXU+IHdyb3RlOgo+ICAgICAgPiBJbiBteSBwZXJzb25hbCBvcGluaW9uLCBqdXN0IHNlbmRpbmcg
Q0kgZW1haWwgYXMgInJlcGx5LWFsbCIgaXMgZmluZS4gSQo+ICAgICAgPiBkbyBub3QgbWluZCBo
YXZpbmcgYW4gZXh0cmEgZW1haWwgcGVyIHBhdGNoIGluIG15IG1haWxib3guCj4gICAgICAKPiAg
ICAgIFRoaXMgaXMgZXhhY3RseSB3aGF0IEknbSBhZnJhaWQgb2YgLSB3aGVuIHlvdSdyZSBDYy1l
ZCBvbiBhIGxvdCBvZgo+ICAgICAgcGF0Y2hlcywgeW91IG1heSB0aGVuIGFsc28gZ2V0IGEgbG90
IG9mIG1haWxzIGhlcmUuIEFuZCBubywgb3RoZXIKPiAgICAgIHRoYW4gc3VnZ2VzdGVkIGVsc2V3
aGVyZSwgSSdtIG5ldmVyIGdvaW5nIHRvIGhhdmUgYSBydWxlIHRvIHB1c2gKPiAgICAgIGFsbCBt
YWlscyBtYXRjaGluZyBjZXJ0YWluIGNyaXRlcmlhIHJpZ2h0IGludG8gdHJhc2ggLSB0aGVyZSdz
IGFsd2F5cwo+ICAgICAgdGhlIHJpc2sgb2YgYSBmYWxzZSBwb3NpdGl2ZS4gSXQgaXMgaW1vIF9h
bHdheXNfIHRoZSBzZW5kaW5nIHNpZGUKPiAgICAgIHdoaWNoIG5lZWRzIHRvIGp1ZGdlIHdobyBu
ZWVkcyB0byBiZSBvbiB0aGUgVG8vQ2MgbGlzdHMgb2YgYSBtYWlsLAo+ICAgICAgbmV2ZXIgdGhl
IHJlY2VpdmluZyBzaWRlIHRvICJwYXBlciBvdmVyIiBtaXN0YWtlcyB0aGUgc2VuZGVyIGhhcwo+
ICAgICAgbWFkZS4KPiAgICAgIAo+IEkgYmVsaWV2ZSB0aGVyZSBpcyBxdWl0ZSBhIGJpdCBvZiBm
cmVlZG9tIG9uIGhvdyB3ZSB3b3VsZCBpbXBsZW1lbnQgdGhpcy4KPiAKPiBARG91ZzogcGxlYXNl
IGNvcnJlY3QgbWUgaWYgdGhpcyBpcyB3cm9uZy4KPiAKPiBGb3IgZXhhbXBsZTogd2UgY291bGQg
ZG8gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZwo+ICogQ29udHJpYnV0b3Igc2VuZHMgc2Vy
aWVzIHRvIHhlbi1kZXZlbEAgKG9yIGlmIG5lY2Vzc2FyeSB0byBzb21lCj4gYWxpYXMgb3IgYSBk
aWZmZXJlbnQgbmV3IGxpc3QpCj4gKiBQYXRjaGJvdCB0byB0YWtlIG1haWwgb2ZmIGxpc3QgYW5k
IHJ1biB0aGUgdGVzdHMKPiAqIFBhdGNoYm90IHRvIGF1Z21lbnQgdGhlIG9yaWdpbmFsIG1haWwo
cykgd2l0aCBlbWJlZGRlZAo+IHRlc3QgcmVzdWx0cyBhbmQvb3IgVGVzdGVkLWJ5OiB0YWdzIHRv
IGFuZCBzZW5kIGl0IHRvIHhlbi1kZXZlbEAKPiAqIEF1Z21lbnRlZCBtYWlsIHRvIGJlIHNlbnQg
dG8geGVuLWRldmVsQCBhcyBpZiBpdCBjYW1lIGZyb20KPiBzZW5kZXIgLSBhbHRob3VnaCB0aGlz
IG1heSBjYXVzZSBwcm9ibGVtcyB3aXRoIHNvbWUgbWFpbAo+IGNsaWVudHMKPiAKPiBPciB3ZSBj
b3VsZCBwdXNoIHRoZSBidXJkZW4gb250byB0aGUgY29udHJpYnV0b3IsIGUuZy4KPiAqIENvbnRy
aWJ1dG9yIHRvIHNlbmQgc2VyaWVzIHRvIHRlc3Qgc2VydmljZQo+ICogQ29udHJpYnV0b3Igd2ls
bCBnZXQgcmVzdWx0cyAoaW5jbHVkaW5nIHNvbWUgVVJMIHBvaW50aW5nIHRvIHJlc3VsdHMpCj4g
KiBJZiBzdWNjZWVkZWQgb3IgdGhlcmUgaXMgYW5vdGhlciBnb29kIHJlYXNvbiB0byBzZW5kIHRo
ZSBzZXJpZXM6Cj4gQ29udHJpYnV0b3IgdG8gc2VuZCBtYWlsIHRvIHhlbi1kZXZlbEAgd2l0aCBh
IHJlZmVyZW5jZSB0byB0aGUgcmVzdWx0cwo+IGluIHRoZSBwYXRjaAoKSSB3b3VsZCBwcmVmZXIg
dGhlIGZpcnN0IHNvbHV0aW9uLiBJZiB5b3UgcHVzaCB0aGUgYnVyZGVuIG9udG8gdGhlIApjb250
cmlidXRvciwgeW91IGluY3JlYXNlIHBvdGVudGlhbCBkaXNjcmVwYW5jeSBiZXR3ZWVuIHRoZSBz
ZXJpZXMgCnRlc3RlZCBhbmQgc2VudC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
