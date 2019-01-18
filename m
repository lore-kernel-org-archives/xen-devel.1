From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/3] xen: add CONFIG item for default
 dom0 memory size
Date: Fri, 18 Jan 2019 15:08:55 +0100
Message-ID: <cb5654c4-36be-d7a4-674f-6ba8727c5f29@suse.com>
References: <20181210114422.27275-1-jgross@suse.com>
 <20181210114422.27275-4-jgross@suse.com>
 <e534b651-5d0b-34fb-0f79-9f02ce6d91c4@citrix.com>
 <37d17bc3-0fe8-44eb-51dd-b2a764c6a323@suse.com>
 <c9a99390-f0d4-462c-1a01-43dc9798e598@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I88E=P2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gkUqQ-0006qH-Pb
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 14:10:02 +0000
In-Reply-To: <c9a99390-f0d4-462c-1a01-43dc9798e598@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMjAxOSAxNDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMS8yMDE5
IDEzOjE5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxOC8wMS8yMDE5IDE0OjEzLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTAvMTIvMjAxOCAxMTo0NCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4+PiBXaXRoIGJlaW5nIGFibGUgdG8gc3BlY2lmeSBhIGRvbTBfbWVtIHZhbHVlIGRl
cGVuZGluZyBvbiBob3N0IG1lbW9yeQo+Pj4+IHNpemUgb24geDg2IG1ha2UgaXQgZWFzeSBmb3Ig
ZGlzdHJvcyB0byBzcGVjaWZ5IGEgZGVmYXVsdCBkb20wIHNpemUgYnkKPj4+PiBhZGRpbmcgYSBD
T05GSUdfRE9NMF9NRU0gaXRlbSB3aGljaCBwcmVzZXRzIHRoZSBkb20wX21lbSBib290IHBhcmFt
ZXRlcgo+Pj4+IHZhbHVlLgo+Pj4+Cj4+Pj4gSXQgd2lsbCBiZSB1c2VkIG9ubHkgaWYgbm8gZG9t
MF9tZW0gcGFyYW1ldGVyIHdhcyBzcGVjaWZpZWQgaW4gdGhlCj4+Pj4gYm9vdCBwYXJhbWV0ZXJz
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+Pj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBX
aHkgd2FzIHRoaXMgcGF0Y2ggYWNjZXB0ZWQ/wqAgV2UndmUgYWxyZWFkeSBnb3QgYSBzdWl0YWJs
ZSBLY29uZmlnCj4+PiBvcHRpb24gZm9yIHRoaXMsIENPTkZJR19DTURMSU5FLgo+PiBXaHkgZG8g
d2UgaGF2ZSBhIGNvbmZpZyBvcHRpb24gZm9yIHRoZSBkZWZhdWx0IHNjaGVkdWxlcj8KPiAKPiBU
aGF0IHByZS1kYXRlcyBDT05GSUdfQ01ETElORSwgYnV0IGlzIG9mIGR1YmlvdXMgdXNlLgoKSSBk
b24ndCBhZ3JlZSB3aXRoIHlvdSBoZXJlLiBJIHRoaW5rIHRoaXMgaXMgYSB2ZXJ5IHNlbnNpYmxl
IGNob2ljZS4KCj4gCj4+Cj4+IEFuZCBzb21ldGhpbmcgbGlrZToKPj4KPj4gZG9tMF9tZW09bWF4
OjhHIGRvbTBfbWVtPTEwJQo+Pgo+PiBpcyBkaWZmZXJlbnQgZnJvbQo+Pgo+PiBDT05GSUdfRE9N
MF9NRU09Im1heDo4RyIgcGx1cyBkb20wX21lbT0xMCUKPj4KPj4gb24gYSBob3N0IHdpdGggc2F5
IDEwMEcgb2YgbWVtb3J5OiBJbiB0aGUgZmlyc3QgY2FzZSB0aGlzIHdvdWxkIGJlIDhHLAo+PiBp
biB0aGUgc2Vjb25kIGNhc2UgMTBHLgo+IAo+IEFuZD/CoCBUaGVyZSBpcyBubyB3YXkgb2YgcHJl
dmVudGluZyB0aGF0LgoKSSB3YW50ZWQgdG8gc2F5OiB1c2luZyBDT05GSUdfRE9NMF9NRU0gYW5k
IENPTkZJR19DTURMSU5FIGFyZSBkaWZmZXJlbnQuClRoZSBmb3JtZXIgaXMgZXZhbHVhdGVkIG9u
bHkgaWYgdGhlIHVzZXIgZG9lc24ndCBzcGVjaWZ5IGRvbTBfbWVtIGFzIGEKcGFyYW1ldGVyLCB3
aGlsZSB0aGUgbGF0dGVyIF9pc18gY3VtdWxhdGl2ZS4KClRoZSBhZHZhbnRhZ2Ugb2YgQ09ORklH
X0RPTTBfTUVNIGlzIHRoYXQgaXMgcmVhbGx5IG9ubHkgdGhlIGRlZmF1bHQsIG5vdAphbiBhZGRp
dGlvbmFsIHNldHRpbmcgdGhlIHVzZXIgaGFzIHRvIHRha2UgaW50byBhY291bnQuCgo+IEEgdXNl
ciBjYW4gcmVhbGx5IHB1dCB0d28gZG9tMF9tZW09IG9uIHRoZSByZWFsIGNvbW1hbmQgbGluZSwg
YW5kIGNvdWxkCj4gcHV0IGEgZG9tMF9tZW0gaW4gQ09ORklHX0NNRExJTkUuCgpSaWdodCwgYW5k
IHRoZW4gaGUnZCBoYXZlIHRocmVlIGN1bXVsYXRpdmUgc2V0dGluZ3MuCgo+IFRoZSBvbmx5IHNv
bHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBpcyBmb3IgdGhlIGZpbmFsIGRvbTBfbWVtPSB0byBiZSBh
Cj4gZnVsbCBzcGVjaWZpY2F0aW9uLCBhbmQgSSBzdGlsbCBzZWUgbm8gdXNlIGZvciBDT05GSUdf
RE9NMF9NRU0KClNvIGEgdXNlciBzcGVjaWZ5aW5nIGRvbTBfbWVtIGluIGEgNC4xMSBzZXR1cCB3
b3VsZCBldmVudHVhbGx5IG5lZWQgdG8KbW9kaWZ5IGhpcyBzZXR0aW5nLiBXaXRoIENPTkZJR19E
T00wX01FTSBoZSBkb2Vzbid0IGhhdmUgdG8gZG8gdGhhdC4KCkFkZGl0aW9uYWxseSBDT05GSUdf
Q01ETElORSBpcyBhdmFpbGFibGUgaW4gZXhwZXJ0IG1vZGUgb25seSwgd2hpbGUKQ09ORklHX0RP
TTBfTUVNIGNhbiBiZSBzZXQgbW9yZSBlYXNpbHkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
