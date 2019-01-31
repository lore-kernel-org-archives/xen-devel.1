From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Wed, 30 Jan 2019 20:05:30 -0800
Message-ID: <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3bm-0004TP-P4
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:05:46 +0000
Received: by mail-lf1-x142.google.com with SMTP id p6so1279192lfc.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:05:44 -0800 (PST)
In-Reply-To: <20190122141702.h3oxvr25xjxbhjcl@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgNjoxOSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAyMSwgMjAxOSBhdCAwMTo1OTo0
MEFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiA+IFZlcnNpb24gZml2ZSBvZiB0
aGlzIHBhdGNoIHNlcmllczoKPiA+Cj4gPiAqIENoYW5nZXMgYXJlIHByaW1hcmlseSBhZGRyZXNz
aW5nIGZlZWRiYWNrIGZyb20gdGhlIHY0IHNlcmllcyByZXZpZXdzLgo+ID4gICBNYW55IHBvaW50
cyBub3RlZCBvbiB0aGUgaW52aWRpZHVhbCBjb21taXQgcG9zdHMuCj4gPgo+ID4gKiBDcml0aWNh
bCBzZWN0aW9ucyBoYXZlIGJlZW4gc2hydW5rLCB3aXRoIGFsbG9jYXRpb25zIGFuZCBmcmVlcwo+
ID4gICBwdWxsZWQgb3V0c2lkZSB3aGVyZSBwb3NzaWJsZSwgcmVvcmRlcmluZyBsb2dpYyB3aXRo
aW4gaHlwZXJjYWxsIG9wcy4KPiA+Cj4gPiAqIEEgbmV3IHJpbmcgaGFzaCBmdW5jdGlvbiBpbXBs
ZW1lbnRlZCwgZGVyaXZlZCBmcm9tIHRoZSBkamIyIHN0cmluZwo+ID4gICBoYXNoIGZ1bmN0aW9u
Lgo+ID4KPiA+ICogRmxhZ3MgcmV0dXJuZWQgYnkgdGhlIG5vdGlmeSBvcCBoYXZlIGJlZW4gc2lt
cGxpZmllZC4KPiA+Cj4gPiAqIE5vdyB1c2VzIGEgc2luZ2xlIGFyZ28gYm9vdCBwYXJhbWV0ZXIs
IHRha2luZyBhIGxpc3Q6Cj4gPiAgIC0gdG9wIGxldmVsIGJvb2xlYW4gdG8gZW5hYmxlL2Rpc2Fi
bGUgQXJnbwo+ID4gICAtIG1hYy1wZXJtaXNzaXZlIG9wdGlvbiB0byBlbmFibGUvZGlzYWJsZSB3
aWxkY2FyZCByaW5ncwo+ID4gICAtIGNvbW1hbmQgbGluZSBkb2MgZWRpdDogbm8gIkNPTkZJR19B
UkdPIiBidXQgcmVmZXJzIHRvIGJ1aWxkIGNvbmZpZwo+ID4KPiA+ICogU3dpdGNoZWQgdG8gdXNl
IHRoZSBzdGFuZGFyZCBsaXN0IGRhdGEgc3RydWN0dXJlcyB1c2VkIGJ5IFhlbidzCj4gPiAgIGNv
bW1vbiBjb2RlLgo+Cj4gQUZBSUsgdGhpcyB3YXMgbm90IHJlcXVlc3RlZCBieSBhbnkgcmV2aWV3
ZXIsIHNvIEkgd29uZGVyIHdoeSB5b3UgbWFkZQo+IHN1Y2ggY2hhbmdlLiBUaGUgbW9yZSB0aGF0
IHlvdSBvcGVuIGNvZGVkIHNvbWUgb2YgdGhlIGxpc3RfIG1hY3Jvcwo+IGluc3RlYWQgb2YganVz
dCBkb2luZyBhIHMvaGxpc3RfL2xpc3RfLyByZXBsYWNlbWVudC4KPiBJJ20gZmluZSB3aXRoIHVz
aW5nIGxpc3QgaW5zdGVhZCBvZiBobGlzdCwKCkF0IHlvdXIgcmVxdWVzdCwgdjcgcmVwbGFjZXMg
b3BlbiBjb2Rpbmcgd2l0aCBYZW4ncyBsaXN0IG1hY3Jvcy4gVGhlCmhsaXN0IG1hY3JvcyB3ZXJl
IG5vdCB1c2VkIGJ5IGFueSBvZiB0aGUgY29tbW9uIGNvZGUgaW4gWGVuLgoKPiBidXQgSSBkb24n
dCB1bmRlcnN0YW5kIHdoeQo+IHlvdSBkZWNpZGVkIHRvIG9wZW4gY29kZSBsaXN0X2Zvcl9lYWNo
IGFuZCBsaXN0X2Zvcl9lYWNoX3NhZmUgaW5zdGVhZAo+IG9mIHVzaW5nIHRoZSBtYWNyb3MgcHJv
dmlkZWQgYnkgWGVuLiBJcyB0aGVyZSBhbiBpc3N1ZSB3aXRoIHN1Y2gKPiBtYWNyb3M/CgpBcyBk
aXNjdXNzZWQgb2ZmbGluZToKCi0gVXNpbmcgWGVuJ3MgbGlzdCBtYWNyb3Mgd2lsbCBleHBlZGl0
ZSBBcmdvJ3MgbWVyZ2UgZm9yIFhlbiA0LjEyCi0gTGlzdCBtYWNyb3MgaW4gWGVuIGxpc3QuaCBv
cmlnaW5hdGVkIGluIExpbnV4IGxpc3QuaCBhbmQgaGF2ZSBkaXZlcmdlZAotIE9wZW5YVCBoYXMg
dXNlIGNhc2VzIGZvciBtZWFzdXJlZCBsYXVuY2ggYW5kIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiwK
ICB3aGljaCBpbmZsdWVuY2UgZG93bnN0cmVhbSBwZXJmb3JtYW5jZSBhbmQgc2VjdXJpdHkgcmVx
dWlyZW1lbnRzIGZvcgogIEFyZ28gYW5kIFhlbgotIE9wZW5YVCBjYW4gdGVtcG9yYXJpbHkgcGF0
Y2ggWGVuIDQuMTIgZm9yIGRvd25zdHJlYW0gdXNlCgo+IEkndmUgbWFkZSBhIGNvdXBsZSBvZiBt
aW5vciBjb21tZW50cywgYnV0IEkgdGhpbmsgdGhlIGN1cnJlbnQgc3RhdHVzCj4gaXMgZ29vZCwg
YW5kIGZpeGluZyB0aG9zZSBtaW5vciBjb21tZW50cyBpcyBnb2luZyB0byBiZSB0cml2aWFsLgoK
QWNrLCB0aGFua3MuIEhvcGVmdWxseSB2NyBsb29rcyBnb29kLgoKQ2hyaXN0b3BoZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
