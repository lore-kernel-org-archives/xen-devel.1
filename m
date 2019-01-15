From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] doc: correct default scheduler in
 xen-command-line.pandoc
Date: Tue, 15 Jan 2019 12:40:32 +0100
Message-ID: <16cd9a9e-e879-7869-d494-f439c6499d13@suse.com>
References: <20190115113510.27121-1-jgross@suse.com>
 <9702a712-278d-583a-976a-9255caac6214@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjN6B-0001x4-D2
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:41:39 +0000
In-Reply-To: <9702a712-278d-583a-976a-9255caac6214@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMS8yMDE5
IDExOjM1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXZSBoYXZlIHN3aXRjaGVkIHRvIGNyZWRp
dDIuIExldCB0aGUgZG9jdW1lbnRhdGlvbiByZWZsZWN0IHRoYXQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+ICBkb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+
PiBpbmRleCBkMzliY2VlOTI4Li5lMjRlM2E0NWU0IDEwMDY0NAo+PiAtLS0gYS9kb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jCj4+IEBAIC0xNzA1LDcgKzE3MDUsNyBAQCB3aXRoIHJlYWQgYW5kIHdyaXRlIHBl
cm1pc3Npb25zLgo+PiAgIyMjIHNjaGVkCj4+ICA+IGA9IGNyZWRpdCB8IGNyZWRpdDIgfCBhcmlu
YzY1MyB8IHJ0ZHMgfCBudWxsYAo+PiAgCj4+IC0+IERlZmF1bHQ6IGBzY2hlZD1jcmVkaXRgCj4+
ICs+IERlZmF1bHQ6IGBzY2hlZD1jcmVkaXQyYAo+PiAgCj4+ICBDaG9vc2UgdGhlIGRlZmF1bHQg
c2NoZWR1bGVyLgo+PiAgCj4gCj4gTGlrZSBYU00sIHRoaXMgaXMgS2NvbmZpZyBjb250cm9sbGVk
LCBub3QgYSBzdGF0aWMgZGVmYXVsdCwgYW5kIGFsc28KPiBkZXBlbmRzIG9uIHRoZSBjb21waWxl
ZCBzY2hlZHVsZXJzLsKgIFRoaXMgc2hvdWxkIHJlYWQgc29tZXRoaW5nIGxpa2U6Cj4gCj4+IERl
ZmF1bHQ6IHNlbGVjdGFibGUgdmlhIEtjb25maWcuwqAgRGVwZW5kcyBvbiBlbmFibGVkIHNjaGVk
dWxlcnMuCgpUaGUgS2NvbmZpZyBkZWZhdWx0IGlzIGNyZWRpdDIuCgoKSnVlcmdlbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
