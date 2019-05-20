From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
Date: Mon, 20 May 2019 16:59:23 +0000
Message-ID: <56755914-DCC1-4386-8740-0F45E1F49544@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
 <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
 <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
 <23778.55202.449293.616451@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hVmq=TU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hSldJ-0006LH-6i
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:59:29 +0000
In-Reply-To: <23778.55202.449293.616451@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <594B5E7155CF524698A44A477269C521@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDIwLzA1LzIwMTksIDEwOjM3LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIFRoaXMgaXMgZ29pbmcgaW4gdGhlIHJpZ2h0IGRpcmVj
dGlvbiBJTU8uDQogICAgDQogICAgTGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIXSBBZGQg
VFJBQ0tJTkcuSU1QT1JUUyB0byB4ZW4uZ2l0IHRvIG1vcmUgZWFzaWx5IG1hbmFnZSBpbXBvcnRl
ZCBmaWxlcyB0aGF0IG5lZWQgdG8gYmUga2VwdCBpbiBzeW5jIHdpdGggYW4gdXBzdHJlYW0iKToN
CiAgICA+IFRoYXQgbWFrZXMgcGVyZmVjdCBzZW5zZSBub3cuIEluIHRoYXQgY2FzZSwgSSB0ZW5k
IHRvIGFncmVlIHRoYXQgImF1dG8iIGlzIHByb2JhYmx5IG5vdCBuZWVkZWQuIFdvdWxkIGJlIHF1
aXRlIGhhcHB5IHRvIGRyb3AgaXQuDQogICAgDQogICAgSXQgd2lsbCBjb25zaWRlcmFibHkgY29t
cGxpY2F0ZSB0aGluZ3MgdG8gYWRkIGEgd2F5IHRvIGRlZmluZQ0KICAgIHNlZGRlcnkuICBMZXQg
dXMgbGVhdmUgdGhhdCB0byBhIGZ1dHVyZSBleHRlbnNpb24uDQogICAgDQogICAgVGhhdCBzdWdn
ZXN0cyB0aGF0IGBtYW51YWwnIHNob3VsZCBiZWNvbWUgYGZpbGU6Jy4NCiAgICANCiAgICBBcyBm
b3IgZGVsaW1pdGVycw0KICAgIA0KICAgID4gT24gMTcvMDUvMjAxOSwgMDE6MzQsICJKYW4gQmV1
bGljaCIgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCiAgICA+ICAgICA+IEkgYW0gbm90IHN1
cmUgd2hhdCB5b3UgbWVhbiwgd2hpY2ggY29sb25zPyBBcmUgeW91IHNheWluZywgdGhlIGZvcm1h
dCBzaG91bGQgYmUNCiAgICA+ICAgICA+IHZlcnNpb246IDENCiAgICA+ICAgICA+IHJlcG86IC4u
Lg0KICAgID4gICAgIA0KICAgID4gICAgIFllcy4gVGhpcyB3b3VsZCBtYWtlIGl0IGV2ZW4gbW9y
ZSBwcm9taW5lbnQgdGhhdCB0aGVzZSBhcmUgdGFncyBvZg0KICAgID4gICAgIHNvbWUgc29ydC4g
QnV0IHRoaXMgd2FzIG9ubHkgYSB0aG91Z2h0IG9mIG1pbmUsIGl0J3MgaW4gbm8gd2F5IG1lYW50
DQogICAgPiAgICAgdG8gYmUgYSByZXF1aXJlbWVudCBJIGhhdmUuDQogICAgDQogICAgSXQgd2ls
bCBtYWtlIHdyaXRpbmcgYSBwYXJzZXIgZWFzaWVyIGlmIGVhY2ggZW50cnkgaXMgYSBzaW5nbGUg
bGluZQ0KICAgIHdpdGggdGhlIGZpZWxkcyBpbiBhIGRlZmluZWQgb3JkZXIgYW5kIGlmIHdlIGNh
biBzYXkgdGhhdCBhIGByZXBvOicNCiAgICBtdXN0IHByZWNlZGUgZXZlcnkgYGZpbGU6JyB0aGF0
IG1lbnRpb25zIGl0Lg0KICAgIA0KVGhhdCBzb3VuZHMgcGVyZmVjdGx5IHNlbnNpYmxlDQpWZXJz
aW9uIDIgb24gaXRzIHdheSwgc29tZXRpbWVzIG5leHQgd2Vlaw0KDQpMYXJzDQogICAgDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
