From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 1 May 2018 14:44:54 +0000
Message-ID: <3B7630C6-E072-42CA-B67B-7E8EE2915C72@citrix.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
 <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
 <23271.17046.529514.36171@mariner.uk.xensource.com>
 <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
 <23272.25339.521207.449205@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9rzx=hu=citrix.com=prvs=6524d7b6e=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fDWWZ-0007Vu-1B
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 14:44:59 +0000
In-Reply-To: <23272.25339.521207.449205@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <B61851D9CE32B44ABC061F99DA2230C0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDAxLzA1LzIwMTgsIDEzOjUyLCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtQQVRDSCBm
b3ItNC4xMSB2MiAyLzJdIEFkZCBuZXcgYWRkX21haW50YWluZXJzLnBsIHNjcmlwdCB0byBvcHRp
bWlzZSB0aGUgd29ya2Zsb3cgd2hlbiB1c2luZyBnaXQgZm9ybWF0LXBhdGNoIHdpdGggZ2V0X21h
aW50YWluZXIucGwiKToNCiAgICA+IE9uIDMwLzA0LzIwMTgsIDE3OjIxLCAiSWFuIEphY2tzb24i
IDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgIFdoZW4g
SSBkbyB0aGlzLCB0aGVyZSBpcyBub3RoaW5nIHRoYXQgZ2V0cyB0aGUgQ0MgZm9yIHRoZSBjb3Zl
ciBsZXR0ZXINCiAgICA+ICAgICByaWdodC4gIChJIHNvbWV0aW1lcyBib2RnZSBpdC4pICBZb3Vy
IHRvb2wgYWxyZWFkeSBrbm93cyBob3cgdG8NCiAgICA+ICAgICBleHRyYWN0IENDcyBmcm9tIHRo
ZSBpbmRpdmlkdWFsIG5vbi1jb3Zlci1sZXR0ZXIgcGF0Y2hlcyBhbmQgYWRkIHRoZW0NCiAgICA+
ICAgICB0byB0aGUgY292ZXIgbGV0dGVyLiAgVGhhdCBpcyB0aGUgZnVuY3Rpb24gSSB3YW50IC0g
dG8gZG8gdGhhdCwgYnV0DQogICAgPiAgICAgbm90IHJ1biBnZXRfbWFpbnRhaW5lci4NCiAgICA+
IA0KICAgID4gVGhhdCBtYWtlcyBzZW5zZSBhbmQgY2FuIGJlIGVhc2lseSBkb25lIHZpYSBhbiBv
cHRpb246IGUuZy4NCiAgICA+IC0taW5zZXJ0IGNvdmVyfC1pIGNvdmVyIG9yIGEgc2VwYXJhdGUg
b3B0aW9uLiBMZXQgbWUga25vdyB3aGV0aGVyDQogICAgPiB5b3UgaGF2ZSBhIHByZWZlcmVuY2Ug
cmVnYXJkaW5nIG5hbWluZy9vcHRpb25zLg0KICAgIA0KICAgIEkgdGhpbmsgdGhpcyBpcyBvcnRo
b2dvbmFsIHRvIC1pLiAgVGhhdCBpcywgYSB1c2VyIHdobyB3YW50cyB5b3VyIHRvb2wNCiAgICB0
byBvbmx5IGVkaXQgdGhlIGNvdmVyIGxldHRlciBtaWdodCB3YW50IGVpdGhlciB0byBoYXZlIGl0
IGFkZCB0aGUgQ0NzDQogICAgb25seSB0byB0aGUgbWFpbCBoZWFkZXIsIG9yIGludG8gdGhlIGJv
ZHkgYXMgd2VsbC4NCiAgICANCiAgICBQZXJoYXBzIC0tdHJhbnNmZXItb25seSBha2EgLVQgPyAg
Tm90IHN1cmUgSSBjYW4gdGhpbmsgb2YgYSBnb29kIG5hbWUuDQoNCkkgY2FuIGRvIGVpdGhlcjog
aW4gZmFjdCBsb29raW5nIGF0IHRoZSBjb2RlIC1pIG9ubHkgb3BlcmF0ZXMgb24gZmlsZXMgdGhh
dA0KYXJlIG5vdCB0aGUgY292ZXIgbGV0dGVyLiANCg0KU286DQotaSB0b3A6IGFkZHMgQ0MncyB0
byBlYWNoICoucGF0Y2ggZXhjZXB0IHRoZSBjb3ZlciBsZXR0ZXINCi1pIGNjYm9keTogYWRkcyBD
QydzIHRvIHRoZSBib2R5IG9mIGVhY2ggKi5wYXRjaCBmaWxlIGV4Y2VwdCB0aGUgY292ZXIgbGV0
dGVyDQoNClRodXMNCi1pIG5vbmU6IGNvdWxkIGp1c3Qgbm90IGFkZCBhbnl0aGluZyB0byBlYWNo
ICoucGF0Y2ggZmlsZSBleGNlcHQgdGhlDQogY292ZXIgbGV0dGVyDQoNCkkgdGhpbmsgdGhhdCBp
cyBwcm9iYWJseSB0aGUgbW9zdCBsb2dpY2FsIHdheSB0byBkbyB0aGlzDQpJIHByb2JhYmx5IG5l
ZWQgdG8gY2xhcmlmeSB0aGUgc2NvcGUgb2YgLWkgaW4gdGhlIGhlbHAgc2VjdGlvbg0KDQpJbiB0
aGUgY292ZXIgbGV0dGVyLCB0aGUgdG9vbCBhbHdheXMgaW5zZXJ0IGF0IHRoZSB0b3AgYXMgaXQg
aXMgYSB0cmFuc2llbnQNCnRoaW5nIHRoYXQgZG9lcyBub3QgZW5kIHVwIGluIGdpdC4NCg0KICAg
IEFzIGFuIGFzaWRlLCBJIGd1ZXNzIHdpdGggYC1pIGNjYm9keScgeW91ciB0b29sIHN0aWxsIHB1
dHMgdGhlIENDcyBpbg0KICAgIHRoZSBtYWlsIGhlYWRlcnMgb2YgdGhlIGNvdmVyIGxldHRlciA/
ICBPciB3aWxsIGdpdC1zZW5kLWVtYWlsIGRvIHRoYXQgPw0KDQpnaXQtc2VuZC1lbWFpbCBkb2Vz
IHRoYXQuIE5vIG5lZWQgdG8gYWRkIGV4dHJhIGxvZ2ljDQpJIHdpbGwgYWRkIGEgY29tbWVudCBp
bnRvIHRoZSB0b29sJ3MgY29kZQ0KDQpMYXJzDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
