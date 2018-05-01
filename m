From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 1 May 2018 17:36:56 +0000
Message-ID: <9DEB1D90-0575-481A-B860-AE734B2F6E13@citrix.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
 <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
 <23271.17046.529514.36171@mariner.uk.xensource.com>
 <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
 <23272.25339.521207.449205@mariner.uk.xensource.com>
 <3B7630C6-E072-42CA-B67B-7E8EE2915C72@citrix.com>
 <23272.34020.765335.855905@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9rzx=hu=citrix.com=prvs=6524d7b6e=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1fDZD3-0003mg-AI
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 17:37:01 +0000
In-Reply-To: <23272.34020.765335.855905@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <BBE1390597E65447BCBB5F3220BF9223@citrix.com>
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

DQoNCu+7v09uIDAxLzA1LzIwMTgsIDE2OjE2LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtQQVRDSCBm
b3ItNC4xMSB2MiAyLzJdIEFkZCBuZXcgYWRkX21haW50YWluZXJzLnBsIHNjcmlwdCB0byBvcHRp
bWlzZSB0aGUgd29ya2Zsb3cgd2hlbiB1c2luZyBnaXQgZm9ybWF0LXBhdGNoIHdpdGggZ2V0X21h
aW50YWluZXIucGwiKToNCiAgICA+IEluIHRoZSBjb3ZlciBsZXR0ZXIsIHRoZSB0b29sIGFsd2F5
cyBpbnNlcnQgYXQgdGhlIHRvcCBhcyBpdCBpcyBhIHRyYW5zaWVudA0KICAgID4gdGhpbmcgdGhh
dCBkb2VzIG5vdCBlbmQgdXAgaW4gZ2l0Lg0KICAgID4gDQogICAgPiBPbiAwMS8wNS8yMDE4LCAx
Mzo1MiwgIklhbiBKYWNrc29uIiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6DQogICAg
Pg0KICAgID4gICAgIEFzIGFuIGFzaWRlLCBJIGd1ZXNzIHdpdGggYC1pIGNjYm9keScgeW91ciB0
b29sIHN0aWxsIHB1dHMgdGhlIENDcyBpbg0KICAgID4gICAgIHRoZSBtYWlsIGhlYWRlcnMgb2Yg
dGhlIGNvdmVyIGxldHRlciA/ICBPciB3aWxsIGdpdC1zZW5kLWVtYWlsIGRvIHRoYXQgPw0KICAg
ID4gDQogICAgPiBnaXQtc2VuZC1lbWFpbCBkb2VzIHRoYXQuDQogICAgDQogICAgVGhlc2UgcmVw
bGllcyBzZWVtIHRvIGJlIGNvbnRyYWRpY3RvcnkuDQoNClRoYXQncyBiZWNhdXNlIEkgbWlzLXJl
YWQgdGhlIHF1ZXN0aW9uLiBTbyB0aGUgY29ycmVjdCBhbnN3ZXIgaXM6DQp0aGUgdG9vbCBkb2Vz
IHRoYXQuIEJ1dCBpdCBkb2VzIHRoaXMgcmVnYXJkbGVzcyBvZiAtaSAqDQoNCiAgICBBbHNvLCBJ
SVJDIHNvbWVvbmUgd3JvdGUgZWFybGllciBpbiB0aGUgdGhyZWFkIHRoYXQgdGhleSBwcmVmZXIg
dGhlDQogICAgcHJhY3RpY2Ugb2YgaW5jbHVkaW5nIENDcyBpbiB0aGUgYm9keSBvZiB0aGUgY292
ZXIgbGV0dGVyIHRvby4gIFNvDQogICAgYXNzdW1pbmcgdGhhdCB0aGUgZmlyc3QgcmVwbHkgaXMg
YWNjdXJhdGUsIGl0IG1heSBub3QgYmUgZGVzaXJhYmxlLg0KDQpUaGF0IGNhbiBiZSBkb25lIGVh
c2lseS4gTWF5YmUgdGhlIGJlc3Qgd2F5IHRvIGFwcHJvYWNoIHRoaXMgaXMNCnRvIGhhdmUgdHdv
IG9wdGlvbnMgdGhhdCBjb250cm9sIGhvdyBDQ3MgYXJlIGluc2VydGVkIGludG8gdGhlIGNvdmVy
DQpsZXR0ZXIgYW5kIGEgc2VwYXJhdGUgb25lIHRoYXQgY29udHJvbHMgaG93IENDcyBhcmUgaW5z
ZXJ0ZWQgaW50bw0KcGF0Y2hlcy4NCg0KSW4gdGhhdCBjYXNlIEkgd291bGQgcHJvYmFibHkgcmVu
YW1lIA0KLS1pbnNlcnQgfCAtaSB0byAtLWluc2VydC1wYXRjaCB8IC1wIHdpdGggdG9wLCBjY2Jv
ZHksIG5vbmUgYXMgYWRtaXNzaWJsZSB2YWx1ZXMNCmFuZA0KLS1pbnNlcnQtY292ZXIgfCAtYyB3
aXRoIHRvcCwgY2Nib2R5LCBub25lIGFzIGFkbWlzc2libGUgdmFsdWVzDQoNCg0KQ2hlZXJzDQpM
YXJzDQoNCg0KSW4gDQoNCkxhcnMNCiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
