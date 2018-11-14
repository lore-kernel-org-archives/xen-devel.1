From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 13:08:54 +0100
Message-ID: <8ac0ae95-f696-4b5d-0b18-e96cfc0fcc13@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com>
 <d4dc12d3-2382-44d3-d078-faeb7c195eb4@arm.com>
 <036e4740-ae1a-e699-719f-966db8876089@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <036e4740-ae1a-e699-719f-966db8876089@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xMy8yMDE4IDA5OjMyIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEyLzEx
LzIwMTggMTk6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmV3LAo+Pgo+PiBPbiAx
MS8xMi8xOCA0OjQxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTIvMTEvMTggMTY6
MzUsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+Pj4+PiBpbmRleCBlNTk0YjQ4
ZDgxLi43ZjgxMDU0NjVjIDEwMDY0NAo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5j
Cj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPj4+Pj4+IEBAIC05Nyw2ICs5Nywx
MSBAQCBzdGF0aWMgdm9pZCBjdHh0X3N3aXRjaF9mcm9tKHN0cnVjdCB2Y3B1ICpwKQo+Pj4+Pj4g
ICAgICAgICBpZiAoIGlzX2lkbGVfdmNwdShwKSApCj4+Pj4+PiAgICAgICAgICAgICByZXR1cm47
Cj4+Pj4+Pgo+Pj4+Pj4gKyAgICAvKiBWQ1BVJ3MgY29udGV4dCBzaG91bGQgbm90IGJlIHNhdmVk
IGlmIGl0cyBkb21haW4gaXMKPj4+Pj4+IHN1c3BlbmRlZCAqLwo+Pj4+Pj4gKyAgICBpZiAoIHAt
PmRvbWFpbi0+aXNfc2h1dF9kb3duICYmCj4+Pj4+PiArICAgICAgICAocC0+ZG9tYWluLT5zaHV0
ZG93bl9jb2RlID09IFNIVVRET1dOX3N1c3BlbmQpICkKPj4+Pj4+ICsgICAgICAgIHJldHVybjsK
Pj4+Pj4gU0hVVERPV05fc3VzcGVuZCBpcyB1c2VkIGluIFhlbiBmb3Igb3RoZXIgcHVycG9zZSAo
c2VlCj4+Pj4+IFNDSEVET1Bfc2h1dGRvd24pLiBUaGUgb3RoZXIgdXNlciBvZiB0aGF0IGNvZGUg
cmVsaWVzIG9uIGFsbCB0aGUgc3RhdGUKPj4+Pj4gdG8gYmUgc2F2ZWQgb24gc3VzcGVuZC4KPj4+
Pj4KPj4+PiBXZSBqdXN0IG5lZWQgYSBmbGFnIHRvIG1hcmsgYSBkb21haW4gYXMgc3VzcGVuZGVk
LCBhbmQgSSBkbyBiZWxpZXZlCj4+Pj4gU0hVVERPV05fc3VzcGVuZCBpcyBub3QgdXNlZCBhbnl3
aGVyZSBlbHNlLgo+Pj4+IExldCdzIGNvbWUgYmFjayBvbiB0aGlzLgo+Pj4gU0hVVERPV05fc3Vz
cGVuZCBpcyB1c2VkIGZvciBtaWdyYXRpb24uICBHcmVwIGZvciBpdCB0aHJvdWdoIHRoZSBYZW4K
Pj4+IHRyZWUgYW5kIHlvdSdsbCBmaW5kIHNldmVyYWwgcGllY2VzIG9mIGRvY3VtZW50YXRpb24s
IGluY2x1ZGluZyB0aGUKPj4+IGRlc2NyaXB0aW9uIG9mIHdoYXQgdGhpcyBzaHV0ZG93biBjb2Rl
IG1lYW5zLgo+Pj4KPj4+IFdoYXQgeW91IGFyZSBpbnRyb2R1Y2luZyBoZXJlIGlzIG5vdCBhIHNo
dXRkb3duIC0gaXQgaXMgYSBzdXNwZW5kIHdpdGgKPj4+IHRoZSBpbnRlbnQgdG8gcmVzdW1lIGV4
ZWN1dGluZyBsYXRlci4gIEFzIHN1Y2gsIGl0IHNob3VsZG4ndCB1c2UgWGVuJ3MKPj4+IHNodXRk
b3duIGluZnJhc3RydWN0dXJlLCB3aGljaCBleGlzdHMgbWFpbmx5IHRvIGNvbW11bmljYXRlIHdp
dGggdGhlCj4+PiB0b29sc3RhY2suCj4+IFdvdWxkIGRvbWFpbiBwYXVzZS91bnBhdXNlIGJlIGEg
YmV0dGVyIHNvbHV0aW9uPwo+IEFjdHVhbGx5IHllcyAtIHRoYXQgc291bmRzIGxpa2UgYSB2ZXJ5
IG5lYXQgc29sdXRpb24uCgpJIGJlbGlldmUgZG9tYWluIHBhdXNlIHdpbGwgbm90IHdvcmsgaGVy
ZSAtIGEgZG9tYWluIGNhbm5vdCBwYXVzZSAKaXRzZWxmLCBpLmUuIGN1cnJlbnQgZG9tYWluIGNh
bm5vdCBiZSBwYXVzZWQuIFRoaXMgZnVuY3Rpb25hbGl0eSBzZWVtcyAKdG8gYXNzdW1lIHRoYXQg
YSBkb21haW4gaXMgcGF1c2luZyBhbm90aGVyIGRvbWFpbi4gT3IgSSBtaXNzZWQgdGhlIHBvaW50
LgoKPiB+QW5kcmV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
